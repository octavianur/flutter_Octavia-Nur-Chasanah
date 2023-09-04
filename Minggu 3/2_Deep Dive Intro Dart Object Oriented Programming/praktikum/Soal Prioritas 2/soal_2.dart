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


  FaktorPersekutuanTerbesar operation1 = FaktorPersekutuanTerbesar(20, 10);
  print("Faktor Persekutuan Terbesar (FPB) adalah: ${operation1.hasil()}");

  KelipatanPersekutuanTerkecil operation2 = KelipatanPersekutuanTerkecil(20, 10);
    print("Faktor Persekutuan Terbesar (FPB) adalah: ${operation2.hasil()}");


  
}
