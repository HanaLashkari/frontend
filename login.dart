import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test/Helpful.dart';

import 'Info.dart';

class first_page extends StatefulWidget{
  @override
  login createState() => login();
}

class login extends State<first_page>{
  final usernameController = TextEditingController();
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isVisible = true;
  String response = '';
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.purple.shade50,
        appBar: AppBar(
          title: Text('Log In Page'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.purple.shade800,
            ), onPressed: () {  },
          ),
        ),
        body: SafeArea(
          child:ListView(
            children: [
              SizedBox( height: 80),
              Row(
                children: [
                  const SizedBox(width: 92),
                  Text(
                    'Fill out the items.',
                    style: TextStyle(
                      color: Colors.purple.shade900, //B71579FF
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              const NameBox(title: 'User Name:' , value: 25),
              SizedBox(height: 5),
              FieldBox(abscureText: false, controller: usernameController, hintText: 'Hana Lashkari'),
              SizedBox(height: 15),
              const NameBox(title: 'Id:' , value: 25),
              SizedBox(height: 5),
              FieldBox(abscureText: false, controller: idController, hintText: '123456789'),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    SizedBox(height: 15 ),
                    NameBox(title: 'Password:' , value: 0),
                    SizedBox(height: 5),
                    TextField(
                      controller: passwordController,
                      obscureText: _isVisible,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple.shade100),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: '************',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          icon: _isVisible
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  SizedBox(width: 305),
                  Text(
                      'Signup',
                    style: TextStyle(
                      color: Color(0xfff50072),
                      fontSize: 15,

                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              ElevatedButton(onPressed: (){},
                child: Text(
                  'LogIn',
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade900,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  InkWell(
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
                  )
                ],
              )
            ],
          ),
        )
    );
  }

  Future<String> logIn() async {
    await Socket.connect("192.168.1.35", 8000).then((serverSocket) {
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