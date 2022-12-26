import "package:flutter/material.dart";

import '../widget/appbar.dart';
import '../widget/drawer.dart';
import '../widget/gallery_widget.dart';

class RoadRuleScreen extends StatefulWidget {
  const RoadRuleScreen({Key? key}) : super(key: key);

  @override
  State<RoadRuleScreen> createState() => _RoadRuleScreenState();
}

class _RoadRuleScreenState extends State<RoadRuleScreen> {
  final urlImages = [
    "assets/images/road_rules/viber_image_2022-09-16_16-27-55-266.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-27-55-563.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-27-55-932.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-27-56-527.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-27-56-994.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-27-57-463.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-27-57-815.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-27-58-093.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-27-58-415.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-27-58-734.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-28-38-910.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-28-39-301.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-28-39-836.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-28-40-240.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-28-40-655.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-28-40-974.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-28-41-443.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-28-41-884.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-28-42-376.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-28-42-686.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-29-09-917.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-29-10-336.png",
    "assets/images/road_rules/viber_image_2022-09-16_16-29-10-721.png",
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
