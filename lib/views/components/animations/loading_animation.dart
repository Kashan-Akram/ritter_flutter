
import 'package:inzzztagram_flutter/views/components/animations/lottie_animation.dart';
import 'package:inzzztagram_flutter/views/components/animations/models/lottie_animations.dart';

class LoadingAnimationView extends LottieAnimationView {
  const LoadingAnimationView({super.key})
      : super(
    animation: LottieAnimation.loading,
  );
}