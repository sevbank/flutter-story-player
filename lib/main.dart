import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/logic.dart';
import 'data/data.dart';
import 'presentation/presentation.dart';


void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: BlocProvider(
      create: (context) =>
      StoryContainerBloc(MockUserRepository())..add(GetUsers()),
      child: StoryContainer(),
    ),
  ));
}
