import 'package:desafio1/src/modules/history/page/history_page.dart';
import 'package:desafio1/src/modules/home/page/home_page.dart';
import 'package:desafio1/src/modules/initial/page/initial_page.dart';
import 'package:desafio1/src/routes/app_router.dart';
import 'package:desafio1/src/shared/storage/hive_config.dart';
import 'package:flutter/material.dart';
//import 'package:search_cep/search_cep.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HiveConfig.initHiveDatabase();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Location',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const InitialPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRouter.home: (context) => const HomePage(),
        AppRouter.history: (context) => const HistoryPage(),
      },
    );
  }
}