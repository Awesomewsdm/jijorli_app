import 'package:jijorli_app/constants/image_strings.dart';

class PromptModel {
  final String title;
  final String prompt;
  final String imageString;
  final String category;

  PromptModel(this.title, this.prompt, this.imageString, this.category);
}

final prompModel = [
  PromptModel("Write an article",
      "Generate well written articles on any topic you want", tPen, "Writing"),
  PromptModel(
      "Write a poem",
      "Let's write you a poem on diverse subject such as love, life, etc",
      tPen,
      "Writing"),
];
