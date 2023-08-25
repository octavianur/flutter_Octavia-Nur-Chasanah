import 'dart:io';

void main(List<String> args) {
  int a, b, c, d;
  for (var a = 1; a <= 8; a++) {
    for (var b = 7; b >= a; b--) {
      stdout.write(" ");
    }
    for (var c = 1; c <= a; c++) {
      stdout.write("*");
    }
    for (var d = 1; d <= a-1; d++) {
      stdout.write("*");
    }
    stdout.writeln();
  }
}