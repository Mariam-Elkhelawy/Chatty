import 'package:chatty/config/routes/app_routes_names.dart';
import 'package:chatty/core/database/database_utils.dart';
import 'package:chatty/core/utils/app_colors.dart';
import 'package:chatty/core/utils/styles.dart';
import 'package:chatty/features/base.dart';
import 'package:chatty/features/home/home_navigator.dart';
import 'package:chatty/features/home/home_vm.dart';
import 'package:chatty/features/home/widgets/room_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    viewModel.getRooms();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.whiteColor,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: AppColor.whiteColor),
            actions: [
              PopupMenuButton<String>(
                offset: const Offset(0, 40),
                color: AppColor.whiteColor,
                surfaceTintColor: AppColor.whiteColor,
                onSelected: (value) async {
                  switch (value) {
                    case 'Logout':
                      await DataBaseUtils.signOut()
                          .then((value) => Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRoutesName.auth,
                                (route) => false,
                              ));
                      break;
                    case 'Settings':
                      Navigator.pushNamed(context, AppRoutesName.settings);
                      break;
                  }
                },
                itemBuilder: (BuildContext context) {
                  return {'Logout', 'Settings'}.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(
                        choice,
                        style: AppStyles.bodyM.copyWith(color: AppColor.second),
                      ),
                    );
                  }).toList();
                },
              ),
            ],
            backgroundColor: AppColor.primaryColor,
            title: Text(
              'My Rooms',
              style: AppStyles.textButton,
            ),
            centerTitle: true,
          ),
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
          body: Consumer<HomeViewModel>(
            builder: (context, homeVM, child) {
              return Padding(
                padding: EdgeInsets.all(16.r),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // mainAxisSpacing: 16,
                      childAspectRatio: 135 / 200,
                      crossAxisSpacing: 16),
                  itemBuilder: (context, index) {
                    return RoomWidget(roomModel: homeVM.rooms[index]);
                  },
                  itemCount: homeVM.rooms.length,
                ),
              );
            },
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
