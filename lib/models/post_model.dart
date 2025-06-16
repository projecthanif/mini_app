class PostModel {
  PostModel({
    required this.id,
    required this.slug,
    required this.title,
    required this.content,
    required this.image,
    required this.thumbnail,
    required this.status,
    required this.category,
    required this.url,
    required this.publishedAt,
    required this.updatedAt,
    required this.userId,
  });

  final int id;
  final String slug;
  final String url;
  final String title;
  final String content;
  final String image;
  final String thumbnail;
  final String status;
  final String category;
  final String publishedAt;
  final String updatedAt;
  final int userId;

  factory PostModel.fromJson(Map<String, dynamic> data) {
    return PostModel(
      id: data['id'],
      slug: data['slug'],
      title: data['title'],
      content: data['content'],
      image: data['image'],
      thumbnail: data['thumbnail'],
      status: data['status'],
      category: data['category'],
      url: data['url'],
      publishedAt: data['publishedAt'],
      updatedAt: data['updatedAt'],
      userId: data['userId'],
    );
  }
}
