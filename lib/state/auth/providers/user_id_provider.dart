import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inzzztagram_flutter/state/auth/providers/auth_state_provider.dart';
import 'package:inzzztagram_flutter/state/posts/typedefs/user_id.dart';

final userIDprovider = Provider<UserId?>(
      (ref) => ref.watch(authStateProvider).userId,
);