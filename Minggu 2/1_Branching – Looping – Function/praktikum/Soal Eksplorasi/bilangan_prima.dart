bool isPrima(int angka) {
  if (angka <= 1) {
    return false; //karena 1 bukan bilangan prima
  } 
  if (angka == 2) {
    return true; // karena 2 merupakan bilangan prima
  }
  if (angka % 2 == 0) {
    return false; // bilangan genap selain 2 maka salah
  }
  for (int i = 3; i <= (angka / 2).floor(); i += 2) {
    if (angka % i == 0) {
      return false; // Jika dapat dibagi, bukan bilangan prima
    }
  } 
  return true; // Jika tidak ada pembagi selain 1 dan dirinya sendiri
}
void main() {
  int angka = 20; 
  
  if (isPrima(angka)) {
    print('angka $angka merupakan bilangan prima');
  } else {
    print('angka $angka merupakan bukan bilangan prima');
  }
}
