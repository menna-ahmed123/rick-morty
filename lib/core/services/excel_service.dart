import 'dart:io';

import 'package:excel/excel.dart';
import 'package:injectable/injectable.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task/feature/home/domain/entities/character_entity.dart';

@lazySingleton
class ExcelService {
  Future<void> exportCharacters(List<CharacterEntity> characters) async {
    final excel = Excel.createExcel();

    final Sheet sheet = excel['Characters'];

    sheet.appendRow([
      TextCellValue('Name'),
      TextCellValue('Status'),
      TextCellValue('Species'),
      TextCellValue('Gender'),
    ]);

    for (final character in characters) {
      sheet.appendRow([
        TextCellValue(character.name),
        TextCellValue(character.status),
        TextCellValue(character.species),
        TextCellValue(character.gender),
      ]);
    }

    final directory = await getApplicationDocumentsDirectory();

    final file = File('${directory.path}/characters.xlsx');

    final bytes = excel.save();

    if (bytes != null) {
      await file.writeAsBytes(bytes);
    }

    await OpenFilex.open(file.path);
  }
}
