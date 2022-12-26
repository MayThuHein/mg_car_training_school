import 'package:flutter/material.dart';
import 'package:making_good_app/data/questionnare_list.dart';
import 'package:making_good_app/provider/app_provider.dart';
import 'package:making_good_app/view/about_licence.dart';
import 'package:making_good_app/view/about_screen.dart';
import 'package:making_good_app/view/address_screen.dart';
import 'package:making_good_app/view/blue_sign_screen.dart';
import 'package:making_good_app/view/car_knowledge_screen.dart';
import 'package:making_good_app/view/car_parking_screen.dart';
import 'package:making_good_app/view/home_screen.dart';
import 'package:making_good_app/view/photo_gallery.dart';
import 'package:making_good_app/view/questionnaire_list_screen.dart';
import 'package:making_good_app/view/red_sign_screen.dart';
import 'package:making_good_app/view/road_rule_screen.dart';
import 'package:making_good_app/view/yellow_sign_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'dart:async';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 0));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionNaireList questionData = QuestionNaireList();
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: AppState())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/home": (context) => HomeScreen(),
          "/red": (context) => RedSignScreen(),
          "/yellow": (context) => YellowSignScreen(),
          "/blue": (context) => BlueSignScreen(),
          "/carknowledge": (context) => CarKnowledgeScreen(
                back: false,
              ),
          "/licence": (context) => AboutLicenceScreen(),
          "/carparking": (context) => CarParkingScreen(),
          "/motorrules": (context) => RoadRuleScreen(),
          // "/orangesign": (context) => OrangeSignScreen(),
          "/questionA": (context) => QuestionnaireListScreen(
                text: questionData.mmDatas["rule_a"],
                data: questionData.questionNaireListA,
              ),
          "/questoionB": (context) => QuestionnaireListScreen(
                text: questionData.mmDatas["rule_b"],
                data: questionData.questionNaireListB,
              ),
          "/photo": (context) => PhotoGalleryScreen(),
          "/about": (context) => AboutScreen(),
          "/address": (context) => AddressScreen()
        },
        home: HomeScreen(),
      ),
    );
  }
}
