import 'package:hive/hive.dart';

part 'category.g.dart';
@HiveType(typeId: 3)
class Category extends HiveObject{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;

  Category(this.id, this.title);
}