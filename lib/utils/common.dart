import 'dart:async';
import 'dart:math';

class CommonUtil {
  static Function() debounce(
    Function func, [
    Duration delay = const Duration(milliseconds: 500),
  ]) {
    print(func);
    print(delay);
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
