import 'package:tarla/GubreFiyatlari.dart';
import 'package:tarla/HalBorsaFiyatlari.dart';
import 'package:tarla/IlacFiyatlari.dart';
import 'package:tarla/PetrolFiyatlari.dart';
import 'package:tarla/Sehirler.dart';
import 'package:tarla/veriTabaniYardimcisi.dart';

class Tarimdao {
  Future<List<Sehirler>> sehirlerList() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Sehirler");
    return List.generate(maps.length, (i){
      var satir = maps[i];
      return Sehirler(Sehir_ID: satir["Sehir_ID"], Sehir_Adi: satir["Sehir_Adi"]);
    });
  }
  Future<List<PetrolFiyatlari>> petrolList(int Sehir_ID) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM PetrolOfisleri WHERE Sehir_ID = $Sehir_ID" );
    return List.generate(maps.length, (i){
      var satir = maps[i];
      return PetrolFiyatlari(Ofis_ID: satir["Ofis_ID"], Ofis_Adi: satir["Ofis_Adi"], Ofis_Fiyat: satir["Ofis_Fiyat"], Sehir_ID: satir["Sehir_ID"], Ofis_Resim: satir["Ofis_Resim"]);
    });
  }
  Future<List<HalBorsaFiyatlari>> borsaList(int Sehir_ID) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Borsa WHERE Sehir_ID = $Sehir_ID" );
    return List.generate(maps.length, (i){
      var satir = maps[i];
      return HalBorsaFiyatlari(Borsa_ID: satir["Borsa_ID"], Borsa_Adi: satir["Borsa_Adi"], Borsa_Fiyat: satir["Borsa_Fiyat"], Sehir_ID: satir["Sehir_ID"], Borsa_HalFiyat: satir["Borsa_HalFiyat"], Borsa_Resim: satir["Borsa_Resim"]);
    });
  }
  Future<List<IlacFiyatlari>> ilacList() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Ilaclar" );
    return List.generate(maps.length, (i){
      var satir = maps[i];
      return IlacFiyatlari(Ilac_ID: satir["Ilac_ID"], Ilac_Adi: satir["Ilac_Adi"], Ilac_Resmi: satir["Ilac_Resmi"], Ilac_Fiyat: satir["Ilac_Fiyat"], Ilac_Aciklama: satir["Ilac_Aciklama"]);
    });
  }
  Future<List<GubreFiyatlari>> gubreList() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Gubreler" );
    return List.generate(maps.length, (i){
      var satir = maps[i];
      return GubreFiyatlari(Gubre_ID: satir["Gubre_ID"], Gubre_Adi: satir["Gubre_Adi"], Gubre_Aciklama: satir["Gubre_Aciklama"], Gubre_Fiyat: satir["Gubre_Fiyat"], Gubre_Resim: satir["Gubre_Resim"]);
    });
  }

}