import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:authentication/auth/account_screen_two.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  bool _toggle = false;

  void _onTogglePressed() {
    setState(() {
      _toggle = !_toggle;
    });
  }

  void _onNextPressed() {
    if (_toggle) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountScreenTwo()),
      );
    }
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
        padding: const EdgeInsets.all(36),
        child: Column(
          children: [
            Text(
              "Customize your experience",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 20),
            Text(
              "Track where you see Twitter content across the web",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(width: 6),
                IconButton(
                  color: _toggle ? Theme.of(context).primaryColor : Colors.grey,
                  iconSize: 32,
                  onPressed: _onTogglePressed,
                  icon: FaIcon(
                    _toggle
                        ? FontAwesomeIcons.toggleOn
                        : FontAwesomeIcons.toggleOff,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "By signing up, you agree to our Terms, Privacy Policy, and Cookie Use. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. Learn more.",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(36),
          child: Container(
            height: 48,
            width: double.infinity,
            decoration: BoxDecoration(
              color: _toggle ? Colors.black : Colors.grey,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _onNextPressed,
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
