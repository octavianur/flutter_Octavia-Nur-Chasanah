class Mobil {
  int kapasitas;
  List<String> muatan = [];

  Mobil(this.kapasitas);

  void tambahMuatan(String hewan) {
    if (muatan.length < kapasitas) {
      muatan.add(hewan);
      print('$hewan berhasil ditambahkan ke dalam muatan.');
    } else {
      print('Kapasitas muatan sudah penuh.');
    }
  }

  int totalMuatan() {
    return muatan.length;
  }
}

void main() {
  Mobil mobil = Mobil(3); // Mengatur kapasitas maksimum menjadi 5

  mobil.tambahMuatan('Kambing');
  mobil.tambahMuatan('Ayam');
  mobil.tambahMuatan('Sapi');
  mobil.tambahMuatan('Anjing');
  mobil.tambahMuatan('Kucing');
  mobil.tambahMuatan('Musang');

  print('Total muatan: ${mobil.totalMuatan()}');
}
