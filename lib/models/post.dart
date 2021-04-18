class Post {
  final String displayUrl;
  final String caption;
  final int likesCount;
  final bool isSideCar;
  final List<String> imagesUrl;
  const Post({this.isSideCar, this.imagesUrl, this.displayUrl, this.caption, this.likesCount});

  factory Post.fromJson(Map<String, dynamic> jsonData) {
    jsonData = jsonData['node'];
    bool _isSideCar = jsonData['__typename'] == 'GraphSidecar';
    return Post(
      displayUrl: jsonData['display_url'] ?? "",
      caption: jsonData['edge_media_to_caption']['edges'][0]['node']['text'] ?? "",
      likesCount: jsonData['edge_liked_by']['count'] ?? 0,
      isSideCar: _isSideCar,
      imagesUrl: _isSideCar
          ? jsonData['edge_sidecar_to_children']['edges']
              .map((e) => e['node']['display_url'])
              .toList()
              .cast<String>()
          : [],
    );
  }
}
