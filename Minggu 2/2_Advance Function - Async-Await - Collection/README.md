# Advance Function - Async - Await - Collection

1. Anonymous Function --- (){}
    yaitu fungsi yang tidak memiliki nama dan dapat menjadi data

ditulis dengan :
    var hello (){
        print ('hello);
    }
    var jumlah = (int a, int b){
        return a + b;    
    };

    void main(){
        //cara memanggil
        hello();
        print (jumlah(1,3));
    }

2. Arrow Function --- ()=>
    Dapat memiliki nama atau tidak, berisi 1 data (dari proses maupun statis), nilai return fungsi ini diambil dari data tersebut

ditulis dengan :
    var hello = () => print ('hello');

    void main (){
        hello();
    }

3. Async - Await
    Menjalankan beberapa proses tanpa menunggu, ditulis dalam bentuk fungsi, await akan menunggu hingga proses async selesai.

ditulis dengan :
    Future<void> P1 ()async {
        await Fuute.delayed(Duration(seconds: 1), (){
            print ('hello dari P1')
        });
    }
    void P2(){
        print ('hello dari P2');
    }

    //cara memanggil
    void main()async{
        await P1();
        P2();
    }

4. Tipe Data Future
    Data yang dapat ditunggu, membawa data return dari fungsi Async

ditulis dengan :
    Future<String> P1 () {
        await Futute.delayed(Duration(seconds: 1), (){
            return 'hello dari P1'; //data yang di return
        });
    }

    //cara memanggil
    void main()async{
        var data = await (P1);
        print(data);
    }

5. Collection 
    Kumpulan data pada suatu tempat
    - LIST (menyimpan data (elemen) secara berbaris dan tiap data memiliki index)
        ditulis dengan :
        void main() async {
            var scores = [];
            scores.add (60); //menambah data
            print(scores);
            print(scores[0]); //mengambil data sesuai dengan index
        }
    - MAP (Menyimpan data secara key-value, Key berguna selayaknya index pada list) 
            dituliskan dengan :
            void main()async{
                var student = {};
                student['name'] = 'Octavia'
                print(student);
                print(student['name']); //mengambil data sesuai key value
            }
