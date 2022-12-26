import 'package:flutter/material.dart';

import '../data/questionnare_list.dart';
import '../data/signs.dart';
import '../helper/my_theme.dart';
import '../widget/appbar.dart';
import '../widget/drawer.dart';

class BlueSignScreen extends StatefulWidget {
  const BlueSignScreen({Key? key}) : super(key: key);

  @override
  State<BlueSignScreen> createState() => _BlueSignScreenState();
}

class _BlueSignScreenState extends State<BlueSignScreen> {
  Signs signs = Signs();
  QuestionNaireList data = QuestionNaireList();
  List<Map<String, dynamic>> blueSignList = [];
  @override
  void initState() {
    super.initState();
    blueSignList = signs.blueSignList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BaseAppBar(),
        drawer: DrawerWidget(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                MyTheme.mmText(data.mmDatas["blue_sign_title"]),
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.only(top: 7),
                scrollDirection: Axis.vertical,
                crossAxisCount: 4,
                children: List.generate(blueSignList.length, (index) {
                  return InkWell(
                    onTap: () {
                      _signAlert(blueSignList[index]);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 10, left: 7, right: 7, bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(blueSignList[index]["image"]),
                            fit: BoxFit.cover),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ));
  }

  _signAlert(data) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Container(
                    height: 130,
                    width: 130,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black),
                        image: DecorationImage(
                            image: AssetImage(data!["image"]),
                            fit: BoxFit.fill)),
                  ),
                  Text(
                    MyTheme.mmText(data!["message"]),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
