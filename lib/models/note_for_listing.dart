// Utilisez ? pour indiquer que la valeur peut être nulle

class NoteForListing {
  final String noteID;
  final String noteTitle;
  final DateTime? createDateTime;
  final DateTime? latestEditDateTime;

  NoteForListing({
    required this.noteID,
    required this.noteTitle,
    required this.createDateTime,
    required this.latestEditDateTime,
  });
}
