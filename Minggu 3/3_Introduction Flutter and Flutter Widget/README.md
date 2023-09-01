# Introduction Flutter and Flutter Widget

FLUTTER

Flutter merupakan framework yang digunakan untuk membuat aplikasi mobile, desktop, dan web

Keunggulan Flutter :
    1. Mudah digunakan dan dipelajari
    2. Produktivitas tinggi
    3. Dokumentasi lengkap
    4. Komunitas yang berkembang

Bagian dari Flutter :
    - SDK (Software Development Kit) -> alat - alat untuk membantu proses pengemmbangan aplikasi
    - Framework -> Perlengkapan untuk membantuk aplikasi yang dapat dikustomisasi

Membuat Project : flutter create  <nama_project>

Menjalankan Project : flutter run

Struktur Direktori :
    1. Direktori platform :
        - android
        - ios 
        - web
    2. Direktori project :
        - lib -> ruang kerja utama
        - test -> aktivitas pengujian
    
WIDGET 
    - digunakan unruk membentuk antarmuka
    - berupa class
    - dapat terdiri dari beberapa widget lainnya

    JENIS WIDGET :
    1. Stateless 
        - tidak bergantung pada perubahan data
        - hanya fokus pada tampilan
        - Dibuat dengan extends pada class StatelessWidget

        *membuat statelessWidget cukup ketik stle*

    2. Stateful
        - Mementingkan pada perubahan data
        - Dibuat dengan extends pada class statefulWidget
        - 1 Widget merupakan 2 class (widget dan state)

        *membuat statefulWidget cukup ketikkan stfl*

BUILD IN WIDGET
    - Widget yang dapat langsung digunakan
    - Sudah ter-install bersama Flutter
    Contohnya :
        1. MaterialApp
        2. Scaffold (membentuk halaman)
        3. AppBar (membentuk application bar yang terletak pada bagian atas halaman)
        4. Text (menampilkan text)
