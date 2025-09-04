import 'package:flutter/material.dart';
import 'package:notekey_app/features/themes/colors.dart';
import 'package:notekey_app/features/widgets/topbar/basic_topbar.dart';
import 'package:notekey_app/features/widgets/loading/fancy_loader.dart';
import 'package:notekey_app/features/presentation/screens/forum/data/todo_db.dart';
import 'package:notekey_app/features/presentation/screens/forum/data/todo_item.dart';

class TodoEditScreen extends StatefulWidget {
  final TodoItem? initial;
  const TodoEditScreen({super.key, this.initial});

  @override
  State<TodoEditScreen> createState() => _TodoEditScreenState();
}

class _TodoEditScreenState extends State<TodoEditScreen> {
  final _db = TodoDb();
  final _title = TextEditingController();
  final _note = TextEditingController();
  DateTime? _due;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final t = widget.initial;
    if (t != null) {
      _title.text = t.title;
      _note.text = t.note;
      _due = t.due;
    }
  }

  @override
  void dispose() {
    _title.dispose();
    _note.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _due ?? now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 5),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.dunkelbraun,
              onPrimary: AppColors.hellbeige,
              surface: AppColors.hellbeige,
              onSurface: AppColors.dunkelbraun,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) setState(() => _due = picked);
  }

  Future<void> _save() async {
    if (_saving) return;
    setState(() => _saving = true);

    // SnackBar (3s) wie bei Veranstaltungen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: AppColors.dunkelbraun,
        content: Row(
          children: const [
            SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 12),
            Text('Speichern…'),
          ],
        ),
      ),
    );

    try {
      final t = TodoItem(
        id: widget.initial?.id,
        title: _title.text.trim().isEmpty ? 'Ohne Titel' : _title.text.trim(),
        note: _note.text.trim(),
        done: widget.initial?.done ?? false,
        due: _due,
      );

      if (widget.initial == null) {
        await _db.insert(t);
      } else {
        await _db.update(t);
      }

      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Fehler beim Speichern: $e')),
      );
      setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dueTxt = _due == null
        ? 'Kein Fälligkeitsdatum'
        : '${_due!.day.toString().padLeft(2, '0')}.${_due!.month.toString().padLeft(2, '0')}.${_due!.year}';

    return Scaffold(
      backgroundColor: AppColors.hellbeige,
      appBar:
          const BasicTopBar(title: 'To-Do', showBack: true, showMenu: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _title,
              decoration: const InputDecoration(
                  labelText: 'Titel', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _note,
              maxLines: 4,
              decoration: const InputDecoration(
                  labelText: 'Notiz', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: Text(dueTxt)),
                ElevatedButton(
                  onPressed: _pickDate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.goldbraun,
                    foregroundColor: AppColors.hellbeige,
                  ),
                  child: const Text('Fällig am…'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saving ? null : _save,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.dunkelbraun,
                foregroundColor: AppColors.hellbeige,
              ),
              child: _saving
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text('Speichern'),
            ),
          ],
        ),
      ),
    );
  }
}
