import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'story.dart';

class User extends Equatable {

  final String imageUrl;
  final List<Story> stories;

  User({
    @required this.imageUrl,
    @required this.stories
  });

  @override
  List<Object> get props => [imageUrl, stories];
}