part of 'user_story_bloc.dart';

abstract class UserStoryEvent extends Equatable {
  const UserStoryEvent();
}

class PlayUserStory extends UserStoryEvent {
  const PlayUserStory();

  @override
  List<Object> get props => [];
}

class ViewUserStory extends UserStoryEvent {
  final int index;
  const ViewUserStory(this.index);

  @override
  List<Object> get props => [index];
}
