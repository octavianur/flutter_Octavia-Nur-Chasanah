Map<dynamic, int> menghitungFrekuensi(List<dynamic> list) {
  // Map untuk menyimpan frekuensi
  Map<dynamic, int> frekuensi = {};

  for (var input in list) {
    // Jika elemen sudah ada dalam map frekuensi, tambahkan 1 ke nilai frekuensinya
    if (frekuensi.containsKey(input)) {
      frekuensi[input] = (frekuensi[input]! + 1);
    } 
    // Jika elemen belum ada dalam map frekuensi, tambahkan elemen baru dengan frekuensi 1
    else {
      frekuensi[input] = 1;
    }
  }

  return frekuensi;
}

void main() {

  List<dynamic> list = ["js","js","js","golang","python","js","js","golang","rust"];
  Map<dynamic, int> hasil = menghitungFrekuensi(list);

  print("Sample Output = ");
  hasil.forEach((input, frekuensi) {
    print('$input: $frekuensi kali');
  });
}
