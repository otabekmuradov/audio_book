import 'dart:async';
import 'dart:convert';

import 'package:audio_book/core/resources/app_keys.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/audio_list/data/models/audiobook_info_dto.dart';

class BookStorage {
  final SharedPreferences storage;

  BookStorage({required this.storage});

  Future<List<AudioBookInfoDto>> saveBooks(AudioBookInfoDto book) async {
    print("save books ssssssssss  ${book.title}");

    final existingList =
        storage.getStringList(AppKeys.storageKey) ?? <String>[];


    final existingProdIndex = existingList.indexWhere((item) {
      final AudioBookInfoDto decodedBook = AudioBookInfoDto.fromJson(
        jsonDecode(item),
      );
      return decodedBook.id == book.id;
    });
    if (existingProdIndex == -1) {
      final String jsonBook = jsonEncode(book.toJson());
      existingList.add(jsonBook);
    }

    storage.setStringList(AppKeys.storageKey, existingList);

    return Future.value(
      existingList.map((book) => AudioBookInfoDto.fromJson(json.decode(book))).toList()
    );
  }

  Future<List<AudioBookInfoDto>> getBooks() async {
    final List<String>? data = storage.getStringList(AppKeys.storageKey);
    print("sadddddddddddd   ${data?.first}");
    if (data == null) {
      return [];
    }
    return data
        .map((book) => AudioBookInfoDto.fromJson(json.decode(book)))
        .toList();
  }

  // Future<void> deleteBook(int id) async {
  //   final List<AudioBookInfoDto> books = await getBooks();
  //   final List<AudioBookInfoDto> newBooks = books.where((book) => book.id != id).toList();
  //   await saveBooks(newBooks);
  // }

  // Future<void> deleteAllBooks() async {
  //   await sharedPreferences.remove(AppKeys.storageKey);
  // }

  // Future<void> updateBook(AudioBookInfoDto book) async {
  //   final List<AudioBookInfoDto> books = await getBooks();
  //   final List<AudioBookInfoDto> newBooks = books.map((b) => b.id == book.id ? book : b).toList();
  //   await saveBooks(newBooks);
  // }
}
