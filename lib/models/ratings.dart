class Ratings {
  final String id;
  final int rate;
  final String userId;
  // final String recipeId;

  Ratings({this.id, this.rate, this.userId});

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'rate': this.rate,
      'userId': this.userId,
      // 'customerId': this.customerId,
      // 'recipeId': this.recipeId,
    };
  }
}
