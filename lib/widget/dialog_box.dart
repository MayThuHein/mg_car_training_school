import 'package:flutter/material.dart';

import '../helper/const.dart';

class AlertExitBox extends StatelessWidget {
  const AlertExitBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Exit App'),
      content: Text('Do you want to exit from this App?'),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(false),
          //return false when click on "NO"
          child: Text('No'),
          style: style,
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          //return true when click on "Yes"
          child: Text('Yes'),
          style: style,
        ),
      ],
    );
  }
}
