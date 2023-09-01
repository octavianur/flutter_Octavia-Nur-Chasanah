# Fundamental Object Oriented Programming (OOP)

    merupakan program yang disusun dalam bentuk abstraksi object.
    Data dan proses diletakkan pada abstraksi tersebut.

Keuntungan dari OOP:
- Mudah di troubleshoot
- Mudah digunakan ulang

Dapat digunakan pada berbagai program seperti, C++, Java,, Javascript, Phyton

Komponen OOP :
    1. Class
        - Abstraksi dari sebuah benda (object)
        - Memiliki ciri - ciri yang disebut property
        - Memiliki sifat dan kemampuan yang disebut method

            Cara membuat Class: 
            1. Menggunakan kata kunci class
            2. Memiliki nama
            3. Detail class diletakkan dalam kurawal

            Cara penulisan :
            class Hewan {
                //property
                //method
            }
    2. Object 
        - Bentuk sebenarnya dari class
        - Disebut juga instance of class
        - Diperlakukan seperti data 

            Cara penulisan :
            void main(){
                var h1 = Hewan();
            } 
    
    3. Property
        - Ciri - ciri suatu class
        - Hal - hal yang dimiliki suatu class
        - Memiliki sifat seperti variable

            Cara Penulisan :
            class Hewan {
                //property
                var mata = 0;
                var kaki = 0;
            }

            panggilnya:
            void main(){
                var h1 = Hewan();
                print(h1.kaki);
            }
    
    4. Method
        - Sifat suatu class
        - Aktivitas yang dapat dikerjakan suatu class
        - Memiliki sifat seperti fungsi

            Cara penulisan :
            class Hewan{
                void bersuara(){
                    print('');
                }
            }

            panggilnya :
            void main(){
                var h1 = Hewan();
                h1.bersuara();
            }

