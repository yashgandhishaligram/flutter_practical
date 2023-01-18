class BusinessTypeModel {
  BusinessTypeModel({
      this.id, 
      this.name, 
      this.description, 
      this.displayOrder,
    this.isSelected = false});

  BusinessTypeModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    displayOrder = json['display_order'];
    isSelected = false;

  }

  String? id;
  String? name;
  String? description;
  String? displayOrder;
  bool? isSelected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['display_order'] = displayOrder;
    map['is_selected'] = isSelected;
    return map;
  }

}