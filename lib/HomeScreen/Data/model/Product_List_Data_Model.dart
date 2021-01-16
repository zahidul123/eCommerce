class ProductListDataModel {
  String total;
  List<ProductList> productList;
  bool success;
  String q;

  ProductListDataModel({this.total, this.productList, this.success, this.q});

  ProductListDataModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['product_list'] != null) {
      productList = new List<ProductList>();
      json['product_list'].forEach((v) {
        productList.add(new ProductList.fromJson(v));
      });
    }
    success = json['success'];
    q = json['q'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.productList != null) {
      data['product_list'] = this.productList.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['q'] = this.q;
    return data;
  }
}

class ProductList {
  String productId;
  String userId;
  String publisherId;
  String authorId;
  String categoryId;
  String discountId;
  String productName;
  String sellingPrice;
  String costPrice;
  String usdPrice;
  String audioProductPrice;
  String hardcoverPrice;
  String eproductPrice;
  String country;
  String picture;
  String product;
  String productPreview;
  String isbn;
  String language;
  String cover;
  String issn;
  String additionalAuthor;
  String translator;
  String distributor;
  String designer;
  String editor;
  String sharEEditor;
  String edition;
  String totalPage;
  String description;
  String isPopular;
  String isBestSeller;
  String isNew;
  String isPublished;
  String publishedAt;
  String additionalNote;
  String additionalImage;
  String tags;
  Null videoLink;
  String ipAddress;
  String createdBy;
  String updatedBy;
  String created;
  String updated;
  String firstName;
  Null lastName;
  String authorName;
  String categoryName;
  String publisherName;
  Null expiryDate;
  Null discount;
  Null type;
  String totalReviews;
  String reviewRating;
  String updated_By;

  ProductList(
      {this.productId,
        this.userId,
        this.publisherId,
        this.authorId,
        this.categoryId,
        this.discountId,
        this.productName,
        this.sellingPrice,
        this.costPrice,
        this.usdPrice,
        this.audioProductPrice,
        this.hardcoverPrice,
        this.eproductPrice,
        this.country,
        this.picture,
        this.product,
        this.productPreview,
        this.isbn,
        this.language,
        this.cover,
        this.issn,
        this.additionalAuthor,
        this.translator,
        this.distributor,
        this.designer,
        this.editor,
        this.sharEEditor,
        this.edition,
        this.totalPage,
        this.description,
        this.isPopular,
        this.isBestSeller,
        this.isNew,
        this.isPublished,
        this.publishedAt,
        this.additionalNote,
        this.additionalImage,
        this.tags,
        this.videoLink,
        this.ipAddress,
        this.createdBy,
        this.updatedBy,
        this.created,
        this.updated,
        this.firstName,
        this.lastName,
        this.authorName,
        this.categoryName,
        this.publisherName,
        this.expiryDate,
        this.discount,
        this.type,
        this.totalReviews,
        this.reviewRating,
        this.updated_By});

  ProductList.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    userId = json['user_id'];
    publisherId = json['publisher_id'];
    authorId = json['author_id'];
    categoryId = json['category_id'];
    discountId = json['discount_id'];
    productName = json['product_name'];
    sellingPrice = json['selling_price'];
    costPrice = json['cost_price'];
    usdPrice = json['usd_price'];
    audioProductPrice = json['audio_product_price'];
    hardcoverPrice = json['hardcover_price'];
    eproductPrice = json['eproduct_price'];
    country = json['country'];
    picture = json['picture'];
    product = json['product'];
    productPreview = json['product_preview'];
    isbn = json['isbn'];
    language = json['language'];
    cover = json['cover'];
    issn = json['issn'];
    additionalAuthor = json['additional_author'];
    translator = json['translator'];
    distributor = json['distributor'];
    designer = json['designer'];
    editor = json['editor'];
    sharEEditor = json['shar_e_editor'];
    edition = json['edition'];
    totalPage = json['total_page'];
    description = json['description'];
    isPopular = json['is_popular'];
    isBestSeller = json['is_best_seller'];
    isNew = json['is_new'];
    isPublished = json['is_published'];
    publishedAt = json['published_at'];
    additionalNote = json['additional_note'];
    additionalImage = json['additional_image'];
    tags = json['tags'];
    videoLink = json['video_link'];
    ipAddress = json['ipAddress'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    created = json['created'];
    updated = json['updated'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    authorName = json['author_name'];
    categoryName = json['category_name'];
    publisherName = json['publisher_name'];
    expiryDate = json['expiry_date'];
    discount = json['discount'];
    type = json['type'];
    totalReviews = json['total_reviews'];
    reviewRating = json['review_rating'];
    updated_By = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    data['publisher_id'] = this.publisherId;
    data['author_id'] = this.authorId;
    data['category_id'] = this.categoryId;
    data['discount_id'] = this.discountId;
    data['product_name'] = this.productName;
    data['selling_price'] = this.sellingPrice;
    data['cost_price'] = this.costPrice;
    data['usd_price'] = this.usdPrice;
    data['audio_product_price'] = this.audioProductPrice;
    data['hardcover_price'] = this.hardcoverPrice;
    data['eproduct_price'] = this.eproductPrice;
    data['country'] = this.country;
    data['picture'] = this.picture;
    data['product'] = this.product;
    data['product_preview'] = this.productPreview;
    data['isbn'] = this.isbn;
    data['language'] = this.language;
    data['cover'] = this.cover;
    data['issn'] = this.issn;
    data['additional_author'] = this.additionalAuthor;
    data['translator'] = this.translator;
    data['distributor'] = this.distributor;
    data['designer'] = this.designer;
    data['editor'] = this.editor;
    data['shar_e_editor'] = this.sharEEditor;
    data['edition'] = this.edition;
    data['total_page'] = this.totalPage;
    data['description'] = this.description;
    data['is_popular'] = this.isPopular;
    data['is_best_seller'] = this.isBestSeller;
    data['is_new'] = this.isNew;
    data['is_published'] = this.isPublished;
    data['published_at'] = this.publishedAt;
    data['additional_note'] = this.additionalNote;
    data['additional_image'] = this.additionalImage;
    data['tags'] = this.tags;
    data['video_link'] = this.videoLink;
    data['ipAddress'] = this.ipAddress;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['author_name'] = this.authorName;
    data['category_name'] = this.categoryName;
    data['publisher_name'] = this.publisherName;
    data['expiry_date'] = this.expiryDate;
    data['discount'] = this.discount;
    data['type'] = this.type;
    data['total_reviews'] = this.totalReviews;
    data['review_rating'] = this.reviewRating;
    data['updated_by'] = this.updated_By;
    return data;
  }
}