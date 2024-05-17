import 'package:chatty/core/database/database_utils.dart';
import 'package:chatty/features/base.dart';
import 'package:chatty/features/home/home_navigator.dart';
import 'package:chatty/models/room_model.dart';

class HomeViewModel extends BaseViewModel<HomeNavigator> {
  List<RoomModel> rooms = [];
  Future<void> getRooms() async {
    try {
      rooms = await DataBaseUtils.getRoom();
    } catch (e) {
      navigator!.showMessage(message: e.toString());
    }
  }
}
