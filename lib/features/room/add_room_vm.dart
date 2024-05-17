import 'package:chatty/core/database/database_utils.dart';
import 'package:chatty/features/base.dart';
import 'package:chatty/features/room/add_room_navigator.dart';
import 'package:chatty/models/room_model.dart';

class AddRoomViewModel extends BaseViewModel<AddRoomNavigator> {
  String? message;

  Future<void> createRoom(
      {required String roomName,
      required String roomDescription,
      required String catId}) async {
    try {
      navigator!.showLoading();
      RoomModel roomModel = RoomModel(
          roomName: roomName, roomDescription: roomDescription, catId: catId);
      await DataBaseUtils.addRoom(roomModel);
      navigator!.hideDialog();
      navigator!.createRoom();
    } catch (e) {
      message = e.toString();
    }
    if (message != null) {
      navigator!.hideDialog();
      navigator!.showMessage(message: message!);
    }
  }
}
