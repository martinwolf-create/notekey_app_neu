import 'package:notekey_app/features/calendar/domain/calendar_repository.dart';

class RemoveCalendarEntry {
  final CalendarRepository repo;
  RemoveCalendarEntry(this.repo);

  Future<void> call(String id) => repo.remove(id);
}
