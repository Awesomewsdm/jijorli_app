import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jijorli_app/constants/image_strings.dart';
import 'package:jijorli_app/screens/chat_history_screen.dart';
import 'package:jijorli_app/screens/chat_screen.dart';

import '../models/example_promp_model.dart';
import '../widgets/app_bar.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<String> categories = [
    "All",
    "Writing",
    "Entertainment",
    "Coding",
    "Math Problems",
    "Health & Fitness"
  ];

  String selectedCategory = "All";

  int currentIndex = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          title: "Explore",
          widget: GestureDetector(
              onTap: () {
                Get.to(() => const ChatHistoryScreen());
              },
              child: const Icon(Icons.launch)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories
                      .map(
                        (content) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: ActionChip(
                            onPressed: () {
                              setState(() {
                                selectedCategory = content;
                              });
                            },
                            side: const BorderSide(color: Colors.lightBlue),
                            backgroundColor: selectedCategory == content
                                ? Colors.lightBlue
                                : Colors.white,
                            label: Text(content),
                            labelStyle: TextStyle(
                              color: selectedCategory == content
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Expanded(
                child: PageView(
                  scrollDirection: selectedCategory == "All"
                      ? Axis.horizontal
                      : Axis.vertical,
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  children: [
                    ListView(
                      children: categories
                          .map(
                            (category) => selectedCategory ==
                                    "All" // Check if the selected category matches the current category
                                ? CategoryWidget(
                                    widget: Row(
                                      children: List.generate(
                                        4,
                                        (index) => CategoryCardWidget(
                                          imageString: tPen,
                                          title: "Write an article",
                                          label:
                                              "Generate well-written articles on any topic you want.",
                                          // color1: 0xFFFFEAEA,
                                          color2: 0xFFE76C6C,
                                        ),
                                      ),
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    category: category,
                                  )
                                : selectedCategory == category
                                    ? CategoryWidget(
                                        widget: Column(
                                          children: [
                                            Wrap(
                                              children: List.generate(
                                                  8,
                                                  (index) => CategoryCardWidget(
                                                        imageString: tPen,
                                                        title:
                                                            "Write an article",
                                                        label:
                                                            "Generate well-written articles on any topic you want.",
                                                        // color1: 0xFFFFEAEA,
                                                        color2: 0xFFE76C6C,
                                                      )),
                                            ),
                                          ],
                                        ),
                                        scrollDirection: Axis.vertical,
                                        category: category,
                                      )
                                    : const SizedBox(), // Hide content for non-selected categories
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
    this.scrollDirection = Axis.vertical,
    required this.widget,
  });
  final String category;
  final Axis scrollDirection;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  category,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.lightBlue,
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: scrollDirection,
              child: widget,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCardWidget extends StatelessWidget {
  CategoryCardWidget({
    super.key,
    required this.title,
    required this.label,
    required this.color2,
    required this.imageString,
  });
  final String title;
  final String label;
  final Color color =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];
  final int color2;
  final String imageString;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ChatScreen(promptModel: prompModel.first),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 20),
        child: CardWidget(
          color: color.withOpacity(0.2),
          height: 226,
          width: 180,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardWidget(
                  color: color.withOpacity(0.4),
                  height: 66,
                  width: 66,
                  child: SvgPicture.asset(
                    color: Colors.white,
                    imageString,
                    width: 10,
                    height: 10,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(label)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.child,
    required this.height,
    required this.width,
    required this.color,
  });

  final Widget child;
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(17)),
      child: child,
    );
  }
}
