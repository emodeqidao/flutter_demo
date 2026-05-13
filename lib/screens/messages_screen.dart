import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/message_provider.dart';

class MessagesScreen extends ConsumerWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messagesAsync = ref.watch(messageListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('消息'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          IconButton(
            onPressed: () => ref.read(messageListProvider.notifier).refresh(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: messagesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('加载失败: $err')),
        data: (messages) => RefreshIndicator(
          onRefresh: () => ref.read(messageListProvider.notifier).refresh(),
          child: ListView.separated(
            itemCount: messages.length,
            separatorBuilder: (context, index) => const Divider(height: 1, indent: 70),
            itemBuilder: (context, index) {
              final message = messages[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  // 使用简单的文字占位，实际应用中可用网络图片
                  child: Text(message.title.substring(4)), 
                ),
                title: Text(
                  message.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  message.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text(
                  message.time,
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                ),
                onTap: () {
                  final encodedTitle = Uri.encodeComponent(message.title);
                  context.push('/chat-detail/${message.id}/$encodedTitle');
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
