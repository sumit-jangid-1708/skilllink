import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/components/widgets/serviceListCard.dart';
import '../../view_models/controller/map_controller.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapController());
    return Scaffold();
  }
}