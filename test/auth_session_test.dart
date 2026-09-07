import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:skill_link/data/storage/app_storage.dart';
import 'package:skill_link/res/routes/routes_names.dart';
import 'package:skill_link/view_models/controller/splash_controller.dart';
import 'package:skill_link/view_models/controller/auth_controller.dart';

class SessionController extends SplashController {
  dynamic error;
  @override
  void handleError(dynamic value, {VoidCallback? onRetry}) { error = value; }
}

String token(int seconds) {
  final payload = base64Url.encode(utf8.encode(jsonEncode({
    'exp': DateTime.now().millisecondsSinceEpoch ~/ 1000 + seconds,
  }))).replaceAll('=', '');
  return 'header.' + payload + '.signature';
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('plugins.flutter.io/path_provider'),
          (call) async => Directory.systemTemp.path);
    await GetStorage.init();
  });
  tearDown(() async {
    await AppStorage.removeToken();
    Get.reset();
  });

  test('Stores both tokens and clears them on logout', () async {
    await AppStorage.saveToken(token(3600), refresh: 'refresh-token');
    expect(AppStorage.hasToken(), isTrue);
    expect(AppStorage.getRefreshToken(), 'refresh-token');
    await AppStorage.removeToken();
    expect(AppStorage.hasToken(), isFalse);
    expect(AppStorage.getRefreshToken(), isNull);
  });

  for (final savedSession in [true, false]) {
    testWidgets('Splash routes from saved session: $savedSession', (tester) async {
      if (savedSession) await AppStorage.saveToken(token(3600));
      await tester.pumpWidget(GetMaterialApp(
        home: const Scaffold(body: Text('Splash')),
        getPages: [
          GetPage(name: RouteName.loginScreen, page: () => const Scaffold(body: Text('Login destination'))),
          GetPage(name: RouteName.dashboardScreen, page: () => const Scaffold(body: Text('Dashboard destination'))),
        ],
      ));
      final controller = SessionController();
      http.runWithClient(() => controller.checkSession(),
        () => MockClient((request) async => throw StateError('Splash must not call the network')));
      await tester.pumpAndSettle();
      expect(find.text(savedSession ? 'Dashboard destination' : 'Login destination'), findsOneWidget);
      controller.onClose();
    });
  }

  test('Login publishes success only after access token is stored', () async {
    final controller = AuthController();
    final access = token(3600);
    String? savedAtSuccess;
    final listener = ever(controller.verifyOtpModel, (model) {
      savedAtSuccess = AppStorage.getToken();
    });
    await http.runWithClient(() async {
      controller.verifyOtp('9999999999', '123456');
      for (var i = 0; i < 30 && controller.isLoading.value; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 10));
      }
    }, () => MockClient((request) async =>
      http.Response(jsonEncode({'tokens': {'access': access, 'refresh': 'refresh'}}), 200)));
    expect(savedAtSuccess, access);
    expect(controller.verifyOtpModel.value, isNotNull);
    listener.dispose();
  });
}

