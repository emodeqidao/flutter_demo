import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/category_skeleton.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('分类'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => context.push('/category-detail'),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CategoryListSkeleton();
          }
          return const Center(child: Text('商品分类内容'));
        },
      ),
    );
  }
}
