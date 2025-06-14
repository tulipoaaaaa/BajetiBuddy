import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';

// TODO: implement actual services
class AuthService {}
class BudgetService {}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO: Use environment configs for dev/prod Firebase initialization
  await Firebase.initializeApp();

  // TODO: Integrate Sentry or Crashlytics

  runApp(const BajetiBuddyApp());
}

class BajetiBuddyApp extends StatelessWidget {
  const BajetiBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        Provider<BudgetService>(create: (_) => BudgetService()),
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: AppConstants.debugMode,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const HomePage(),
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    // TODO: Configure deep linking for M-Pesa callbacks
    return null;
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('BajetiBuddy up and running 🎉'),
      ),
    );
  }
}
