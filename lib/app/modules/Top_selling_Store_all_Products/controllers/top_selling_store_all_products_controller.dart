import 'dart:convert';
import 'package:get/get.dart';
import 'package:waggs_app/app/Modal/GetAllProductModule.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:http/http.dart'  as http;
import 'package:waggs_app/app/constant/SizeConstant.dart';
class TopSellingStoreAllProductsController extends GetxController {
  //TODO: Implement TopSellingStoreAllProductsController
  var data = Get.arguments;
  GetAllproduct getAllproduct = GetAllproduct();
  RxList<Products> mainProductList = RxList<Products>([]);
  @override
  void onInit() {
    getProduct();
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
  getProduct() async {
    var URl = Uri.parse(baseUrl+ApiConstant.getAllProductUsers + "?sellerId=$data");
    var response = await http.get(URl);
    print(response.body);
    dynamic result = jsonDecode(response.body);
    getAllproduct = GetAllproduct.fromJson(result);
    if (!isNullEmptyOrFalse(getAllproduct.data)) {
      if (!isNullEmptyOrFalse(getAllproduct.data!.products)) {
        getAllproduct.data!.products!.forEach((element) {
          mainProductList.add(element);
        }
        );
      }
    }
    mainProductList.refresh();

  }

}
