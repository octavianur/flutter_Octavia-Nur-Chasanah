import 'dart:io';

void main() {
  int n = 6; 
  
  for (int a = 0; a < n; a++) {
    for (int b = 0; b < a; b++) {
      stdout.write(" ");
    }
    for (int c = 0; c < 2 * (n - a) - 1; c++) {
      stdout.write("0");
    }
    print("");
  }
  for (int a = 1; a < n; a++) {
    for (int b = 0; b < n - a - 1; b++) {
      stdout.write(" ");
    }
    for (int c = 0; c < 2 * a + 1; c++) {
      stdout.write("0");
    }
    print("");
  }
}
