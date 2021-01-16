import 'dart:async';
import 'dart:io';
import 'package:ciblecommerce/CartListAndOrder/AddToCart/Cartmodel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database

  String table_Name = 'CartWish_table';
  String colId = 'id';
  String product_id = 'product_id';
  String product_title = 'product_title';
  String product_description = 'product_description';
  String product_price = 'product_price';
  String product_quantity = 'product_quantity';
  String product_image = 'product_image';
  String product_list_type = 'product_list_type';

  DatabaseHelper.createinstance(); // Named constructor to create instance of DatabaseHelper
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          .createinstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {

    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'CartWishList.db';

    // Open/create the database at a given path
    var createdatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return createdatabase;
  }


  FutureOr<void> _createDb(Database db, int version) async{
    await db.execute('CREATE TABLE $table_Name($colId INTEGER PRIMARY KEY AUTOINCREMENT, $product_id TEXT, $product_title TEXT, '
        '$product_description TEXT, $product_price TEXT, $product_quantity TEXT, $product_image TEXT, $product_list_type TEXT)');
  }
  // Delete Operation: Delete a Note object from database
  Future<int> deleteNote(String id,String list_type) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $table_Name WHERE $product_id = $id');
    return result;
  }
  Future<int> updateNote(CartModel note) async {
    var db = await this.database;
    var result = await db.update(table_Name, note.MaketoMap(), where: '$product_id = ?', whereArgs: [note.product_id]);
    return result;
  }
  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getSavedProductMapList(String listType) async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(table_Name,where: '$product_list_type=?',whereArgs: [listType] );
    return result;
  }
  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<CartModel>> getSavedProductList(String listType) async {

    var noteMapList = await getSavedProductMapList(listType); // Get 'Map List' from database
    int count = noteMapList.length;         // Count the number of map entries in db table

    List<CartModel> cartList = List<CartModel>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      cartList.add(CartModel.fromMapObject(noteMapList[i]));
    }

    return cartList;
  }

  // Insert Operation: Insert a Note object to database
  Future<int> insertNote(CartModel model) async {
    Database db = await this.database;
    var result = await db.insert(table_Name, model.MaketoMap());
    return result;
  }

}
