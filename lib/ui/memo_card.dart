import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../data/model/memo_data.dart';
import 'list_view_model.dart';

class MemoCard extends StatelessWidget {
  const MemoCard({super.key, required this.memo, required this.onRemove});

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
                Text(DateFormat("yyyy년 MM월 dd일").format(DateTime.parse(memo.createdTimeValue))
                  ,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
                Text(
                  memo.title,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
                Text(
                  memo.detail,
                  style: const TextStyle(fontSize: 13, color: Colors.black),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                // 수정버튼 작성할 것
                ListViewModel.removeFromMemoList(memo);
                context.go('/updateMemo', extra: memo);

              },
              icon: const Icon(
                Icons.edit,
                size: 25,
              )),
          IconButton(
            onPressed: () {
              onRemove();
              ListViewModel.removeFromMemoList(memo);
              const snackBar = SnackBar(
                content: Text(
                  'DELETED!!.',
                ),
                duration: Duration(seconds: 2),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: const Icon(
              Icons.delete_outline_rounded,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
