import 'package:exam/home/model/detailmodel.dart';
import 'package:get/get.dart';

import '../model/detailmodel.dart';

class HomeController extends GetxController{
  Rx<DetailModel> d1  = DetailModel().obs;
  RxList<Map> dataList = <Map>[].obs;
}