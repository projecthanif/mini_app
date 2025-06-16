import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_app/models/post_model.dart';
import 'package:mini_app/providers/post_provider.dart';
import 'package:mini_app/screens/post/post_detail_screen.dart';
import 'package:mini_app/widgets/post_card.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<PostProvider>(context, listen: false).getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Post",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Discover",
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Post from jsonplaceholder"),
            SizedBox(height: 10.h),
            SizedBox(
              height: 650.h,
              width: double.infinity,
              child: Consumer<PostProvider>(
                builder: (context, postProvider, _) {
                  if (postProvider.loading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  } else if (postProvider.posts.isNotEmpty) {
                    return _PostList(posts: postProvider.posts);
                  } else {
                    return Center(
                      child: Text("No Post"),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostList extends StatelessWidget {
  const _PostList({required this.posts});

  final List<PostModel> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final PostModel post = posts[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PostDetailScreen(id: post.id);
                },
              ),
            );
          },
          child: PostCard(
            title: post.title,
            author: "hanif",
            category: post.category,
            thumbnail:
                "https://images.unsplash.com/photo-1747134392453-751dfaed2aa3?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            date: post.updatedAt,
          ),
        );
      },
    );
  }
}
