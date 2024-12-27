class NoteModal {
  final String note;

  NoteModal({required this.note});

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
