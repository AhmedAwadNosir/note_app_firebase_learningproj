import 'package:flutter/foundation.dart';

class NoteModal {
  final String note;
  String? docId;
  NoteModal({required this.note, @required this.docId});

  factory NoteModal.fromJson(dynamic json) {
    return NoteModal(
      note: json['note'],
    );
  }
  Map<String, dynamic> tojson() {
    return {
      'note': note,
    };
  }
}
