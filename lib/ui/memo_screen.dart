import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/model/memo_data.dart';
import 'list_view_model.dart';

class MemoScreen extends StatefulWidget {
  const MemoScreen({super.key});

  @override
  State<MemoScreen> createState() => _MemoScreenState();
}

class _MemoScreenState extends State<MemoScreen> {
  final _titleTextController = TextEditingController();
  final _memoTextController = TextEditingController();
  final List<ColorItem> colorData = [];
  Color selectedColor = Colors.yellowAccent;

  @override
  void initState() {
    super.initState();
    colorData.add(ColorItem(true, Colors.yellowAccent));
    colorData.add(ColorItem(false, Colors.lightBlueAccent));
    colorData.add(ColorItem(false, Colors.greenAccent));
    colorData.add(ColorItem(false, Colors.purpleAccent));
    colorData.add(ColorItem(false, Colors.orangeAccent));
    colorData.add(ColorItem(false, Colors.pinkAccent));
  }

  @override
  void dispose() {
    _titleTextController.dispose();
    _memoTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: selectedColor, // 화면 배경색을 선택한 색상으로 설정
            ),
            Column(
              children: [
                // 저장 버튼
                AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => context.go('/listMemo'),
                  ),
                  backgroundColor: Colors.transparent,
                  title: const Text(
                    'MEMO PAGE',
                  ),
                  actions: [
                    TextButton(
                        child: const Text(
                          'SAVE',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          MemoData memoData = MemoData(
                            title: _titleTextController.text,
                            detail: _memoTextController.text,
                            backgroundColorValue:
                                selectedColor.value.toString(),
                            createdTimeValue: DateTime.now().toIso8601String(),
                          );
                          ListViewModel.addToMemoList(memoData, context);
                          context.go('/listMemo');
                        })
                  ],
                ),
                // 색상 선택
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: colorData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              for (var element in colorData) {
                                element.isSelected = false;
                              }
                              colorData[index].isSelected = true;
                              selectedColor = colorData[index].backgroundColor;
                            });
                          },
                          child: ForColorChange(colorData[index]),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                    ),
                  ),
                ),
                // 제목 작성
                Container(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: _titleTextController,
                    decoration: InputDecoration(
                      hintText: 'TITLE',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                // 내용 작성
                Expanded(
                  child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      maxLines: 15,
                      controller: _memoTextController,
                      decoration: InputDecoration(
                        hintText: 'PLEASE WRITE DETAILS HERE',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ForColorChange extends StatelessWidget {
  final ColorItem _item;

  const ForColorChange(this._item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        color: _item.backgroundColor,
        border: Border.all(
            width: _item.isSelected ? 3.0 : 1.0,
            color: _item.isSelected ? Colors.black : Colors.white),
        shape: BoxShape.circle,
      ),
    );
  }
}

class ColorItem {
  bool isSelected;
  Color backgroundColor;

  ColorItem(this.isSelected, this.backgroundColor);
}
