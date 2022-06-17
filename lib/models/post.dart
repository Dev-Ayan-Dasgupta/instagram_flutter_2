import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String username;
  final String uid;
  final String postId;
  final String description;
  final String postUrl;
  final String profImage;
  final datePublished;
  final likes;

  const Post(
      {required this.username,
      required this.uid,
      required this.postId,
      required this.description,
      required this.postUrl,
      required this.profImage,
      required this.datePublished,
      required this.likes});

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'postId': postId,
        'description': description,
        'datePublished': datePublished,
        'profImage': profImage,
        'postUrl': postUrl,
        'likes': likes,
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      username: snapshot['username'],
      uid: snapshot['uid'],
      postId: snapshot['postId'],
      description: snapshot['description'],
      datePublished: snapshot['datePublished'],
      profImage: snapshot['profImage'],
      postUrl: snapshot['postUrl'],
      likes: snapshot['likes'],
    );
  }
}
