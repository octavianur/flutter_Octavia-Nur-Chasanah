class Calculator {
  //Penjumlahan
  double tambah(double a, double b){
    return a + b;
  }

  //Pengurangan
  double kurang(double a, double b){
    return a - b;
  }

  //Perkalian
  double kali(double a, double b){
    return a * b;
  }

  //Pembagian
  double bagi(double a, double b){
    if (b != 0) {
      return a / b;
    } else {
      throw ArgumentError("Hasilnya tak terhingga");
    }
  }
}

void main() {
  Calculator calculator = Calculator();

  double a = 12;
  double b = 15;

  print('Penjumlahan : ${calculator.tambah(a, b)}');
  print("Pengurangan: ${calculator.kurang(a, b)}");
  print("Perkalian : ${calculator.kali(a, b)}");

  try{
    print("Pembagian: ${calculator.bagi(a, b)}");
  }catch(e){
    print(e); //buat print error
  }
}