import 'package:go_router/go_router.dart';
import 'package:memo_app/data/model/memo_data.dart';
import 'package:memo_app/ui/list_screen.dart';
import 'package:memo_app/ui/memo_screen.dart';
import 'package:memo_app/ui/update_screen.dart';

final router = GoRouter(
    initialLocation: '/listMemo',
    routes: [
  GoRoute(path: '/listMemo', builder: (context, state) => const ListScreen()),
  GoRoute(path: '/creatMemo', builder: (context, state) => const MemoScreen()),
  GoRoute(
      path: '/updateMemo',
      builder: (context, state) {
        return UpdateScreen(memo: state.extra as MemoData);
      }),
]);
