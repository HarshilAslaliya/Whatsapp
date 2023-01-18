import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../globals/globals.dart';

class CallsComponent extends StatefulWidget {
  const CallsComponent({Key? key}) : super(key: key);

  @override
  State<CallsComponent> createState() => _CallsComponentState();
}

class _CallsComponentState extends State<CallsComponent> {
  DateTime today = DateTime.now();

  // String date = DateTime.now().toString();

  TimeOfDay todayTime = TimeOfDay.now();

  List<String> allMonths = [
    'Jan',
    'Feb',
    'March',
    'April',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ...allContacts
                  .map((e) => Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('${e['image']}'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${e['name']}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.call_received_outlined,color: Colors.green,),
                            SizedBox(width: 10,),
                            Text('${e['time']}'),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.call,
                        size: 30,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ))
                  .toList(),

            ],
          ),
        ),
      ),
    );
  }
}
