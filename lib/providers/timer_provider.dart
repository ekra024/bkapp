import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final questionTimerProvider = StateNotifierProvider<QuestionTimerNotifier, int>((ref) => QuestionTimerNotifier());


class QuestionTimerNotifier extends StateNotifier<int> {
Timer? _t;
int initial = 20;
QuestionTimerNotifier() : super(20);


void start([int seconds = 20]) {
_t?.cancel();
initial = seconds;
state = seconds;
_t = Timer.periodic(const Duration(seconds: 1), (timer) {
if (state <= 1) {
timer.cancel();
state = 0;
} else {
state = state - 1;
}
});
}


void stop() {
_t?.cancel();
}


void reset() {
_t?.cancel();
state = initial;
}
}