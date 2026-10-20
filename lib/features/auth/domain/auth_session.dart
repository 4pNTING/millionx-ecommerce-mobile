class AuthSession {
  const AuthSession({
    required this.accountId,
    required this.customerId,
    required this.token,
    required this.refreshToken,
    this.email,
    this.phone,
  });

  final String accountId;
  final String customerId;
  final String token;
  final String refreshToken;
  final String? email;
  final String? phone;

  String get identifier => email?.isNotEmpty == true
      ? email!
      : phone?.isNotEmpty == true
      ? phone!
      : customerId;
}
