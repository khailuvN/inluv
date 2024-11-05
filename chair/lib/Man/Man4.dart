import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'Man5.dart';

class Man4 extends StatefulWidget {
  final String phoneNumber;

  Man4({required this.phoneNumber});

  @override
  _Man4State createState() => _Man4State();
}

class _Man4State extends State<Man4> {
  late Timer _timer;
  int _start = 120;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _start = 120;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String get formattedTime {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: screenWidth * 0.05,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      iconSize: screenWidth * 0.06,
                    ),
                  ),
                  Text(
                    'Xác Thực OTP',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.07,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.1),
                ],
              ),
              SizedBox(height: screenHeight * 0.05),
              Container(
                width: screenWidth * 0.9,
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset(4, 4),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Một mã xác thực đã được gửi tới sđt:',
                      style: TextStyle(fontSize: screenWidth * 0.05),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      widget.phoneNumber,
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFA61028),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: Pinput(
                        length: 4,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        mainAxisAlignment: MainAxisAlignment.center,
                        defaultPinTheme: PinTheme(
                          width: screenWidth * 0.1,
                          height: screenHeight * 0.07,
                          textStyle: TextStyle(fontSize: screenWidth * 0.06, color: Colors.black),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(screenWidth * 0.02),
                            border: Border.all(color: Colors.grey),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: screenWidth * 0.1,
                          height: screenHeight * 0.07,
                          textStyle: TextStyle(fontSize: screenWidth * 0.06, color: Colors.black),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(screenWidth * 0.02),
                            border: Border.all(color: Color(0xFFA61028)),
                          ),
                        ),
                        onChanged: (value) {},
                        onCompleted: (pin) {
                          print('OTP entered: $pin');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _start == 0
                        ? () {
                      startTimer();
                      print("OTP resend triggered");
                    }
                        : null,
                    child: Text(
                      'Gửi lại OTP',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    formattedTime,
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
              SizedBox(
                height: screenHeight * 0.08,
                width: screenWidth * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFA61028),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Man5()));
                  },
                  child: const Text(
                    'Lấy mã xác nhận',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
