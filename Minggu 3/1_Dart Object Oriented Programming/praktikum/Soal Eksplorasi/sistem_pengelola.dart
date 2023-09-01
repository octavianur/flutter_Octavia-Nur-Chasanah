class Buku {
  int id;
  String judul;
  String penerbit;
  double harga;
  String kategori;

  Buku(this.id, this.judul, this.penerbit, this.harga, this.kategori);

}

class TokoBuku {
  List<Buku> daftarBuku = [];
  // Method untuk menambahkan buku ke dalam daftar
  void tambahBuku(int id, String judul, String penerbit, double harga, String kategori) {
    Buku buku = Buku(id, judul, penerbit, harga, kategori);
    daftarBuku.add(buku);
    print('Buku dengan ID $id ditambahkan.');
  }

  // Method untuk mendapatkan semua data buku
  List<Buku> semuaBuku() {
    return daftarBuku;
  }

  // Method untuk menghapus buku berdasarkan ID
  void hapusBukuById(int id) {
    try {
      var buku = daftarBuku.firstWhere((buku) => buku.id == id);
      daftarBuku.remove(buku);
      print('Buku dengan ID $id telah dihapus.');
    } catch (e) {
      print('Error: Buku dengan ID $id tidak ditemukan.');
    }
  }
}

void main() {
  TokoBuku toko = TokoBuku();

  // Menambahkan beberapa buku
  toko.tambahBuku(1, 'Judul Buku 1', 'Penerbit A', 29.99, 'Fiksi');
  toko.tambahBuku(2, 'Judul Buku 2', 'Penerbit B', 19.99, 'Non-Fiksi');
  toko.tambahBuku(3, 'Judul Buku 3', 'Penerbit A', 24.99, 'Fiksi');

  // Mendapatkan semua data buku
  List<Buku> semuaBuku = toko.semuaBuku();
  print('Data Semua Buku:');
  for (var buku in semuaBuku) {
    print('ID: ${buku.id}, Judul: ${buku.judul}, Penerbit: ${buku.penerbit}, Harga: ${buku.harga}, Kategori: ${buku.kategori}');
  }

  // Menghapus buku berdasarkan ID
  toko.hapusBukuById(2);
  toko.hapusBukuById(4); // Ini akan memicu error karena ID 4 tidak ada.

  // Mendapatkan semua data buku setelah penghapusan
  semuaBuku = toko.semuaBuku();
  print('\nData Semua Buku Setelah Penghapusan:');
  for (var buku in semuaBuku) {
    print('ID: ${buku.id}, Judul: ${buku.judul}, Penerbit: ${buku.penerbit}, Harga: ${buku.harga}, Kategori: ${buku.kategori}');
  }
}
