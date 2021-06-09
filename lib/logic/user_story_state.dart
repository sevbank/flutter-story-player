part of 'user_story_bloc.dart';

abstract class UserStoryState extends Equatable {
  const UserStoryState();
}

class UserStoryInitial extends UserStoryState {
  const UserStoryInitial();

  @override
  List<Object> get props => [];
}

class UserStoryPlaying extends UserStoryState {
  final String userImageUrl;
  final List<StoryItem> storyItems;
  final StoryController controller;
  const UserStoryPlaying(this.userImageUrl, this.storyItems, this.controller);

  @override
  List<Object> get props => [userImageUrl, storyItems, controller];
}
