import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFilterBar extends StatelessWidget {
  const AppFilterBar({
    super.key,
    required this.controller,
    required this.onSelect,
    required this.isQueried,
  });

  final TextEditingController controller;
  final void Function(dynamic) onSelect;
  final ValueNotifier<bool> isQueried;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(5.sp),
          height: 40.h,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: DropdownButton(
            // isExpanded: true,
            menuWidth: 100.w,
            onChanged: onSelect,
            hint: Text("Sort"),
            items: [
              DropdownMenuItem(
                value: "1",
                child: Text("A-Z"),
              ),
              DropdownMenuItem(
                value: "2",
                child: Text("Z-A"),
              ),
            ],
          ),
        ),
        ValueListenableBuilder(
          valueListenable: isQueried,
          builder: (context, value, _) {
            return isQueried.value
                ? ElevatedButton(
                    onPressed: () {
                      isQueried.value = false;
                    },
                    child: const Text("Clear"),
                  )
                : Text("");
          },
        )
      ],
    );
  }
}
