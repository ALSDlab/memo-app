import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/memo_data.dart';
import '../data/repository/memo_repository.dart';

class ListViewModel {
  static Future<void> addToMemoList(MemoData item, BuildContext context) async {
    List<MemoData> currentList = await MemoRepository.getMemoList();

    // 중복 체크
    if (!currentList.contains(item)) {
      currentList.add(item);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String jsonString =
          jsonEncode(currentList.map((e) => e.toJson()).toList());
      prefs.setString(MemoRepository.key, jsonString);

      // 정상적으로 추가된 경우 스낵바로 알림
      memoAddSnackBar(context);
    } else {
      // 수정된 경우 스낵바로 알림
      modifySnackBar(context);
    }
  }

  static void memoAddSnackBar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('YOUR MEMO SAVED.'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void modifySnackBar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('YOUR MEMO EDITED.'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> removeFromMemoList(MemoData item) async {
    try {
      List<MemoData> currentList = await MemoRepository.getMemoList();
      currentList.remove(item);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String jsonString =
          jsonEncode(currentList.map((e) => e.toJson()).toList());
      prefs.setString(MemoRepository.key, jsonString);
    } catch (e) {
      print('Error during removal: $e');
    }
  }
}
