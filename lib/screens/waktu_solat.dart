import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waktu_solat/widgets/Screen.dart';

class JadualWaktuSolat extends ConsumerWidget {
  const JadualWaktuSolat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Screen(body: Text('lala'));
  }

  // @override
  // ConsumerState<ConsumerStatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }
}
