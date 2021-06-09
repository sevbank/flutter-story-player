import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/logic.dart';
import '../data/data.dart';
import 'presentation.dart';

class StoryContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<StoryContainerBloc, StoryContainerState>(
        listener: (context, state) {
          if (state is StoryContainerError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is StoryContainerLoaded) {
            return buildStoryContainer(context, state.users);
          } else {
            return buildLoading();
          }
        },
        buildWhen: (previousState, currentState) {
          // Prevent updating state after loaded once
          return !(previousState is StoryContainerLoaded);
        },
      ),
    );
  }

  void _onPageChanged(BuildContext context, int index) {
    context.read<StoryContainerBloc>().add(UpdatePageIndex(index));
  }

  Widget buildStoryContainer(BuildContext context, List<User> users) {
    final children = users
        .map(
          (e) => Scaffold(
            body: BlocProvider(
              create: (context) => UserStoryBloc(e)..add(PlayUserStory()),
              child: UserStory(),
            ),
          ),
        )
        .toList();

    return PageView(
      controller: context.read<StoryContainerBloc>().pageController,
      children: children,
      onPageChanged: (index) => _onPageChanged(context, index),
    );
  }

  Widget buildLoading() => Center(child: CircularProgressIndicator());
}
