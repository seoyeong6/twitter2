import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:authentication/auth/widget/auth_button.dart';
import 'package:authentication/auth/account_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void onAccountTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AccountScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(FontAwesomeIcons.twitter, size: 24, color: Colors.blue),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Text(
                "See what's happening in the world right now.",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60),
              AuthButton(
                text: "Continue with Google",
                icon: FontAwesomeIcons.google,
              ),
              SizedBox(height: 16),
              AuthButton(
                text: "Continue with Apple",
                icon: FontAwesomeIcons.apple,
              ),
              SizedBox(height: 16),
              Text("----------or----------"),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => onAccountTap(context),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: Text(
                    "Create account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "By signing up, you agree to our Terms, Privacy Policy and Cookie Use.",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account?"),
            SizedBox(width: 4),
            Text(
              "Sign in",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
