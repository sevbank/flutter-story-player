part of 'story_container_bloc.dart';

abstract class StoryContainerState extends Equatable {
  const StoryContainerState();
}

class StoryContainerInitial extends StoryContainerState {
  const StoryContainerInitial();
  @override
  List<Object> get props => [];
}

class StoryContainerLoading extends StoryContainerState {
  const StoryContainerLoading();

  @override
  List<Object> get props => [];
}

class StoryContainerGoToNextUser extends StoryContainerState {
  const StoryContainerGoToNextUser();

  @override
  List<Object> get props => [];
}

class StoryContainerLoaded extends StoryContainerState {
  final List<User> users;
  const StoryContainerLoaded(this.users);

  @override
  List<Object> get props => [users];
}

class StoryContainerError extends StoryContainerState {
  final String message;
  const StoryContainerError(this.message);

  @override
  List<Object> get props => [message];
}


