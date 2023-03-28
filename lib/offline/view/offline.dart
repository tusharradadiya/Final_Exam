import 'package:exam/home/model/detailmodel.dart';
import 'package:exam/utils/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/controller/homecontroller.dart';

class OfflinePage extends StatefulWidget {
  const OfflinePage({Key? key}) : super(key: key);

  @override
  State<OfflinePage> createState() => _OfflinePageState();
}

class _OfflinePageState extends State<OfflinePage> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    homeController.dataList.value = await Db_Helper.db_helper.readData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                child: InkWell(
                  onTap: () {
                    homeController.d1.value.title =
                        homeController.dataList[index]['title'];
                    homeController.d1.value.image =
                        homeController.dataList[index]['image'];
                    homeController.d1.value.content =
                        homeController.dataList[index]['content'];
                    homeController.d1.value.des =
                        homeController.dataList[index]['desc'];
                    Get.toNamed('detail');
                  },
                  child: Container(
                    height: 240,
                    width: double.infinity,
                    margin:
                        EdgeInsets.only(left: 8, right: 8, bottom: 10, top: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${homeController.dataList[index]['title']} .",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                    "${homeController.dataList[index]['content']} ")),
                            Expanded(
                              child: Image.network(
                                "${homeController.dataList[index]['image']}",
                                height: 100,
                                width: 150,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: homeController.dataList.length,
          ),
        ),
      ),
    );
  }
}
