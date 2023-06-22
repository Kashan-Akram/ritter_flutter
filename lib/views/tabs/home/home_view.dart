import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inzzztagram_flutter/state/posts/providers/all_posts_provider.dart';
import 'package:inzzztagram_flutter/views/components/animations/empty_contents_with_text.dart';
import 'package:inzzztagram_flutter/views/components/animations/error_animation.dart';
import 'package:inzzztagram_flutter/views/components/animations/loading_animation.dart';
import 'package:inzzztagram_flutter/views/components/post/posts_grid_view.dart';
import 'package:inzzztagram_flutter/views/constants/strings.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(allPostsProvider);
    return RefreshIndicator(
      onRefresh: () {
        ref.refresh(allPostsProvider);
        return Future.delayed(
          const Duration(
            seconds: 1,
          ),
        );
      },
      child: posts.when(
        data: (posts) {
          if (posts.isEmpty) {
            return const EmptyContentsWithTextAnimationView(
              text: Strings.noPostsAvailable,
            );
          } else {
            return PostsGridView(
              posts: posts,
            );
          }
        },
        error: (error, stackTrace) {
          return const ErrorAnimationView();
        },
        loading: () {
          return const LoadingAnimationView();
        },
      ),
    );
  }
}