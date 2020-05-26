import 'group_code.dart';

abstract class BaseSection {

  bool _isNotEmpty = false;
  bool get isNotEmpty => _isNotEmpty;

  var _groupCodes = <GroupCode>[];
  List<GroupCode> get groupCodes => _groupCodes;
 
  set groupCodes(value) {
    _isNotEmpty = true;
    return _groupCodes = value;
  }

  Future parse(List<GroupCode> groupCodes);

  String get dxfString;
  
}

class UndefinedSection extends BaseSection {
  @override
  Future parse(List<GroupCode> groupCodes) {
    return null;
  }

  @override
  String get dxfString {
    var str = '';
    // Không xử lý giá trị mà chỉ chuyển trở lại dxf
    groupCodes.forEach((m) {
      str += m.dxfString;
    });
    return str;
  }

}