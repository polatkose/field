import 'package:flutter/material.dart';
import 'package:tarla/Duyurular.dart';
import 'package:tarla/Firsatlar.dart';
import 'package:tarla/GubreFiyatlari.dart';
import 'package:tarla/Tarimdao.dart';
import 'package:tarla/main.dart';

class Gubre extends StatefulWidget {
  const Gubre({super.key});

  @override
  State<Gubre> createState() => _GubreState();
}

class _GubreState extends State<Gubre> {

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

  TextEditingController searchController = TextEditingController();
  late List<GubreFiyatlari> gubreList;
  late List<GubreFiyatlari> filteredGubreList;

  @override
  void initState() {
    super.initState();
    gubreList = [];
    filteredGubreList = [];
    fetchGubreList();
  }

  Future<void> fetchGubreList() async {
    var fetchedGubreList = await Tarimdao().gubreList();
    setState(() {
      gubreList = fetchedGubreList;
      filteredGubreList = List.from(gubreList);
    });
  }

  List<GubreFiyatlari> filterGubreList(String query) {
    return gubreList
        .where((gubre) =>
        gubre.Gubre_Adi.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void clearSearch() {
    setState(() {
      searchController.clear();
      filteredGubreList = List.from(gubreList);
    });
  }

  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Text(
              "GÜBRE FİYATLARI",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 13),
            child: Row(
              children: [
                Container(
                  width:ekranGenisligi/1.18,
                  decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(10.0), // Border radius
                  ),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        filteredGubreList = filterGubreList(value);
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Gübre Ara",
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: clearSearch,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: filteredGubreList.length,
              itemBuilder: (context, index) {
                var gubre = filteredGubreList[index];
                return Container(
                  width: ekranGenisligi/3,
                  height: ekranYuksekligi/4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: ekranGenisligi/5,
                              height: ekranYuksekligi/10,
                              child:
                              Image.asset("resimler/${gubre.Gubre_Resim}"),
                            ),
                            Text(
                              "${gubre.Gubre_Adi}",
                              style:
                              TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                            Text(
                              "${gubre.Gubre_Fiyat}₺",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${gubre.Gubre_Aciklama}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: ekranGenisligi/1,
                        height: ekranYuksekligi/1000,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                );
              },
            ),
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
