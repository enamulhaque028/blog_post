import 'package:blog_post/views/blog_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PopularPosts extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String description;
  final String avatar;
  final String author;
  final String profession;
  PopularPosts({
    @required this.imgUrl,
    @required this.title,
    @required this.description,
    @required this.avatar,
    @required this.author,
    @required this.profession,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var leftContainerWidth = width * (2 / 5) - 18;
    var rightContainerWidth = width * (3 / 5) - 42;
    return Column(
      children: [
        Card(
          elevation: 5.0,
          child: Container(
            width: width,
            height: 140,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => BlogDetails(
                            imgUrl: imgUrl,
                            title: title,
                            description: description,
                            avatar: avatar,
                            author: author,
                            profession: profession,
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: imgUrl,
                        height: height,
                        width: leftContainerWidth,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: height,
                    width: rightContainerWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: rightContainerWidth,
                              child: Text(
                                title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundImage: NetworkImage(avatar),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  author,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
