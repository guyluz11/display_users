import 'package:flutter/material.dart';

class IntroductionScreenBodyAboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: (Theme.of(context).textTheme.bodyText1!.color)!
                .withOpacity(0.55),
            border: Border.all(
              color: (Theme.of(context).textTheme.bodyText1!.color)!,
            ),
            // Make rounded corners
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: const SingleChildScrollView(
              child: Text(
                'We believe that we can make the world better by '
                'creating the best flutter template app that there is.\n'
                'Together we can build the future and advance our '
                'civilization foreword.',
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
