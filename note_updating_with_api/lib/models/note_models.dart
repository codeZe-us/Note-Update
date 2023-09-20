class NoteForListing {
  String noteId;
  String noteTitle;
  DateTime createDateTime;
  DateTime lastEditDateTime;

  NoteForListing(
      {required this.noteId,
      required this.createDateTime,
      required this.lastEditDateTime,
      required this.noteTitle});
}
