import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getex/core/constants.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    super.key,
    this.page,
  });
  final dynamic page;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: FloatingActionButton(
          backgroundColor: appBarClrBlk,
          onPressed: () {
            Get.to(page);
          },
          child: const Icon(
            Icons.add,
            size: 25,
            color: appBarClrWhite,
          )),
    );
  }
}
