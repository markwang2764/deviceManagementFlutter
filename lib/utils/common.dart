import 'dart:async';

class commonUtil {
  static void Function() debounce(
    Function func, [
    Duration delay = const Duration(milliseconds: 500),
  ]) {
    Timer? timer;
    void Function() target = () {
      timer?.cancel();
      timer = Timer(delay, () {
        func.call();
      });
    };
    return target;
  }
}
