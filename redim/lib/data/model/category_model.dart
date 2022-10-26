class CategoryModel {
  bool? status;
  Data? data;

  CategoryModel({this.status, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  List<Categories>? categories;

  Data({this.categories});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? nameEn;
  String? nameBn;
  String? slug;
  String? icon;
  String? color;
  int? isTop;
  int? isActive;
  int? priority;
  String? name;

  Categories(
      {this.id,
      this.nameEn,
      this.nameBn,
      this.slug,
      this.icon,
      this.color,
      this.isTop,
      this.isActive,
      this.priority,
      this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameBn = json['name_bn'];
    slug = json['slug'];
    icon = json['icon'];
    color = json['color'];
    isTop = json['is_top'];
    isActive = json['is_active'];
    priority = json['priority'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_en'] = nameEn;
    data['name_bn'] = nameBn;
    data['slug'] = slug;
    data['icon'] = icon;
    data['color'] = color;
    data['is_top'] = isTop;
    data['is_active'] = isActive;
    data['priority'] = priority;
    data['name'] = name;
    return data;
  }
}
