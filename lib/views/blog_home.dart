import 'package:flutter/material.dart';
import '../model/model.dart';
import '../service/services.dart';
import '../ui/blog_list_tile.dart';
import '../ui/popular_posts.dart';

class BlogHome extends StatefulWidget {
  @override
  _BlogHomeState createState() => _BlogHomeState();
}

class _BlogHomeState extends State<BlogHome> {
  BlogPost blogPost = new BlogPost();
  var isLoading = true;

  @override
  void initState() {
    Webservice().fetchPosts().then((data) {
      setState(() {
        blogPost = data;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var blogInfo = blogPost.blogs;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        leading: Container(
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 25,
                ),
                SizedBox(width: 20),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/9398191?v=4'),
                ),
              ],
            ),
          )
        ],
        elevation: 0.0,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                //color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Daily",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Recommendation",
                      style: TextStyle(
                          fontSize: 28,
                          //color: Colors.black54,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 240,
                      child: ListView.builder(
                          itemCount: blogInfo.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return BlogListTile(
                              imgUrl: blogInfo[index].coverPhoto.toString(),
                              title: blogInfo[index].title.toString(),
                              description:
                                  blogInfo[index].description.toString(),
                              avatar: blogInfo[index].author.avatar.toString(),
                              author: blogInfo[index].author.name,
                              profession: blogInfo[index].author.profession,
                            );
                          }),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Popular Posts",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: blogPost.blogs.length,
                        itemBuilder: (context, index) {
                          return PopularPosts(
                            imgUrl: blogInfo[index].coverPhoto.toString(),
                            title: blogInfo[index].title.toString(),
                            description: blogInfo[index].description.toString(),
                            avatar: blogInfo[index].author.avatar.toString(),
                            author: blogInfo[index].author.name,
                            profession: blogInfo[index].author.profession,
                          );
                        }),
                  ],
                ),
              ),
            ),
    );
  }
}
