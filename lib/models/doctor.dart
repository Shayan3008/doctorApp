class Doctor {
  Detail name;
  PersonalDetails obj1;
  Doctor({required this.name, required this.obj1});
}

class PersonalDetails {
  Detail phone, email, address, city, state, preCode;
  PersonalDetails({
    required this.phone,
    required this.email,
    required this.address,
    required this.city,
    required this.state,
    required this.preCode,
  });
}

class Detail {
  String data;
  bool edit;
  Detail(this.data, this.edit);
}

class DetailList {
  List<String> data;
  bool edit;
  DetailList(this.data, this.edit);
}

class CareerDetails {
  Detail degrees, hospitalAttention, proffesionalMembership;
  DetailList awards;
  DetailList expertiese;
  CareerDetails({
    required this.degrees,
    required this.hospitalAttention,
    required this.proffesionalMembership,
    required this.awards,
    required this.expertiese,
  });
}
