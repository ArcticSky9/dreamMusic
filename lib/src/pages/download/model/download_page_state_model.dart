import 'package:dream_music/src/components/basic/base_change_notifier.dart';

enum DownloadPageType {
  /// 已下载
  finished,
  /// 正在下载
  download,
}

class DownloadPageStateModel extends BaseChangeNotifier {

  DownloadPageType _type = DownloadPageType.finished;
  DownloadPageType get type => _type;
  set type(DownloadPageType value) {
    if (_type == value) return;
    _type = value;
    notifyListeners();
  }
}