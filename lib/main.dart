import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:inzzztagram_flutter/state/auth/backend/authenticator.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello World!"),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () async {
                Authenticator().loginWithGoogle();
              },
              child: const Text("Sign in with google"),
          ),
          TextButton(
            onPressed: () async {
              Authenticator().loginWithFacebook();
            },
            child: const Text("Sign in with facebook"),
          ),
        ],
      ),
    );
  }
}