import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/memo_data.dart';

class MemoRepository {
  static const String key = 'memoList';

  static Future<List<MemoData>> getMemoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? memos = prefs.getString(key);

    if (memos != null) {
      // 저장된 데이터가 있다면 JSON을 파싱하여 리스트로 변환

      final jsonList = jsonDecode(memos) as List<dynamic>;
      return jsonList.map((e) => MemoData.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
