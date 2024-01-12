import 'package:go_router/go_router.dart';
import 'package:memo_app/ui/list_screen.dart';
import 'package:memo_app/ui/memo_screen.dart';
import 'package:memo_app/ui/update_screen.dart';

final router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const ListScreen()),
  GoRoute(path: '/creatMemo', builder: (context, state) => const MemoScreen()),
  GoRoute(path: '/updateMemo', builder: (context, state) => const UpdateScreen()),
]);
