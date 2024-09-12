import 'package:flutter/material.dart';
import 'package:tarla/Duyurular.dart';
import 'package:tarla/FirsatlarDetaySayfasi.dart';
import 'package:tarla/main.dart';

class Firsatlar extends StatefulWidget {
  const Firsatlar({super.key});

  @override
  State<Firsatlar> createState() => _FirsatlarState();
}

class _FirsatlarState extends State<Firsatlar> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });


    if (_selectedIndex == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Firsatlar()));
    } else if (_selectedIndex == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: '')));
    } else if (_selectedIndex == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Duyurular()));
    }
  }

  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        title: Center(
          child: Text(
            "FIRSATLAR",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FirsatlarDetaySayfasi(
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: ekranGenisligi/1,
                    height: ekranYuksekligi/4.5,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.white,border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Gölge rengi
                        blurRadius: 1.0,   // Gölge bulanıklığı
                        offset: Offset(0, 2), // Gölge konumu (x, y)
                      ),
                    ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 14.0, left: 15.0),
                          child: Text("13.07.2023", style: TextStyle(color: Colors.grey),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 15.0),
                          child: Text("string"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: ekranGenisligi/1.1),
                          child: Icon(Icons.chevron_right),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FirsatlarDetaySayfasi(
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: ekranGenisligi/1,
                    height: ekranYuksekligi/4.5,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.white,border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Gölge rengi
                        blurRadius: 1.0,   // Gölge bulanıklığı
                        offset: Offset(0, 2), // Gölge konumu (x, y)
                      ),
                    ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 14.0, left: 15.0),
                          child: Text("13.07.2023", style: TextStyle(color: Colors.grey),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 15.0),
                          child: Text("string"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: ekranGenisligi/1.1),
                          child: Icon(Icons.chevron_right),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
        bottomNavigationBar:ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.green,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            elevation: 8,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Fırsatlar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Anasayfa',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.announcement),
                label: 'Duyurular',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        )
    );
  }
}
