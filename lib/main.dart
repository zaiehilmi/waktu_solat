import 'package:flutter/material.dart';
import 'package:waktu_solat/services/api/esolat_api.dart';
import 'package:waktu_solat/services/api/kiblat_api.dart';
import 'package:waktu_solat/services/api/nominatim_api.dart';
import 'package:waktu_solat/utils/constant/eSolat.dart';
import 'package:waktu_solat/utils/interface/koordinat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    Koordinat koordinat = Koordinat(
      latitud: 3.11226,
      longitud: 101.71629,
    );

    // await getNamaBandar(koordinat);
    // await getArahKiblat(koordinat);
    await getWaktuSolatHariIni(
      tempohJadual: TempohJadual.week,
      zonWaktuSolat: ZonWaktuSolat.JHR02,
    );

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
