class ProductList {
  final String? sName;
  final int? pQuantity;
  final double? pPrice;
  final String? pImage;
  final String? cImage;
  final String? cName;

  ProductList({this.sName, this.pQuantity, this.pPrice, this.pImage, this.cName, this.cImage});
}

List productImageList = [
  {
    "typeImage": "assets/images/relevant/type.png",
    "categoryImage": "assets/images/relevant/category.png",
    "brandImage": "assets/images/relevant/brand.png",
    "colorImage": "assets/images/relevant/color.png",
  }
];

List users = [
  {"pQuantity": 1, "pPrice": 100.0, "pName": "Product", "pImage": "assets/images/women_prod/2.png"},
  {"pQuantity": 1, "pPrice": 150.0, "pName": "Produ", "pImage": "assets/images/women_prod/3.png"},
  {"pQuantity": 1, "pPrice": 200.0, "pName": "Name", "pImage": "assets/images/women_prod/4.png"},
  {"pQuantity": 1, "pPrice": 250.0, "pName": "Demo", "pImage": "assets/images/women_prod/5.png"},
  {"pQuantity": 1, "pPrice": 300.0, "pName": "Demo Prod", "pImage": "assets/images/women_prod/6.png"},
  {"pQuantity": 1, "pPrice": 50.0, "pName": "Lens ", "pImage": "assets/images/women_prod/1.png"},
];
