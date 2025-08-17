import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:authentication/auth/confirmation_screen.dart';

class AccountScreenTwo extends StatefulWidget {
  final String name;
  final String phone;
  final String dateOfBirth;

  const AccountScreenTwo({
    super.key,
    this.name = '',
    this.phone = '',
    this.dateOfBirth = '',
  });

  @override
  State<AccountScreenTwo> createState() => _AccountScreenTwoState();
}

class _AccountScreenTwoState extends State<AccountScreenTwo> {
  TextEditingController? _nameController;
  TextEditingController? _phoneController;
  TextEditingController? _dateController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _phoneController = TextEditingController(text: widget.phone);
    _dateController = TextEditingController(text: widget.dateOfBirth);
  }

  @override
  void dispose() {
    _nameController?.dispose();
    _phoneController?.dispose();
    _dateController?.dispose();
    super.dispose();
  }

  void _onSingUpPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ConfirmationScreen()),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // initState가 호출되지 않았다면 로딩 화면 표시
    if (_nameController == null ||
        _phoneController == null ||
        _dateController == null) {
      return Scaffold(
        appBar: AppBar(
          title: FaIcon(
            FontAwesomeIcons.twitter,
            size: 24,
            color: Theme.of(context).primaryColor,
          ),
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create your account",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: FaIcon(
                      FontAwesomeIcons.circleCheck,
                      size: 24,
                      color: Colors.green,
                    ),
                  ),
                ),
                readOnly: true,
                controller: _nameController!,
              ),

              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Phone & Email",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: FaIcon(
                      FontAwesomeIcons.circleCheck,
                      size: 24,
                      color: Colors.green,
                    ),
                  ),
                ),
                readOnly: true,
                controller: _phoneController!,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Date of Birth",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: FaIcon(
                      FontAwesomeIcons.circleCheck,
                      size: 24,
                      color: Colors.green,
                    ),
                  ),
                ),
                readOnly: true,
                controller: _dateController!,
              ),
              SizedBox(height: 60),
              Text(
                "By signing up, you agree to the Terms of Service and Privacy Policy, including Cookie Use. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, like keeping your account secure and personalizing our services, including ads. Learn more. Others will be able to find you by email or phone number, when provided, unless you choose otherwise here.",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: GestureDetector(
          onTap: _onSingUpPressed,
          child: Padding(
            padding: const EdgeInsets.all(36),
            child: Container(
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
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
