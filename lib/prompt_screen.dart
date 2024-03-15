import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_gpt/bloc/generate_bloc.dart';
import 'package:food_gpt/model/gpt_model.dart';

class PromptScreen extends StatefulWidget {
  const PromptScreen({super.key});

  @override
  State<PromptScreen> createState() => _PromptScreenState();
}

class _PromptScreenState extends State<PromptScreen> {
  final TextEditingController _controller = TextEditingController();
  final GenerateBloc chatBloc = GenerateBloc();
  late String items = '', calories = '', protein = '', carb = '', fat = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<GenerateBloc, GenerateState>(
          bloc: chatBloc,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case const (GenerateSuccessState):
                List<GptMessageModal> messages =
                    (state as GenerateSuccessState).messages;
                if (messages.isNotEmpty && messages.last.role == 'assistant') {
                  log(messages.last.content, name: 'Last Message');
                  //this is log message create separate variables and store  the values{"Calories": 187, "Protein (in g)": 6, "Carb (in g)": 28, "Fat (in g)": 4}
                  //and then use these values to show in the below container
                  // Parse the JSON string into a Map
                  String jsonString = messages.last.content;
                  Map<String, dynamic> nutritionInfo = json.decode(jsonString);

                  // Extract the values into separate variables
                  items = nutritionInfo['Items'] ?? '';
                  calories = nutritionInfo['Calories'] ?? '0';
                  protein = nutritionInfo['Protein(in g)'] ?? '0';
                  carb = nutritionInfo['Carb(in g)'] ?? '0';
                  fat = nutritionInfo['Fat(in g)'] ?? '0';

                  // Print the values to verify
                  log('Calories: $calories');
                  log('Protein: $protein');
                  log('Carb: $carb');
                  log('Fat: $fat');
                }
                return SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          height: 100,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Food GPT',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24)),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back))
                            ],
                          ),
                        ),
                        Container(
                          height: 200,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                            color: const Color.fromARGB(255, 44, 43, 43),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                items,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        const Text('Calories',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        Text(calories,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const Text('Protein',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        Text(protein,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        const Text('Carbs',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        Text(carb,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const Text('Fats     ',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        Text(fat,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                controller: _controller,
                                style: const TextStyle(fontSize: 12),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  //fillColor: Colors.grey,
                                  hintText: "Type something...",
                                  hintStyle: const TextStyle(
                                    color: Colors
                                        .white, //Color.fromARGB(1, 117, 117, 125),
                                  ),
                                  filled: true,
                                  //fillColor: Colors.grey,
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2)),
                                ),
                              )),
                              const SizedBox(width: 12),
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.black,
                                child: InkWell(
                                  onTap: () {
                                    if (_controller.text.isNotEmpty) {
                                      String text = _controller.text;
                                      chatBloc.add(
                                          GenerateNewTextMessageEvent(text));
                                      _controller.clear();
                                    }
                                  },
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: Center(
                                      //add image here
                                      child: Image.asset(
                                        'assets/Button.png',
                                        scale: 1 / 4,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              default:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ));
  }
}
