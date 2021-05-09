import 'dart:convert';

BlogPost blogPostFromJson(String str) => BlogPost.fromJson(json.decode(str));

class BlogPost {
  BlogPost({
    this.blogs,
  });

  List<Blog> blogs;

  factory BlogPost.fromJson(Map<String, dynamic> json) => BlogPost(
        blogs: List<Blog>.from(json["blogs"].map((x) => Blog.fromJson(x))),
      );
}

class Blog {
  Blog({
    this.id,
    this.title,
    this.description,
    this.coverPhoto,
    this.categories,
    this.author,
  });

  int id;
  String title;
  String description;
  String coverPhoto;
  List<String> categories;
  Author author;

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        coverPhoto: json["cover_photo"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        author: Author.fromJson(json["author"]),
      );
}

class Author {
  Author({
    this.id,
    this.name,
    this.avatar,
    this.profession,
  });

  int id;
  String name;
  String avatar;
  String profession;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
        profession: json["profession"],
      );
}
