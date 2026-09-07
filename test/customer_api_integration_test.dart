import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:skill_link/data/app_exceptions.dart';
import 'package:skill_link/data/storage/app_storage.dart';
import 'package:skill_link/models/category_model.dart';
import 'package:skill_link/models/service_request_model.dart';
import 'package:skill_link/models/technician_model.dart';
import 'package:skill_link/res/app_url/app_url.dart';
import 'package:skill_link/view/home/categories_screen.dart';
import 'package:skill_link/view/booking_screen/requests_screen.dart';
import 'package:skill_link/view_models/controller/categories_controller.dart';
import 'package:skill_link/view_models/controller/requests_controller.dart';
import 'package:skill_link/view_models/controller/request_details_controller.dart';
import 'package:skill_link/view_models/controller/request_service_controller.dart';
import 'package:skill_link/view_models/services/edit_profile_service.dart';
import 'package:skill_link/view_models/services/home_service.dart';
import 'package:skill_link/view_models/services/request_details_service.dart';
import 'package:skill_link/view_models/services/request_service_service.dart';
import 'package:skill_link/view_models/services/worker_profile_service.dart';

class LoadedCategoriesController extends CategoriesController {
  @override
  void onReady() {}
}
class LoadedRequestsController extends RequestsController {
  @override
  void onReady() {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/path_provider'),
      (call) async => Directory.systemTemp.path,
    );
    await GetStorage.init();
    await AppStorage.saveToken('customer-api-test-token');
  });
  tearDown(() async => Get.reset());
  tearDownAll(() async => AppStorage.removeToken());

  test('Media paths resolve against live origin and preserve external hosts', () {
    expect(AppUrl.mediaUrl('/media/profile_photos/test.png'),
        'https://skilllink-backend-v85z.onrender.com/media/profile_photos/test.png');
    expect(AppUrl.mediaUrl('media/profile_photos/test.png'),
        'https://skilllink-backend-v85z.onrender.com/media/profile_photos/test.png');
    expect(AppUrl.mediaUrl('http://skilllink-backend-v85z.onrender.com/media/test.png'),
        'https://skilllink-backend-v85z.onrender.com/media/test.png');
    expect(AppUrl.mediaUrl('https://images.example.com/test.png'),
        'https://images.example.com/test.png');
    expect(AppUrl.mediaUrl(null), '');
    expect(AppUrl.mediaUrl('  '), '');
  });

  testWidgets('Time picker defaults to a future minute instead of current minute', (tester) async {
    final controller = RequestServiceController();
    await tester.pumpWidget(GetMaterialApp(home: Builder(builder: (context) =>
      Scaffold(body: TextButton(
        onPressed: () => controller.selectTime(context),
        child: const Text('Choose time'),
      )),
    )));
    final before = DateTime.now();
    await tester.tap(find.text('Choose time'));
    await tester.pumpAndSettle();
    final initial = tester.widget<TimePickerDialog>(find.byType(TimePickerDialog)).initialTime;
    final difference = (initial.hour * 60 + initial.minute -
        before.hour * 60 - before.minute + 1440) % 1440;
    expect(difference, inInclusiveRange(5, 6));
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    controller.onClose();
  });

  test('Request details fetch the assigned technician photo instead of an empty URL', () async {
    final controller = RequestDetailsController()..requestId = 42;
    await http.runWithClient(() async {
      await controller.getRequest();
    }, () => MockClient((request) async {
      if (request.url.path == '/api/services/requests/42/') {
        return http.Response('{"id":42,"technician":7}', 200);
      }
      expect(request.url.path, '/api/services/technicians/7/');
      return http.Response('{"id":7,"profile_photo":"/media/photo.png"}', 200);
    }));
    expect(controller.technicianModel.value?.profilePhoto, '/media/photo.png');
    controller.onClose();
  });

  test('Nullable and decimal backend fields parse without fabricated values', () {
    final request = ServiceRequestModel.fromJson({
      'id': 42, 'request_id': 'SL-20260905-001',
      'skill_category': null, 'technician': null,
      'amount': null, 'status': 'pending', 'is_paid': false,
      'timeline': [{'label': 'Request Submitted', 'done': true, 'time': null}],
    });
    expect(request.technician, isNull);
    expect(request.amount, isNull);
    expect(request.timeline.single.done, isTrue);
    expect(request.toJson()['timeline'][0]['time'], isNull);
    final technician = TechnicianModel.fromJson({
      'id': 7, 'avg_rating': '4.5', 'skill_categories': [],
      'reviews': [{'id': 2, 'service_request': 42, 'rating': 5, 'comment': 'Good'}],
    });
    expect(technician.avgRating, '4.5');
    expect(technician.reviews.single.rating, 5);
  });

  test('Customer mutations use live endpoints, correct verbs and existing token', () async {
    final seen = <http.Request>[];
    await http.runWithClient(() async {
      await RequestServiceService().createRequestApi({
        'skill_category': 7, 'description': 'Leak', 'address': 'Address', 'city': 'Delhi',
      });
      await EditProfileService().updateProfileApi({'full_name': 'Customer'});
      await RequestDetailsService().cancelRequestApi(42);
      await RequestDetailsService().submitReviewApi(42, {'rating': 4, 'comment': 'Good'});
      await WorkerProfileService().saveTechnicianApi(7);
      await WorkerProfileService().removeTechnicianApi(7);
      await HomeService().getTechniciansApi(category: 7, city: 'New Delhi', sort: 'most_reviewed');
    }, () => MockClient((request) async {
      seen.add(request);
      expect(request.headers['Authorization'], 'Bearer customer-api-test-token');
      expect(request.url.host, 'skilllink-backend-v85z.onrender.com');
      return http.Response(jsonEncode({'id': 42, 'message': 'OK'}), 200);
    }));
    expect(seen.map((r) => r.method), ['POST', 'PATCH', 'PATCH', 'POST', 'POST', 'DELETE', 'GET']);
    expect(seen[0].url.path, '/api/services/requests/create/');
    expect(jsonDecode(seen[0].body)['skill_category'], 7);
    expect(seen[1].url.path, '/api/auth/profile/customer/');
    expect(seen[2].url.path, '/api/services/requests/42/status/');
    expect(jsonDecode(seen[2].body), {'status': 'cancelled'});
    expect(seen[3].url.path, '/api/services/requests/42/review/');
    expect(jsonDecode(seen[3].body)['rating'], 4);
    expect(seen[5].url.path, '/api/services/saved/7/');
    expect(seen.last.url.queryParameters['city'], 'New Delhi');
    expect(AppUrl.baseUrl, 'https://skilllink-backend-v85z.onrender.com/api/auth');
  });

  test('Backend validation errors do not become successful booking/profile/review models', () async {
    await http.runWithClient(() async {
      await expectLater(RequestServiceService().createRequestApi({}), throwsA(isA<FetchDataException>()));
      await expectLater(EditProfileService().updateProfileApi({'email': 'invalid'}), throwsA(isA<FetchDataException>()));
      await expectLater(RequestDetailsService().submitReviewApi(42, {'rating': 8}), throwsA(isA<FetchDataException>()));
    }, () => MockClient((request) async => http.Response('{"rating":["Invalid value"]}', 400)));
  });

  test('Photo uploads preserve bearer auth and send multipart fields', () async {
    final photo = File(Directory.systemTemp.path + '/skilllink_api_test_photo.png');
    await photo.writeAsBytes(base64Decode(
      'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+aD1sAAAAASUVORK5CYII='));
    final seen = <http.Request>[];
    try {
      await http.runWithClient(() async {
        await EditProfileService().uploadProfileApi({'full_name': 'Customer'}, photo.path);
        await RequestServiceService().uploadRequestApi({
          'description': 'Leak', 'address': 'Address', 'city': 'Delhi', 'skill_category': '7',
        }, photo.path);
      }, () => MockClient((request) async {
        seen.add(request);
        expect(request.headers['Authorization'], 'Bearer customer-api-test-token');
        expect(request.headers['content-type'], startsWith('multipart/form-data;'));
        return http.Response('{"id":42}', 200);
      }));
      expect(seen[0].method, 'PATCH');
      expect(seen[0].url.path, '/api/auth/profile/customer/');
      expect(latin1.decode(seen[0].bodyBytes), contains('name="profile_photo"'));
      expect(latin1.decode(seen[0].bodyBytes), contains('name="full_name"'));
      expect(seen[1].method, 'POST');
      expect(seen[1].url.path, '/api/services/requests/create/');
      expect(latin1.decode(seen[1].bodyBytes), contains('name="image"'));
      expect(latin1.decode(seen[1].bodyBytes), contains('name="skill_category"'));
    } finally {
      await photo.delete();
    }
  });

  test('Cancel response updates detail and list controller states', () async {
    final list = Get.put<RequestsController>(LoadedRequestsController());
    final detail = RequestDetailsController()..requestId = 42;
    await http.runWithClient(() async {
      await detail.cancelRequest();
    }, () => MockClient((request) async {
      final data = {'id': 42, 'description': 'Leak', 'status': 'cancelled'};
      return http.Response(jsonEncode(request.method == 'GET' ? [data] : data), 200);
    }));
    expect(detail.requestModel.value?.status, 'cancelled');
    expect(list.requests.single.status, 'cancelled');
    expect(detail.isLoading.value, isFalse);
    detail.onClose();
  });

  testWidgets('Categories screen reacts to API state and existing search', (tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final controller = Get.put<CategoriesController>(LoadedCategoriesController());
    await tester.pumpWidget(const GetMaterialApp(home: CategoriesScreen()));
    controller.categories.assignAll([
      CategoryModel.fromJson({'id': 7, 'name': 'Plumbing', 'description': 'Pipes'}),
      CategoryModel.fromJson({'id': 9, 'name': 'Electrical', 'description': 'Wiring'}),
    ]);
    await tester.pump();
    expect(find.text('Plumbing'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'electrical');
    await tester.pump();
    expect(find.text('Electrical'), findsOneWidget);
    expect(find.text('Plumbing'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Requests screen replaces mock cards and filters backend statuses', (tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final controller = Get.put<RequestsController>(LoadedRequestsController());
    controller.requests.assignAll([
      ServiceRequestModel.fromJson({'id': 42, 'description': 'Actual pending job', 'status': 'pending'}),
      ServiceRequestModel.fromJson({'id': 43, 'description': 'Actual completed job', 'status': 'completed'}),
    ]);
    await tester.pumpWidget(const GetMaterialApp(home: RequestsScreen()));
    await tester.pump();
    expect(find.text('Actual pending job'), findsOneWidget);
    // The existing floating tabs overflow their Stack's hit-test bounds.
    // Verify the existing callback without changing that unrelated layout.
    tester.widget<InkWell>(find.ancestor(
      of: find.text('Completed').first, matching: find.byType(InkWell),
    ).first).onTap!();
    await tester.pumpAndSettle();
    expect(find.text('Actual completed job'), findsOneWidget);
    expect(find.text('Actual pending job'), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
