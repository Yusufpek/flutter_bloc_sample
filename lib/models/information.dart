import 'account.dart';
import 'post.dart';

class Information {
  final Account account;
  final List<Post> posts;

  const Information({this.account, this.posts});

  factory Information.fromJson(jsonData) {
    jsonData = jsonData['graphql']['user'];
    return Information(
      account: Account.fromJson(jsonData),
      posts: jsonData['edge_owner_to_timeline_media']['edges']
          .map((e) => Post.fromJson(e))
          .toList()
          .cast<Post>(),
    );
  }
}
