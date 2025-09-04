import 'package:flutter/material.dart';
import 'package:notekey_app/features/themes/colors.dart';
import 'package:notekey_app/features/widgets/topbar/basic_topbar.dart';
import 'package:notekey_app/features/widgets/loading/fancy_loader.dart';

import 'package:notekey_app/features/presentation/screens/forum/data/todo_db.dart';
import 'package:notekey_app/features/presentation/screens/forum/data/todo_item.dart';
import 'todo_edit_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final _db = TodoDb();
  bool _loading = true;
  List<TodoItem> _items = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    // Lade-Delay
    await Future.delayed(const Duration(seconds: 2));
    final list = await _db.list(sortBy: 'due', desc: false);
    if (!mounted) return;
    setState(() {
      _items = list;
      _loading = false;
    });
  }

  Future<void> _toggle(TodoItem t, bool v) async {
    final up = t.copyWith(done: v);
    await _db.update(up);
    if (!mounted) return;
    setState(() {
      final i = _items.indexWhere((x) => x.id == t.id);
      if (i >= 0) _items[i] = up;
    });
  }

  Future<void> _delete(TodoItem t) async {
    if (t.id != null) await _db.delete(t.id!);
    if (!mounted) return;
    setState(() => _items.removeWhere((x) => x.id == t.id));
  }

  Future<void> _openCreate() async {
    final ok = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => const TodoEditScreen()),
    );
    if (ok == true) _load();
  }

  Future<void> _openEdit(TodoItem t) async {
    final ok = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => TodoEditScreen(initial: t)),
    );
    if (ok == true) _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hellbeige,
      appBar:
          const BasicTopBar(title: 'To-Do', showBack: true, showMenu: false),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.dunkelbraun,
        foregroundColor: AppColors.hellbeige,
        onPressed: _openCreate,
        child: const Icon(Icons.add_task),
      ),
      body: _loading
          ? const FancyLoader()
          : (_items.isEmpty
              ? const Center(child: Text('Noch keine To-Dos.'))
              : ReorderableListView.builder(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 96),
                  itemCount: _items.length,
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (newIndex > oldIndex) newIndex -= 1;
                      final x = _items.removeAt(oldIndex);
                      _items.insert(newIndex, x);
                    });
                  },
                  itemBuilder: (context, i) {
                    final t = _items[i];
                    return Dismissible(
                      key: ValueKey(t.id ?? '$i-${t.title}'),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        color: Colors.redAccent,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (_) => _delete(t),
                      child: Card(
                        color: AppColors.hellbeige,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: ListTile(
                          leading: Checkbox(
                            value: t.done,
                            onChanged: (v) => _toggle(t, v ?? false),
                          ),
                          title: Text(
                            t.title.isEmpty ? 'Ohne Titel' : t.title,
                            style: TextStyle(
                              decoration:
                                  t.done ? TextDecoration.lineThrough : null,
                              color: AppColors.dunkelbraun,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: (t.note.isEmpty && t.due == null)
                              ? null
                              : Text([
                                  if (t.due != null)
                                    '${t.due!.day.toString().padLeft(2, '0')}.${t.due!.month.toString().padLeft(2, '0')}.${t.due!.year}',
                                  if (t.note.isNotEmpty) t.note,
                                ].join('  ·  ')),
                          trailing: const Icon(Icons.drag_handle),
                          onTap: () => _openEdit(t),
                        ),
                      ),
                    );
                  },
                )),
    );
  }
}
