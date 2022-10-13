List<Data> datasFromJson(List list){
 return list.map((e) => Data.fromJson(e)).toList();
}

class Data {
  String? pName;
  int? pId;
  int? pCost;
  int? pAvailability;
  String? pDetails;
  String? pCategory;
  String? pImage;
  int? count;

  Data(
      {this.pName,
      this.pId,
      this.pCost,
      this.pAvailability,
      this.pDetails,
      this.pCategory,
      this.pImage,
      this.count
      }
      );

  Data.fromJson(Map<String, dynamic> json) {
    pName = json['p_name'];
    pId = json['p_id'];
    pCost = json['p_cost'];
    pAvailability = json['p_availability'];
    pDetails = json['p_details']??" ";
    pCategory = json['p_category']??"";
    pImage=json['image'];
    count = json['count']??0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['p_name'] = pName;
    data['p_id'] = pId;
    data['p_cost'] = pCost;
    data['p_availability'] = pAvailability;
    data['p_details'] = pDetails;
    data['p_category'] = pCategory;
    
    return data;
  }
}
