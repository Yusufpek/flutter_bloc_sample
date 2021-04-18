import 'package:flutter/material.dart';
import 'package:flutter_bloc_sample/constants/extensions/context_extension.dart';
import 'package:flutter_bloc_sample/models/post.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: context.screenHeight * 0.6,
              child: post.isSideCar ? swiperWidget : buildImage(post.displayUrl),
            ),
            Text('🟣 ${post.caption}'),
          ],
        ),
        Positioned(top: 0, right: 0, child: likesCountWidget)
      ],
    );
  }

  Image buildImage(String url) => Image.network(url, fit: BoxFit.contain);

  Swiper get swiperWidget => Swiper(
        autoplay: true,
        itemCount: post.imagesUrl.length,
        itemBuilder: (_, i) => buildImage(post.imagesUrl[i]),
      );

  Card get likesCountWidget => Card(
        child: Row(
          children: [
            Icon(Icons.favorite),
            Text(post.likesCount.toString()),
          ],
        ),
      );
}
