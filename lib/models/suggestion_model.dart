import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/image_strings.dart';

class SuggestedQuestionModel {
  final String prompt;
  final void Function() onTap;

  SuggestedQuestionModel({required this.prompt, required this.onTap});
}

class ExploreModel {
  final String title;
  final String prompt;
  final Widget icon;

  ExploreModel(this.title, this.prompt, this.icon);
}

List<ExploreModel> writing = [
  ExploreModel("Write a poem", "", SvgPicture.asset(tList)),
  ExploreModel("Write a short story", "Write a short bedtime story",
      const Icon(Icons.polymer)),
  ExploreModel(
      "Job posting",
      "Write a template for a job posting, say a \"Jnr. Software Engineer\"",
      const Icon(Icons.work_sharp)),
  ExploreModel(
      "Write an article",
      "Generate well written articles on any topic you want",
      SvgPicture.asset(tPen))
];

// List<ExploreModel> entertainment = [
//   ExploreModel("Write", prompt, icon)
// ];
