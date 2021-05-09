import 'package:blog_post/views/blog_details.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BlogListTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String description;
  final String avatar;
  final String author;
  final String profession;
  BlogListTile({
    @required this.imgUrl,
    @required this.title,
    @required this.description,
    @required this.avatar,
    @required this.author,
    @required this.profession,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Stack(
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
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: imgUrl,
                    height: 220,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 220,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            width: 150,
            child: Column(
              children: [
                Spacer(),
                Container(
                  margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 130,
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
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
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
