import 'dart:ffi';
import 'package:flutter/material.dart';

class FieldBox extends StatelessWidget{
  const FieldBox({super.key , required this.labelText,required this.controller , required this.hintText});
  final controller;
  final String labelText;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white70,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Color(0xff003b11),
            fontWeight: FontWeight.w300,
          ),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green)),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFFB4B4B4)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color(0xff006716)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
                color: Color(0xff09ce36),
                style: BorderStyle.solid),
          ),
        ),
      ),
    );
  }
}

class NameBox extends StatelessWidget{
  const NameBox({required this.title , required this.value});
  final String title;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: this.value ,
        ),
        Text(
            this.title ,
            style: TextStyle(
                color: Colors.purple.shade900,
                fontSize: 20
            )
        ),
      ],
    );
  }

}

class PharseText extends StatelessWidget{
  const PharseText({super.key , required this.pharse , required this.color , required this.size});
  final String? pharse;
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      pharse!,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w100,
      ),
    );
  }

}
