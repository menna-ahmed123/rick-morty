import 'package:injectable/injectable.dart';
import 'package:task/core/services/excel_service.dart';
import 'package:task/feature/home/domain/entities/character_entity.dart';

@lazySingleton
class ExportCharactersUseCase {
  final ExcelService excelService;

  ExportCharactersUseCase({required this.excelService});

  Future<void> call(List<CharacterEntity> characters) {
    return excelService.exportCharacters(characters);
  }
}
