import 'package:flutter/material.dart';
import 'package:jijorli_app/repository/openai_repository.dart';
import 'package:jijorli_app/widgets/ai_message_widget.dart';
import 'package:jijorli_app/widgets/loading_widget.dart';
import 'package:jijorli_app/widgets/user_prompt_message.dart';

class ChatModel extends ChangeNotifier {
  final TextEditingController chatController = TextEditingController();
  List<Widget> messages = [];

  List<Widget> get getMessages => messages;

  void addMessages(String prompt) {
    messages.add(UserPromptMessageWidget(text: prompt));
    messages.add(const Loading(text: "..."));
    notifyListeners();
  }

  Future<void> sendPromptRequest(String prompt) async {
    addMessages(prompt);

    Map<String, dynamic> response =
        await OpenAIRepository.sendPromptMessage(prompt);

    String aiText = response["choices"][0]['text'];
    messages.removeLast();
    messages.add(AiMessageWidget(text: aiText));
    notifyListeners();
  }
}
