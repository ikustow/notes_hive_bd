import 'package:hive/hive.dart';

part 'note.g.dart';
@HiveType(typeId: 2)
class Note extends HiveObject{
  @HiveField(0)
  final int idTest;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String note;
  @HiveField(3)
  final bool completed;
  @HiveField(4)
  final String color;
  @HiveField(5)
  final String date;
  @HiveField(6)
  final int categoryId;
  @HiveField(7)
  final String username;

  Note(this.idTest, this.title, this.note, this.completed, this.color, this.date, this.categoryId, this.username);

}