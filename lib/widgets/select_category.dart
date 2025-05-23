import 'package:enough_with_todo/providers/providers.dart';
import 'package:enough_with_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:enough_with_todo/utils/utils.dart';
import 'package:gap/gap.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = TaskCategories.values.toList();
    final selectedCategory = ref.watch(categoryProvider);

    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text('Category', style: context.textTheme.titleLarge),
          Gap(8),
          Expanded(
            child: ListView.separated(
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                final category = categories[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    ref.read(categoryProvider.notifier).state = category;
                  },
                  child: CircleContainer(
                    color: category.color.withValues(alpha: 0.3),
                    borderColor: category.color,
                    child: Icon(
                      category.icon,
                      color:
                          category == selectedCategory
                              ? context.colorScheme.primary
                              : category.color,
                    ),
                  ),
                );
              },
              separatorBuilder: (ctx, index) => Gap(8),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
