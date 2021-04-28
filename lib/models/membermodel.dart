class MemberModel {
  String id, name, image, job, city, gender, phone, alive, type, email,add;
  String dyear = "", dmon = "", dday = "";
  String age;
  List<dynamic> sons, parents, couple;
  List<dynamic> allsons = [];
  List<dynamic> allparents = [];
  List<dynamic> allcouples = [];
  int nodeNumber = 0;

  void setNodeMember(int x) {
    nodeNumber = x;
  }

  MemberModel({
    this.type,
    this.dday,
    this.dyear,
    this.dmon,
    this.phone,
    this.id,
    this.name,
    this.image,
    this.email,
    this.job,
    this.age,
    this.gender,
    this.city,
    this.add,
    this.sons,
    this.parents,
    this.couple,
    this.alive,
  });

  void printModel() {
    print(name);
    print(age);
    print(image);
    print(city);
    print(job);
    print(sons);
    print(parents);
  }
}