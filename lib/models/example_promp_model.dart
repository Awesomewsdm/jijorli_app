import 'package:get/get.dart';
import 'package:jijorli_app/constants/image_strings.dart';
import 'package:jijorli_app/controllers.dart/controller.dart';
import 'package:jijorli_app/models/suggestion_model.dart';

class PromptModel {
  final String title;
  final String prompt;
  final String imageString;
  final String category;

  PromptModel(this.title, this.prompt, this.imageString, this.category);
}

ChatController chatController = Get.put(ChatController());

final List<SuggestedQuestionModel> suggestedQuestions = [
  SuggestedQuestionModel(
    prompt: "Explain Quantum physics",
    onTap: () {
      chatController.promptController.text = "Explain Quantum physics";
    },
  ),
  SuggestedQuestionModel(
    prompt: "What are wormholes explain like I am 5",
    onTap: () {
      chatController.promptController.text =
          "What are wormholes explain like I am 5";
    },
  ),
  // Add other suggested questions here...
];

final prompModel = [
  PromptModel("Write an article",
      "Generate well written articles on any topic you want", tPen, "Writing"),
  PromptModel(
      "Write a poem",
      "Let's write you a poem on diverse subject such as love, life, etc",
      tPen,
      "Writing"),
];
