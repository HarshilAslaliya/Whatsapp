import 'package:flutter/material.dart';

import '../../globals/globals.dart';

class StatusComponent extends StatefulWidget {
  const StatusComponent({Key? key}) : super(key: key);

  @override
  State<StatusComponent> createState() => _StatusComponentState();
}

class _StatusComponentState extends State<StatusComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 1,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Stack(
                      alignment: Alignment(1.2, 1.2),
                      children: [
                        CircleAvatar(
                          radius: 42,
                          backgroundImage:
                              AssetImage('assets/images/person.jpg'),
                        ),
                        CircleAvatar(
                          child: Icon(Icons.add),
                          backgroundColor: Color(0xff075e55),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My status',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Tap to add status update',
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Divider(endIndent: 15,indent: 15,),
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
                                Text(
                                  '${e['time']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
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
