import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Man2.dart';

class Man1 extends StatefulWidget {
  @override
  _Man1State createState() => _Man1State();
}

class _Man1State extends State<Man1> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

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
                  'lib/assets/group1.png',
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
                      labelText: 'Họ và Tên',
                      labelStyle: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email của bạn',
                      labelStyle: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Số điện thoại',
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
                  TextField(
                    obscureText: !_isConfirmPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Nhập lại mật khẩu',
                      labelStyle: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  SizedBox(
                    height: screenHeight * 0.08,
                    width: screenWidth * 0.9,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFA61028),
                        foregroundColor: Colors.white,
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
                              content: Text('Đăng ký thành công!'),
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
                        'Đăng ký',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.06,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Đã có tài khoản ?',
                        style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.05),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Man2()),
                          );
                        },
                        child: Text(
                          'Đăng nhập.',
                          style: TextStyle(color: Colors.red, fontSize: screenWidth * 0.05),
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
