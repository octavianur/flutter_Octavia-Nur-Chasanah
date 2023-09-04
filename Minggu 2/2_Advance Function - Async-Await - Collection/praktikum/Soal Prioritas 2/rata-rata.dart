
void main() {
  List<int> masukan = [7,5,3,5,2,1];
  double rataRata = hitungRataRata(masukan);
  int pembulatan = rataRata.ceil(); // Melakukan pembulatan ke atas

  print("Nilai rata-rata (sebelum pembulatan) : $rataRata");
  print("Nilai rata-rata (setelah pembulatan) : $pembulatan");
}

double hitungRataRata(List<int> masukan) {
  if (masukan.isEmpty) {
    return 0;
  }

  int jumlah = masukan.reduce((a, b) => a + b); //.reduce untuk kombinasi
  return jumlah / masukan.length; //menghitung rata2
}
