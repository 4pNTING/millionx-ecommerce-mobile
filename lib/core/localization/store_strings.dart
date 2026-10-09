import 'app_strings.dart';

class StoreStrings {
  const StoreStrings(this.language);
  final AppLanguage language;
  String text(String english, String lao) =>
      language == AppLanguage.lao ? lao : english;
  String get products => text('Products', 'ສິນຄ້າ');
  String get categories => text('Categories', 'ໝວດໝູ່');
  String get all => text('All categories', 'ທຸກໝວດໝູ່');
  String get search => text('Search products', 'ຄົ້ນຫາສິນຄ້າ');
  String get empty => text('No products found', 'ບໍ່ພົບສິນຄ້າ');
  String get unavailable => text('Could not load data', 'ບໍ່ສາມາດໂຫຼດຂໍ້ມູນ');
  String get register => text('Create customer account', 'ສ້າງບັນຊີລູກຄ້າ');
  String get firstName => text('First name', 'ຊື່');
  String get lastName => text('Last name', 'ນາມສະກຸນ');
  String get email => text('Email', 'ອີເມວ');
  String get phone => text('Phone', 'ເບີໂທ');
  String get account => text('My account', 'ບັນຊີຂອງຂ້ອຍ');
  String get retry => text('Retry', 'ລອງໃໝ່');
}
