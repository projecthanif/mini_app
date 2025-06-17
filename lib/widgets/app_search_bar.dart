import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    required this.controller,
    required this.onSearch,
    required this.isQueried,
  });

  final TextEditingController controller;
  final void Function() onSearch;
  final ValueNotifier<bool> isQueried;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Colors.black),
    );

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Search posts...",
              prefixIcon: const Icon(Icons.search),
              border: border,
              enabledBorder: border,
              focusedBorder: border,
              contentPadding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 10.w,
              ),
              suffixIcon: ValueListenableBuilder(
                valueListenable: isQueried,
                builder: (context, value, _) {
                  return value
                      ? IconButton(
                          onPressed: () {
                            isQueried.value = false;
                            controller.text = "";
                          },
                          icon: Icon(Icons.cancel, color: Colors.red),
                        )
                      : Text("");
                },
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        ElevatedButton(
          onPressed: onSearch,
          child: const Text("Search"),
        )
      ],
    );
  }
}
