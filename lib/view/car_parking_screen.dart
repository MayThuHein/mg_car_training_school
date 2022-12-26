import "package:flutter/material.dart";

import '../widget/appbar.dart';
import '../widget/drawer.dart';
import '../widget/gallery_widget.dart';

class CarParkingScreen extends StatefulWidget {
  const CarParkingScreen({Key? key}) : super(key: key);

  @override
  State<CarParkingScreen> createState() => _CarParkingScreenState();
}

class _CarParkingScreenState extends State<CarParkingScreen> {
  final urlImages = [
    "assets/images/car_parking/step1.jpg",
    "assets/images/car_parking/step2.jpg",
    "assets/images/car_parking/step3.jpg",
    "assets/images/car_parking/step4.jpg",
    "assets/images/car_parking/step5.jpg",
    "assets/images/car_parking/step6.jpg",
    "assets/images/car_parking/viber_image_2022-09-16_16-24-02-437.jpg",
    "assets/images/car_parking/viber_image_2022-09-16_16-24-02-859.jpg",
    "assets/images/car_parking/viber_image_2022-09-16_16-24-03-144.jpg",
    "assets/images/car_parking/viber_image_2022-09-16_16-24-03-458.jpg",
    "assets/images/car_parking/viber_image_2022-09-16_16-24-03-695.jpg",
    "assets/images/car_parking/viber_image_2022-11-24_00-32-27-346.jpg"
  ];
  late int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: const BaseAppBar(),
      body: OrientationBuilder(
        builder: ((context, orientation) => GridView.builder(
              padding: const EdgeInsets.only(top: 15, left: 5, right: 15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
              ),
              itemCount: urlImages.length,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    selectedIndex = index;
                    openGallery();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(
                            urlImages[index],
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                );
              }),
            )),
      ),
    );
  }

  void openGallery() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => GalleryWidget(urlImages: urlImages, index: selectedIndex),
    ));
  }
}
