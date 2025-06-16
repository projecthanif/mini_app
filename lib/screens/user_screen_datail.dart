import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_app/providers/user_provider.dart';
import 'package:mini_app/screens/card_info_list.dart';
import 'package:provider/provider.dart';

class UserScreenDatail extends StatefulWidget {
  const UserScreenDatail({super.key, required this.id});

  final int id;

  @override
  State<UserScreenDatail> createState() => _UserScreenDatailState();
}

class _UserScreenDatailState extends State<UserScreenDatail> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<UserProvider>(context, listen: false).getUserById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          return Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50.r,
                ),
              ),
              SizedBox(height: 20.h),
              CardInfoList(title: "Name", value: "Ibrahim Mustapha"),
              CardInfoList(title: "Email", value: "Ibrahim Mustapha"),
              CardInfoList(title: "Phone", value: "Ibrahim Mustapha"),
            ],
          );
        },
      ),
    );
  }
}
