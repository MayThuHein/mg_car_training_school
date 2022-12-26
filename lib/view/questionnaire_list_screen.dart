import 'package:flutter/material.dart';
import 'package:making_good_app/view/question_naire_secreen.dart';

import '../data/questionnare_list.dart';
import '../helper/my_theme.dart';
import '../widget/appbar.dart';
import '../widget/drawer.dart';
import 'answer_screen.dart';

class QuestionnaireListScreen extends StatefulWidget {
  final String? text;
  final List<Map<String, dynamic>>? data;
  const QuestionnaireListScreen({Key? key, this.text, this.data})
      : super(key: key);

  @override
  State<QuestionnaireListScreen> createState() =>
      _QuestionnaireListScreenState();
}

class _QuestionnaireListScreenState extends State<QuestionnaireListScreen> {
  QuestionNaireList questionnaireListData = QuestionNaireList();
  List<Map<String, dynamic>> questionNaireList = [];
  UniqueKey keyTile = UniqueKey();
  @override
  void initState() {
    super.initState();
    questionNaireList = widget.data!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  questionnaireListData.mmDatas["quenaireI"],
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                // Text(
                //   questionnaireListData.mmDatas["time"],
                //   style: const TextStyle(
                //       fontSize: 15, fontWeight: FontWeight.w600),
                // ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MyTheme.mmText(questionnaireListData.mmDatas["dept"]),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600, height: 1.7),
                ),
                Text(
                  MyTheme.mmText(widget.text!),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600, height: 1.7),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: questionNaireList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                            expandedCrossAxisAlignment:
                                CrossAxisAlignment.start,
                            title: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return QuestionNaireScreen(
                                      quenaire: questionNaireList[index],
                                      text: widget.text);
                                }));
                              },
                              child: Text(
                                MyTheme.mmText(
                                    questionNaireList[index]["quesnaire"]),
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Column(
                                      children: List.generate(
                                          questionNaireList[index]
                                                  ["questionList"]
                                              .length, (position) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Divider(
                                                thickness: 1,
                                                color: Colors.black12),
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(builder:
                                                        (BuildContext context) {
                                                  return AnswerScreen(
                                                      question:
                                                          questionNaireList[
                                                                      index][
                                                                  "questionList"]
                                                              [position]);
                                                }));
                                              },
                                              child: Row(
                                                children: [
                                                  Text(
                                                    MyTheme.mmText(
                                                        questionNaireList[index]
                                                                ["questionList"]
                                                            [
                                                            position]["question"]),
                                                    style: const TextStyle(
                                                        fontSize: 13),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                      ),
                      const Divider(
                        thickness: 1,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
