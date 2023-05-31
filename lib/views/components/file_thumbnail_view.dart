import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inzzztagram_flutter/state/image_upload/models/thumbnail_request.dart';
import 'package:inzzztagram_flutter/state/image_upload/providers/thumbnail_provider.dart';
import 'package:inzzztagram_flutter/views/components/animations/loading_animation.dart';
import 'package:inzzztagram_flutter/views/components/animations/small_error_animation.dart';

class FileThumbnailView extends ConsumerWidget {
  final ThumbnailRequest thumbnailRequest;
  const FileThumbnailView({
    super.key,
    required this.thumbnailRequest,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbnail = ref.watch(
      thumbnailProvider(
        thumbnailRequest,
      ),
    );
    return thumbnail.when(
      data: (imageWithAspectRatio) {
        return AspectRatio(
          aspectRatio: imageWithAspectRatio.aspectRatio,
          child: imageWithAspectRatio.image,
        );
      },
      loading: () {
        return const LoadingAnimationView();
      },
      error: (error, stackTrace) {
        return const SmallErrorAnimationView();
      },
    );
  }
}