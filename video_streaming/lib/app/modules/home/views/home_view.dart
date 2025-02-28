import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return HomeStateView(controller: controller);
  }
}

class HomeStateView extends StatefulWidget {
  final HomeController controller;

  const HomeStateView({super.key, required this.controller});

  @override
  State<HomeStateView> createState() => _HomeStateViewState();
}

class _HomeStateViewState extends State<HomeStateView>
    with WidgetsBindingObserver {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: CustomInkRippleFactory(rippleRadius: 30),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: currentIndex,
          onTap: (value) {
            // Respond to item press.
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: SvgPicture.asset(
                'assets/images/home_unselected.svg',
              ),
              activeIcon: SvgPicture.asset(
                'assets/images/home_selected.svg',
                colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
              ),
            ),
            BottomNavigationBarItem(
              label: "Short",
              icon: SvgPicture.asset(
                'assets/images/short_unselected.svg',
              ),
              activeIcon: SvgPicture.asset(
                'assets/images/short_selected.svg',
                colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
              ),
            ),
            BottomNavigationBarItem(
                label: "Search", icon: Icon(Icons.favorite)),
            BottomNavigationBarItem(label: "Subs", icon: Icon(Icons.book)),
            BottomNavigationBarItem(
                label: "Library", icon: Icon(Icons.library_music))
          ],
        ),
      ),
    );
  }
}

class CustomInkRipple extends InkRipple {
  CustomInkRipple({
    required super.controller,
    required super.referenceBox,
    required super.position,
    required super.color,
    required super.textDirection,
    super.containedInkWell,
    super.rectCallback,
    super.borderRadius,
    super.customBorder,
    super.radius, // 自定义水波纹半径
  });
}

class CustomInkRippleFactory extends InteractiveInkFeatureFactory {
  final double rippleRadius; // 动态调整水波纹大小

  const CustomInkRippleFactory({this.rippleRadius = 20});

  @override
  InteractiveInkFeature create(
      {required MaterialInkController controller,
      required RenderBox referenceBox,
      required Offset position,
      required Color color,
      required TextDirection textDirection,
      bool containedInkWell = false,
      RectCallback? rectCallback,
      BorderRadius? borderRadius,
      ShapeBorder? customBorder,
      double? radius,
      VoidCallback? onRemoved}) {
    return CustomInkRipple(
      controller: controller,
      referenceBox: referenceBox,
      position: position,
      color: color,
      textDirection: textDirection,
      containedInkWell: containedInkWell,
      rectCallback: rectCallback,
      borderRadius: borderRadius,
      customBorder: customBorder,
      radius: radius ?? rippleRadius, // 使用传入的水波纹大小
    );
  }
}
