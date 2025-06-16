import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_app/models/user_model.dart';
import 'package:mini_app/providers/user_provider.dart';
import 'package:mini_app/widgets/user_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<UserProvider>(context).getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Users",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
        child: Consumer<UserProvider>(
          builder: (context, userProvider, _) {
            if (userProvider.loading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
            return ListView.builder(
              itemCount: userProvider.users.length,
              itemBuilder: (context, index) {
                final UserModel user = userProvider.users[index];
                return InkWell(
                  onTap: () {},
                  child: UserCard(
                    name: "${user.firstname} ${user.firstname}",
                    email: user.email,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
