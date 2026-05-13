import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hive_ce/hive.dart';
import '../models/chat_message.dart';

part 'chat_provider.g.dart';

@riverpod
class ChatMessages extends _$ChatMessages {
  late Box<ChatMessage> _box;
  final String _boxNamePrefix = 'chat_messages_';

  @override
  Future<List<ChatMessage>> build(String senderId) async {
    _box = await Hive.openBox<ChatMessage>('$_boxNamePrefix$senderId');
    
    // 如果没有数据，可以 mock 一两句初始对话
    if (_box.isEmpty) {
      final initialMessages = [
        ChatMessage(
          text: '你好！我是联系人 $senderId',
          isMe: false,
          timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
          senderId: senderId,
        ),
        ChatMessage(
          text: '有什么可以帮你的吗？',
          isMe: false,
          timestamp: DateTime.now().subtract(const Duration(minutes: 4)),
          senderId: senderId,
        ),
      ];
      await _box.addAll(initialMessages);
    }
    
    return _box.values.toList();
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final newMessage = ChatMessage(
      text: text,
      isMe: true,
      timestamp: DateTime.now(),
      senderId: senderId, // 使用 senderId 而不是 arg
    );

    await _box.add(newMessage);
    
    // 更新本地状态，触发 UI 刷新
    state = AsyncData([...state.value ?? [], newMessage]);

    // 模拟对方回复
    Future.delayed(const Duration(seconds: 1), () async {
      final reply = ChatMessage(
        text: '收到消息：$text',
        isMe: false,
        timestamp: DateTime.now(),
        senderId: senderId,
      );
      await _box.add(reply);
      state = AsyncData([...state.value ?? [], reply]);
    });
  }
}
