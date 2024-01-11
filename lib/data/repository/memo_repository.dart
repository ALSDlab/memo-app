import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/memo_data.dart';

class MemoAddRemove {
  static const String _key = 'memoList';

  static Future<List<MemoData>> getMemoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? memos = prefs.getString(_key);

    if (memos != null) {
      // 저장된 데이터가 있다면 JSON을 파싱하여 리스트로 변환

      final jsonList = jsonDecode(memos) as List<dynamic>;
      return jsonList.map((e) => MemoData.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  static Future<void> addToMemoList(
      MemoData item, BuildContext context) async {
    List<MemoData> currentList = await getMemoList();

    // 중복 체크
    if (!currentList.contains(item)) {
      currentList.add(item);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String jsonString =
      jsonEncode(currentList.map((e) => e.toJson()).toList());
      prefs.setString(_key, jsonString);

      // 정상적으로 추가된 경우 스낵바로 알림
      memoAddSnackBar(context);
    } else {
      // 수정된 경우 스낵바로 알림
      modifySnackBar(context);
    }
  }

  static void memoAddSnackBar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('저장 되었습니다.'),
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void modifySnackBar(BuildContext context) {
    const snackBar = SnackBar(
      content:
      Text('수정 되었습니다.'),
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> removeFromMemoList(MemoData item) async {
    try {
      List<MemoData> currentList = await getMemoList();
      currentList.remove(item);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String jsonString =
      jsonEncode(currentList.map((e) => e.toJson()).toList());
      prefs.setString(_key, jsonString);
    } catch (e) {
      print('Error during removal: $e');
    }
  }
}
