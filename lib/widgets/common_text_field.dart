import 'package:enough_with_todo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CommonTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final int? maxLines;
  final bool readOnly;

  const CommonTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.maxLines,
    this.suffixIcon,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: context.textTheme.titleLarge),
        Gap(8),
        TextField(
          readOnly: readOnly,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
          onChanged: (value) {},
          maxLines: maxLines,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      ],
    );
  }
}
