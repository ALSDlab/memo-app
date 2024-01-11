import 'package:flutter/material.dart';

import '../data/model/memo_data.dart';
import '../data/repository/memo_repository.dart';



class MemoCard extends StatelessWidget {
  const MemoCard(
      {super.key, required this.memo, required this.onRemove});

  final MemoData memo;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(int.parse(memo.backgroundColorValue)),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(17),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  memo.createdTimeValue,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
                Text(
                  memo.title,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
                Text(
                  memo.detail,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                // 수정버튼 작성할 것
                // copyToClipboard(favorite.firstString);
                // const snackBar = SnackBar(
                //   content: Text('클립보드에 복사되었습니다.',
                //       style: TextStyle(fontFamily: 'Dohyeon')),
                //   duration: Duration(seconds: 1),
                // );
                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: const Icon(
                Icons.content_copy,
                size: 25,
              )),
          IconButton(
              onPressed: () {
                onRemove();
                MemoAddRemove.removeFromMemoList(memo);
                const snackBar = SnackBar(
                  content:
                  Text('삭제되었습니다.', style: TextStyle(fontFamily: 'Dohyeon')),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: const Icon(
                Icons.delete_outline_rounded,
                size: 30,
              ))
        ],
      ),
    );
  }
}
