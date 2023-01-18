import 'package:flutter/material.dart';

import '../../globals/globals.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Switch(
              inactiveThumbImage:
              AssetImage('assets/images/android1.png'),
              activeThumbImage: AssetImage('assets/images/apple.png'),
              value: Globals.isIos,
              onChanged: (val) {
                setState(() {
                  Globals.isIos = val;
                });
              }),
        ),
      ],
    );
  }
}
