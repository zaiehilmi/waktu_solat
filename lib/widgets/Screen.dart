import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Screen extends ConsumerWidget {
  final Widget body;

  const Screen({super.key, required this.body});

  @override
  Widget build(BuildContext context, WidgetRef ref) => CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemBackground,
        child: SafeArea(
          child: body,
        ),
      );
}
