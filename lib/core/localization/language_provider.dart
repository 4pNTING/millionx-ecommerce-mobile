import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_strings.dart';

final appLanguageProvider = StateProvider<AppLanguage>(
  (ref) => AppLanguage.english,
);
