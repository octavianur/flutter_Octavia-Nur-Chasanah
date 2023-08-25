void main() {
  int rows = 10; // ini untuk yang mendatar/baris
  int columns = 10; // ini untuk kebawah/kolom

  for (int i = 1; i <= rows; i++) {
    List<String> row = []; //List<String> row adalah list yang mewakili baris di tabel perkalian.
    for (int j = 1; j <= columns; j++) {
      int result = i * j;
      // Menambahkan hasil perkalian ke row
      row.add(result.toString().padLeft(3)); //.padLeft(3) digunakan untuk mengatur panjang string result menjadi 3 karakter.
    }
    // menggabungkan semua elemen dalam list row
    print(row.join(' '));
  }
}

