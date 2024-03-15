part of 'generate_bloc.dart';

@immutable
sealed class GenerateState {}

final class GenerateInitial extends GenerateState {}

class GenerateSuccessState extends GenerateState {
  final List<GptMessageModal> messages;

  GenerateSuccessState({required this.messages});
}
