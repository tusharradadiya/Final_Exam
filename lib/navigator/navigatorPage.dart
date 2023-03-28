import 'package:exam/home/view/homePage.dart';
import 'package:exam/offline/view/offline.dart';
import 'package:exam/utils/sharedhelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int i = 0;
  List pageList = [HomePage(), OfflinePage()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          title: i == 0
              ? Text(
                  "Live News",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                )
              : Text(
                  "Offline News",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "",
                  content: Text("Are you sure, Logout?"),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Sharedhelper.sharedhelper.isLogin(false);
                        Get.offAllNamed('signin');

                      },
                      child: Text("Log Out"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Cancel"),
                    ),
                  ],
                );
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: pageList[i],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          onTap: (value) {
            setState(() {
              i = value;
            });
          },
          currentIndex: i,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: "Live",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download_for_offline_outlined),
              label: "Offline",
            ),
          ],
        ),
      ),
    );
  }
}
