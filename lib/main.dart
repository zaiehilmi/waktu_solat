import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waktu_solat/utils/navigation/router.dart';

void main() {
  runApp(const ProviderScope(child: WaktuSolat()));
}

class WaktuSolat extends ConsumerWidget {
  const WaktuSolat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: penghala,
        debugShowCheckedModeBanner: true,
      );
}
