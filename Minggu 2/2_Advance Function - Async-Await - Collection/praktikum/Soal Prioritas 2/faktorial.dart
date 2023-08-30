import 'dart:async';

int faktorial(int n) {
  if (n == 0) {
    return 1;
  } else {
    return n * faktorial(n - 1);
  }
}

Future<void> main() async {
  try {
    final result = await hitungFaktorialAsync(5);
    print("faktorialnya adalah $result");
  } catch (e) {
    print("Error: $e");
  }
}

Future<int> hitungFaktorialAsync(int n) async {
  return await Future(() => faktorial(n));
}
