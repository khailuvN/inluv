import 'package:flutter/material.dart';
import 'Man2.dart';

class Man5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResetPasswordScreen(),
    );
  }
}

class PasswordField extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  const PasswordField({required this.label, required this.controller});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          obscureText: _obscureText,
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: TextStyle(color: Colors.grey[600], fontSize: screenWidth * 0.045),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: _toggleVisibility,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
          ),
          style: TextStyle(fontSize: screenWidth * 0.05),
        ),
        Container(
          height: 1,
          color: Colors.grey[400],
        ),
      ],
    );
  }
}

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String? _errorMessage;

  void _validatePasswords() {
    setState(() {
      if (_passwordController.text == _confirmPasswordController.text) {
        _errorMessage = null;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Man2()),
        );
      } else {
        _errorMessage = "Mật khẩu không khớp!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.3,
              width: double.infinity,
              color: Color(0xFFA61028),
              child: Image.asset(
                'lib/assets/group3.png',
                height: screenHeight * 0.3,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.03),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  PasswordField(
                    label: 'Mật khẩu mới',
                    controller: _passwordController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  PasswordField(
                    label: 'Nhập lại mật khẩu mới',
                    controller: _confirmPasswordController,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  if (_errorMessage != null)
                    Text(
                      _errorMessage!,
                      style: TextStyle(color: Colors.red, fontSize: screenWidth * 0.04),
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
                          borderRadius: BorderRadius.circular(screenWidth * 0.02),
                        ),
                      ),
                      onPressed: _validatePasswords,
                      child: Text(
                        'Tiếp tục',
                        style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.055),
                      ),
                    ),
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
