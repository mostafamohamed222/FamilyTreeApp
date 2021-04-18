class MemberModel {
  String id, name, image, job, city, gender;
  String age;
  int numberOfSons = 2;
  List<dynamic> sons, parents, couple;
  List<dynamic> allsons = [];
  List<dynamic> allparents = [];
  List<dynamic> allcouples = [];
  int nodeNumber = 0;

  void setNodeMember(int x) {
    nodeNumber = x;
  }

  MemberModel({
    this.id,
    this.name,
    this.image,
    this.job,
    this.age,
    this.gender,
    this.city,
    this.sons,
    this.parents,
    this.couple,
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
