import 'package:flutter/material.dart';

import '../data/questionnare_list.dart';
import '../helper/my_theme.dart';
import '../widget/appbar.dart';
import '../widget/drawer.dart';

// ignore: must_be_immutable
class AnswerScreen extends StatelessWidget {
  final Map<String, dynamic>? question;
  AnswerScreen({Key? key, this.question}) : super(key: key);
  QuestionNaireList queChoose = QuestionNaireList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(MyTheme.mmText(queChoose.mmDatas["question_choose"])),
            Text(MyTheme.mmText(question!["question"])),
            Text(MyTheme.mmText(question!["question_title"])),
            question!["image"] == null || question!["image"] == ""
                ? const SizedBox()
                : Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(question!["image"]),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(MyTheme.mmText(question!["answer_a"])),
                  Text(MyTheme.mmText(question!["answer_b"])),
                  Text(MyTheme.mmText(question!["answer_c"])),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(2, 3),
                                color: Colors.grey.withOpacity(0.4),
                                blurRadius: 4,
                                spreadRadius: 3)
                          ]),
                      child: Text(
                        MyTheme.mmText(question!["answer"]),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
