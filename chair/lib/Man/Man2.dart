import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Man3.dart';

class Man2 extends StatefulWidget {
  @override
  _Man2State createState() => _Man2State();
}

class _Man2State extends State<Man2> {
  bool _isPasswordVisible = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.3,
              width: double.infinity,
              color: Color(0xFFF2D5A1),
              child: Center(
                child: Image.asset(
                  'lib/assets/group2.png',
                  height: screenHeight * 0.3,
                  width: screenWidth,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.03,
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextField(
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Mật khẩu',
                      labelStyle: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Text(
                        'Nhớ đăng nhập',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.048,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Man3()));
                        },
                        child: Text(
                          'Quên mật khẩu?',
                          style: TextStyle(
                            fontSize: screenWidth * 0.048,
                            color: Color(0xFF5C5C6B),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  SizedBox(
                    height: screenHeight * 0.08,
                    width: screenWidth * 0.9,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFA61028),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Thông báo'),
                              content: Text('Đăng nhập thành công!'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        'Đăng Nhập',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.06,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    'Hoặc',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  SizedBox(
                    height: screenHeight * 0.08,
                    width: screenWidth * 0.9,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('lib/assets/google.png', height: screenHeight * 0.04),
                          SizedBox(width: screenWidth * 0.03),
                          Text(
                            'Đăng nhập bằng google',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.055,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Chưa có tài khoản ?',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Đăng ký.',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: screenWidth * 0.05,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
