class NoteModel {
  int? _id;
  String _title;
  String? _description;

  NoteModel(
    this._id,
    this._title,
    this._description,
  );

  int get id => _id!;

  String get title => _title;

  String get desc => _description!;

  // set the title
  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

// set the title end

  // set the description
  set desc(String newDesc) {
    if (newDesc.length <= 255) {
      this._description = newDesc;
    }
  }

// set the description end

  Map<String, dynamic> toMap() {
    if (id != null) {
      return {
        'id': _id,
      };
    }
    return {
      "id": this._id,
      "title": this._title,
      "description": this._description,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      map['id'],
      map['title'],
      map['description'],
    );
  }
}
