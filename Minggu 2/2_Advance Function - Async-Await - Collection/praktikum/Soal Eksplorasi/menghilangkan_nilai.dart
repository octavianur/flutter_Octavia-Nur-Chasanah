void main() {
  List<String> nama = [
    "amuse", 
    "tommy",
    "kaira",
    "spoon",
    "litchfield",
    "amuse",
    "HKS",
  ];
  nama.removeRange(5, 6);
  print("Sample Output : $nama");

  List<String> namaLain = [
    "JS Racing", 
    "amuse",
    "spoon",
    "spoon",
    "JS Racing",
    "amuse",
  ];
  namaLain.removeRange(3, 5);
  print("Sample Output : $namaLain");
}