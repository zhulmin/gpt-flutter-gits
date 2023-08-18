import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

final String messageTable = 'message_table';

/**
 * 
 * 自定义roomId = "topic???", 新生成的id可以直接用时间戳?
 */
final String columnRoomId = 'roomId';
//用户id, 区分是ai还是用户
final String columnAuthor = 'author';
final String columnId = 'id';
final String columnCreatedAt = 'createdAt';
final String columnText = 'text';

class MessageProvider {
  static late Database db;

  static Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $messageTable ( 
  $columnId text primary key, 
  $columnRoomId integer,
  $columnCreatedAt integer not null,
  $columnText text not null,
  $columnAuthor text not null)
''');
    });
  }

  static Future<int> insert(types.TextMessage message) async {
    Map<String, Object?> result = Map();
    result[columnCreatedAt] = message.createdAt;
    result[columnAuthor] = jsonEncode(message.author.toJson());
    result[columnId] = message.id;
    result[columnRoomId] = message.roomId;
    result[columnText] = message.text;

    int messageId = await db.insert(messageTable, result);
    return messageId;
  }

  // static Future<types.Message?> getMessage(int id) async {
  //   List<Map<String, dynamic>> maps = await db.query(messageTable,
  //       columns: [
  //         columnId,
  //         columnCreatedAt,
  //         columnAuthor,
  //         columnText,
  //         columnRoomId
  //       ],
  //       where: '$columnId = ?',
  //       whereArgs: [id]);
  //   if (maps.length > 0) {
  //     return types.Message.fromJson(maps.first);
  //   }
  //   return null;
  // }

  static Future<List<types.TextMessage>> getMessages(int? roomId) async {
    if (roomId != null) {
      List<Map<String, dynamic>> maps = await db.query(messageTable,
          columns: [
            columnId,
            columnCreatedAt,
            columnAuthor,
            columnText,
            columnRoomId
          ],
          where: '$columnRoomId = ?',
          whereArgs: [roomId]);
      if (maps.length > 0) {
        return maps
            .map((e) {
              String author = e[columnAuthor];
              Map map = jsonDecode(author);
              e[columnAuthor] = map;

              return types.TextMessage.fromJson(e);
            })
            .toList()
            .reversed
            .toList();
      }
      return [];
    }

    List<Map<String, dynamic>> maps = await db.query(messageTable, columns: [
      columnId,
      columnCreatedAt,
      columnAuthor,
      columnText,
      columnRoomId
    ]);

    if (maps.length > 0) {
      return maps
          .map((e) {
            Map<String, Object?> result = Map();
            result[columnCreatedAt] = e[columnCreatedAt];
            result[columnAuthor] = jsonDecode(e[columnAuthor]);
            result[columnId] = e[columnId];
            result[columnRoomId] = e[columnRoomId];
            result[columnText] = e[columnText];

            return types.TextMessage.fromJson(result);
          })
          .toList()
          .reversed
          .toList();
    }
    return [];
  }

  static Future<int> delete(int roomId) async {
    return await db
        .delete(messageTable, where: '$columnRoomId = ?', whereArgs: [roomId]);
  }

    static Future<int> deleteAll() async {
    return await db
        .delete(messageTable);
  }

  // static Future<int> update(types.Message todo) async {
  //   return await db.update(messageTable, todo.toJson(),
  //       where: '$columnId = ?', whereArgs: [todo.id]);
  // }

  // static Future close() async => db.close();
}
