class Kursus {
  String judul;
  String deskripsi;

  Kursus(this.judul, this.deskripsi);
}

class Student {
  String nama;
  String kelas;
  List<Kursus> kursus = [];

  Student(this.nama, this.kelas);

   void listKursus() {
    if (kursus.isEmpty) {
      print("$nama belum mengambil kursus apapun.");
    } else {
      print("Kursus yang diambil oleh $nama :");
      for (var Kursus in kursus) {
        print("Kursus: ${Kursus.judul},\nDeskripsi: ${Kursus.deskripsi}\n");
      }
    }
  }

  void tambahKursus(Kursus Kursus) {
    kursus.add(Kursus);
  }

  void hapusKursus(Kursus Kursus) {
    kursus.remove(Kursus);
  }

 
}

void main() {
  // Membuat objek kursus
  var komputer = Kursus("Komputer", "Intro Pemahaman Dart");
  var matematika = Kursus("Matematika", "Aritmatika");

  // Membuat objek mahasiswa
  var octavia = Student("Octavia Nur ", "Class A");
  var riakus = Student("Ria Kusmara", "Class B");

  // Menambahkan kursus ke mahasiswa
  octavia.tambahKursus(komputer);
  octavia.tambahKursus(matematika);
  riakus.tambahKursus(matematika);

  // Melihat daftar kursus yang dimiliki oleh mahasiswa
  octavia.listKursus();
  riakus.listKursus();

  // Menghapus kursus dari mahasiswa
  octavia.hapusKursus(matematika);


  // Melihat daftar kursus yang dimiliki oleh mahasiswa setelah penghapusan
  print("-------------Setelah dihapus-----------------");
  octavia.listKursus();
}
