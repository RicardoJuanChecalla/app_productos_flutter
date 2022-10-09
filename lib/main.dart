import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:products_app/pages/pages.dart';
import 'package:products_app/services/services.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsService()),
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: ((_) => const LoginScreen()),
        RegisterScreen.routeName: ((_) => const RegisterScreen()),
        HomeScreen.routeName: ((_) => const HomeScreen()),
        ProductScreen.routeName: ((_) => const ProductScreen()),
        CheckAuthScreen.routeName: ((_) => const CheckAuthScreen()),
      },
      scaffoldMessengerKey: NotificationsService.messengerState,
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
          appBarTheme: const AppBarTheme(elevation: 0, color: Colors.indigo),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.indigo, elevation: 0)),
    );
  }
}
