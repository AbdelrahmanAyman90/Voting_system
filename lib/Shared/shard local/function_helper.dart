import 'package:voting/Shared/shard%20local/cash_helper.dart';

bool isEnglish() {
  if (CashNetwork.GetFromCash(key: 'lang') == 'en') {
    return true;
  } else {
    return false;
  }
}
