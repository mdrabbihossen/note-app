// class Notes {
//   int? id;
//   late String title;
//   String? desc;
//   late String date;
//   late int priority;
//   Notes({
//     this.id,
//     required this.title,
//     required this.date,
//     required this.priority,
//     this.desc,
//   });
//   // get method
//   int get getId => id ?? 0;
//   String get getTitle => title;
//   String? get getDesc => desc;
//   String get getDate => date;
//   int get getPriority => priority;

//   // set method

//   // set title
//   set getTitle(String newTitle) {
//     this.title = newTitle;
//   }

//   // set description
//   set getDesc(String? newDesc) {
//     this.desc = newDesc;
//   }

//   // set priority
//   set getPriority(int newPriority) {
//     if (newPriority >= 1 && newPriority <= 2) {
//       this.priority = newPriority;
//     }
//   }

//   // set date
//   set getDate(String newDate) {
//     this.date = newDate;
//   }

//   // convert to map
//   Map<String, dynamic> toMap() {
//     var map = Map<String, dynamic>();
//     if (id != null) {
//       map['id'] = id;
//     }
//     map['title'] = title;
//     map['desc'] = desc;
//     map['date'] = date;
//     map['priority'] = priority;
//     return map;
//   }

//   // extract a note object from a map object
//   Notes.fromMapObject(Map<String, dynamic> map) {
//     this.id = map['id'];
//     this.title = map['title'];
//     this.desc = map['desc'];
//     this.date = map['date'];
//     this.priority = map['priority'];
//   }
  
// }
