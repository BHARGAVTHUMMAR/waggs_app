import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../controllers/date_time_appoiment_controller.dart';

class DateTimeAppoimentView extends GetWidget<DateTimeAppoimentController> {
  const DateTimeAppoimentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          child: Column(
        children: [
          Container(
            height: 60,
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.keyboard_backspace_outlined))
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // SizedBox(width: 200,),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              size: 25,
                              color: Colors.grey,
                            )),

                        Stack(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.shopping_cart,
                                  size: 25,
                                  color: Colors.grey[500],
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 180,
                      padding: EdgeInsets.all(100),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/catagory.jpg"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, right: 20),
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/ca.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 60, left: 25),
                              child: Text("Book Appointment",
                                  style: GoogleFonts.roboto(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5, left: 25),
                              child: Text("Home >",
                                  style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, left: 2),
                              child: Text("My Pets >",
                                  style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade600)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, left: 2),
                              child: Text("Book Appointment",
                                  style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade600)),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 0, left: 0),
                        child: Text("- SELECT TIME AND BOOK APPOINTMENT",
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            )),
                      ),
                      Container(
                        child: SfDateRangePicker(
                          selectionMode: DateRangePickerSelectionMode.single,
                          initialSelectedRange: PickerDateRange(
                              DateTime.now().subtract(const Duration(days: 4)),
                              DateTime.now().add(const Duration(days: 3))),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      )),
    ));
  }
}