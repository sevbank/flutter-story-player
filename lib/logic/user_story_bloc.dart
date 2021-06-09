import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:story_view/story_view.dart';
import '../data/user.dart';
import '../data/story.dart';

part 'user_story_event.dart';
part 'user_story_state.dart';

class UserStoryBloc extends Bloc<UserStoryEvent, UserStoryState> {
  final User user;
  final controller = StoryController();
  UserStoryBloc(this.user) : super(UserStoryInitial());

  @override
  Stream<UserStoryState> mapEventToState(
    UserStoryEvent event,
  ) async* {
    if (event is PlayUserStory) {
      final storyItems = _convertIntoItems(this.user.stories);
      yield UserStoryPlaying(this.user.imageUrl, storyItems, this.controller);
    } else if (event is ViewUserStory) {
      // TO-DO: Save id of viewed story somehow
    }
  }

  List<StoryItem> _convertIntoItems(List<Story> stories) {
    List<StoryItem> storyItems = [];

    stories.forEach((story) {

      if (story.type == StoryType.image) {
        storyItems.add(StoryItem.pageImage(
          url: story.dataUrl,
          controller: controller,
          duration: Duration(
            seconds: 5,
          ),
        ));
      }

      if (story.type == StoryType.video) {
        storyItems.add(
          StoryItem.pageVideo(
            story.dataUrl,
            controller: controller,
          ),
        );
      }
    });

    return storyItems;
  }

}
