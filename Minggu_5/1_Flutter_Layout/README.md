# Flutter Layout

1. Layout
berfungsi untuk mengatur tata letak, berbentuk widget yang dapat mengatur widget di dalamnya

2. Single-child Layout
    > Container
    membuat sebuah box,
    data membungkus widget lain, 
    box memiliki margin, padding, border

    ex: 
    Container(
        margin:  EdgeInsets.all(10)
        padding: EdgeInsets.all(10)
        decoration: BoxDecoration(
            border: Border.all(),
        ),
        child: Text("Ini adalah Readme"),
    );

    > Center
    membuat sebuah box,
    dapat membungkus widget lain, 
    memenuhi lebar dan tinggi ruang di luarnya,
    meletakkan widget berada dibagian tengah

    ex:
    Center(
        child: Text("ini adalah readme"),
    );

    > Sizedbox
    membuat sebuah box,
    dapat membungkus widget lain,
    box dapat diatur lebar dan tingginya,
    lebih sederhana dari container,
    biasanya untuk memberikan jarak

    ex:
    SizedBox(
        width: 100,
        height: 150,
        child: Text("ini adalah readme"),
    );

3. Multi-child Layout

    > Column
    untuk mengatur widgets secara vertikal

    ex: 
    Column(
        children: [
            Text(),
            Text(),
            Container(),
            Container(),
        ],
    );

    > Row
    untuk mengatur widgets secara horizontal

     ex: 
    Row(
        children: [
            Text(),
            Text(),
            Container(),
            Container(),
        ],
    );

    > ListView
    mengatur widget dalam bentuk list,
    memiliki kemampuan scroll,
    untuk statis bisa dinamis menggunakan List.generate()

    ex:
    Listview(
        children: List.generate(
            items.length, (index) => Container(
                width: double.infinity,
                color: Colors.red,
                child: Text(
                    items[index]
                )
            )
        )
    )

    > Listview builder = untuk data dinamis. 
    Ex : 
    Listview.builder(
        itemCount : items.lenght
        itemBuilder : (context, int index) {
            return Container(
                width: double.infinity,
                color: Colors.red,
                child: Text(
                    items[index]
                )
            )
        }
    )

    > Listview separated = untuk data dinamis dan dibawahnya ada garis (Divider). 
    Ex : 
    Listview.separated(
        itemBuilder : (context, index){
        return Text(
            items[index]
        ); 
        separatorBuilder : (){}
        }
    )

    > Listview custom = untuk tampilan yang lebih complex

    > GridView
    mengatur widgets dalam bentuk galeri
    
    > GridView.count  : membuat tampilan berbasis grid dgn jumlah baris dan kolom tetap. 

    ex:  
    //tampung List bisa masukin link image 
    List<String> items =["Gshsuisi","Vehsusj","Gsusii"];
    
    GridView.count(
        crossAxisCount : 3,
        children : List.generate[
            10,
            
        //biar gambar sama rata
        (index)=> Image.network( 
            items[index],
            fit : Boxfit.cover
            ), 
        ],
    ),

    > GridView.builder : datanya dinamis dan panjang

    ex: 
    GridView.builder (
        SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount : 2
            ),
            itemCount : items.lenght,
            itemBuilder : (context, int index){
                return Container(
                    width : double.infinity
                    color : Colors.red
                    child : image.network(
                        items[index]
                    ),
                );
            },
        ),
    

    > GridView.extent :   
    ex: 
    GridView.extend(
        maxCrosdAxisExtend : 250,
        children : List.generate (
            item.lenght
            (index) => Container(
                width : double.infinity
                color : Colors.red
                child : image.network(
                    items[index]),
                    Fit : boxFit.cover
                    ),
                )
            )
    
    > GridView.custom : tampilan lebih complex


