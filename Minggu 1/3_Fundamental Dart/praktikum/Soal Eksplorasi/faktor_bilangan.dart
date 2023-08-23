void faktorPembagi(int angka) {
  print("Sampel Input pembagi dari $angka:\nSampel Output:");
  for (int faktor = 1; faktor <= angka; faktor++) {
    if (angka % faktor == 0) {
      print(faktor);
    }
  }
}
void main() {
  int angka = 24; // Ganti dengan angka yang ingin Anda cari faktor pembaginya
  faktorPembagi(angka);
}
