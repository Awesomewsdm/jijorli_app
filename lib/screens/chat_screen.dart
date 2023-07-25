import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jijorli_app/constants/image_strings.dart';
import 'package:jijorli_app/constants/styles.dart';
import 'package:jijorli_app/models/example_promp_model.dart';
import 'package:jijorli_app/screens/explore_screen.dart';
import 'package:jijorli_app/widgets/app_bar.dart';
import 'package:provider/provider.dart';

import '../models/chat_model.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key, this.promptModel})
      : super(key: key); // Corrected the constructor

  final TextEditingController chatController = TextEditingController();
  final PromptModel? promptModel;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(
        widget: Row(
          children: [
            SvgPicture.asset(tVolume),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(tExport),
          ],
        ),
        title: "Chat",
      ), // Moved the AppBarWidget to the AppBar
      body: MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => ChatModel())],
        child: Consumer<ChatModel>(builder: (context, model, child) {
          List<Widget> messages = model.getMessages;
          return Stack(
            children: [
              ListView(
                children: [
                  if (messages.isEmpty)
                    const SizedBox(
                      child: Column(
                        children: [
                          SuggestionWithHeader(
                            imageString: tList,
                            label: "Explain",
                          ),
                          SuggestedQuestionWidget(
                            prompt: "Explain Quantum physics",
                          ),
                          SuggestedQuestionWidget(
                            prompt: "What are wormholes explain like I am 5",
                          ),
                          SizedBox(height: 30),
                          SuggestionWithHeader(
                            label: "Write and Edit",
                            imageString: tPen,
                          ),
                          SuggestedQuestionWidget(
                            prompt: "Write a tweet about global warming",
                          ),
                          SuggestedQuestionWidget(
                            prompt: "Write a poem about flower and love",
                          ),
                          SuggestedQuestionWidget(
                            prompt: "Write a rap song lyrics about",
                          ),
                          SizedBox(height: 40),
                          SuggestionWithHeader(
                            label: "Translate",
                            imageString: tTranslate,
                          ),
                          SuggestedQuestionWidget(
                            prompt: "How do you say “how are you” in Korean?",
                          ),
                          SuggestedQuestionWidget(
                            prompt: "How do you say “I love you” in French?",
                          ),
                          SuggestedQuestionWidget(
                            prompt: "How do you say “how are you” in Korean?",
                          ),
                        ],
                      ),
                    )
                  else
                    ...messages,
                  const SizedBox(height: 60),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  // Moved the Padding to bottomNavigationBar
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 10.0),
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.all(8.0),
                    decoration: kTextFieldDecoration,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onFieldSubmitted: (e) {},
                            controller: chatController,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: GestureDetector(
                                onTap: () {
                                  Get.to(() => const ExploreScreen());
                                },
                                child: SvgPicture.asset(
                                  tStar,
                                  height: 30,
                                  width: 30,
                                  color: Colors.blue,
                                ),
                              ),
                              hintText: "Ask me anything...",
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    tMicrophone,
                                    height: 30,
                                    width: 30,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      context
                                          .read<ChatModel>()
                                          .sendPromptRequest(
                                              chatController.text);
                                      chatController.clear();
                                    },
                                    child: SvgPicture.asset(
                                      tSend,
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ],
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class SuggestionWithHeader extends StatelessWidget {
  const SuggestionWithHeader({
    Key? key,
    required this.label,
    required this.imageString,
  }) : super(key: key);

  final String label;
  final String imageString;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          imageString,
          color: const Color.fromARGB(255, 252, 122, 47),
          height: 40,
          width: 40,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class SuggestedQuestionWidget extends StatelessWidget {
  const SuggestedQuestionWidget({
    Key? key,
    required this.prompt,
  }) : super(key: key);

  final String prompt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF656565).withOpacity(0.1),
        ),
        child: Center(child: Text(prompt)),
      ),
    );
  }
}
