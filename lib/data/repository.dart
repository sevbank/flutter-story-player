import 'data.dart';

abstract class UserRepository {
  Future<List<User>> fetchUsers();
}

class MockUserRepository implements UserRepository {
  @override
  Future<List<User>> fetchUsers() {
    return Future.delayed(
        Duration(seconds: 1),
            () {
          return [
            User(imageUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg', stories: [
              Story(id: 'id1', type: StoryType.image, dataUrl: 'https://images.unsplash.com/photo-1564865878688-9a244444042a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
              Story(id: 'id2', type: StoryType.image, dataUrl: 'https://images.unsplash.com/photo-1617040619263-41c5a9ca7521?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
              Story(id: 'id3', type: StoryType.image, dataUrl: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80')
            ]),
            User(imageUrl: 'https://images.unsplash.com/photo-1501450626433-39bbf117090e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', stories: [
              Story(id: 'id4', type: StoryType.image, dataUrl: 'https://images.unsplash.com/photo-1502101872923-d48509bff386?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80'),
              Story(id: 'id5', type: StoryType.image, dataUrl: 'https://images.unsplash.com/photo-1605811784515-402587119f3b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80')
            ]),
            User(imageUrl: 'https://images.unsplash.com/photo-1591160690555-5debfba289f0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80', stories: [
              Story(id: 'id6', type: StoryType.image, dataUrl: 'https://images.unsplash.com/photo-1591160690555-5debfba289f0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80'),
              Story(id: 'id7', type: StoryType.image, dataUrl: 'https://images.unsplash.com/photo-1546527868-ccb7ee7dfa6a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
              Story(id: 'id8', type: StoryType.image, dataUrl: 'https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80')
            ]),
            User(imageUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg', stories: [
              Story(id: 'id9', type: StoryType.video, dataUrl: 'https://firebasestorage.googleapis.com/v0/b/flutter-case-study.appspot.com/o/pexels-anna-tarazevich-6550211.mp4?alt=media&token=176e6f01-3052-4a8d-8c72-fbfe2710f66e'),
              Story(id: 'id10', type: StoryType.image, dataUrl: 'https://images.unsplash.com/photo-1537884944318-390069bb8665?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
              Story(id: 'id11', type: StoryType.video, dataUrl: 'https://firebasestorage.googleapis.com/v0/b/flutter-case-study.appspot.com/o/pexels-vlada-karpovich-6134023.mp4?alt=media&token=8eeb435d-0ab4-45d2-bbde-982a5d52ad66')
            ])
          ];
        }
    );
  }
}