import 'dart:ffi';
import 'package:flutter/material.dart';

class FieldBox extends StatelessWidget{
  const FieldBox({super.key , required this.abscureText ,required this.controller , required this.hintText});
  final controller;
  final String? hintText;
  final bool abscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextField(
          controller: controller,
          obscureText: abscureText,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple.shade100),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
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
