class Account {
  final String profileImageUrl;
  final String biograpyh;
  const Account({this.profileImageUrl, this.biograpyh});

  factory Account.fromJson(Map<String, dynamic> jsonData) {
    return Account(
      profileImageUrl: jsonData['profile_pic_url'],
      biograpyh: jsonData['biography'],
    );
  }
}
