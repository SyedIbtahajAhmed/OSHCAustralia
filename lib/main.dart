import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:oshcaustralia/Constants/AppConstants.dart';
import 'package:oshcaustralia/DataLayer/Providers/breadCrumbsProvider.dart';
import 'package:oshcaustralia/DataLayer/Providers/dataProvider.dart';
import 'package:oshcaustralia/Screens/home.dart';
import 'package:oshcaustralia/UserControls/RouteGenerator.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUrlStrategy(PathUrlStrategy());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
        ChangeNotifierProvider(create: (_) => BreadCrumbsProvider()),
      ],
      child: const OSHCAustralia(),
    ),
  );
}

class OSHCAustralia extends StatelessWidget {
  const OSHCAustralia({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OSHC Australia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:
            MaterialColor(0xFF4396c0, AppConstants.appThemeBlueColorCodes),
      ),
      initialRoute: '/home',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const Home(),
      localizationsDelegates: const [
        MonthYearPickerLocalizations.delegate,
      ],
    );
  }
}
