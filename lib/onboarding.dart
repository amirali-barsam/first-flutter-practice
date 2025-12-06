import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test/auth.dart';
import 'package:test/data.dart';
import 'package:test/home.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController(initialPage: 0);
  final items = AppDatabase.onBoardingItems;
  int page = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.page!.toInt() != page) {
        setState(() {
          page = controller.page!.toInt();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Image.asset("img/background/onboarding.png")),
            Container(
              height: 290,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Color.fromARGB(60, 82, 131, 255),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        itemCount: items.length,
                        controller: controller,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Text(
                                items[index].title,
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                ),
                              ),
                              Text(
                                items[index].description,
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    Container(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmoothPageIndicator(
                            controller: controller, // PageController
                            count: 4,
                            effect: ExpandingDotsEffect(
                              activeDotColor: const Color(0xff376AED),
                              dotColor: Colors.grey,
                              dotWidth: 8,
                              dotHeight: 8,
                            ), // your preferred effect
                            onDotClicked: (index) {},
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (items.length - 1 == page) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => AuthScreen(),
                                  ),
                                );
                              } else {
                                controller.animateToPage(
                                  page + 1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.decelerate,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(84, 60),
                              backgroundColor: const Color(0xff376AED),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
