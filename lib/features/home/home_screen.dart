import 'package:chatty/config/routes/app_routes_names.dart';
import 'package:chatty/core/utils/app_colors.dart';
import 'package:chatty/core/utils/styles.dart';
import 'package:chatty/features/base.dart';
import 'package:chatty/features/home/home_navigator.dart';
import 'package:chatty/features/home/home_vm.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.whiteColor,
          appBar: AppBar(
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
              return


                Padding(
                padding: EdgeInsets.all(16.r),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      childAspectRatio: 140 / 200,
                      crossAxisSpacing: 16),
                  itemBuilder: (context, index) {
                    return Material(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(20.r),
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 90,
                              backgroundImage: AssetImage(
                                'assets/images/${homeVM.rooms[index].catId}.jpg',
                              ),
                            ),
                            Text(homeVM.rooms[index].roomName,
                                style: AppStyles.bodyS
                                    .copyWith(color: AppColor.primaryColor)),
                            Text(
                              homeVM.rooms[index].roomDescription,
                              maxLines: 2,
                              style: AppStyles.bodyS.copyWith(fontSize: 14,
                                  color: AppColor.primaryColor.withOpacity(.5)),
                            ),
                          ],
                        ),
                      ),
                    );
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
