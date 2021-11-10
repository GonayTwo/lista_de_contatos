import 'package:sqflite/sqflite.dart';

final int idColumn = 'idColumn';
final String nameColumn = 'nameColumn';
final String emailColumn = 'emailColumn';
final String phoneColumn = 'phoneColumn';
final String imgColumn = 'imgColumn';

class ContactHelper{

}

class Contact{
  int id;
  String name;
  String email;
  String phone;
  String img;

  Contact.fromMap(Map map){
    this.id = map[idColumn];
    this.name = map[nameColumn];
    this.email = map[emailColumn];
    this.phone = map[phoneColumn];
    this.img = map[imgColumn];
  }


  Future<Map> toMap()  {
    Map<String, dynamic> map = {
      nameColumn = name,
      emailColumn = email,
      phoneColumn = phone,
      imgColumn = img
    };
    if(id != null){
      Map[idColumn] = id;
    }
  }

  @override
  String toString() {
    return "ID: $id, NAME: $name, EMAIL: $email, PHONE: $phone, IMG: $img";
  }
}