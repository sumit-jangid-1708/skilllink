import 'package:flutter/material.dart';

import '../../res/components/widgets/serviceListCard.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ServiceListCard(
        imagePath: "assets/images/electrianImg.png",
        serviceTitle: "Electrician",
        providerName: "Jackson Henry",
        price: "\$125.00",
        onBookNow: () {
          // Book Now action
        },
        onFavorite: () {
          // Favourite action
        }
    );
  }
}