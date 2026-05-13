import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryListSkeleton extends StatelessWidget {
  const CategoryListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.separated(
        itemCount: 8,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(backgroundColor: Colors.white),
            title: Container(
              width: double.infinity,
              height: 16.0,
              color: Colors.white,
            ),
            trailing: const Icon(Icons.chevron_right, color: Colors.white),
          );
        },
      ),
    );
  }
}

class CategoryGridSkeleton extends StatelessWidget {
  const CategoryGridSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Container(
                  width: 80,
                  height: 14,
                  color: Colors.white,
                ),
                const SizedBox(height: 4),
                Container(
                  width: 40,
                  height: 12,
                  color: Colors.white,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
