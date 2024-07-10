import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/home.dart';

import 'Helpful.dart';

class user_profile extends StatefulWidget{
  user_profile(this.id);
  int id;
  @override
  State<user_profile> createState() => _user_profileState();
}

class _user_profileState extends State<user_profile> {
  static const buttonColor = Color(0xffbb0000);
  static const textColor = Color(0xFF024335);
  static const backgroundColor = Color(0xFFE6F6EF);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isVisible = true;
  var response = '';
  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: textColor,
          ),
          onPressed: () => setState(
                () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => home(widget.id),
                  ));
            },
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: const [
                0.5,
                0.8,
                0.9,
              ],
              colors: [
                Colors.white,
                Colors.green.shade50,
                Colors.green.shade100,
              ]),
        ),
        child: Stack(
          children: [
            Positioned(
                top: 10,
                right: 127,
                child:Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                  border: Border.all(width: 4, color: textColor),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 6,
                        spreadRadius: 2,
                        color: Colors.white
                    )
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://irs01.wisgoon.com/irs01/8b/8a/e0/5f/irs01_s3old_736x736_bF2GD9mm_2411253_1626592307032145264.jpeg',
                      )
                  )
              ),
            )),  //نمایه
            Positioned(
              top: 148,
              right: 105,
              child: const PharseText(
                pharse: 'اطلاعات خود را کامل کنید',
                color: textColor,
                size: 18,
              ),
            ),  //نوشته
            Positioned(
              top: 190,
                right: 10,
                child: Container(
                  width: 365,
                  height: 230,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    border: Border.all(
                      color: textColor,
                      width: 8,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                )),  //بکگراند
            Positioned(
                top: 230,
                right: 32,
                child: FieldBox(
                  labelText: 'نام و نام خانوادگی',
                  hintText: 'بین نام و نام خانوادگی تنها یک فاصله باشد',
                  controller: usernameController,
                )
            ),  //باکس نام و نام خانوادگی
            Positioned(
              top: 310,
              right: 32,
              child: SizedBox(
                width: 320,
                child: TextFormField(
                  obscureText: _isVisible,
                  controller: passwordController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      icon: _isVisible
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      color: textColor,
                    ),
                    filled: true,
                    fillColor: Colors.white70,
                    labelText: 'رمز عبور',
                    labelStyle: const TextStyle(
                      color: Color(0xff003b11),
                      fontWeight: FontWeight.w300,
                    ),
                    border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green , width: 5)),
                    hintText: 'رمز عبور نباید شامل نام کاربری باشد',
                    hintStyle: const TextStyle(color: Color(0xFFB4B4B4)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xff003b11) , width: 3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Color(0xff09ce36),
                          style: BorderStyle.solid),
                    ),
                  ),
                ),
              ),
            ),  //باکس رمز عبور
            Positioned(
                top: 450,
                right: 118,
                child: InkWell(
                    onTap: () async {
                      changeInformation();
                      if (response.contains('5')) {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => home(widget.id),
                        ));
                      }
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: textColor,
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 46,),
                          PharseText(
                            color: Colors.white,
                            size: 15,
                            pharse: 'ذخیره کن',
                          ),
                        ],
                      ),
                    )
                )),  //دکمه ثبت
            Eror_password(response: response, widthOfScreen: widthOfScreen, buttonColor: buttonColor),
            Eror_login(response: response, widthOfScreen: widthOfScreen, buttonColor: buttonColor)
          ],
        ),
      ),
    );
  }
  Future<String> changeInformation() async {
    await Socket.connect("192.168.141.145", 8000).then((serverSocket) {
      serverSocket.write('${widget.id}-changeInformation\u0000');
      serverSocket.write('${usernameController.text}-${passwordController.text}\u0000');
      serverSocket.flush();
      serverSocket.listen((socketResponse) {
        if (mounted) {
          setState(() {
            response = String.fromCharCodes(socketResponse);
          });
        }
      });
    });
    print("---------- server response is:  { $response }");
    return response;
  }
}