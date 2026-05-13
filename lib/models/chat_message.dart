import 'package:hive_ce/hive.dart';

part 'chat_message.g.dart';

@HiveType(typeId: 0)
class ChatMessage extends HiveObject {
  @HiveField(0)
  final String text;

  @HiveField(1)
  final bool isMe;

  @HiveField(2)
  final DateTime timestamp;

  @HiveField(3)
  final String senderId;

  ChatMessage({
    required this.text,
    required this.isMe,
    required this.timestamp,
    required this.senderId,
  });
}
