import 'package:flutter/material.dart';

import '../data/questionnare_list.dart';
import '../helper/my_theme.dart';
import '../widget/appbar.dart';
import '../widget/drawer.dart';
import 'answer_screen.dart';

// ignore: must_be_immutable
class QuestionNaireScreen extends StatelessWidget {
  final Map<String, dynamic>? quenaire;
  final String? text;
  QuestionNaireScreen({Key? key, this.quenaire, this.text}) : super(key: key);
  QuestionNaireList? data = QuestionNaireList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  MyTheme.mmText(quenaire!["quesnaire"]),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  MyTheme.mmText(data!.mmDatas["time"]),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Divider(thickness: 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MyTheme.mmText(data!.mmDatas["dept"]),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600, height: 1.7),
                ),
                Text(
                  MyTheme.mmText(text!),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600, height: 1.7),
                ),
              ],
            ),
            const Divider(thickness: 2),
            Expanded(
                child: ListView.builder(
                    itemCount: quenaire!["questionList"].length,
                    itemBuilder: (context, index) {
                      var queList = quenaire!["questionList"][index];
                      return Column(
                        children: [
                          Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                              leading:
                                  Text(MyTheme.mmText(queList["question"])),
                              title: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                      return AnswerScreen(question: queList);
                                    }));
                                  },
                                  child: Text(
                                    MyTheme.mmText(queList["question_title"]),
                                    style: const TextStyle(
                                        height: 1.2, fontSize: 14.0),
                                  )),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(MyTheme.mmText(
                                              queList["answer_a"])),
                                          Text(MyTheme.mmText(
                                              queList["answer_b"])),
                                          Text(MyTheme.mmText(
                                              queList["answer_c"])),
                                          Text(MyTheme.mmText(
                                              queList["answer"])),
                                        ],
                                      )),
                                )
                              ],
                            ),
                          ),
                          const Divider(thickness: 1.5)
                        ],
                      );
                    })),
            Text(MyTheme.mmText(data!.mmDatas["note"])),
            Text(MyTheme.mmText(data!.mmDatas["wrong_explaination"])),
          ],
        ),
      ),
    );
  }
}
