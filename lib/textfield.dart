import 'dart:ui';

import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String placeholder;
  final String label;
  final controller;
  const AppTextField({ required this.placeholder, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 7, left: 10, bottom: 7),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
          color: const Color(0xFF1E1C24),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: const Color(0xFF5D5D67),
              width: 1
          )
      ),
      child: TextFormField(
        controller: controller,
        validator: (String? value){
          if (value == null){
            return "Please enter principal amount";
          }
        },
        keyboardType: TextInputType.phone,
        style: const TextStyle(
            fontSize: 15, color: Colors.white
        ),
        decoration: InputDecoration(hintText: placeholder,
            errorStyle: TextStyle(
              color: Colors.white
            ),
            label: Text(label, style: TextStyle(color: Colors.white,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400),),
            hintStyle: const TextStyle(
                color: Color(0xFF8F8F9E), fontSize: 15,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins'
            ),
            border: InputBorder.none

        ),
      ),
    );
  }
}