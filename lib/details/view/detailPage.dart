import 'package:exam/utils/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/controller/homecontroller.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Live News",
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
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(
            () => Column(
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Image.network(
                    "${homeController.d1.value.image}",
                    height: 200,
                  ),
                ),
                Container(
                  height: 1.5,
                  width: double.infinity,
                  color: Colors.black,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title :",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "${homeController.d1.value.title}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Content :",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "${homeController.d1.value.content}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Description :",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "${homeController.d1.value.des}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Db_Helper.db_helper.insertData(
                title: homeController.d1.value.title.toString(),
                content: homeController.d1.value.content.toString(),
                image: homeController.d1.value.image.toString(),
                desc: homeController.d1.value.des.toString());
            Get.back();
            Get.snackbar('Added Successfully', "Tap to view");
          },
          child: Icon(Icons.download),
        ),
      ),
    );
  }
}
