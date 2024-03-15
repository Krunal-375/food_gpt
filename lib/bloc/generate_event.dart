part of 'generate_bloc.dart';

@immutable
sealed class GenerateEvent {}

class GenerateNewTextMessageEvent extends GenerateEvent {
  final String inputMessage;

  GenerateNewTextMessageEvent(this.inputMessage);
}
