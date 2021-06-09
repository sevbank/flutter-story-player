import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Story extends Equatable {
  final String id;
  final StoryType type;
  final String dataUrl;

  Story({
    @required this.id,
    @required this.type,
    @required this.dataUrl,
  });

  @override
  List<Object> get props => [id, type, dataUrl];
}

enum StoryType {
  image,
  video
}
