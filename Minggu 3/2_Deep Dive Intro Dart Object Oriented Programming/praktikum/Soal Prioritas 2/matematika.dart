abstract class Matematika {
  double hasil();
}

class FaktorPersekutuanTerbesar implements Matematika {
  double x;
  double y;

  FaktorPersekutuanTerbesar(this.x, this.y);

  @override
  double hasil() {
    double a = x;
    double b = y;
    while (b != 0) {
      final double temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }
}

class KelipatanPersekutuanTerkecil implements Matematika {
  double x;
  double y;

  KelipatanPersekutuanTerkecil(this.x, this.y);

  @override
  double hasil() {
    // Menggunakan rumus: KPK = (x * y) / FPB(x, y)
    double fpb = FaktorPersekutuanTerbesar(x, y).hasil();
    double kpk = (x * y) / fpb;
    return kpk;
  }
}

void main() {
  double x = 20;
  double y = 10;

  // Menghitung FPB
  FaktorPersekutuanTerbesar FPB = FaktorPersekutuanTerbesar(x, y);
  double fpb = FPB.hasil();
  print("Faktor Persekutuan Terbesar (FPB) dari $x dan $y adalah: $fpb");

  // Menghitung KPK
  KelipatanPersekutuanTerkecil KPK = KelipatanPersekutuanTerkecil(x, y);
  double kpk = KPK.hasil();
  print("Kelipatan Persekutuan Terkecil (KPK) dari $x dan $y adalah: $kpk");
}
