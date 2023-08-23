void main() {
  String kata = "kasur rusak";
  String hasil = "";
  String value = kata;
  for (var i = kata.length - 1; i >= 0; i--) {
    hasil = hasil + kata[i];    
  }
  if (value == hasil) {
    print("Sampel Input : $value\nSampel Output : $hasil\nis Palindrome");
  }else{
     print("Sampel Input : $value\nSampel Output : $hasil\nis not Palindrome");
  }
}