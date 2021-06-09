import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_view/story_view.dart';
import '../logic/logic.dart';

class UserStory extends StatelessWidget {
  @override
  Widget build(BuildContext userStoryContext) {
    return Scaffold(
        body: BlocBuilder<UserStoryBloc, UserStoryState>(
          builder: (context, state) {
            if (state is UserStoryPlaying) {
              return _StoryView(
                userImageUrl: state.userImageUrl,
                storyItems: state.storyItems,
                controller: state.controller,
              );
            } else {
              return buildLoading();
            }
          },
        ),
      );
  }

  Widget buildLoading() => Center(child: CircularProgressIndicator());
}

class _StoryView extends StatelessWidget {
  const _StoryView({
    Key key,
    this.userImageUrl,
    this.storyItems,
    this.controller,
  }) : super(key: key);

  final String userImageUrl;
  final List<StoryItem> storyItems;
  final StoryController controller;

  @override
  Widget build(BuildContext storyViewContext) {
    return Stack(
      children: <Widget>[
        StoryView(
          storyItems: storyItems,
          controller: controller,
          onComplete: () {
            storyViewContext.read<StoryContainerBloc>().add(GoToNextUser());
          },
          onStoryShow: (storyItem) {
            int index = storyItems.indexOf(storyItem);
            storyViewContext.read<UserStoryBloc>().add(ViewUserStory(index));
          },
        ),
        Container(
          padding: EdgeInsets.only(
            top: 48,
            left: 16,
            right: 16,
          ),
          child: _ProfileView(userImageUrl: userImageUrl),
        )
      ],
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView({Key key, this.userImageUrl}) : super(key: key);
  final String userImageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(userImageUrl),
        ),
        SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
