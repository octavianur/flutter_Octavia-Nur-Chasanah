# UI Testing
    Pengujian yang dilakukan pada tampilan suatu aplikasi untuk memastikan aplikasi dapat menerima interaksi dengan memberi respon kepada pengguna.

> UI Testing di Flutter
    Disebut juga dengan widget testing sehingga pengujian dilakukan pada widgets dengan menuliskan script yang dapat dijalankan secara otomatis.

> Keuntunga UI Testing 
    1. Memastikan seluruh widget memberi tampilan yang sesuai,
    2. Memastikan seluruh interaksi dapat diterima dengan baik
    3. Menjadi ketentuan yang harus diikuti saat diperlukan perubahan pada widget

> Melakukan UI Testing
    1. Install package testing pada pubspec.yaml
    2. Penulisan script Testing
       > Dilakukan pada folder test
       > Nama file harus diikuti _test.dart 
       > Tiap file berisi fungsi main() yang didalambya dapat dituliskan script testing
       > Tiap skenario pengujin disebut test case
    3. Script Testing 
        Test casee diawali denga testWidgets dan diberi judul

        testWidgets('Judul harus Contacts', (WidgetTester tester) async {
    
            await tester.pumpWidget(const MaterialApp(
            home: ContactScreen(),
            ));

            expect(find.text('Contacts'), findsOneWidget);
        });
    
    4. Menjalankan Testing 
        > Perintah flutter test akan menjalankan seluruh file test yang dibuat

        > Hasil dari perintah ini adalah lamanya waktu pengujian, total pengujian yang dilakukan dan pesan bahwa pengujian berhasil 

        > Jika testing gagal akan ditampilkan penyebab gagal pengujiannya. 

# Output Build Flutter
    Merupakan file/berkas keluaran dari project flutter. Digunakan untuk merilis aplikasi ke App Store. Terdiri dari format APK atau AAB untuk Android dan IPA untuk iOS. 

> Mode Build 
    1. Mode debug -> unruk pengujian selama proses development
    2. Mode profile -> untuk pengujian performa aplikasi
    3. Mode release -> Untuk merilis aplikasi ke Google Play Store dan Stores android lainnya. 

> Build APK 
    hanya dapat berjalan di Android, memiliki format .apk, dapat diinstall langsung pada perangkat Android

> Proses Sebelum Build APK 
    1. Mengatur nama aplikasi 
    2. Mengatur ikon aplikasi
    3. Mengatur perizinan aplikasi 

> Build IPA
    Hasil output hanya dapat berjalan di iOS, memiliki format .ipa, perlu mendaftarkan akun Apple Developer Program, perintah build hanya dapat dijalankan pada perangkat Apple

> Mengubah nama aplikasi menggunakan packages rename
    1. install rename
    2. jalankan perintah flutter pub global activate rename
    3. jalankan perintah flutter pub global run rename --appname "Nama Aplikasi"

> Mengubah icon aplikasi menggunakan packages flutter launcher icons
    1. install flutter_launcher_icons
    2. Buat folder assets
    3. pindahlan file ikon
    4. menambahkan flutter icons di pubspec.yaml 
        flutter_icons: 
            android : true
            ios : true
            image_path : "assets/app_logo.png"
    5. Jalankan flutter clean && flutter pub ger && flutter pub run flutter_launcher_icons:main
