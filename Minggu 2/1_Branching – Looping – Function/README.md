# 4_Branching, Looping, Function

1. Branching (Pengambilan Keputusan)
    menentukan alur program pada kondisi tertentu

    - IF
        > Memerlukan nilai bool (dari operator logical / comparassion)
        > Menjalankan bagian proses jika nilai bool bernilai true

        Dituliskan dengan : 
            if(niali_bool){
                //jika nilai bool true
            }
    - IF - ELSE
        > Berjalan dengan IF
        > Menambah alternatif jika nilai bool false

        Dituliskan dengan :
            if(nilai_bool){
                //proses true
            } else{
                //proses false
            }
    - Sisipan IF -ELSE
        > Berjalan dengan if
        > Menambah alternatif jika nilai bool false
        > Menambah pengujian nilai bool lain

        Dituliskan dengan :
            if(nilai_bool){
                //proses true
            } else if(nilai_bool_1){
                //jika nilai_bool salah
                //dan nilai_bool_1 benar            
            }
2. Perulangan (Looping)
    Menjalankan proses berulang kali

    - FOR
        > Diketahui berapa kali perulangan terjadi
        > Memerlukan nilai awal
        > Memerlukan nilai bool, jika true, maka perulangan dilanjutkan
        > Memerlukan pengubah nilai

        Dituliskan dengan :
            for (var i = 0; i < count; i++) {
                print(i);
             }

    - WHILE
        > Tidak diketahui berapa kali perulangan terjadi
        > Memerlukan nilai bool, jika true maka perulangan dilanjutkan 

        Dituliskan dengan : 
        while (condition) {

        }
    
    - DO WHILE
        > Mengubah bentuk while
        > Proses dijalankan minimum sekali, akan diteruskan jika nilai bool adalah true.

        Dituliskan dengan :
        do {

        } while (condition);
    
    - BREAK AND CONTINUE
        Cara lain menghentikan perulangan

        > BREAK : menghentikan seluruh proses perulangan
        > CONTINUE : menghentikan satu kali peroses perulangan
    
3. FUNCTION 
    Kumpulan kode yang dapat ditulis ulang
        > Kumpulan perintah
        > Dapat digunakan berkali - kali
        > Cukup mengubah fungsi sekali, penggunaann lainnya akan ikut berubah

        - Membuat Fungsi : 
            tipe_data nama_fungsi(){

            }
        - Memanggil Fungsi :
            nama_fungsi();
        - Fungsi Dengan Return (memberi nilai pada fungsi saat dipanggil):
            tipe_data nama_fungsi(tipe_data nama_parameter){
                //perintah

                return nilai;
            }
    
