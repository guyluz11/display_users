import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class IntroductionScreenBodyWelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Row(
            children: <Widget>[
              Text(
                'We',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              const SizedBox(width: 10.0),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'are OPEN SOURCE',
                    textStyle: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                  TypewriterAnimatedText(
                    'are FAIR',
                    textStyle: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                  TypewriterAnimatedText(
                    'are INNOVATIVE',
                    textStyle: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                  TypewriterAnimatedText(
                    'are PRIVATE',
                    textStyle: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                  TypewriterAnimatedText(
                    'are SECURE',
                    textStyle: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                  TypewriterAnimatedText(
                    'are EASY TO USE',
                    textStyle: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                  TypewriterAnimatedText(
                    'support LOCAL CONNECTION',
                    textStyle: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                  TypewriterAnimatedText(
                    'want a BETTER FUTURE',
                    textStyle: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: ((Theme.of(context).textTheme.bodyText1!.color)!)
                .withOpacity(0.3),
            border: Border.all(
              color: (Theme.of(context).textTheme.bodyText1!.color)!,
            ),
            // Make rounded corners
            borderRadius: BorderRadius.circular(30),
          ),
          height: 160,
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [],
            ),
          ),
        ),
      ],
    );
  }
}
