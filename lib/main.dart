import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inzzztagram_flutter/state/auth/backend/authenticator.dart';
import 'package:inzzztagram_flutter/state/auth/providers/is_logged_in_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: App()));
}
class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        indicatorColor: Colors.blueGrey,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
       ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: Consumer(
        builder: (context, ref, child){
          final isLoggedIn = ref.watch(isLoggedInProvider);
          if(isLoggedIn){
            return const MainView();
          }else{
            return const MainView();
          }
        },
      ),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Main View"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () { },
            child: const Text("AFTER LOG IN"),
          ),
        ],
      ),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login View"),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () async {
                const Authenticator().loginWithGoogle();
              },
              child: const Text("Sign in with google"),
          ),
          TextButton(
            onPressed: () async {
              const Authenticator().loginWithFacebook();
            },
            child: const Text("Sign in with facebook"),
          ),
        ],
      ),
    );
  }
}