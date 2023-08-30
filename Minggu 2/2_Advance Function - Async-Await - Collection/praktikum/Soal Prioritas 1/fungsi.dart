Future<List<int>> listPengali(List<int> data, int pengali) async {
  //list baru
  List<int> hasil = [];

  await Future.forEach(data, (int item) async {
    int hasilPerkalian = item * pengali;

    // Menambahkan hasil perhitungan ke dalam list hasil
    hasil.add(hasilPerkalian);
  });
  return hasil;
}

void main() async {
  List<int> data = [10];
  int pengali = 2;
  List<int> hasilPerkalian = await listPengali(data, pengali);
  print('Hasil Perkalian: $hasilPerkalian');
}
