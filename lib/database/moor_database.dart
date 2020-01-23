import 'package:moor_flutter/moor_flutter.dart';
part 'moor_database.g.dart';

class FavouritesImagesTable extends Table {
  // autoincrement sets this to the primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get largeImageUrl => text()();
  TextColumn get userImageUrl => text()();
  IntColumn get likes => integer()();
  IntColumn get views => integer()();
  IntColumn get comments => integer()();
  IntColumn get downloads => integer()();
  IntColumn get imagesize => integer()();
}

@UseMoor(tables: [FavouritesImagesTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<FavouritesImagesTableData>> getAllFavourtiesImages() =>
      select(favouritesImagesTable).get();
  Future insertMedicine(FavouritesImagesTableData image) =>
      into(favouritesImagesTable).insert(image);
  Future deleteMedicine(FavouritesImagesTableData image) =>
      delete(favouritesImagesTable).delete(image);
}
