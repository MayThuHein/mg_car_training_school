import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white24,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Image.asset(
        "assets/images/MG-logo.png",
        width: 150,
      ),
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
  // Size.fromHeight(appBar.preferredSize.height)
}
