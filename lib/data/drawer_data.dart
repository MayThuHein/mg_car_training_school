import 'package:flutter/material.dart';

List<Map<String, dynamic>> drawerData = [
  {
    "page": "/home",
    "title": "မူလစာမျက်နှာ",
    "icon": Icon(
      Icons.home,
      size: 18,
    )
  },
  {
    "page": "false",
    "title": "ယာဉ်စည်းကမ်း လမ်းစည်းကမ်း",
    "icon": Icon(
      Icons.edit_road,
      size: 18,
    ),
    "detail_list": [
      {
        "page": "/red",
        "text": "တားမြစ်ခြင်း နှင့် ကန့်သတ်ခြင်း လမ်းညွှန်များ",
        "color": Colors.red[200],
        "icon": Icon(Icons.home)
      },
      {
        "page": "/yellow",
        "text": "အန္တရာယ်သတိပေး လမ်းညွှန်များ",
        "color": Color.fromARGB(255, 219, 197, 0),
        "icon": Icon(Icons.warning)
      },
      {
        "page": "/blue",
        "text": "အမိန့်ပေးခြင်း လမ်းညွှန်များ",
        "color": Colors.blue,
        "icon": Icon(Icons.comment)
      },
      {
        "page": "/carparking",
        "text": "ကားပါကင်ထိုးပုံထိုးနည်းများ",
        "color": Colors.black,
        "icon": Icon(Icons.park)
      },
      {
        "page": "/motorrules",
        "text": "မော်တော်ယာဥ်နည်းဥပဒေများ",
        "color": Colors.black,
        "icon": Icon(Icons.contact_mail)
      },
    ],
  },
  {
    "page": "/carknowledge",
    "title": "ကားစက်ပိုင်းဆိုင်ရာ ဗဟုသုတများ",
    "icon": Icon(
      Icons.lightbulb_outline,
      size: 18,
    )
  },
  {
    "page": "/licence",
    "title": "ယဥ်မောင်းလိုင်စင်အကြောင်း",
    "icon": Icon(
      Icons.credit_card,
      size: 18,
    )
  },
  {
    "page": "false",
    "title": "မေးခွန်းလွှာများ",
    "icon": Icon(
      Icons.question_answer,
      size: 18,
    ),
    "detail_list": [
      {
        "page": "/questionA",
        "text": "\"ခ\" ယာဉ်မောင်းလိုင်စင်ဖြေဆိုသူများ အတွက် ယာဥ်/လမ်းစည်းကမ်း",
        "color": Colors.red[200],
      },
      {
        "page": "/questoionB",
        "text":
            "\"ဃ\" /\"င\" ယာဉ်မောင်းလိုင်စင်ဖြေဆိုသူများ အတွက် ယာဥ်/လမ်းစည်းကမ်း",
        "color": Colors.black,
      },
    ],
  },
  {
    "page": "/photo",
    "title": "မှတ်သားစရာများ",
    "icon": Icon(
      Icons.edit,
      size: 18,
    )
  },
  {
    "page": "/about",
    "title": "ကျွန်ုပ်တို့အကြောင်း",
    "icon": Icon(
      Icons.info,
      size: 18,
    )
  },
  {
    "page": "/address",
    "title": "ဆက်သွယ်ရန်လိပ်စာများ",
    "icon": Icon(
      Icons.email,
      size: 18,
    )
  }
];

enum NavigationItem {
  home,
  red,
  yellow,
  blue,
  carknowledge,
  licence,
  roadsign,
  orangesign,
  questionA,
  questoionB,
  unknown,
  about,
  address
}
