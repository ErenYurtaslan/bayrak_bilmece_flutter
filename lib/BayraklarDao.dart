import 'package:bayrak_bilmece_flutter/Bayraklar.dart';
import 'package:bayrak_bilmece_flutter/DbHelper.dart';

class BayraklarDao{



  Future<List<Bayraklar>> randomlyFetch() async{
    var db = await DbHelper.dbAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery(
        "SELECT*FROM ulkeBayraklari"
        " ORDER BY RANDOM() LIMIT 10");
      return List.generate(maps.length, (index){
        var line = maps[index];
        return Bayraklar(
          line["bayrak_id"],
          line["bayrak_ad"],
          line["bayrak_resim"],
           );
        }
      );
  }







  Future<List<Bayraklar>> randomlyBringWrongOnes(int bayrak_id) async{
    var db = await DbHelper.dbAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery(
            "SELECT*FROM ulkeBayraklari"
            " WHERE bayrak_id != $bayrak_id"
            " ORDER BY RANDOM() LIMIT 3");
    return List.generate(maps.length, (index){
      var line = maps[index];
      return Bayraklar(
        line["bayrak_id"],
        line["bayrak_ad"],
        line["bayrak_resim"],
      );
    }
    );
  }


}