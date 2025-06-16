import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mini_app/widgets/app_thumbnail_image.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.title,
    required this.author,
    required this.category,
    required this.thumbnail,
    required this.date,
  });

  final String thumbnail;
  final String author;
  final String title;
  final String category;
  final String date;

  String capitalize(String value) {
    if (value.isEmpty) return value;
    return value[0].toUpperCase() + value.substring(1);
  }

  String formmatedDate(String value) {
    final fullFormat = DateFormat("dd/MM/yyyy HH:mm:ss");
    final fullDate = fullFormat.parse(value);
    final dateOnly = DateTime(fullDate.year, fullDate.month, fullDate.day);
    return DateFormat("MMM d, yyyy").format(dateOnly);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.h,
      width: double.infinity,
      padding: EdgeInsets.only(right: 5.sp),
      margin: EdgeInsets.only(bottom: 20.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Row(
        children: [
          AppThumbnailImage(thumbnail: thumbnail),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    capitalize(category),
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                // SizedBox(height: 5.h),
                Expanded(
                  child: Text(
                    title,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          capitalize(author),
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Text(
                        formmatedDate(date),
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
