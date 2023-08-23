# 3_Fundametal Dart

1. Dart merupakan bahasa pemrograman yang dirancang untuk membuat aplikasi agr berjalan dengan cepat yang dikembangkan oleh google. Dart ini berjalan disisi client atau FE

2. Why Dart?
    - Type safe : menjamin konsisten tipe data
    - Null Safety : memberi keamanan dari data bernilai hampa (null)
    - Rich Standart Library : banyak dukungan library internal
    - Multiplatform : mampu berjalan di berbagai jenis perangkat

3. Program Dart Sederhana :
    - Fungsi Main : 
        > Harus ada 1 dalam satu projek
        > Bagian yang dijalankan pertama kali
        > Dapat memiliki type data void
        > memiliki nama main
    - Komentar : Baris kode yang tidak dijalankan dgn tujuan memberi catatan, mencegah perintah dijalankan 
        > "//" : untuk komentar 1 line
        > "///" : untuk komentar banyak line jika di enter akan tetap menjadi komentar
        > "/* ..... */" : komentar langsung banyak
    - Variabel : untuk menyimpan data, memiliki nama, memiliki tipe data
    - Konstanta : untuk menyimpan data, memiliki nama, tipe data, dan nilai tetap (tidak dapat dirubah)
    - Tipe Data : Jenis data yang dapat dikelola, Tipe data sederhana disebut primitive data type
        > Int : bilangan bulat 
        > Double : bilangan pecahan, penulisan menggunakan titik
        > bool : benar / salah
        > String : teks, penulisan diawali tanda ""
            -- Interpolasi : untuk memanggil variabel agar bisa menggabungkan V1 dan V2. Ex : 
            Print ("Halo nama saya $namaDepan $namaBelakang");

    - Operator : Untuk pengolaan data, data yang dikelola disebut dengan operand

