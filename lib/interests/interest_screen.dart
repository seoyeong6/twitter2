import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final List<String> interests = [
    "Fashion & beauty",
    "Outdoors",
    "Food & drink",
    "Health & fitness",
    "Technology",
    "Travel",
    "Art & design",
    "Music",
    "Books",
    "Movies",
    "TV",
    "Sports",
    "Gaming",
    "Science",
    "History",
    "Politics",
    "Business",
  ];

  final List<String> selectedInterests = [];

  void _onInterestSelected(String interest) {
    setState(() {
      if (selectedInterests.length < 3 &&
          !selectedInterests.contains(interest)) {
        selectedInterests.add(interest);
      } else if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      }
    });
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What do you want to see on Twitter?",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 16),
              Text(
                "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
              ),
              SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  for (var interest in interests)
                    GestureDetector(
                      onTap: () => _onInterestSelected(interest),
                      child: Container(
                        width: 150,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: selectedInterests.contains(interest)
                              ? Colors.blue
                              : null,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  selectedInterests.contains(interest)
                                      ? FaIcon(
                                          FontAwesomeIcons.circleCheck,
                                          size: 20,
                                          color: Colors.white,
                                        )
                                      : SizedBox.shrink(),
                                ],
                              ),
                              Text(
                                interest,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: selectedInterests.contains(interest)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
