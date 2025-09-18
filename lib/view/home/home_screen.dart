import 'package:flutter/material.dart';
import 'package:skill_link/res/colors/app_color.dart';

import '../../res/colors/app_color.dart';
import '../../res/components/widgets/serviceCard.dart';
import '../../res/components/widgets/serviceListCard.dart';
import '../../utils/curved_background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CurvedBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          // border: BoxBorder.all(width: 1, color: AppColor.blackColor),
                          color: AppColor.white,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "S",
                              style: TextStyle(
                                fontSize: 22,
                                color: AppColor.mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          // border: BoxBorder.all(width: 1, color: AppColor.blackColor),
                          color: AppColor.white,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: AppColor.mainColor,
                                  size: 30,
                                ),

                                Positioned(
                                  left: 18,
                                  top: 4,
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      // border: BoxBorder.all(width: 1, color: AppColor.blackColor),
                                      color: AppColor.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 130),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special For You",
                      style: TextStyle(
                        fontSize: 22,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColor.mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("assets/images/offerImage.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Get 25% off on Home Cleaning",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "There are many variations of passages of Lorem Ipsum available,",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.mainColor,
                          ),
                          onPressed: () {},
                          child: Text(
                            "View",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(
                        fontSize: 22,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColor.mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 140,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ServiceCard(
                        imagePath: "assets/images/electrician.png",
                        title: "Electrician",
                        onTap: () {},
                      ),
                      ServiceCard(
                        imagePath: "assets/images/carpenter.png",
                        title: "Carpenter",
                        onTap: () {},
                      ),
                      ServiceCard(
                        imagePath: "assets/images/plumber.png",
                        title: "Plumber",
                        onTap: () {},
                      ),
                      ServiceCard(
                        imagePath: "assets/images/cleaner.png",
                        title: "Cleaner",
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Services",
                      style: TextStyle(
                        fontSize: 22,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColor.mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  itemCount: 4, // kitni baar repeat karna hai
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
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
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
