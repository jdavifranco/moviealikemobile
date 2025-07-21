// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_analysis_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieAnalysisDto _$MovieAnalysisDtoFromJson(Map<String, dynamic> json) =>
    MovieAnalysisDto(
      title: json['title'] as String,
      themes: Map<String, String>.from(json['themes'] as Map),
      emotionalImpact: json['emotionalImpact'] as String,
      socialRelevance: json['socialRelevance'] as String,
    );
