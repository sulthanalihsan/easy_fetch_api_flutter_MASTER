class Meal {
  String idMeal;
  String strMeal;
  String strInstructions;
  String strMealThumb;
  String strCategory;

  Meal({
    this.idMeal,
    this.strMeal,
    this.strInstructions,
    this.strMealThumb,
    this.strCategory,
  });

  Meal.fromJson(Map<String, dynamic> json) {
    idMeal = json['idMeal'];
    strMeal = json['strMeal'];
    strInstructions = json['strInstructions'];
    strMealThumb = json['strMealThumb'];
    strCategory = json['strCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idMeal'] = this.idMeal;
    data['strMeal'] = this.strMeal;
    data['strInstructions'] = this.strInstructions;
    data['strMealThumb'] = this.strMealThumb;
    data['strCategory'] = this.strCategory;
    return data;
  }

  void setFavoriteId(String id) {
    this.idMeal = id;
  }
}
