import 'package:flutter/material.dart';
import 'package:making_good_app/view/questionnaire_list_screen.dart';

import '../data/questionnare_list.dart';
import '../helper/my_theme.dart';
import '../widget/appbar.dart';
import '../widget/car_knowledge_widget.dart';
import '../widget/dialog_box.dart';
import '../widget/drawer.dart';
import 'car_knowledge_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuestionNaireList data = QuestionNaireList();
  Map<String, dynamic>? labelText;
  @override
  void initState() {
    super.initState();
    labelText = data.mmDatas;
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
        //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertExitBox(),
      ); //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: SafeArea(
        child: Scaffold(
          drawer: DrawerWidget(),
          appBar: const BaseAppBar(),
          body: ListView(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            children: [
              Text(MyTheme.mmText(labelText!["for_driver"])),
              Text(MyTheme.mmText(labelText!["learn_que"])),
              const SizedBox(
                height: 7,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return QuestionnaireListScreen(
                                text: data.mmDatas["rule_a"],
                                data: data.questionNaireListA);
                          }));
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      "assets/images/component1.png",
                                    ),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              right: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    MyTheme.mmText(labelText!["ques_naires"]),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(MyTheme.mmText(labelText!["rule_a"]),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          height: 1.2,
                                          fontSize: 12)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return QuestionnaireListScreen(
                                    text: data.mmDatas["rule_b"],
                                    data: data.questionNaireListB);
                              },
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      "assets/images/component2.png",
                                    ),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 20,
                              right: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    MyTheme.mmText(labelText!["ques_naires"]),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(MyTheme.mmText(labelText!["rule_b"]),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          height: 1.2,
                                          fontSize: 12)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    MyTheme.mmText(labelText!["car_knowledges"]),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const CarKnowledgeScreen(back: true);
                        }));
                      },
                      child: Row(
                        children: [
                          Text(
                            MyTheme.mmText(labelText!["view_all"]),
                          ),
                          const Icon(Icons.arrow_forward,
                              size: 18, color: Colors.black)
                        ],
                      )),
                ],
              ),
              const CarKnowledgeWidget()
            ],
          ),
        ),
      ),
    );
  }
}
