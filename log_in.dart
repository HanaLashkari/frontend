import 'dart:io';

import 'package:test/Helpful.dart';
import 'package:flutter/material.dart';

import 'Info.dart';

class page_one extends StatefulWidget{
  @override
  State<page_one> createState() => _page_oneState();
}

class _page_oneState extends State<page_one> {
  final usernameController = TextEditingController();
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isVisible = true;
  String response = '';
  static const buttonColor = Color(0xffbb0000);
  static const Color colorText = Color(0xFF024335);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Log In Page'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: buttonColor,
          ), onPressed: () {  //todo
             },
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
                child: FieldBox(
                  labelText: 'رمز عبور',
                  hintText: 'رمز عبور نباید شامل اسم کاربر باشد',
                  controller: passwordController,
                )
            ),
            Positioned(
                top: 450,
                right: 26,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InfoScreen(),
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
                  if (response == 'رمز مورد تایید است!') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InfoScreen(),
                      ),
                    );
                  }
                  else{
                    Text(
                      response,
                      style: TextStyle(
                          color: Color(0xbd961d6b),
                          fontSize: 15
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
          ],
        ),
      ),
    );
  }

  Future<String> logIn() async {
    await Socket.connect("192.168.128.145", 8000).then((serverSocket) {
      serverSocket
          .write('${usernameController.text}-${idController.text}-${passwordController.text}\u0000');
      serverSocket.flush();
      serverSocket.listen((socketResponse) {
        setState(() {
          response = String.fromCharCodes(socketResponse);
        });
      });
    });
    print("----------   server response is:  { $response }");
    return response;
  }
}