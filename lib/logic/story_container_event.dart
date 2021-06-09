part of 'story_container_bloc.dart';

abstract class StoryContainerEvent extends Equatable {
  const StoryContainerEvent();
}

class GetUsers extends StoryContainerEvent {
  GetUsers();

  @override
  List<Object> get props => [];
}

class GoToNextUser extends StoryContainerEvent {
  GoToNextUser();

  @override
  List<Object> get props => [];
}

class UpdatePageIndex extends StoryContainerEvent {
  final int index;
  UpdatePageIndex(this.index);

  @override
  List<Object> get props => [index];
}
