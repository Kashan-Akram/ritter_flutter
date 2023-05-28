import 'package:inzzztagram_flutter/views/components/animations/lottie_animation.dart';
import 'package:inzzztagram_flutter/views/components/animations/models/lottie_animations.dart';

class ErrorAnimationView extends LottieAnimationView {
  const ErrorAnimationView({super.key})
      : super(
    animation: LottieAnimation.error,
    reverse: true,
  );
}