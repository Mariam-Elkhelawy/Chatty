import 'package:chatty/config/routes/app_routes_names.dart';
import 'package:chatty/core/database/database_utils.dart';
import 'package:chatty/core/utils/app_colors.dart';
import 'package:chatty/features/base.dart';
import 'package:chatty/features/home/home_navigator.dart';
import 'package:chatty/features/home/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen, HomeViewModel>
    implements HomeNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primaryColor,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutesName.addRoom);
            },
            child: const Icon(
              Icons.group_add_rounded,
              color: AppColor.whiteColor,
            ),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await DataBaseUtils.signOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoutesName.login, (route) => false);
                  },
                  child: const Text('data'))
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel initViewModel() {
    return HomeViewModel();
  }
}
