void main() {
  //membuat list dan sub elemen
  List<List<String>> namaDepan = [
    ["Octa", "Via"],
    ["Rara", "Rosa"],
    ["Adelia", "Fitri"],
  ];

  //membuat map dari list
  Map<String, List<String>> mapFromList = {};
  for (var subElemen in namaDepan) {
    if (subElemen.length == 2) {
      mapFromList[subElemen[1]] = subElemen; //indeks terakhir sebagai kunci
    }
  }

  // Menampilkan map
  mapFromList.forEach((key, value) {
    print("$key: $value");
  });
}