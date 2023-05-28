
import 'package:inzzztagram_flutter/views/components/animations/lottie_animation.dart';
import 'package:inzzztagram_flutter/views/components/animations/models/lottie_animations.dart';

class EmptyContentsAnimationView extends LottieAnimationView {
  const EmptyContentsAnimationView({super.key})
      : super(
    animation: LottieAnimation.empty,
  );
}