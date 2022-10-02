class NoteModel {
  int? _id;
  String _title;
  String? _description;
  String _date;
  int _priority;

  NoteModel(
    this._id,
    this._title,
    this._description,
    this._date,
    this._priority,
  );

  int get id => _id!;

  String get title => _title;

  String get desc => _description!;

  String get date => _date;

  int get priority => _priority;

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

  // set the priority
  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

// set the priority end
// set date
  set date(String newDate) {
    this._date = newDate;
  }

  // set date end

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
      "date": this._date,
      "priority": this._priority,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      map['id'],
      map['title'],
      map['description'],
      map['date'],
      map['priority'],
    );
  }
}
