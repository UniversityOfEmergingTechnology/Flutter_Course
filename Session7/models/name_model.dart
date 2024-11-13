class Name{
  Name({required this.first, required this.last, this.title});
  String? title;
  String first;
  String last;
  String get fullName => '$title $first $last' ;
  factory Name.fromJson(Map<String, dynamic> jsonObject){
    return Name(first: jsonObject['first'], last: jsonObject['last'], title: jsonObject['title']);
  }
}