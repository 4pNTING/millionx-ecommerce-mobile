import '../../domain/auth_session.dart';

class AuthSessionModel extends AuthSession {
  const AuthSessionModel({
    required super.accountId,
    required super.customerId,
    required super.token,
    required super.refreshToken,
    super.email,
    super.phone,
  });

  factory AuthSessionModel.fromJson(Map<String, dynamic> json) {
    final model = AuthSessionModel(
      accountId: json['accountId']?.toString() ?? '',
      customerId: json['customerId']?.toString() ?? '',
      token: json['token']?.toString() ?? '',
      refreshToken: json['refreshToken']?.toString() ?? '',
      email: json['email']?.toString(),
      phone: json['phone']?.toString(),
    );
    if (model.accountId.isEmpty ||
        model.customerId.isEmpty ||
        model.token.isEmpty ||
        model.refreshToken.isEmpty) {
      throw const FormatException('Customer session is incomplete');
    }
    return model;
  }

  Map<String, dynamic> toJson() => {
    'accountId': accountId,
    'customerId': customerId,
    'token': token,
    'refreshToken': refreshToken,
    'email': email,
    'phone': phone,
  };
}
