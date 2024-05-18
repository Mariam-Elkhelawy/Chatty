import 'package:chatty/core/database/database_utils.dart';
import 'package:chatty/features/base.dart';
import 'package:chatty/features/settings/settings_navigator.dart';

class SettingsViewModel extends BaseViewModel<SettingsNavigator> {
  Future<void> updatePassword(String newPassword) async {
    try {
      navigator!.showLoading();
      await DataBaseUtils.changePassword(newPassword);
      navigator!.hideDialog();
      navigator!.showMessage(message: 'Password changed successfully');
      navigator!.hideDialog();
      navigator!.goToLogin();
    } catch (e) {
      navigator!.showMessage(message: e.toString());
      navigator!.hideDialog();
    }
  }

  Future<void> deleteAccount() async {
    try {
      navigator!.showLoading();
      await DataBaseUtils.deleteUserAccount();
       navigator!.hideDialog();
      navigator!.showMessage(message: 'Account Deleted successfully');
      navigator!.hideDialog();
      navigator!.goToAuth();
    } catch (e) {
      navigator!.showMessage(message: e.toString());
      navigator!.hideDialog();
    }
  }
}
