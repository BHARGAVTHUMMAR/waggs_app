import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:waggs_app/app/Modal/appointments_models.dart';
import 'package:waggs_app/app/Modal/view_pet_details_models.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/constant/SizeConstant.dart';
import 'package:waggs_app/app/routes/app_pages.dart';
import 'package:waggs_app/main.dart';
import 'package:waggs_app/utilities/custome_dialogs.dart';

import '../../../Modal/CartCountModel.dart';
import '../../../constant/Container.dart';

class PetViewDetailsController extends GetxController {
  //TODO: Implement PetViewDetailsController
  RxBool hasData = false.obs;
  RxBool hasData1 = false.obs;
  PetData petData = PetData();
  RxList<Appointments> appointmentslist = RxList([]);
  Appointments1 appointments1 = Appointments1();
  Rx<TextEditingController> reasonController = TextEditingController().obs;
  Rx<TextEditingController> feedBackController = TextEditingController().obs;
  RxDouble _initialRating = 0.0.obs;
  bool _isVertical = false;
  RxDouble _rating = 0.0.obs;
  String Argument = "";
  Count1 count1 = Count1();
  RxList<Count1> Countlist = RxList([]);
  @override
  void onInit() {
    CartCount();
    if (Get.arguments != null) {
      Argument = Get.arguments;
    }
    MyPet(context: Get.context!);

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

  MyPet({required BuildContext context, bool isFromLoading = false}) async {
    hasData.value = false;
    var url = Uri.parse(baseUrl + ApiConstant.getpet + "${Argument}");
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    hasData.value = true;
    if (response.statusCode == 200) {
      pet1 res = pet1.fromJson(jsonDecode(response.body));
      if (!isNullEmptyOrFalse(res)) {
        if (!isNullEmptyOrFalse(res.data)) {
          petData = res.data!;
        }
      }
      appointmentApi(context: Get.context!);
    }
  }

  dilogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0.0),
            content: Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Call to book your appointment",
                    style: GoogleFonts.publicSans(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "+91 9741588018",
                    style: GoogleFonts.publicSans(
                      color: Color(0xffeb9d4f),
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Pet Id: ${petData.uniqueNo}",
                    style: GoogleFonts.publicSans(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          child: ElevatedButton(
                        onPressed: () async {
                          const url = 'tel:9741588018';
                          await launch(url);
                        },
                        child: Text("Call Now"),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  cancelAppointment(
      {required BuildContext context, required String AppointmentId}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0.0),
            content: Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Reason",
                    style: GoogleFonts.publicSans(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 200,
                    margin: EdgeInsets.only(left: 15, right: 15),
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: TextFormField(
                      controller: reasonController.value,
                      keyboardType: TextInputType.text,
                      maxLines: 7,
                      decoration: InputDecoration(
                        hintText: "Type your reason here...",
                        hintStyle: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: TextButton(
                              onPressed: () async {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "CANCEL",
                                style: TextStyle(color: Colors.orange),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              deleteAppointment(AppointmentId);
                              reasonController.value.clear();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: getcon(
                                color: Colors.orange,
                                text: Text(
                                  "SUBMIT",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                width: 100,
                                height: 40,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  appointmentApi(
      {required BuildContext context, bool isFromLoading = false}) async {
    appointmentslist.clear();
    hasData1.value = false;
    var url = Uri.parse(baseUrl +
        "appointment/list?skip=0&limit=15&petId=${Argument}&status=&search=");
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    hasData1.value = true;
    dynamic result = jsonDecode(response.body);
    appointments1 = Appointments1.fromJson(result);
    if (response.statusCode == 200) {
      if (!isNullEmptyOrFalse(appointments1)) {
        if (!isNullEmptyOrFalse(appointments1.data!.appointments)) {
          appointments1.data!.appointments!.forEach((element) {
            print(response.body);
            appointmentslist.add(element);
          });
        }
      }
    }
  }

  MyPetDelete(
      {required BuildContext context, bool isFromLoading = false}) async {
    getIt<CustomDialogs>().showCircularDialog(context);
    var url = Uri.parse(baseUrl + ApiConstant.getpet + "${petData.sId}");
    var response = await http.delete(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    getIt<CustomDialogs>().hideCircularDialog(context);

    if (response.statusCode == 200) {
      Get.back();
      Get.offAndToNamed(Routes.MY_PET);
    }
  }

  deleteAppointment(String AppointmentId) async {
    var URl = baseUrl + ApiConstant.appointment + "${AppointmentId}";
    Dio dio = Dio();
    Options option = Options(headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    var response;
    await dio
        .put(
      URl,
      data: {
        "status": "canceled",
        "reason": '${reasonController.value.text.trim()}'
      },
      options: option,
    )
        .then((value) {
      response = value;
      if (response.statusCode == 200 || response.statusCode == 201) {
        reasonController.value.clear();
        Get.back();
        MyPet(context: Get.context!);
        print(response.data);
      } else if (response.statusCode == 400) {
      } else {}
    }).catchError((error) {
      DioError err = error as DioError;
      print("Error:==== ${err.response}");
    });
  }

  deleteDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0.0),
            content: Container(
              margin: EdgeInsets.only(top: 20),
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Are you sure you want to delete this pet?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              MyPetDelete(context: context);
                            },
                            child: Text("yes")),
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text("No")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  feedBackApi(String AppointmentId) async {
    var URl = baseUrl + ApiConstant.appointment + "${AppointmentId}";
    Dio dio = Dio();
    Options option = Options(headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    var response;
    await dio
        .put(
      URl,
      data: {
        "rating": _rating.value,
        "review": '${feedBackController.value.text.trim()}'
      },
      options: option,
    )
        .then((value) {
      response = value;
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.back();

        MyPet(context: Get.context!);
        print(response.data);
      } else if (response.statusCode == 400) {
      } else {}
    }).catchError((error) {
      DioError err = error as DioError;
      print("Error:==== ${err.response}");
    });
  }

  feedBackDialog(
      {required BuildContext context, required String AppointmentId}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0.0),
          insetPadding: EdgeInsets.all(10),
          content: Container(
            height: 300,
            width: 400,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Vet Feedback",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RatingBar.builder(
                        glow: false,
                        initialRating: _initialRating.value,
                        minRating: 0.5,
                        direction:
                            _isVertical ? Axis.vertical : Axis.horizontal,
                        allowHalfRating: true,
                        unratedColor: Colors.amber.withAlpha(50),
                        itemCount: 5,
                        itemSize: 30.0,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          _rating.value = rating;
                          print(_rating);
                        },
                        updateOnDrag: true,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  padding: EdgeInsets.only(
                    left: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: TextFormField(
                    controller: feedBackController.value,
                    keyboardType: TextInputType.text,
                    maxLines: 7,
                    decoration: InputDecoration(
                      hintText: "Type your reason here...",
                      hintStyle: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, top: 5.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: TextButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "CANCEL",
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            feedBackApi(AppointmentId);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 5),
                            child: getcon(
                              color: Colors.orange,
                              text: Text(
                                "SUBMIT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              width: 100,
                              height: 40,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
