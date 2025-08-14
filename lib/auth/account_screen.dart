import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:authentication/auth/experience_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _isNameValid = false;
  final TextEditingController _nameController = TextEditingController();
  String _name = "";

  final TextEditingController _phoneController = TextEditingController();
  bool _isPhoneValid = false;

  final TextEditingController _dateController = TextEditingController();
  bool _isDobValid = false; // ← DOB 유효성 플래그 추가

  @override
  void initState() {
    super.initState();

    _nameController.addListener(() {
      final nextName = _nameController.text;
      final nextIsValid = nextName.trim().length > 2;
      if (nextName != _name || nextIsValid != _isNameValid) {
        setState(() {
          _name = nextName;
          _isNameValid = nextIsValid;
        });
      }
    });

    _phoneController.addListener(() {
      final nextIsValid = isValidContactSimple(_phoneController.text);
      if (nextIsValid != _isPhoneValid) {
        setState(() {
          _isPhoneValid = nextIsValid;
        });
      }
    });

    // ← 날짜가 변경되면 버튼 활성화 상태도 즉시 반영
    _dateController.addListener(() {
      final nextIsValid = _dateController.text.isNotEmpty;
      if (nextIsValid != _isDobValid) {
        setState(() {
          _isDobValid = nextIsValid;
        });
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void _nextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ExperienceScreen()),
    );
  }

  // ===== 간단 정규식 검증 =====
  final _emailRe = RegExp(r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');
  final _phoneReSimple = RegExp(r'^\d{9,15}$'); // 숫자만(국제 9~15자리)

  bool isValidEmail(String s) => _emailRe.hasMatch(s.trim());

  bool isValidPhoneSimple(String s) {
    final digitsOnly = s.replaceAll(RegExp(r'\D'), '');
    return _phoneReSimple.hasMatch(digitsOnly);
  }

  bool isValidContactSimple(String s) =>
      s.contains('@') ? isValidEmail(s) : isValidPhoneSimple(s);

  @override
  Widget build(BuildContext context) {
    final canNext = _isNameValid && _isPhoneValid && _isDobValid; // ← 핵심

    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          size: 24,
          color: Colors.blue,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: const TextStyle(color: Colors.grey),
                suffix: _isNameValid
                    ? FaIcon(
                        FontAwesomeIcons.circleCheck,
                        color: Colors.green[300],
                      )
                    : null,
              ),
              cursorColor: Theme.of(context).primaryColor,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                hintText: "Phone number or email address",
                hintStyle: const TextStyle(color: Colors.grey),
                suffix: _isPhoneValid
                    ? FaIcon(
                        FontAwesomeIcons.circleCheck,
                        color: Colors.green[300],
                      )
                    : null,
              ),
              cursorColor: Theme.of(context).primaryColor,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 24),
            TextField(
              readOnly: true,
              controller: _dateController,
              decoration: const InputDecoration(
                hintText: "Date of birth",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Next 버튼
              GestureDetector(
                onTap: canNext ? _nextTap : null, // 비활성화
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    color: canNext
                        ? Theme.of(context).primaryColor
                        : Colors.grey, // 활성/비활성 색
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // DatePicker (216px 고정)
              SizedBox(
                height: 216,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime date) {
                    // yyyy-MM-dd 로 텍스트 필드에 반영
                    _dateController.text = date.toString().split(" ")[0];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
