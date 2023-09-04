# Deep Dive Into Dart Object Oriented Programming

Constructor 
    > Method yang dijalankan saat membuat object
    > Dapat menerima parameter
    > tidak memiliki return
    > Nama sama dengan class

    penulisannya :
        class Hewan{
            var mata;
            var kaki;

            Hewan(){
                mata = 0;
                kaki = 0;
            }
        }

Inheritance
    > Membuat class baru dengan memanfaatkan class yang sudah ada
    > Bertujuan agar kemampuan class yang sudah ada dapat dimiliki oleh class baru
    > menambahkan extends

    penulisannya: 
        class Kambing extends Hewan{
            Kambing(){
                mata = 2;
                kaki = 4;
            }
        }

Method Overriding
    > Menulis ulang method yang ada pada super class
    > Bertujuan agar class memiliki method yang sama, dengan proses yang berbeda.
    > method sudah ada pada class induk
    > menambahkan @override sebelum method dibuat

    Penulisannya: 
        class Hewan{
            reproduksi(){
                print('tidak diketahui);
            }
        }

        class Kambing extends Hewan{
            @override
            reproduksi(){
                print('melahirkan');
            }
        }


Interface
    > Berupa class
    > menunjukkan method apa saja yang ada pada suatu classs
    > Seluruh method wajib override
    > Digunakan dengan menggunakan implements

    Penulisannya :
        class Hewan{
            reproduksi(){
                print('tidak diketahui);
            }
        }

        class Kambing implements Hewan{
            @override
            reproduksi(){
                print('melahirkan');
            }
        }

Abstract Class
    > Berupa class abstract
    > Menunjukkan method apa saja yang ada pada suatu class
    > menggunakan extends
    > Tidak dapat dibuat object
    > Tidak semua method harus override

    Penulisannya :
        abstract class Hewan{
            reproduksi(){
                print('tidak diketahui);
            }
        }

        class Kambing extends Hewan{
            @override
            reproduksi(){
                print('melahirkan');
            }
        }

Polymorphihsm
    > Kemampuan data berubah menjadi bentuk lain
    > Tipe data yang dapat digunakan adalah super class
    > Dapat dilakukan pada class dengan extends atau implements

    penulisannya:
        void main(){
            Hewan k1 = Kambing();
            k1.reproduksi();
        }

Generics
    > Dapat digunakan pada class atau fungsi
    > Memberikan kemampuan agar dapat menerima dengan tipe yang berbeda
    > Tipe data yang diinginkan, ditentukan saat membuat class atau menjalankan fungsi 
    
    penulisannya:
        class Hadiah<T>{
            var isi;

            Hadiah(T i){
                isi = i
            }
        }

        penggunaan :
        void main(){
            var h1 = Hadiah<String>('mobil');
            print(h1.isi);

            var h2 = Hadiah<int>(10);
            print(h2.isi);
        }

Enkapsulasi
    > Ini mempromosikan penyembunyian data
    > Peningkatan integritas data
    > Memungkinkan perubahan pada satu bagian kode tanpa memengaruhi bagian lain.
    > mengurangi kompleksitas dan potensi bug dalam kode.

    GETTER DAN SETTER
        > Metode yang memungkinkan akses terkontrol ke variabel privat
        > Memungkinkan enkapsulasi dengan menyediakan cara untuk membaca dan memodifikasi data privat, memastikan validasi atau perhitungan saat diperlukan. 