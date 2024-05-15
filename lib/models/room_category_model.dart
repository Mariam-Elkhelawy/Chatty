import 'package:flutter/material.dart';

class RoomCategoryModel {
  String id;
  String roomName;
  String roomImage;
  Widget roomIcon;

  RoomCategoryModel(
      {required this.id,
      required this.roomName,
      required this.roomImage,
      required this.roomIcon});
  static List<RoomCategoryModel> getCategories() {
    return [
      RoomCategoryModel(
        id: 'Friends',
        roomName: 'Friends',
        roomImage: 'roomImage',
        roomIcon: const ImageIcon(
          AssetImage('assets/icons/ic_friends.png'),
          size: 18,
        ),
      ),
      RoomCategoryModel(
        id: 'Sport',
        roomName: 'Sport Club',
        roomImage: 'roomImage',
        roomIcon: const ImageIcon(
          AssetImage('assets/icons/ic_sport.png'),
          size: 18,
        ),
      ),
      RoomCategoryModel(
        id: 'Family',
        roomName: 'Family',
        roomImage: 'roomImage',
        roomIcon: const ImageIcon(
          AssetImage('assets/icons/ic_family.png'),
          size: 18,
        ),
      ),
      RoomCategoryModel(
        id: 'Movie',
        roomName: 'Movies',
        roomImage: 'roomImage',
        roomIcon: const ImageIcon(
          AssetImage('assets/icons/ic_movie.png'),
          size: 18,
        ),
      ),
      RoomCategoryModel(
        id: 'Health',
        roomName: 'Healths',
        roomImage: 'roomImage',
        roomIcon: const ImageIcon(
          AssetImage('assets/icons/ic_health.png'),
          size: 18,
        ),
      ),
      RoomCategoryModel(
        id: 'id',
        roomName: 'Work',
        roomImage: 'roomImage',
        roomIcon: const ImageIcon(
          AssetImage('assets/icons/ic_work.png'),
          size: 18,
        ),
      ),
      RoomCategoryModel(
        id: 'id',
        roomName: 'Music',
        roomImage: 'roomImage',
        roomIcon: const ImageIcon(
          AssetImage('assets/icons/ic_music.png'),
          size: 18,
        ),
      ),
      RoomCategoryModel(
        id: 'id',
        roomName: 'Love',
        roomImage: 'roomImage',
        roomIcon: const ImageIcon(
          AssetImage('assets/icons/ic_love.png'),
          size: 18,
        ),
      ),
    ];
  }
}
