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

class PharseText extends StatelessWidget {
  const PharseText(
      {super.key, required this.pharse, required this.color, required this.size});

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

class Eror_login extends StatelessWidget{
  Eror_login({required this.response , required this.widthOfScreen , required this.buttonColor});
  String response;
  double widthOfScreen;
  Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return response == '10'? Positioned(
        top: 560,
        right: widthOfScreen * 0.138,
        child: PharseText(
          pharse: 'رمز عبور اشتباه است دوباره امتحان کنید',
          size: 17,
          color: buttonColor,
        )
    ) : response == '01' || response == '00' ?
    Positioned(
        top: 560,
        right: widthOfScreen * 0.21,
        child: PharseText(
          pharse: 'اطلاعات یافت نشد، ثبت نام کنید',
          size: 17,
          color: buttonColor,
        )
    ) : Positioned(child: Container());
  }

  }

class Eror_password extends StatelessWidget{
  Eror_password({required this.response , required this.widthOfScreen , required this.buttonColor});
  String response;
  double widthOfScreen;
  Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return response == '0'? Positioned(
        top: 540,
        right: widthOfScreen * 0.12,
        child: PharseText(
          pharse: 'رمز عبور اشتباه باید بیشتر از 8 حرف باشد',
          size: 17,
          color: buttonColor,
        )
    ) : response == '1' ?
    Positioned(
        top: 540,
        right: widthOfScreen * 0.055,
        child: PharseText(
          pharse: 'رمز عبور باید شامل یکی از کارکترهای @ ، ! ، # و \$ باشد',
          size: 15,
          color: buttonColor,
        )
    ) : response == '2' ? Positioned(
        top: 540,
        right: widthOfScreen * 0.085,
        child: PharseText(
          pharse: 'رمز عبور باید شامل یک حرف بزرگ انگلیسی باشد',
          size: 16,
          color: buttonColor,
        )
    )
        : response == '3' ? Positioned(
        top: 540,
        right: widthOfScreen * 0.085,
        child: PharseText(
          pharse: 'رمز عبور باید شامل یک حرف کوچک انگلیسی باشد',
          size: 16,
          color: buttonColor,
        )
    ): response == '4' ? Positioned(
        top: 540,
        right: widthOfScreen * 0.14,
        child: PharseText(
          pharse: 'رمز عبور باید شامل یکی از اعداد 0-9 باشد',
          size: 16,
          color: buttonColor,
        )
    ) :
    response == '6' ? Positioned(
        top: 540,
        right: widthOfScreen * 0.055,
        child: PharseText(
          pharse: 'رمز عبور نباید شامل نام کاربری و شماره دانشجویی باشد',
          size: 15,
          color: buttonColor,
        )
    ) :
    response == '7' ? Positioned(
        top: 540,
        right: widthOfScreen * 0.25,
        child: PharseText(
          pharse: 'این حساب کاربری وجود دارد',
          size: 17,
          color: buttonColor,
        )
    ) :
    Positioned(child: Container());
  }

}