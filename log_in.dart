import 'dart:io';

import 'package:project/Helpful.dart';
import 'package:flutter/material.dart';
import 'package:project/home.dart';
import 'package:project/sign_up.dart';

class login_page extends StatefulWidget{
  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final usernameController = TextEditingController();
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isVisible = true;
  String response = '';
  static const buttonColor = Color(0xffbb0000);
  static const Color colorText = Color(0xFF024335);

  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In Page'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: heightOfScreen-80,
          width: widthOfScreen,
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
                  top: 20,
                  right: 30,
                  child: PharseText(
                    pharse: 'به اپلیکیشن دانشجویار خوش آمدید',
                    color: colorText,
                    size: 22,
                  ),
              ),
              Positioned(
                top: 75,
                right: 16,
                child: PharseText(
                  pharse: 'برای ورود به حساب کاربری خود اطلاعات زیر را کامل کنید',
                  color: colorText,
                  size: 15,
                ),
              ),
              Positioned(
                top: 100,
                right: 75,
                child: const PharseText(
                  pharse: 'اگر حساب کاربری ندارید ثبت نام کنید',
                  color: colorText,
                  size: 15,
                ),
              ),
              Positioned(
                top: 180,
                right: 32,
                child: FieldBox(
                  labelText: 'نام و نام خانوادگی',
                  hintText: 'بین نام و نام خانوادگی تنها یک فاصله باشد',
                  controller: usernameController,
                )
              ),
              Positioned(
                  top: 280,
                  right: 32,
                  child: FieldBox(
                    labelText: 'شماره دانشجویی',
                    hintText: 'اعداد باید انگلیسی باشند',
                    controller: idController,
                  )
              ),
              Positioned(
                  top: 380,
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
                          color: colorText,
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
              ),
              Positioned(
                  top: 450,
                  right: 26,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => signup_page(),
                        ),
                      );
                    },
                    child: const PharseText(
                      size: 14,
                      color: buttonColor,
                      pharse: 'ثبت نام کنید',
                    ),
                  ),
              ),
              Positioned(
                top: 500,
                right: 115,
                child: InkWell(
                  onTap: () async {
                    logIn();
                    print('************here     :    $response');
                    if (response.split('-')[0] == '11') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => home(int.parse(response.split("-")[1])),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: colorText,
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 62,),
                        PharseText(
                          color: Colors.white,
                          size: 15,
                          pharse: 'ورود',
                        ),
                      ],
                    ),
                  )
                )),
              Eror_login(response: response, widthOfScreen: widthOfScreen, buttonColor: buttonColor),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> logIn() async {
    await Socket.connect("192.168.141.145", 8000).then((serverSocket) {
      serverSocket.write('login\u0000');
      serverSocket.write('${usernameController.text}-${idController.text}-${passwordController.text}\u0000');
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