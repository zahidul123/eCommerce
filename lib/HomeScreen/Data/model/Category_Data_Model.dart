class CategoryDataModel {
  int total;
  bool success;
  List<CatList> catList;

  CategoryDataModel({this.total, this.success, this.catList});

  CategoryDataModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    success = json['success'];
    if (json['catList'] != null) {
      catList = new List<CatList>();
      json['catList'].forEach((v) {
        catList.add(new CatList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['success'] = this.success;
    if (this.catList != null) {
      data['catList'] = this.catList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CatList {
  String categoryId;
  String categoryName;
  String categoryCode;
  String description;
  String picture;
  String ipAddress;
  String createdBy;
  String updatedBy;
  String created;
  String updated;

  CatList(
      {this.categoryId,
        this.categoryName,
        this.categoryCode,
        this.description,
        this.picture,
        this.ipAddress,
        this.createdBy,
        this.updatedBy,
        this.created,
        this.updated});

  CatList.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryCode = json['category_code'];
    description = json['description'];
    picture = json['picture'];
    ipAddress = json['ipAddress'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_code'] = this.categoryCode;
    data['description'] = this.description;
    data['picture'] = this.picture;
    data['ipAddress'] = this.ipAddress;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}