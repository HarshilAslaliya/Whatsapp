import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/views/components/chats_components.dart';
import 'package:whatsapp/views/components/status_component.dart';
import 'package:whatsapp/views/components/call_component.dart';
import 'globals/globals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController tabController;

  PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  int current = 0;
  int currentCupertinoIndex = 0;

  TextEditingController _name = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _call = TextEditingController();

  getImage() async {
    ImagePicker pick = ImagePicker();
    XFile? file = await pick.pickImage(source: ImageSource.camera);
    if (file != null) {
      setState(() {
        Globals.image = File(file.path);
      });
    }
  }

  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return (Globals.isIos == false)
        ? MaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: Color(0xff075e55),
                secondary: Color(0xff075e55),
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              drawer: Drawer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Switch(
                          inactiveThumbImage:
                              AssetImage('assets/images/android1.png'),
                          activeThumbImage:
                              AssetImage('assets/images/apple.png'),
                          value: Globals.isIos,
                          onChanged: (val) {
                            setState(() {
                              Globals.isIos = val;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              appBar: AppBar(
                title: Text(
                  'Whatsapp',
                  style: TextStyle(fontSize: 22),
                ),
                actions: [
                  Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(CupertinoIcons.ellipsis_vertical),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
                bottom: TabBar(
                    onTap: (val) {
                      pageController.animateToPage(val,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    indicatorWeight: 4,
                    indicatorColor: Colors.white,
                    controller: tabController,
                    tabs: [
                      Tab(
                        child: Text(
                          'Chats',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Status',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Calls',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ]),
              ),
              body: PageView(
                controller: pageController,
                onPageChanged: (val) {
                  tabController.animateTo(val);
                },
                children: [
                  ChatsComponents(),
                  StatusComponent(),
                  CallsComponent(),
                ],
              ),
              floatingActionButton: Builder(builder: (context) {
                return FloatingActionButton(
                  onPressed: () {
                    setState(() {

                    });
                  },
                  child: Icon(
                    Icons.chat,
                    size: 30,
                  ),
                );
              }),
            ),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                leading: Builder(builder: (context) {
                  return GestureDetector(
                      onTap: () {
                        showCupertinoDialog(
                            context: context,
                            builder: (context) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: CupertinoSwitch(
                                                value: Globals.isIos,
                                                onChanged: (val) {
                                                  setState(() {
                                                    Globals.isIos = val;
                                                  });
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 7,
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          color: Colors.transparent,
                                        )),
                                    flex: 3,
                                  ),
                                ],
                              );
                            });
                      },
                      child: Icon(Icons.menu));
                }),
                middle: Text(
                  'WhatsApp',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black),
                ),
                trailing: CupertinoSwitch(
                    value: Globals.isIos,
                    onChanged: (val) {
                      setState(() {
                        Globals.isIos = val;
                      });
                    }),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 90),
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    IndexedStack(
                      index: currentCupertinoIndex,
                      children: [
                        ChatsComponents(),
                        StatusComponent(),
                        CallsComponent(),
                      ],
                    ),
                    CupertinoTabBar(
                      currentIndex: currentCupertinoIndex,
                      onTap: (val) {
                        setState(() {
                          currentCupertinoIndex = val;
                        });
                      },
                      items: [
                        BottomNavigationBarItem(
                          label: "Chats",
                          icon: Icon(CupertinoIcons.chat_bubble_2),
                        ),
                        BottomNavigationBarItem(
                          label: "Status",
                          icon: Icon(CupertinoIcons.profile_circled),
                        ),
                        BottomNavigationBarItem(
                          label: "Settings",
                          icon: Icon(CupertinoIcons.phone),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
