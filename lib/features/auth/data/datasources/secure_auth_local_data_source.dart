import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/auth_session_model.dart';
import 'auth_local_data_source.dart';

class SecureAuthLocalDataSource implements AuthLocalDataSource {
  SecureAuthLocalDataSource(this._storage);

  static const _sessionKey = 'millionx_storefront_customer_session';
  final FlutterSecureStorage _storage;

  @override
  Future<AuthSessionModel?> readSession() async {
    final value = await _storage.read(key: _sessionKey);
    if (value == null || value.isEmpty) return null;
    final decoded = jsonDecode(value);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('Stored session is invalid');
    }
    return AuthSessionModel.fromJson(decoded);
  }

  @override
  Future<void> writeSession(AuthSessionModel session) =>
      _storage.write(key: _sessionKey, value: jsonEncode(session.toJson()));

  @override
  Future<void> clearSession() => _storage.delete(key: _sessionKey);
}
