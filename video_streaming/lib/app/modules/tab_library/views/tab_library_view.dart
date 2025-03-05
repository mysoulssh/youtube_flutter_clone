import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart' as fk;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:video_streaming/app/utils/assets.dart';
import 'package:video_streaming/app/widgets/custom_elevate_button.dart';
import 'package:video_streaming/generated/locales.g.dart';

import '../controllers/tab_library_controller.dart';

class TabLibraryView extends GetView<TabLibraryController> {
  const TabLibraryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 3,
        itemBuilder: (context, index) {
          final titles = [LocaleKeys.libHistory.tr, LocaleKeys.libFavorites.tr, LocaleKeys.libLikes.tr];
          return collectionViewItem(context, titles[index], index);
        },
      ),
    );
  }
}

extension TabLibraryCollectionView on TabLibraryView {
  collectionViewItem(BuildContext context, String title, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                Spacer(),
                CustomElevateButton(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    minimumSize: Size(50, 32),
                    backgroundColor: Colors.white.withValues(alpha: 0.05),
                    onPressed: () {},
                    child: Text(
                      LocaleKeys.libViewAll.tr,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ))
              ],
            ),
            SizedBox(
              height: 167.h,
              child: GridView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 15.w,
                  crossAxisCount: 1,
                  childAspectRatio: 167 / 159,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 2,
                              child: Container(
                                width: double.infinity,
                                alignment: Alignment.bottomRight,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: CachedNetworkImageProvider(Assets.randomFilm()), fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  margin: EdgeInsets.all(4),
                                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                  decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.6), borderRadius: BorderRadius.circular(6)),
                                  child: Text(
                                    "12:09",
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        fk.faker.conference.name(),
                                        maxLines: 2,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Text.rich(TextSpan(style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white70), children: [
                                        TextSpan(text: fk.faker.person.name()),
                                        WidgetSpan(
                                            alignment: ui.PlaceholderAlignment.middle,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 4),
                                              child: Icon(
                                                Icons.verified,
                                                size: 11,
                                                color: Colors.white70,
                                              ),
                                            )),
                                      ]))
                                    ],
                                  ),
                                ),
                                SvgPicture.asset(Assets.homeMore)
                              ],
                            )
                          ],
                        ),
                      ),
                      Spacer()
                    ],
                  );
                },
              ),
            )
          ],
        ),
      );
}
