import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waktu_solat/screens/laman_utama.dart';

void main() {
  runApp(const ProviderScope(child: WaktuSolat()));
}

class WaktuSolat extends ConsumerWidget {
  const WaktuSolat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LamanUtama(),
        debugShowCheckedModeBanner: false,
      );
}
