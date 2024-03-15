import 'dart:convert';

class GptMessageModal {
  final String role;
  final String content;

  GptMessageModal({
    required this.role,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'content': content,
    };
  }

  factory GptMessageModal.fromMap(Map<String, dynamic> map) {
    return GptMessageModal(
      role: map['role'] ?? '',
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GptMessageModal.fromJson(String source) =>
      GptMessageModal.fromMap(json.decode(source));
}
