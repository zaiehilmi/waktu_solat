import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Screen extends ConsumerWidget {
  final Widget body;

  const Screen({super.key, required this.body});

  @override
  Widget build(BuildContext context, WidgetRef ref) => CupertinoPageScaffold(
        backgroundColor: ThemeData.dark(useMaterial3: true).primaryColor,
        child: SafeArea(
          child: body,
        ),
      );
}
