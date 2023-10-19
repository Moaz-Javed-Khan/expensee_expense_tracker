import 'package:expensee/features/onBoarding/on_boarding_content.dart';
import 'package:expensee/widgets/CutomButton.dart';
import 'package:flutter/material.dart';

class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({super.key});

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60.0,
            left: 8.0,
            bottom: 20.0,
            right: 8.0,
          ),
          child: Column(
            children: [
              Flexible(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(
                          contents[index].image,
                          height: 300,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          contents[index].title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          contents[index].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                  (index) => buildDot(
                    index,
                    currentIndex,
                    context,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const ToSignupButton(),
              const ToSigninButton(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildDot(
  int index,
  int currentIndex,
  BuildContext context,
) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: CircleAvatar(
      radius: currentIndex == index ? 8 : 6,
      backgroundColor: currentIndex == index
          ? Colors.deepPurpleAccent
          : Colors.deepPurple[50],
    ),
  );
}
