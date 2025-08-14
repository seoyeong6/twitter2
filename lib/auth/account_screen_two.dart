import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountScreenTwo extends StatelessWidget {
  const AccountScreenTwo({super.key});

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
      body: Column(children: [Text("Account Screen Two")]),
    );
  }
}
