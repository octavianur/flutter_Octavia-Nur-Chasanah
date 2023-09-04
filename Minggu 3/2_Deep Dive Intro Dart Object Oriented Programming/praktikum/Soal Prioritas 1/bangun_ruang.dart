class bangunRuang {
  double panjang;
  double lebar;
  double tinggi;

  bangunRuang(this.panjang, this.lebar, this.tinggi);

  double volume() {
    return 0;
  }
}

class Balok extends bangunRuang {
  Balok(double panjang, double lebar, double tinggi) : super(panjang, lebar, tinggi);

  @override
  double volume() {
    return panjang * lebar * tinggi;
  }
}

class Kubus extends bangunRuang {
  double sisi;

  Kubus(this.sisi) : super(sisi, sisi, sisi);

  @override
  double volume() {
    return sisi * sisi * sisi;
  }
}

void main() {
  Kubus kubus = Kubus(15);
  print("Volume Kubus adalalh: ${kubus.volume()}");

  Balok balok = Balok(10, 11, 12);
  print("Volume Balok adalah: ${balok.volume()}");
}
