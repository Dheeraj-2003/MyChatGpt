import 'package:client/screens/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                height: 200,
                width: 200,
                child: SvgPicture.asset(
                  "assets/openai.svg",
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Welcome to SmartChat',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Need some assistance with anything? \nJust start typing and we will help you out!',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 17, color: Colors.white),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: ((context) => const Chat())));
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    height: 58,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Get Started',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 25, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Icon(Icons.arrow_forward_outlined),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
