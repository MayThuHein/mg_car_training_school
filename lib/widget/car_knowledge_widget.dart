import 'package:flutter/material.dart';

import '../data/car_knowledge_list.dart';
import '../helper/my_theme.dart';
import '../view/car_knowledge_detail.dart';

class CarKnowledgeWidget extends StatefulWidget {
  const CarKnowledgeWidget({Key? key}) : super(key: key);

  @override
  State<CarKnowledgeWidget> createState() => _CarKnowledgeWidgetState();
}

class _CarKnowledgeWidgetState extends State<CarKnowledgeWidget> {
  CarKnowledgeData carKnowledgeData = CarKnowledgeData();
  List<Map<String, dynamic>> carKnowledgeList = [];
  @override
  void initState() {
    super.initState();
    carKnowledgeList = carKnowledgeData.carKnowledgeList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          carKnowledgeList.length,
          (index) => InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return CarKnowledgeDetail(data: carKnowledgeList[index]);
                  }));
                },
                child: Container(
                  height: 106,
                  margin: const EdgeInsets.only(
                    top: 7,
                    bottom: 3,
                  ),
                  padding: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset:
                            const Offset(0.1, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage(
                                carKnowledgeList[index]["image"],
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, left: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                MyTheme.mmText(
                                    carKnowledgeList[index]["title"]),
                                style: const TextStyle(
                                    height: 1.45, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                MyTheme.mmText(carKnowledgeList[index]
                                    ["details"][0]["fact"]),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    height: 1.25, fontSize: 13.5),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
