import 'package:flutter/material.dart';

import '../widget/appbar.dart';
import '../widget/car_knowledge_widget.dart';
import '../widget/drawer.dart';

class CarKnowledgeScreen extends StatefulWidget {
  final bool back;
  const CarKnowledgeScreen({Key? key, required this.back}) : super(key: key);

  @override
  State<CarKnowledgeScreen> createState() => _CarKnowledgeScreenState();
}

class _CarKnowledgeScreenState extends State<CarKnowledgeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(),
        drawer: DrawerWidget(),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10, right: 10, top: 15),
          child: CarKnowledgeWidget(),
        ));
  }
}
