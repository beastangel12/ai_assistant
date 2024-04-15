import 'package:ai_assistant/model/onboard.dart';
import 'package:ai_assistant/screens/home_screen.dart';
import 'package:ai_assistant/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();
    final list = [
      //onboarding 1
      Onboard(
        title: 'Ask me Anything',
        lottie: 'ai_ask_me',
        subtitle: "I'm here for you, If you need help simply you can ask me",
      ),

      //onboarding 2
      Onboard(
        title: 'Imagination to Reality',
        lottie: 'ai_play',
        subtitle:
            'Just Imagine anything & let me know, I will create something wonderful for you!',
      ),
    ];

    return Scaffold(
      body: PageView.builder(
        controller: c,
        itemCount: list.length,
        itemBuilder: (ctx, ind) {
          final islast = ind == list.length - 1;
          return Column(
            children: [
              //Lottie
              Lottie.asset('assets/lottie/${list[ind].lottie}.json',
                  height: mq.height * .6, width: islast ? mq.width * 7 : null),

              // Title

              Text(
                list[ind].title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    letterSpacing: .5),
              ),

              //for adding some space
              SizedBox(
                height: mq.height * .015,
              ),

              //subtitle
              SizedBox(
                width: mq.width * .8,
                child: Text(
                  list[ind].subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13.5,
                    letterSpacing: .5,
                    color: Colors.black54,
                  ),
                ),
              ),

              const Spacer(),

              //dots

              Wrap(
                spacing: 10,
                children: List.generate(
                  list.length,
                  (i) => Container(
                    width: i == ind ? 18 : 10,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == ind ? Colors.blue : Colors.grey,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              //button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    elevation: 0,
                    backgroundColor: const Color.fromARGB(255, 95, 143, 224),
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                    minimumSize: Size(mq.width * .4, 50)),
                onPressed: () {
                  if (islast) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );
                  } else {
                    c.nextPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.ease);
                  }
                },
                child: Text(
                  islast ? 'Finish' : 'Next',
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          );
        },
      ),
    );
  }
}
