import "package:flutter/material.dart";

import '../widget/appbar.dart';
import '../widget/drawer.dart';
import '../widget/gallery_widget.dart';

class PhotoGalleryScreen extends StatefulWidget {
  const PhotoGalleryScreen({Key? key}) : super(key: key);

  @override
  State<PhotoGalleryScreen> createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  final urlImages = [
    "assets/images/new_feature/mg1.jpg",
    "assets/images/new_feature/viber_image_2022-07-25_17-03-05-663.jpg",
    "assets/images/new_feature/viber_image_2022-07-25_17-03-19-714.jpg",
    "assets/images/new_feature/viber_image_2022-07-27_11-00-36-866.jpg",
    "assets/images/new_feature/viber_image_2022-07-27_11-00-37-192.jpg",
    "assets/images/new_feature/viber_image_2022-07-27_11-00-41-111.jpg",
    "assets/images/new_feature/viber_image_2022-07-27_11-00-41-232.jpg",
    "assets/images/new_feature/viber_image_2022-07-27_11-00-41-396.jpg",
    "assets/images/new_feature/viber_image_2022-07-27_11-00-41-540.jpg",
    "assets/images/new_feature/viber_image_2022-07-27_11-00-41-820.jpg",
    "assets/images/new_feature/viber_image_2022-07-27_11-00-41-995.jpg",
    "assets/images/new_feature/viber_image_2022-07-27_11-00-42-386.jpg",
    "assets/images/new_feature/viber_image_2022-09-16_16-26-10-290.jpg",
    "assets/images/new_feature/viber_image_2022-09-16_16-26-10-947.jpg",
    "assets/images/new_feature/viber_image_2022-09-16_16-26-11-382.jpg",
    "assets/images/new_feature/viber_image_2022-09-16_16-26-11-799.jpg",
    "assets/images/new_feature/viber_image_2022-09-16_16-26-12-166.jpg",
    "assets/images/new_feature/viber_image_2022-09-16_16-26-12-581.jpg",
    "assets/images/new_feature/viber_image_2022-09-16_16-33-20-334.jpg",
    "assets/images/new_feature/viber_image_2022-09-16_16-33-20-741.jpg",
    "assets/images/new_feature/viber_image_2022-09-16_16-33-21-068.jpg",
    "assets/images/new_feature/IMG_20220921_110333.jpg",
    "assets/images/new_feature/IMG_20220921_111015.jpg",
    "assets/images/new_feature/IMG_20220921_112157.jpg",
    "assets/images/new_feature/IMG_20220921_112238.jpg",
    "assets/images/new_feature/viber_image_2022-09-22_11-12-18-019.jpg",
    "assets/images/new_feature/viber_image_2022-09-22_11-12-18-125.jpg",
    "assets/images/new_feature/viber_image_2022-09-22_11-12-18-234.jpg",
    "assets/images/new_feature/viber_image_2022-09-22_11-12-20-729.jpg",
    "assets/images/new_feature/viber_image_2022-09-22_11-12-21-624.jpg"
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
