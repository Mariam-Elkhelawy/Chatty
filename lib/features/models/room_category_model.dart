import 'package:chatty/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class RoomCategoryModel {
  String id;
  String roomName;
  Widget roomIcon;

  RoomCategoryModel(
      {required this.id,
      required this.roomName,
      required this.roomIcon});
  static List<RoomCategoryModel> getCategories() {
    return [
      RoomCategoryModel(
        id: 'friends',
        roomName: 'Friends',
        roomIcon: const ImageIcon(
          AssetImage(AppImages.icFriends),
          size: 18,
        ),
      ),
      RoomCategoryModel(
        id: 'sport',
        roomName: 'Sport Club',
        roomIcon: const ImageIcon(
          AssetImage(AppImages.icSport),
          size: 18,
        ),
      ),
      RoomCategoryModel(
        id: 'family',
        roomName: 'Family',
        roomIcon: const ImageIcon(
          AssetImage(AppImages.icFamily),
          size: 18,
        ),
      ),
      RoomCategoryModel(
        id: 'movie',
        roomName: 'Movies',
        roomIcon: const ImageIcon(
          AssetImage(AppImages.icMovie),
          size: 18,
        ),
      ),
      RoomCategoryModel(
        id: 'health',
        roomName: 'Health',
        roomIcon: const ImageIcon(
          AssetImage(AppImages.icHealth),
          size: 18,
        ),
      ),
      RoomCategoryModel(
        id: 'work',
        roomName: 'Work',
        roomIcon: const ImageIcon(
          AssetImage(AppImages.icWork),
          size: 18,
        ),
      ),
      RoomCategoryModel(
        id: 'music',
        roomName: 'Music',
        roomIcon: const ImageIcon(
          AssetImage(AppImages.icMusic),
          size: 18,
        ),
      ),
      RoomCategoryModel(
        id: 'love',
        roomName: 'Love',
        roomIcon: const ImageIcon(
          AssetImage(AppImages.icLove),
          size: 18,
        ),
      ),
    ];
  }
}
