import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inzzztagram_flutter/state/auth/providers/auth_state_provider.dart';
import 'package:inzzztagram_flutter/state/image_upload/providers/image_upload_provider.dart';

final isLoadingProvider = Provider<bool>((ref){
  final authState = ref.watch(authStateProvider);
  final isUploadingImage = ref.watch(imageUploaderProvider);
  return authState.isLoading || isUploadingImage;
});