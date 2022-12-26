import 'package:flutter/material.dart';

import '../helper/my_theme.dart';
import '../widget/appbar.dart';
import '../widget/drawer.dart';

class CarKnowledgeDetail extends StatelessWidget {
  final Map<String, dynamic>? data;
  const CarKnowledgeDetail({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              child: Image.asset(
                data!["image"],
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                  left: 15, right: 15, top: 10, bottom: 10),
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 4, spreadRadius: 3)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    MyTheme.mmText(data!["title"]),
                    style: const TextStyle(
                        height: 1.4, fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  data!["details"].length == 0
                      ? const SizedBox()
                      : Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Column(
                            children: List.generate(
                                data!["details"].length,
                                (index) => Text(
                                      MyTheme.mmText(
                                          data!["details"][index]["fact"]),
                                      style: const TextStyle(
                                          height: 1.4, fontSize: 14),
                                    )),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8),
                    child: Text(MyTheme.mmText(
                        'Credit to Original Writer \n မူရင်းရေးသားသူအားလေးစားစွာဖြင့် credit ပေးပါသည်။')),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
