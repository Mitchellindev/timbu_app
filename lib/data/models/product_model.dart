class ProductModel {
  ProductModel({
    required this.page,
    required this.size,
    required this.total,
    required this.debug,
    required this.previousPage,
    required this.nextPage,
    required this.items,
  });

  final int? page;
  final int? size;
  final int? total;
  final dynamic debug;
  final dynamic previousPage;
  final dynamic nextPage;
  final List<Item> items;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      page: json["page"],
      size: json["size"],
      total: json["total"],
      debug: json["debug"],
      previousPage: json["previous_page"],
      nextPage: json["next_page"],
      items: json["items"] == null
          ? []
          : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "page": page,
        "size": size,
        "total": total,
        "debug": debug,
        "previous_page": previousPage,
        "next_page": nextPage,
        "items": items.map((x) => x.toJson()).toList(),
      };
}

class Item {
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

  final String? name;
  final String? description;
  final String? uniqueId;
  final String? urlSlug;
  final bool? isAvailable;
  final bool? isService;
  final dynamic previousUrlSlugs;
  final bool? unavailable;
  final dynamic unavailableStart;
  final dynamic unavailableEnd;
  final String? id;
  final dynamic parentProductId;
  final dynamic parent;
  final String? organizationId;
  final List<dynamic> productImage;
  final List<dynamic> categories;
  final DateTime? dateCreated;
  final DateTime? lastUpdated;
  final String? userId;
  final List<Photo> photos;
  final List<CurrentPrice> currentPrice;
  final bool? isDeleted;
  final double? availableQuantity;
  //TODO: Here

  final dynamic sellingPrice;
  final dynamic discountedPrice;
  final dynamic buyingPrice;
  final dynamic extraInfos;

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json["name"],
      description: json["description"],
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
      organizationId: json["organization_id"],
      productImage: json["product_image"] == null
          ? []
          : List<dynamic>.from(json["product_image"]!.map((x) => x)),
      categories: json["categories"] == null
          ? []
          : List<dynamic>.from(json["categories"]!.map((x) => x)),
      dateCreated: DateTime.tryParse(json["date_created"] ?? ""),
      lastUpdated: DateTime.tryParse(json["last_updated"] ?? ""),
      userId: json["user_id"],
      photos: json["photos"] == null
          ? []
          : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
      currentPrice: json["current_price"] == null
          ? []
          : List<CurrentPrice>.from(
              json["current_price"]!.map((x) => CurrentPrice.fromJson(x))),
      isDeleted: json["is_deleted"],
      availableQuantity: json["available_quantity"],
      sellingPrice: json["selling_price"],
      discountedPrice: json["discounted_price"],
      buyingPrice: json["buying_price"],
      extraInfos: json["extra_infos"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
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
        "organization_id": organizationId,
        "product_image": productImage.map((x) => x).toList(),
        "categories": categories.map((x) => x).toList(),
        "date_created": dateCreated?.toIso8601String(),
        "last_updated": lastUpdated?.toIso8601String(),
        "user_id": userId,
        "photos": photos.map((x) => x.toJson()).toList(),
        "current_price": currentPrice.map((x) => x.toJson()).toList(),
        "is_deleted": isDeleted,
        "available_quantity": availableQuantity,
        "selling_price": sellingPrice,
        "discounted_price": discountedPrice,
        "buying_price": buyingPrice,
        "extra_infos": extraInfos,
      };
}

class CurrentPrice {
  CurrentPrice({
    required this.ngn,
  });

  final List<dynamic> ngn;

  factory CurrentPrice.fromJson(Map<String, dynamic> json) {
    return CurrentPrice(
      ngn: json["NGN"] == null
          ? []
          : List<dynamic>.from(json["NGN"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "NGN": ngn.map((x) => x).toList(),
      };
}

class Photo {
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

  final String? modelName;
  final String? modelId;
  final String? organizationId;
  final String? filename;
  final String? url;
  final bool? isFeatured;
  final bool? saveAsJpg;
  final bool? isPublic;
  final bool? fileRename;
  final int? position;

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      modelName: json["model_name"],
      modelId: json["model_id"],
      organizationId: json["organization_id"],
      filename: json["filename"],
      url: json["url"],
      isFeatured: json["is_featured"],
      saveAsJpg: json["save_as_jpg"],
      isPublic: json["is_public"],
      fileRename: json["file_rename"],
      position: json["position"],
    );
  }

  Map<String, dynamic> toJson() => {
        "model_name": modelName,
        "model_id": modelId,
        "organization_id": organizationId,
        "filename": filename,
        "url": url,
        "is_featured": isFeatured,
        "save_as_jpg": saveAsJpg,
        "is_public": isPublic,
        "file_rename": fileRename,
        "position": position,
      };
}
