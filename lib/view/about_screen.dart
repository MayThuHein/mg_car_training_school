import 'package:flutter/material.dart';

import '../widget/appbar.dart';
import '../widget/drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BaseAppBar(),
        drawer: DrawerWidget(),
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
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
            children: [
              Center(
                child: Text(
                  'About Us',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                  '⚈ MG ယာဉ်မောင်းသင်တန်းကျောင်းကို ၂၃/၁၂/၂၀၁၅ ခုနှစ် တွင် ဆရာဦးကျော်ကျော်ထွန်းမှ ဓမ္မသုခကျောင်းလမ်း လှိုင်မြို့နယ်တွင် စတင်တည်ထောင်ဖွင့်လှစ်ခဲ့ပါသည်။ \n⚈ ၂၀၁၇ ခုနှစ် နိုဝင်ဘာ လတွင်  MG 2  အမည်ဖြင့် သင်တန်းကျောင်းခွဲကို တောင်ဥက္ကလာပမြို့နယ်တွင် ထပ်မံဖွင့်လှစ်ခဲ့သည်။ \n⚈ သင်တန်းသားများ၏ယုံကြည်မှုဖြင့်  ဩဂုတ် ၂၀၁၈ ခုနှစ် တွင် အလုံမြို့နယ်တွင် ၎င်း၊ စက်တာဘာ ၂၀၁၉ ခုနှစ် တွင် တာမွေမြို့နယ် ဉ် ၎င်း ၊အင်းစိန်ရုံးခွဲကို ၂၀၁၉ တွင်၎င်း ၊ သာကေတ ရုံးခွဲကို ၂၀၂၀ ခုနှစ်တွင် ၎င်း အသီးသီးထပ်မံဖွင့်လှစ်ခဲ့ပါသည်။ \n⚈ MG ယာဉ်မောင်းသင်တန်းကျောင်းသည် လက်ရှိ ရုံးခွဲ ၆ခုဖွင့်လှစ်ထားပြီ တစ်ဦးခြင်း(အမျိုးသား/အမျိုးသမီး) ယာဉ်မောင်းအတတ်သင်ကြားခြင်းနှင့် လိုင်စင်ဝန်ဆောင်မှုများကို အာမခံဖြင့် တိကျ မှန်ကန် မြန်ဆန်စွာဆောင်ရွက်ပေးနေသည့်သင်တန်းကျောင်းတစ်ခုဖြစ်ပါသည်။\n⚈ https://www.facebook.com/MG1Hlaing')
            ],
          ),
        ));
  }
}
