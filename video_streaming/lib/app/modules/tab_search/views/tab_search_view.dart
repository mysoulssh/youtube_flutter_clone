import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:video_streaming/app/utils/assets.dart';
import 'package:video_streaming/app/widgets/custom_elevate_button.dart';
import 'package:video_streaming/app/widgets/custom_header_delegate.dart';
import 'package:video_streaming/app/widgets/video_item.dart';

import '../controllers/tab_search_controller.dart';

class TabSearchView extends GetView<TabSearchController> {
  const TabSearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [searchTextField(context), bodyListView(context)],
      ),
    );
  }
}

extension TabSearchTextFieldView on TabSearchView {
  searchTextField(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: SizedBox(
          height: 36.w,
          child: TextField(
            focusNode: controller.focusNode,
            controller: controller.editingController,
            style: Theme.of(context).textTheme.titleMedium,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(100)),
              filled: true,
              fillColor: Colors.white.withValues(alpha: 0.05),
              prefixIcon: Icon(
                Icons.search,
                size: 24,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  controller.editingController.text = "";
                  if (controller.focusNode.hasFocus == false &&
                      controller.focusNode.canRequestFocus) {
                    FocusScope.of(context).requestFocus(controller.focusNode);
                  }
                },
                child: Icon(
                  Icons.clear,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      );
}

extension TabSearchBodyView on TabSearchView {
  bodyListView(BuildContext context) => Expanded(
          child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [categories(context), listView()],
      ));

  categories(BuildContext context) => SliverPersistentHeader(
        floating: true, // 下滑时立即出现
        pinned: false, // 上滑时消失
        delegate: StickyHeaderDelegate(
          minHeight: 50,
          maxHeight: 50,
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: SingleChildScrollView(
              controller: controller.categoryScrollController,
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w - 4, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i <= Assets.testCategories.length; i++)
                      categoryItem(context, i)
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  categoryItem(BuildContext context, int index) {
    if (index == 0) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: CustomElevateButton(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            backgroundColor: Colors.white.withValues(alpha: 0.14),
            minimumSize: Size(48, 32),
            radius: 8,
            onPressed: () {},
            child: SvgPicture.asset(Assets.homeFilter)),
      );
    }
    return Obx(
      () => Padding(
        key: controller.categoryKeys[index - 1],
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: CustomElevateButton(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            backgroundColor: controller.rxcategoryIndex.value == index
                ? Colors.white
                : Colors.white.withValues(alpha: 0.14),
            minimumSize: Size(48, 32),
            radius: 8,
            onPressed: () => controller.categoryItemClicked(index - 1),
            child: Text(
              Assets.testCategories[index - 1],
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: controller.rxcategoryIndex.value == index
                        ? Colors.black
                        : Colors.white,
                  ),
            )),
      ),
    );
  }

  listView() {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return VideoItem();
      },
    );
  }
}
