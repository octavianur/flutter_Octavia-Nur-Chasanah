double hitungLuasLingkaran(double r) {
  double phi = 3.14;
  double luas = phi * r * r;
  
  return luas;
}

void main() {
  double r = 15;
  double luasLingkaran = hitungLuasLingkaran(r);
  
  print('jika panjang jari - jari $r,\nmaka luas lingkaran : $luasLingkaran');
}
