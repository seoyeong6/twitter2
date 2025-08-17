import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //TextInputFormatter 사용.
import 'package:authentication/auth/password_screen.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  bool _complete = false;
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  @override
  void initState() {
    super.initState();
    // 각 컨트롤러에 리스너 추가
    for (var controller in _controllers) {
      controller.addListener(_checkComplete);
    }
  }

  @override
  void dispose() {
    // 컨트롤러들 해제
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _checkComplete() {
    // 모든 TextField가 입력되었는지 확인
    bool allFilled = _controllers.every(
      (controller) => controller.text.isNotEmpty,
    );

    if (allFilled != _complete) {
      setState(() {
        _complete = allFilled;
      });
    }
  }

  void _onNextPressed(BuildContext context) {
    if (_complete) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PasswordScreen()),
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
        padding: const EdgeInsets.all(36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "We sent you a code",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 16),
            Text(
              "Enter it below to verify",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Text(
              "jhon.mobbin@gmail.com",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 32),
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildBox(0),
                      const SizedBox(width: 8),
                      buildBox(1),
                      const SizedBox(width: 8),
                      buildBox(2),
                      const SizedBox(width: 8),
                      buildBox(3),
                      const SizedBox(width: 8),
                      buildBox(4),
                      const SizedBox(width: 8),
                      buildBox(5),
                    ],
                  ),
                  SizedBox(height: 16),
                  _complete
                      ? FaIcon(
                          FontAwesomeIcons.circleCheck,
                          size: 24,
                          color: Colors.green,
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 36.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Didn't receive email?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () => _onNextPressed(context),
              child: Padding(
                padding: const EdgeInsets.all(36),
                child: Container(
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: _complete ? Colors.black : Colors.grey,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Next",
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
          ],
        ),
      ),
    );
  }

  Widget buildBox(int index) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey),
    );

    return SizedBox(
      width: 48,
      height: 56,
      child: TextField(
        controller: _controllers[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // 숫자만 허용
          LengthLimitingTextInputFormatter(1), // 최대 1글자
        ],
        decoration: InputDecoration(
          isDense: true,
          border: border,
          enabledBorder: border,
          focusedBorder: border.copyWith(
            borderSide: const BorderSide(width: 2),
          ),
          counterText: '',
        ),
      ),
    );
  }
}
