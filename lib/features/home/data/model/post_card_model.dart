import 'package:flutter/material.dart';

class PostCardModel {
  final String text;
  final String username;
  final String data;
  final Widget? postImages;
  final String like;
  final String repost;
  final String comments;
  final String avatar;

  PostCardModel(
      {required this.text,
      required this.username,
      required this.data,
      this.postImages,
      required this.like,
      required this.repost,
      required this.comments,
      required this.avatar,});
}
