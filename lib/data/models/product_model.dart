// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  int page;
  int size;
  int total;
  dynamic debug;
  dynamic previousPage;
  dynamic nextPage;
  List<Item> items;

  ProductModel({
    required this.page,
    required this.size,
    required this.total,
    required this.debug,
    required this.previousPage,
    required this.nextPage,
    required this.items,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        page: json["page"],
        size: json["size"],
        total: json["total"],
        debug: json["debug"],
        previousPage: json["previous_page"],
        nextPage: json["next_page"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "size": size,
        "total": total,
        "debug": debug,
        "previous_page": previousPage,
        "next_page": nextPage,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  String name;
  Description? description;
  String uniqueId;
  String urlSlug;
  bool isAvailable;
  bool isService;
  dynamic previousUrlSlugs;
  bool unavailable;
  dynamic unavailableStart;
  dynamic unavailableEnd;
  String id;
  dynamic parentProductId;
  dynamic parent;
  OrganizationId organizationId;
  List<dynamic> productImage;
  List<dynamic> categories;
  DateTime dateCreated;
  DateTime lastUpdated;
  UserId userId;
  List<Photo> photos;
  List<CurrentPrice> currentPrice;
  bool isDeleted;
  int availableQuantity;
  dynamic sellingPrice;
  dynamic discountedPrice;
  dynamic buyingPrice;
  dynamic extraInfos;

  Item({
    required this.name,
    required this.description,
    required this.uniqueId,
    required this.urlSlug,
    required this.isAvailable,
    required this.isService,
    required this.previousUrlSlugs,
    required this.unavailable,
    required this.unavailableStart,
    required this.unavailableEnd,
    required this.id,
    required this.parentProductId,
    required this.parent,
    required this.organizationId,
    required this.productImage,
    required this.categories,
    required this.dateCreated,
    required this.lastUpdated,
    required this.userId,
    required this.photos,
    required this.currentPrice,
    required this.isDeleted,
    required this.availableQuantity,
    required this.sellingPrice,
    required this.discountedPrice,
    required this.buyingPrice,
    required this.extraInfos,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        description: descriptionValues.map[json["description"]]!,
        uniqueId: json["unique_id"],
        urlSlug: json["url_slug"],
        isAvailable: json["is_available"],
        isService: json["is_service"],
        previousUrlSlugs: json["previous_url_slugs"],
        unavailable: json["unavailable"],
        unavailableStart: json["unavailable_start"],
        unavailableEnd: json["unavailable_end"],
        id: json["id"],
        parentProductId: json["parent_product_id"],
        parent: json["parent"],
        organizationId: organizationIdValues.map[json["organization_id"]]!,
        productImage: List<dynamic>.from(json["product_image"].map((x) => x)),
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        dateCreated: DateTime.parse(json["date_created"]),
        lastUpdated: DateTime.parse(json["last_updated"]),
        userId: userIdValues.map[json["user_id"]]!,
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        currentPrice: List<CurrentPrice>.from(
            json["current_price"].map((x) => CurrentPrice.fromJson(x))),
        isDeleted: json["is_deleted"],
        availableQuantity: json["available_quantity"],
        sellingPrice: json["selling_price"],
        discountedPrice: json["discounted_price"],
        buyingPrice: json["buying_price"],
        extraInfos: json["extra_infos"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": descriptionValues.reverse[description],
        "unique_id": uniqueId,
        "url_slug": urlSlug,
        "is_available": isAvailable,
        "is_service": isService,
        "previous_url_slugs": previousUrlSlugs,
        "unavailable": unavailable,
        "unavailable_start": unavailableStart,
        "unavailable_end": unavailableEnd,
        "id": id,
        "parent_product_id": parentProductId,
        "parent": parent,
        "organization_id": organizationIdValues.reverse[organizationId],
        "product_image": List<dynamic>.from(productImage.map((x) => x)),
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "date_created": dateCreated.toIso8601String(),
        "last_updated": lastUpdated.toIso8601String(),
        "user_id": userIdValues.reverse[userId],
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "current_price":
            List<dynamic>.from(currentPrice.map((x) => x.toJson())),
        "is_deleted": isDeleted,
        "available_quantity": availableQuantity,
        "selling_price": sellingPrice,
        "discounted_price": discountedPrice,
        "buying_price": buyingPrice,
        "extra_infos": extraInfos,
      };
}

class CurrentPrice {
  List<dynamic> ngn;

  CurrentPrice({
    required this.ngn,
  });

  factory CurrentPrice.fromJson(Map<String, dynamic> json) => CurrentPrice(
        ngn: List<dynamic>.from(json["NGN"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "NGN": List<dynamic>.from(ngn.map((x) => x)),
      };
}

enum Description { NULL }

final descriptionValues = EnumValues({"null": Description.NULL});

enum OrganizationId { E7907185_A326465_DA7_BAF7277_F8_CCB0_D }

final organizationIdValues = EnumValues({
  "e7907185a326465da7baf7277f8ccb0d":
      OrganizationId.E7907185_A326465_DA7_BAF7277_F8_CCB0_D
});

class Photo {
  ModelName modelName;
  String modelId;
  OrganizationId organizationId;
  String filename;
  String url;
  bool isFeatured;
  bool saveAsJpg;
  bool isPublic;
  bool fileRename;
  int position;

  Photo({
    required this.modelName,
    required this.modelId,
    required this.organizationId,
    required this.filename,
    required this.url,
    required this.isFeatured,
    required this.saveAsJpg,
    required this.isPublic,
    required this.fileRename,
    required this.position,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        modelName: modelNameValues.map[json["model_name"]]!,
        modelId: json["model_id"],
        organizationId: organizationIdValues.map[json["organization_id"]]!,
        filename: json["filename"],
        url: json["url"],
        isFeatured: json["is_featured"],
        saveAsJpg: json["save_as_jpg"],
        isPublic: json["is_public"],
        fileRename: json["file_rename"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "model_name": modelNameValues.reverse[modelName],
        "model_id": modelId,
        "organization_id": organizationIdValues.reverse[organizationId],
        "filename": filename,
        "url": url,
        "is_featured": isFeatured,
        "save_as_jpg": saveAsJpg,
        "is_public": isPublic,
        "file_rename": fileRename,
        "position": position,
      };
}

enum ModelName { PRODUCTS }

final modelNameValues = EnumValues({"products": ModelName.PRODUCTS});

enum UserId { THE_220_EF4_D896_B94_FE183_A38_F42648172_FC }

final userIdValues = EnumValues({
  "220ef4d896b94fe183a38f42648172fc":
      UserId.THE_220_EF4_D896_B94_FE183_A38_F42648172_FC
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
