import 'package:exam/home/controller/homecontroller.dart';
import 'package:exam/utils/api_http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/homemodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Homemodel?>(
          future: Api_http().getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              Homemodel? h1 = snapshot.data;
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    child: InkWell(
                      onTap: () {
                        homeController.d1.value.title = h1.articles![index].title ;
                        homeController.d1.value.image = h1.articles![index].urlToImage ;
                        homeController.d1.value.content = h1.articles![index].content ;
                        homeController.d1.value.des = h1.articles![index].description ;
                        Get.toNamed('detail');
                      },
                      child: Container(
                        height: 250,
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            left: 8, right: 8, bottom: 10, top: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${h1.articles![index].title} .",
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
                                    child:
                                        Text("${h1.articles![index].content}")),
                                Expanded(
                                  child: Image.network(
                                    "${h1.articles![index].urlToImage}",
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
                itemCount: h1!.articles!.length,
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
