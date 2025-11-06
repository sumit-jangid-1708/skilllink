import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapControllerX extends GetxController {
  Rx<GoogleMapController?> mapController = Rx<GoogleMapController?>(null);
  RxBool isWorkerSelected = false.obs;
  Rx<LatLng> initialPosition = const LatLng(26.9124, 75.7873).obs;

  void onMapCreated(GoogleMapController controller) {
    mapController.value = controller;
  }

  void toggleWorkerSheet(bool value) {
    isWorkerSelected.value = value;
  }
}

class MapScreen extends StatelessWidget {
  MapScreen({super.key});
  final MapControllerX controller = Get.put(MapControllerX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 🗺 Google Map Background
          Obx(() => GoogleMap(
            onMapCreated: controller.onMapCreated,
            initialCameraPosition: CameraPosition(
              target: controller.initialPosition.value,
              zoom: 13,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          )),

          /// 🔙 Top Back Button and Search Bar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
                  ),

                  const SizedBox(height: 8),

                  // Search bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Category chips
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        categoryChip('Near me', isSelected: true),
                        categoryChip('Favorite'),
                        categoryChip('Popular'),
                        categoryChip('Electrician'),
                        categoryChip('Plumber'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// 🧍 Bottom Sheet for Worker Details
          Obx(() => AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
            left: 0,
            right: 0,
            bottom: controller.isWorkerSelected.value ? 0 : -300,
            child: WorkerBottomSheet(
              onClose: () => controller.toggleWorkerSheet(false),
            ),
          )),
        ],
      ),
    );
  }

  Widget categoryChip(String title, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFe83322) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFe83322)),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFFe83322),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// Worker Bottom Sheet Widget
class WorkerBottomSheet extends StatelessWidget {
  final VoidCallback onClose;
  const WorkerBottomSheet({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Electrician',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(onPressed: onClose, icon: const Icon(Icons.close)),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            '4.0 ⭐  |  Active Now\n\nSpacious professional service within 18 min drive',
            style: TextStyle(color: Colors.grey),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFe83322),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: () {},
            child: const Text('Book Now'),
          )
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../../res/components/widgets/serviceListCard.dart';
// import '../../res/components/widgets/worker_bottom_sheet.dart';
// import '../../view_models/controller/map_controller.dart';
//
// class MapScreen extends StatelessWidget {
//   const MapScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(MapController());
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           /// Map BBackground
//           Obx(
//             () => GoogleMap(
//               onMapCreated: controller.onMapCreated,
//               initialCameraPosition: CameraPosition(
//                 target: controller.currentLocation.value,
//                 zoom: 14,
//               ),
//               markers: controller.markers.value,
//               myLocationEnabled: true,
//               zoomControlsEnabled: false,
//               myLocationButtonEnabled: false,
//             ),
//           ),
//
//           //Top controls
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: Colors.white,
//                     child: IconButton(
//                       icon: Icon(Icons.arrow_back, color: Colors.black87),
//                       onPressed: () => Get.back(),
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//
//                   /// Search bsr
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black12,
//                           blurRadius: 8,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: const TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Search....',
//                         border: InputBorder.none,
//                         prefixIcon: Icon(Icons.search, color: Colors.grey),
//                         contentPadding: EdgeInsets.symmetric(horizontal: 16),
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(height: 16),
//
//                   /// Categories row
//                   SizedBox(
//                     height: 36,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         categoryChip("Near me"),
//                         categoryChip("Favorite"),
//                         categoryChip("Popular"),
//                         categoryChip("Electrician"),
//                         categoryChip("Plumber"),
//                       ],
//                     ),
//                   ),
//
//                   /// BOTTOM SHEET for selected worker
//                   Obx(
//                     () => AnimatedPositioned(
//                       duration: const Duration(milliseconds: 300),
//                       curve: Curves.easeOut,
//                       bottom: controller.isBottomSheetVisible.value ? 0 : -300,
//                       left: 0,
//                       right: 0,
//                       child: WorkerBottomSheet(
//                         name: controller.selectedWorker.value,
//                         onClose: controller.closeBottomeSheet,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   Widget categoryChip(String lable){
//     return Container(
//       margin: const EdgeInsets.only(right: 8),
//       padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: Colors.grey.shade300),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 4,
//             offset: const Offset(0, 2)
//           )
//         ]
//       ),
//       child: Text(lable, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),),
//     );
//   }
// }