import 'package:desafio_rick_and_morty/shared/base-service/system-colors/SystemColors.dart';

import 'alerts/alert.dart';
import 'loading/loading.dart';

abstract class BaseService {
  static Alert alert = new Alert();
  static Loading loading = new Loading();
  static SystemColors systemColors = new SystemColors();
}
