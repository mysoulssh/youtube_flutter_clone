import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_streaming/app/modules/home/views/home_view.dart';
import 'package:video_streaming/app/utils/assets.dart';
import 'package:video_streaming/app/utils/themes.dart';
import 'package:video_streaming/app/widgets/custom_text_button.dart';

extension HomeTopView on HomeView {
  AppBar? topNavigatorView() => AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: Get.isDarkMode ? [Colors.black, Themes.darkBackgroundColor] : [Colors.white, Themes.backgroundColor], // 渐变色
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextButton(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4),
                minimumSize: Size(24, 24),
                onPressed: () {},
                child: SvgPicture.asset(
                  Assets.appbarMenu,
                  colorFilter: ColorFilter.mode(Get.isDarkMode ? Colors.white : Color(0xff111111).withValues(alpha: 0.7), BlendMode.srcIn),
                )),
            SvgPicture.asset(Assets.appbarLogo),
            SizedBox(
              width: 2,
            ),
            SvgPicture.asset(
              Assets.appbarYoutube,
              colorFilter: ColorFilter.mode(Get.isDarkMode ? Colors.white : Color(0xff111111).withValues(alpha: 0.7), BlendMode.srcIn),
            )
          ],
        ),
        leadingWidth: Get.width / 2.0,
        actions: [
          CustomTextButton(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              minimumSize: Size(24, 24),
              onPressed: () {},
              child: SvgPicture.asset(Assets.appbarCast)),
          CustomTextButton(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              minimumSize: Size(24, 24),
              onPressed: () {},
              child: SvgPicture.asset(Assets.appbarNotifyEnable)),
          InkWell(
            onTap: () {},
            radius: 15,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.pink], // 渐变色
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      );
}
