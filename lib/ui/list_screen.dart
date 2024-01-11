import 'package:flutter/material.dart';

import '../data/model/memo_data.dart';
import '../data/repository/memo_repository.dart';
import 'memo_card.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<MemoData> memoList = [];

  @override
  void initState() {
    super.initState();
    _loadMemos();
  }

  void _loadMemos() async {
    List<MemoData> memos = await MemoAddRemove.getMemoList();
    setState(() {
      memoList = memos;
    });
  }

  void _removeFromMemos(MemoData item) async {
    await MemoAddRemove.removeFromMemoList(item);
    // 삭제 후에는 다시 목록을 불러올 수 있도록 _loadFavorites 메서드 호출
    setState(() {
      _loadMemos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'MEMO LIST',
        ),
        actions: [
          TextButton(
              child: const Text(
                '정렬',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {})
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: memoList.length,
          itemBuilder: (context, index) {
            final memo = memoList[index];

            return MemoCard(
              memo: memo,
              onRemove: () => _removeFromMemos(memo),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
