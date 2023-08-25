void faktorPembagi(int angka) {
  print("Sampel Input pembagi dari $angka\nSampel Output:");
  for (int faktor = 1; faktor <= angka; faktor++) {
    if (angka % faktor == 0) {
      print(faktor);
    }
  }
}
void main() {
  // int angka = 10; 
  // int angka = 40; 
  int angka = 50; 
  faktorPembagi(angka);

  
}
