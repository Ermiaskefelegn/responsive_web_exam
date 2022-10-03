// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    this.items,
    this.count,
    this.scannedCount,
    this.responseMetadata,
  });

  List<Item>? items;
  int? count;
  int? scannedCount;
  ResponseMetadata? responseMetadata;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        items: List<Item>.from(json["Items"].map((x) => Item.fromJson(x))),
        count: json["Count"],
        scannedCount: json["ScannedCount"],
        responseMetadata: ResponseMetadata.fromJson(json["ResponseMetadata"]),
      );

  Map<String, dynamic> toJson() => {
        "Items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "Count": count,
        "ScannedCount": scannedCount,
        "ResponseMetadata": responseMetadata!.toJson(),
      };
}

class Item {
  Item({
    this.id,
    this.price,
    this.image,
    this.title,
  });

  Id? id;
  Price? price;
  Id? image;
  Id? title;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: Id.fromJson(json["id"]),
        price: Price.fromJson(json["price"]),
        image: Id.fromJson(json["image"]),
        title: Id.fromJson(json["title"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id!.toJson(),
        "price": price!.toJson(),
        "image": image!.toJson(),
        "title": title!.toJson(),
      };
}

class Id {
  Id({
    this.s,
  });

  String? s;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        s: json["S"],
      );

  Map<String, dynamic> toJson() => {
        "S": s,
      };
}

class Price {
  Price({
    this.n,
  });

  String? n;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        n: json["N"],
      );

  Map<String, dynamic> toJson() => {
        "N": n,
      };
}

class ResponseMetadata {
  ResponseMetadata({
    this.requestId,
    this.httpStatusCode,
    this.httpHeaders,
    this.retryAttempts,
  });

  String? requestId;
  int? httpStatusCode;
  HttpHeaders? httpHeaders;
  int? retryAttempts;

  factory ResponseMetadata.fromJson(Map<String, dynamic> json) =>
      ResponseMetadata(
        requestId: json["RequestId"],
        httpStatusCode: json["HTTPStatusCode"],
        httpHeaders: HttpHeaders.fromJson(json["HTTPHeaders"]),
        retryAttempts: json["RetryAttempts"],
      );

  Map<String, dynamic> toJson() => {
        "RequestId": requestId,
        "HTTPStatusCode": httpStatusCode,
        "HTTPHeaders": httpHeaders!.toJson(),
        "RetryAttempts": retryAttempts,
      };
}

class HttpHeaders {
  HttpHeaders({
    this.server,
    this.date,
    this.contentType,
    this.contentLength,
    this.connection,
    this.xAmznRequestid,
    this.xAmzCrc32,
  });

  String? server;
  String? date;
  String? contentType;
  String? contentLength;
  String? connection;
  String? xAmznRequestid;
  String? xAmzCrc32;

  factory HttpHeaders.fromJson(Map<String, dynamic> json) => HttpHeaders(
        server: json["server"],
        date: json["date"],
        contentType: json["content-type"],
        contentLength: json["content-length"],
        connection: json["connection"],
        xAmznRequestid: json["x-amzn-requestid"],
        xAmzCrc32: json["x-amz-crc32"],
      );

  Map<String, dynamic> toJson() => {
        "server": server,
        "date": date,
        "content-type": contentType,
        "content-length": contentLength,
        "connection": connection,
        "x-amzn-requestid": xAmznRequestid,
        "x-amz-crc32": xAmzCrc32,
      };
}
