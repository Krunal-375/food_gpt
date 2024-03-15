import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:food_gpt/model/gpt_model.dart';
import 'package:food_gpt/repo/gpt_repo.dart';
import 'package:meta/meta.dart';

part 'generate_event.dart';
part 'generate_state.dart';

class GenerateBloc extends Bloc<GenerateEvent, GenerateState> {
  GenerateBloc() : super(GenerateSuccessState(messages: const [])) {
    on<GenerateNewTextMessageEvent>(generateNewTextMessageEvent);
  }
  List<GptMessageModal> messages = [];
  bool generating = false;
  FutureOr<void> generateNewTextMessageEvent(
      GenerateNewTextMessageEvent event, Emitter<GenerateState> emit) async {
    messages.add(GptMessageModal(role: "user", content: event.inputMessage));
    emit(GenerateSuccessState(messages: messages));
    generating = true;
    String generatedText = await GPTRepo.textGenerationRepo(event.inputMessage);
    if (generatedText.isNotEmpty) {
      messages.add(GptMessageModal(
          role: 'assistant', content: generatedText.replaceAll('\n', '')));
      emit(GenerateSuccessState(messages: messages));
    }
    generating = false;
  }
}
