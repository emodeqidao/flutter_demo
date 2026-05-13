import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:flutter_demo/app_router.dart';
import 'package:flutter_demo/models/chat_message.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 初始化 Hive CE
  await Hive.initFlutter();
  
  // 注册适配器
  Hive.registerAdapter(ChatMessageAdapter());
  
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Tab Navigation Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _status = 'Idle';
  bool _isLoading = false;
  CancelableOperation<String>? _cancelableOperation;

  // 模拟一个耗时任务
  Future<String> _fetchData() async {
    await Future.delayed(const Duration(seconds: 3));
    return 'Data fetched successfully!';
  }

  void _startTask() {
    setState(() {
      _status = 'Running... (Wait 3s)';
      _isLoading = true;
    });

    // 创建一个可取消的操作
    _cancelableOperation = CancelableOperation<String>(
      _fetchData(),
      onCancel: () {
        setState(() {
          _status = 'Task Canceled';
          _isLoading = false;
        });
      },
    );

    _cancelableOperation!.value.then((value) {
      if (mounted) {
        setState(() {
          _status = value;
          _isLoading = false;
        });
      }
    }).catchError((error) {
      if (mounted) {
        setState(() {
          _status = 'Error: $error';
          _isLoading = false;
        });
      }
    });
  }

  void _cancelTask() {
    _cancelableOperation?.cancel();
  }

  @override
  void dispose() {
    _cancelableOperation?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Status:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            Text(
              _status,
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            const SizedBox(height: 40),
            if (_isLoading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: _startTask,
                child: const Text('Start 3s Task'),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? _cancelTask : null,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade100),
              child: const Text('Cancel Task', style: TextStyle(color: Colors.red)),
            ),
            const SizedBox(height: 40), // 添加一些间距
            ElevatedButton(
              onPressed: () {
                context.go('/second'); // 跳转到第二个页面
              },
              child: const Text('Go to Second Page'),
            ),
            const SizedBox(height: 20), // 添加一些间距
            ElevatedButton(
              onPressed: () {
                context.go('/network'); // 跳转到网络请求页面
              },
              child: const Text('Go to Network Page'),
            ),
          ],
        ),
      ),
    );
  }
}

/// 一个简单的可取消操作封装类
class CancelableOperation<T> {
  final Future<T> _innerFuture;
  final VoidCallback? onCancel;
  bool _isCanceled = false;
  final Completer<T> _completer = Completer<T>();

  CancelableOperation(this._innerFuture, {this.onCancel}) {
    _innerFuture.then((value) {
      if (!_isCanceled) {
        _completer.complete(value);
      }
    }).catchError((error) {
      if (!_isCanceled) {
        _completer.completeError(error);
      }
    });
  }

  Future<T> get value => _completer.future;

  void cancel() {
    if (!_isCanceled && !_completer.isCompleted) {
      _isCanceled = true;
      onCancel?.call();
    }
  }
}
