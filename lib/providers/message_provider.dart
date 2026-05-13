import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'message_provider.g.dart';

class Message {
  const Message({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.avatarUrl,
  });

  final String id;
  final String title;
  final String subtitle;
  final String time;
  final String avatarUrl;
}

@riverpod
class MessageList extends _$MessageList {
  @override
  Future<List<Message>> build() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 800));
    
    return List.generate(30, (index) {
      return Message(
        id: '$index',
        title: '联系人 ${index + 1}',
        subtitle: '这是来自联系人 ${index + 1} 的最新消息内容...',
        time: '${12 - (index % 12)}:00',
        avatarUrl: 'https://api.dicebear.com/7.x/avataaars/svg?seed=${index + 1}',
      );
    });
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(milliseconds: 500));
      return build();
    });
  }
}
