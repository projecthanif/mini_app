import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_app/models/post_model.dart';
import 'package:mini_app/providers/post_provider.dart';
import 'package:mini_app/screens/post/post_detail_screen.dart';
import 'package:mini_app/widgets/app_filter_bar.dart';
import 'package:mini_app/widgets/post_card.dart';
import 'package:mini_app/widgets/app_search_bar.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController filterController = TextEditingController();
  late ValueNotifier<bool> isQueried = ValueNotifier(false);

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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSearchBar(
              controller: searchController,
              isQueried: isQueried,
              onSearch: () {
                isQueried.value = true;
                Provider.of<PostProvider>(context, listen: false)
                    .getPostQueried(searchController.text, false);
              },
            ),
            SizedBox(height: 10.h),
            AppFilterBar(
              controller: filterController,
              isQueried: isQueried,
              onSelect: (value) {
                isQueried.value = true;
                Provider.of<PostProvider>(context, listen: false)
                    .getPostQueried(value!, true);
              },
            ),
            Text("Post from jsonplaceholder"),
            SizedBox(height: 10.h),
            ValueListenableBuilder(
              valueListenable: isQueried,
              builder: (context, value, _) {
                return Expanded(
                  child: isQueried.value
                      ? _buildQueriedPostList()
                      : _buildPostList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostList() {
    return Consumer<PostProvider>(
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
          return Container(
            color: Colors.red,
            width: double.infinity,
            child: Center(
              child: Text(
                "No Post",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildQueriedPostList() {
    return Consumer<PostProvider>(
      builder: (context, postProvider, _) {
        if (postProvider.loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        } else if (postProvider.posts.isNotEmpty) {
          return _PostList(posts: postProvider.queriedPosts!);
        } else {
          return Container(
            width: double.infinity,
            child: Center(
              child: Text(
                "No Post",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
      },
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
