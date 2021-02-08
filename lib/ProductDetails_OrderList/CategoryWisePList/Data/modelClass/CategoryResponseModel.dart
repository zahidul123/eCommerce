class CategoryResponseModel {
  String total;
  List<BookList> bookList;
  bool success;
  String q;

  CategoryResponseModel({this.total, this.bookList, this.success, this.q});

  CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['book_list'] != null) {
      bookList = new List<BookList>();
      json['book_list'].forEach((v) {
        bookList.add(new BookList.fromJson(v));
      });
    }
    success = json['success'];
    q = json['q'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.bookList != null) {
      data['book_list'] = this.bookList.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['q'] = this.q;
    return data;
  }
}

class BookList {
  String bookId;
  String userId;
  String publisherId;
  String authorId;
  String categoryId;
  Null discountId;
  String bookName;
  String sellingPrice;
  String costPrice;
  String usdPrice;
  String audioBookPrice;
  String hardcoverPrice;
  String ebookPrice;
  String country;
  String picture;
  String book;
  String bookPreview;
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
  Null reviewRating;
  String updated_by;

  BookList(
      {this.bookId,
        this.userId,
        this.publisherId,
        this.authorId,
        this.categoryId,
        this.discountId,
        this.bookName,
        this.sellingPrice,
        this.costPrice,
        this.usdPrice,
        this.audioBookPrice,
        this.hardcoverPrice,
        this.ebookPrice,
        this.country,
        this.picture,
        this.book,
        this.bookPreview,
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
        this.updated_by});

  BookList.fromJson(Map<String, dynamic> json) {
    bookId = json['book_id'];
    userId = json['user_id'];
    publisherId = json['publisher_id'];
    authorId = json['author_id'];
    categoryId = json['category_id'];
    discountId = json['discount_id'];
    bookName = json['book_name'];
    sellingPrice = json['selling_price'];
    costPrice = json['cost_price'];
    usdPrice = json['usd_price'];
    audioBookPrice = json['audio_book_price'];
    hardcoverPrice = json['hardcover_price'];
    ebookPrice = json['ebook_price'];
    country = json['country'];
    picture = json['picture'];
    book = json['book'];
    bookPreview = json['book_preview'];
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
    updated_by = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['book_id'] = this.bookId;
    data['user_id'] = this.userId;
    data['publisher_id'] = this.publisherId;
    data['author_id'] = this.authorId;
    data['category_id'] = this.categoryId;
    data['discount_id'] = this.discountId;
    data['book_name'] = this.bookName;
    data['selling_price'] = this.sellingPrice;
    data['cost_price'] = this.costPrice;
    data['usd_price'] = this.usdPrice;
    data['audio_book_price'] = this.audioBookPrice;
    data['hardcover_price'] = this.hardcoverPrice;
    data['ebook_price'] = this.ebookPrice;
    data['country'] = this.country;
    data['picture'] = this.picture;
    data['book'] = this.book;
    data['book_preview'] = this.bookPreview;
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
    data['updated_by'] = this.updated_by;
    return data;
  }
}