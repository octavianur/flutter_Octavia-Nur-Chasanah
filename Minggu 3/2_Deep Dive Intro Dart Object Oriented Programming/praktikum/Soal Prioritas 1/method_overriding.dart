class BangunRuang {
  double panjang;
  double lebar;
  double tinggi;

  BangunRuang(this.panjang, this.lebar, this.tinggi);

  double volume() {
    return 0;
  }
}

class Balok extends BangunRuang {
  Balok(double panjang, double lebar, double tinggi) : super(panjang, lebar, tinggi);

  @override
  double volume() {
    return panjang * lebar * tinggi;
  }
}

class Kubus extends BangunRuang {
  double sisi;

  Kubus(this.sisi) : super(sisi, sisi, sisi);

  @override
  double volume() {
    return sisi * sisi * sisi;
  }
}

void main() {
  BangunRuang bangun;

  Kubus kubus = Kubus(15);
  Balok balok = Balok(10, 11, 12);

  // Menggunakan metode overriding
  bangun = kubus;
  print("Volume Kubus Adalah: ${bangun.volume()}");

  bangun = balok;
  print("Volume Balok Adalah: ${bangun.volume()}");
}
