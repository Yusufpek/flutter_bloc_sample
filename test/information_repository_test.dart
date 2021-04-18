import 'package:flutter_bloc_sample/models/information.dart';
import 'package:flutter_bloc_sample/models/post.dart';
import 'package:flutter_bloc_sample/repository/informations_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  InformationRepository infoRepo;
  var response;
  setUp(() async {
    infoRepo = InformationRepository();
    response = await infoRepo.fetcInformations();
  });

  test("Instagram data fetch", () {
    expect(response is Information, true);
  });

  test("Post list", () {
    expect(response.posts is List<Post>, true);
  });

  test("Posts sliders image url", () {
    //First post isn't sliders so i try second post's images' urls
    expect(response.posts[1].imagesUrl is List<String>, true);
  });
  test("Account biography", () {
    expect(response.account.biograpyh.isNotEmpty, true);
  });

  test("Account profile image url", () {
    expect(response.account.profileImageUrl.isNotEmpty, true);
  });
}
