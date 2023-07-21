import 'package:flutter/widgets.dart';

class DeviceDimension {
  BuildContext context;

  DeviceDimension(this.context);

  double get width => MediaQuery.sizeOf(context).width;
  double get height => MediaQuery.sizeOf(context).height;
}
