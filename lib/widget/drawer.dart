import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/drawer_data.dart';
import '../data/questionnare_list.dart';
import '../provider/app_provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  QuestionNaireList data = QuestionNaireList();
  bool ruleButton = false;
  bool questionButton = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: ListView(
          children: [
            Image.asset(
              "assets/images/MG-logo.png",
              height: 100,
              width: 160,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(drawerData.length, (index) {
                Map<String, dynamic> data = drawerData[index];
                print(data['icon']);
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildMenuItem(context, data: data, index: index),
                      Divider(
                        color: Color(0xFFCCCCC),
                      )
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, {required data, required index}) {
    final provider = Provider.of<AppState>(context);
    final currentItem = provider.selectedIndex;
    var isSelected;
    setState(() {
      isSelected = index == currentItem;
    });

    final color = isSelected ? Colors.red[600] : Colors.black;
    return InkWell(
      onTap: () => selectItem(context, index, data, isSelected),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Row(
                children: [
                  data['icon'],
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "${data['title']}",
                      style: TextStyle(
                          color: color,
                          decoration: data["detail_list"] == null
                              ? TextDecoration.none
                              : TextDecoration.underline),
                    ),
                  ),
                ],
              )),
              data["detail_list"] == null
                  ? SizedBox()
                  : Icon(Icons.arrow_drop_down)
            ],
          ),
          data["detail_list"] == null
              ? SizedBox()
              : isSelected
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          List.generate(data["detail_list"].length, (position) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10.0,
                            top: 5,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.popAndPushNamed(context,
                                  data["detail_list"][position]["page"]);
                            },
                            child: Text(
                              "${data["detail_list"][position]["text"]}",
                              style: TextStyle(
                                  height: 1.3,
                                  color: data["detail_list"][position]
                                      ["color"]),
                            ),
                          ),
                        );
                      }),
                    )
                  : const SizedBox()
        ],
      ),
    );
  }

  void selectItem(BuildContext context, index, data, isSelected) {
    final provider = Provider.of<AppState>(context, listen: false);
    provider.updateCategoryId(index);
    // Navigator.pushNamed(context, data["page"]);
    if (index != 1 && index != 4) {
      // Navigator.pushNamedAndRemoveUntil(context, data["page"], (r) => false);
      Navigator.popAndPushNamed(context, data["page"]);
    }
  }
}
