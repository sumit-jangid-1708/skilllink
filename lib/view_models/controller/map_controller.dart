import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  Rx<LatLng> currentLocation = const LatLng(26.9124, 75.7873).obs;
  RxSet<Marker> markers = <Marker>{}.obs;
  RxBool isBottomSheetVisible = false.obs;
  RxString selectedWorker = ''.obs;

  GoogleMapController? mapController;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void closeBottomeSheet() {
    isBottomSheetVisible.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    _loadDummyMarkers();
  }

  void _loadDummyMarkers() {
    final sampleMarkers = [
      Marker(
        markerId: const MarkerId("1"),
        position: const LatLng(26.9124, 75.7873),
        infoWindow: const InfoWindow(title: "Electrician"),
        onTap: () => selectedWorker("Electrician"),
      ),
      Marker(
        markerId: const MarkerId("2"),
        position: const LatLng(26.9150, 75.7900),
        infoWindow: const InfoWindow(title: "Plumber"),
        onTap: () => selectedWorker("Plumber"),
      ),
    ];
    markers.addAll(sampleMarkers);
  }
}
