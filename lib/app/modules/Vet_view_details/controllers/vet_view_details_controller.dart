import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/Modal/VetDetailModel.dart';
import '../../../../main.dart';
import '../../../Modal/CartCountModel.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';

class VetViewDetailsController extends GetxController {

  RxBool hasData = false.obs;
  VetData vetData = VetData();
  RxBool isOpen = false.obs;
  RxBool isOpen1 = false.obs;
  RxBool isOpen2 = false.obs;
  String petid = '';
  String vetid= '';
  Count1 count1 = Count1();
  RxList<Count1> Countlist = RxList([]);
  @override
  void onInit() {
    CartCount();
    if (!isNullEmptyOrFalse(Get.arguments)) {
      if (!isNullEmptyOrFalse(Get.arguments[0][1])) {
        petid = Get.arguments[0];
        vetid = Get.arguments[1];
      }
    }
    VetDetails(context: Get.context!);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  VetDetails({required BuildContext context, bool isFromLoading = false}) async {
    var url = Uri.parse(baseUrl + ApiConstant.vetdetail + "${vetid}");
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    hasData.value = true;
    if (response.statusCode == 200) {
      VetDetailModel res = VetDetailModel.fromJson(jsonDecode(response.body));
      if (!isNullEmptyOrFalse(res)) {
        if (!isNullEmptyOrFalse(res.data)) {
          vetData = res.data!;
        }
      }
    }
  }

  CartCount() async {
    Countlist.clear();
    var url = Uri.parse(baseUrl + ApiConstant.Count);
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
      'Content-Type': 'application/json',
    });
    print('response status:${response.body}');
    dynamic result = jsonDecode(response.body);
    count1 = Count1.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(count1.data)) {
      Countlist.add(count1);
    }
    Countlist.refresh();
  }

}
