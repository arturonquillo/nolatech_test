// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tennis_time/src/core/router/app_route_enum.dart';
import 'package:tennis_time/src/core/utils/assets.dart';
import 'package:tennis_time/src/core/utils/colors.dart';
import 'package:tennis_time/src/shared/services/shared_preferences_service.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      actions: [
        SizedBox(
          width: 30,
          child: CircleAvatar(
            child: Image.asset(AppAssets.profile),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 8),
          width: 30,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
              color: AppColors.light,
              size: 22,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: PopupMenuButton(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            child: SizedBox(
              width: 30,
              child: Icon(
                Icons.menu_rounded,
                color: AppColors.light,
                size: 22,
              ),
            ),
            onSelected: (value) {
              // selectedPeriod = int.tryParse(value) ?? 1;
              // callArticles();
              if (value == "logout") {
                Navigator.of(context).popAndPushNamed(AppRouteEnum.welcome.name);
                LocalStorageService.clearAll();
              }
            },
            elevation: 3,
            tooltip: "Menú",
            itemBuilder: (BuildContext bc) {
              return [
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.logout,
                        color: Theme.of(context).iconTheme.color,
                        size: 20,
                      ),
                      Text(
                        "Cerrar sesión",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  value: 'logout',
                ),
              ];
            },
          ),
        ),
      ],
      leading: Container(
        width: 180.w,
        margin: EdgeInsets.only(left: 12),

        // width: 100,
        child: Image.asset(AppAssets.logoHeader),
      ),
      leadingWidth: 150.w,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.dark,
              AppColors.secondaryColor,
              AppColors.thirdColor,
              AppColors.thirdColor,
              AppColors.thirdColor,
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(360.w, 50.h);

}
