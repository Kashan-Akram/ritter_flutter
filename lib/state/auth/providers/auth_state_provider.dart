import 'package:hooks_riverpod/hooks_riverpod.dart' show StateNotifierProvider;
import 'package:inzzztagram_flutter/state/auth/models/auth_state.dart';
import 'package:inzzztagram_flutter/state/auth/notifiers/auth_state_notifier.dart';

final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>(
      (ref) => AuthStateNotifier(),
);