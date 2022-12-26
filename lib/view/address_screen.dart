import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/licence.dart';
import '../helper/my_theme.dart';
import '../widget/appbar.dart';
import '../widget/drawer.dart';

class AddressScreen extends StatefulWidget {
  AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  Data address = Data();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      drawer: DrawerWidget(),
      body: ListView(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
        children: [
          Text(
            MyTheme.mmText("MGသင်တန်းကျောင်း ရုံးခွဲ (၆)ခု လိပ်စာများ"),
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(address.addressList.length, (index) {
              var data = address.addressList[index];
              return Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(
                    top: 5, left: 8, right: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 4,
                          spreadRadius: 3)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      MyTheme.mmText(data["name"]),
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      MyTheme.mmText("လိပ်စာ : " + data["address"]),
                      style: TextStyle(height: 1.3, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Wrap(
                      children: [
                        Text(
                          "Phone: ",
                          style: TextStyle(fontSize: 15),
                        ),
                        Wrap(
                          children:
                              List.generate(data["phone"].length, (position) {
                            var phone = data["phone"][position];
                            return Text(
                              MyTheme.mmText(phone.toString()),
                              style: TextStyle(fontSize: 15),
                            );
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Wrap(
                      children: [
                        Text(
                          "YBS Car Lines: ",
                          style: TextStyle(fontSize: 15),
                        ),
                        Wrap(
                          children: List.generate(data["ybs_no"].length, (int) {
                            var ybsNo = data["ybs_no"][int];
                            return Text(
                              MyTheme.mmText(ybsNo.toString()),
                              style: TextStyle(fontSize: 15),
                            );
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      child: Text(data["map_link"],
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue)),
                      onTap: () async {
                        final Uri _url = Uri.parse(data["map_link"]);
                        if (await launchUrl(_url)) launchUrl(_url);
                      },
                    ),
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
