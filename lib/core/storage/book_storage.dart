// import 'package:audio_book/core/resources/app_keys.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../features/audio_list/domain/entities/audiobook_info.dart';

// class BookStorage {
//   final SharedPreferences storage;
//   BookStorage({required this.storage});

//   Future<List<AudioBookInfo>> getBooks() async {
//     final existingList = storage.getStringList(AppKeys.storageKey) ?? <String>[];

//     return Future.value(
//       existingList.map((e) => BookModel.fromJson(jsonDecode(e))).toList(),
//     );
//   }

//   Future<List<AudioBookInfo>> save(BookModel book) async {
//     final existingList = storage.getStringList(_Keys.storageKey) ?? <String>[];

//     final existingProdIndex = existingList.indexWhere((item) {
//       final BookModel decodedBook = BookModel.fromJson(
//         jsonDecode(item),
//       );
//       return decodedBook.id == book.id;
//     });
//     if (existingProdIndex == -1) {
//       final String jsonBook = jsonEncode(book.toJson());
//       existingList.add(jsonBook);
//     }

//     storage.setStringList(_Keys.storageKey, existingList);

//     return Future.value(
//       existingList.map((e) => BookModel.fromJson(jsonDecode(e))).toList(),
//     );
//   }
// }
