import 'package:flutter/material.dart';
import 'package:making_good_app/data/licence.dart';
import 'package:making_good_app/widget/gallery_widget.dart';

import '../helper/my_theme.dart';
import '../widget/appbar.dart';
import '../widget/drawer.dart';

class AboutLicenceScreen extends StatefulWidget {
  const AboutLicenceScreen({Key? key}) : super(key: key);

  @override
  State<AboutLicenceScreen> createState() => _AboutLicenceScreenState();
}

class _AboutLicenceScreenState extends State<AboutLicenceScreen> {
  Data licence = Data();
  bool switchButton = true;
  late int selectedIndex;
  late int bSelectedIndex;

  final urlImages = [
    "assets/images/licence/licence2.jpg",
    "assets/images/licence/licence3.jpg",
    "assets/images/licence/viber_image_2022-09-17_20-56-54-317.jpg",
    "assets/images/licence/viber_image_2022-09-17_20-12-49-326.jpg",
    "assets/images/new_feature/licens.jpg",
    "assets/images/licence/20221207_080850.jpg"
  ];

  @override
  void initState() {
    super.initState();
  }

  // void openGallery() {
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (_) => GalleryWidget(urlImages: urlImages, index: selectedIndex),
  //   ));
  // }

  void licenceOpenGallery(photoList, index) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => GalleryWidget(urlImages: photoList, index: index),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BaseAppBar(),
        drawer: DrawerWidget(),
        body: Column(
          children: [
            Row(children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        switchButton = true;
                      });
                    },
                    child: Text(
                      MyTheme.mmText("ယာဥ်မောင်းလိုင်စင်အမျိုးအစားများ"),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 5, right: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        switchButton = false;
                      });
                    },
                    child: Text(
                      MyTheme.mmText(
                          "လိုင်စင်ဖြေဆိုလျှင်သိရှိရမည့်အချက်အလက်များ"),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
              ),
            ]),
            switchButton
                ? Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        itemCount: licence.licenceList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  MyTheme.mmText(
                                    licence.licenceList[index]["title"],
                                  ),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 35.0, top: 5),
                                  child: Text(
                                    MyTheme.mmText(
                                        licence.licenceList[index]["details"]),
                                  ),
                                ),
                                Container(
                                  height: 200,
                                  child: OrientationBuilder(
                                    builder: ((context, orientation) =>
                                        GridView.builder(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 5, right: 15),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2),
                                          itemCount: licence
                                              .licenceList[index]["imageList"]
                                              .length,
                                          itemBuilder: ((context, position) {
                                            return InkWell(
                                              onTap: () {
                                                licenceOpenGallery(
                                                    licence.licenceList[index]
                                                        ["imageList"],
                                                    position);
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 10, bottom: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        licence.licenceList[
                                                                    index]
                                                                ["imageList"]
                                                            [position],
                                                      ),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            );
                                          }),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  )
                : Expanded(
                    child: OrientationBuilder(
                      builder: ((context, orientation) => GridView.builder(
                            padding: const EdgeInsets.only(
                                top: 15, left: 5, right: 15),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3
                                    // orientation == Orientation.portrait
                                    //     ? 3
                                    //     : 5,
                                    ),
                            itemCount: urlImages.length,
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: () {
                                  selectedIndex = index;
                                  licenceOpenGallery(urlImages, index);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, bottom: 10),
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
                  ),
          ],
        ));
  }
}
