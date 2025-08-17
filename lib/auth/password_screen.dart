import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:authentication/interests/interest_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordValid = false;

  void _onPasswordChanged() {
    setState(() {
      _isPasswordValid = _passwordController.text.length >= 8;
    });
  }

  bool _isPasswordVisible = false;
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _onNextPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InterestScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          size: 24,
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You'll need a password",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
            ),
            Text(
              "Make sure it's 8 characters or more",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 32),
            TextFormField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: _togglePasswordVisibility,
                      child: FaIcon(
                        _isPasswordVisible
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                    if (_isPasswordValid) ...[
                      SizedBox(width: 8),
                      FaIcon(
                        FontAwesomeIcons.circleCheck,
                        size: 20,
                        color: Colors.green,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: GestureDetector(
          onTap: _onNextPressed,
          child: Padding(
            padding: const EdgeInsets.all(36),
            child: Container(
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                color: _isPasswordValid ? Colors.black : Colors.grey,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
