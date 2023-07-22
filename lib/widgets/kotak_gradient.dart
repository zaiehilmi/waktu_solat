import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waktu_solat/theme/color.dart';
import 'package:waktu_solat/theme/dimension.dart';
import 'package:waktu_solat/theme/spacing.dart';

class KotakGradient extends ConsumerWidget {
  double? width;
  double? height;
  double? margin;
  Function()? onTap;
  Widget? child;

  KotakGradient({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dimension = DeviceDimension(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? dimension.width / 1.3,
        height: height ?? dimension.height / 3.5,
        margin: EdgeInsets.all(margin ?? Spacing.xxl),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(CustomColors.bighead.color_1),
              Color(CustomColors.bighead.color_2),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0xff4b134f),
              spreadRadius: 0,
              blurRadius: 25,
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: (child),
      ),
    );
  }
}
