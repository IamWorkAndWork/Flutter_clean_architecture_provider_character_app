import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_provider_character/layers/presentation/home_page.dart';
import 'package:flutter_clean_architecture_provider_character/layers/presentation/home_page_provider.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:provider/provider.dart';
import './layers/di/injection_container.dart' as di;

void main() async {
  if (kDebugMode) Stetho.initialize();

  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageProvider>(
          create: (context) {
            return di.sl<HomePageProvider>();
          },
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
