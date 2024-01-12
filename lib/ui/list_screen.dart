import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/model/memo_data.dart';
import '../data/repository/memo_repository.dart';
import 'list_view_model.dart';
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
    List<MemoData> memos = await MemoRepository.getMemoList();
    setState(() {
      memoList = memos;
    });
  }

  void _removeFromMemos(MemoData item) async {
    await ListViewModel.removeFromMemoList(item);
    // 삭제 후에는 다시 목록을 불러올 수 있도록 _loadFavorites 메서드 호출
    setState(() {
      _loadMemos();
    });
  }

  void _sort(int value) {
    switch (value) {
      case 1:
        memoList
            .sort((a, b) => a.createdTimeValue.compareTo(b.createdTimeValue));
      case 2:
        memoList
            .sort((a, b) => b.createdTimeValue.compareTo(a.createdTimeValue));
      case 3:
        memoList.sort(
            (a, b) => a.backgroundColorValue.compareTo(b.backgroundColorValue));
      case 4:
        memoList.sort(
            (a, b) => b.backgroundColorValue.compareTo(a.backgroundColorValue));
      case 5:
        memoList.sort((a, b) => a.title.compareTo(b.title));
      case 6:
        memoList.sort((a, b) => b.title.compareTo(a.title));
      default:
    }
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: PopupMenuButton(
              child: const Text('SORT'),
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(value: 1, child: Text("Ascend by DATE")),
                const PopupMenuItem(value: 2, child: Text("Descend by DATE")),
                const PopupMenuItem(value: 3, child: Text("Ascend by COLOR")),
                const PopupMenuItem(value: 4, child: Text("Descend by COLOR")),
                const PopupMenuItem(value: 5, child: Text("Ascend by TITLE")),
                const PopupMenuItem(value: 6, child: Text("Descend by TITLE")),
              ],
              onSelected: (v) {
                // 정렬하는 로직 만들기
                setState(() {
                  _sort(v);
                });
              },
            ),
          )
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
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueGrey,
        label: const Text('NEW MEMO'),
        icon: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () => context.go('/creatMemo'),
      ),
    );
  }
}
