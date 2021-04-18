import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/Information_cubit.dart';
import '../bloc/info_states.dart';
import '../constants/app_strings/app_strings.dart';
import '../constants/extensions/context_extension.dart';
import '../constants/padding/custom_paddings.dart';
import '../models/account.dart';
import '../models/post.dart';
import '../widgets/post_card.dart';

class HomePage extends StatelessWidget {
  final _infoCubit = InformationCubit();
  final CustomPadding _padding = CustomPadding();
  TextStyle _centerTextStyle = TextStyle();
  @override
  Widget build(BuildContext context) {
    _centerTextStyle = context.textTheme.bodyText1;
    _infoCubit.fetchData();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appBarTitle),
        centerTitle: true,
      ),
      body: _blocBuilderWidget,
    );
  }

  Widget get _blocBuilderWidget => BlocBuilder<InformationCubit, InfoState>(
        bloc: _infoCubit,
        builder: (context, state) {
          if (state is InfoInitialize) {
            return _centerText(AppStrings.welcome);
          } else if (state is InfoLoading) {
            return _loadingWidget;
          } else if (state is InfoSucces) {
            return _informationsWidget(state);
          } else if (state is InfoError) {
            return _centerText(state.errorMessage);
          } else {
            return _centerText(AppStrings.stateDefault);
          }
        },
      );
  Widget get _loadingWidget => Center(child: CircularProgressIndicator());

  Widget _centerText(String str) => Center(child: Text(str, style: _centerTextStyle));

  Widget _informationsWidget(state) => Column(
        children: [
          Expanded(flex: 1, child: _accountListTile(state.response.account)),
          Expanded(flex: 5, child: _informationsListView(state.response.posts)),
        ],
      );

  Widget _informationsListView(List<Post> _posts) {
    return ListView.builder(
      itemCount: _posts.length,
      padding: _padding.lowPadding,
      itemBuilder: (c, i) => Padding(
        padding: _padding.horizontalPadding(16),
        child: _listViewItems(i, _posts),
      ),
    );
  }

  Widget _listViewItems(int i, List<Post> _posts) {
    return Column(
      children: [
        PostCard(post: _posts[i]),
        if (i != _posts.length)
          Divider(
            thickness: 2,
            color: Colors.black,
          ),
      ],
    );
  }

  Widget _accountListTile(Account account) => ListTile(
        leading: Image.network(account.profileImageUrl),
        title: _centerText(account.biograpyh),
      );
}
