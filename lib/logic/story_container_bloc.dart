import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../data/data.dart';

part 'story_container_event.dart';
part 'story_container_state.dart';

class StoryContainerBloc extends Bloc<StoryContainerEvent, StoryContainerState> {
  final UserRepository _userRepository;
  final pageController = PageController();
  int numberOfUsers = 0;
  int currentPage = 0;
  StoryContainerBloc(this._userRepository) : super(StoryContainerInitial());

  @override
  Stream<StoryContainerState> mapEventToState(
    StoryContainerEvent event,
  ) async* {
    if (event is GetUsers) {
      try {
        yield StoryContainerLoading();
        final users = await _userRepository.fetchUsers();
        numberOfUsers = users.length;
        yield StoryContainerLoaded(users);
      } on NetworkException {
        yield StoryContainerError("Couldn't fetch users.");
      }
    } else if (event is GoToNextUser) {
      // If it is the last user, don't try going to the next page.
      if ((this.currentPage + 1) < this.numberOfUsers) {
        pageController.nextPage(duration: Duration(milliseconds: 600), curve: Curves.easeInCubic);
      }
    } else if (event is UpdatePageIndex) {
      currentPage = event.index;
    }
  }
}

class NetworkException implements Exception {}
