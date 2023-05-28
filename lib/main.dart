import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:inzzztagram_flutter/state/auth/backend/authenticator.dart';
import 'package:inzzztagram_flutter/state/auth/providers/auth_state_provider.dart';
import 'package:inzzztagram_flutter/state/auth/providers/is_logged_in_provider.dart';
import 'package:inzzztagram_flutter/state/providers/is_loading_provider.dart';
import 'package:inzzztagram_flutter/views/components/animations/data_not_found_animation.dart';
import 'package:inzzztagram_flutter/views/components/animations/empty_content_animation.dart';
import 'package:inzzztagram_flutter/views/components/animations/empty_contents_with_text.dart';
import 'package:inzzztagram_flutter/views/components/loading/loading_screen.dart';
import 'package:inzzztagram_flutter/views/login/login_view.dart';
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
          ref.listen<bool>( isLoadingProvider,
            (_, isLoading){
              if(isLoading){
                LoadingScreen.instance().show(
                  context: context,
                );
              }else{
                LoadingScreen.instance().hide();
              }
          });
          final isLoggedIn = ref.watch(isLoggedInProvider);
          if(isLoggedIn){
            return const MainView();
          }else{
            return const LoginView();
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
      body: Consumer(
          builder: (context, ref, child) {
            return TextButton(
              onPressed: () async {
                await ref.read(authStateProvider.notifier).logOut();
              },
              child: const Text("Log Out"),
              );
            },
          ),
      );
  }
}