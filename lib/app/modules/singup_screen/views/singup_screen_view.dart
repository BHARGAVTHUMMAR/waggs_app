import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/singup_screen_controller.dart';

class SingupScreenView extends GetView<SingupScreenController> {
  const SingupScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingupScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SingupScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
