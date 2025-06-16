import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.name,
    required this.email,
    profilePic,
  });

  final String name;
  final String email;
  final String? profilePic = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.sp,
      margin: EdgeInsets.only(bottom: 10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(),
      ),
      child: Row(
        children: [
          SizedBox(width: 5.sp),
          CircleAvatar(),
          SizedBox(width: 10.sp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                email,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
