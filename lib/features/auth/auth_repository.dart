import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../../../data/db/app_database.dart';
import '../../../data/models/user_model.dart';

class AuthRepository {
  final dbProvider = AppDatabase.instance;

  String _hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  Future<void> signup(String name, String email, String password) async {
    final db = await dbProvider.database;

    final user = UserModel(
      name: name,
      email: email,
      passwordHash: _hashPassword(password),
    );

    await db.insert(
      'users',
      user.toMap(),
      // conflictAlgorithm: ConflictAlgorithm.abort,
    );
  }

  Future<UserModel?> login(String email, String password) async {
    final db = await dbProvider.database;

    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, _hashPassword(password)],
    );

    if (result.isEmpty) return null;

    return UserModel.fromMap(result.first);
  }
}
