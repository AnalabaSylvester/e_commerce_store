import 'package:amzone/common/widgets/bottom_bar.dart';
import 'package:amzone/constants/global_variables.dart';
import 'package:amzone/features/auth/screens/authscreen.dart';
import 'package:amzone/features/auth/services/auth_service.dart';
import 'package:amzone/provider/user_provider.dart';
import 'package:amzone/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authServices = AuthService();

  @override
  void initState() {
    super.initState();
    authServices.getUserData(context as BuildContext);
  }

  // This widget is the root of your applicatiion.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: GlobalVariables.secondaryColor));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce flutter',
      theme: ThemeData(
        colorScheme:
            const ColorScheme.light(primary: GlobalVariables.secondaryColor),
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const BottomBar()
          : const AuthScreen(),
    );
  }
}
