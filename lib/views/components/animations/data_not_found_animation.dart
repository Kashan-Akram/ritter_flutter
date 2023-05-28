import 'package:inzzztagram_flutter/views/components/animations/lottie_animation.dart';
import 'package:inzzztagram_flutter/views/components/animations/models/lottie_animations.dart';

class DataNotFoundAnimationView extends LottieAnimationView {
  const DataNotFoundAnimationView({super.key})
      : super(
    animation: LottieAnimation.dataNotFound,
  );
}