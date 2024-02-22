import 'dart:convert';

class UserResponse {
    List<Datum>? data;

    UserResponse({
        this.data,
    });

    UserResponse copyWith({
        List<Datum>? data,
    }) => 
        UserResponse(
            data: data ?? this.data,
        );

    factory UserResponse.fromJson(String str) => UserResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserResponse.fromMap(Map<String, dynamic> json) => UserResponse(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    };
}

class Datum {
    String? eic;
    String? idNo;
    int? recNo;
    String? firstName;
    String? lastName;
    String? middleName;
    String? extName;
    String? birthdate;
    String? birthplace;
    String? fullnameFirst;
    String? fullnameLast;
    String? designation;
    String? empGroupCode;
    dynamic payGroupCode;
    String? schemeCode;
    String? officeCode;
    String? statusCode;

    Datum({
        this.eic,
        this.idNo,
        this.recNo,
        this.firstName,
        this.lastName,
        this.middleName,
        this.extName,
        this.birthdate,
        this.birthplace,
        this.fullnameFirst,
        this.fullnameLast,
        this.designation,
        this.empGroupCode,
        this.payGroupCode,
        this.schemeCode,
        this.officeCode,
        this.statusCode,
    });

    Datum copyWith({
        String? eic,
        String? idNo,
        int? recNo,
        String? firstName,
        String? lastName,
        String? middleName,
        String? extName,
        String? birthdate,
        String? birthplace,
        String? fullnameFirst,
        String? fullnameLast,
        String? designation,
        String? empGroupCode,
        dynamic payGroupCode,
        String? schemeCode,
        String? officeCode,
        String? statusCode,
    }) => 
        Datum(
            eic: eic ?? this.eic,
            idNo: idNo ?? this.idNo,
            recNo: recNo ?? this.recNo,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            middleName: middleName ?? this.middleName,
            extName: extName ?? this.extName,
            birthdate: birthdate ?? this.birthdate,
            birthplace: birthplace ?? this.birthplace,
            fullnameFirst: fullnameFirst ?? this.fullnameFirst,
            fullnameLast: fullnameLast ?? this.fullnameLast,
            designation: designation ?? this.designation,
            empGroupCode: empGroupCode ?? this.empGroupCode,
            payGroupCode: payGroupCode ?? this.payGroupCode,
            schemeCode: schemeCode ?? this.schemeCode,
            officeCode: officeCode ?? this.officeCode,
            statusCode: statusCode ?? this.statusCode,
        );

    factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        eic: json["EIC"],
        idNo: json["idNo"],
        recNo: json["recNo"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        middleName: json["middleName"],
        extName: json["extName"],
        birthdate: json["birthdate"],
        birthplace: json["birthplace"],
        fullnameFirst: json["fullnameFirst"],
        fullnameLast: json["fullnameLast"],
        designation: json["designation"],
        empGroupCode: json["empGroupCode"],
        payGroupCode: json["payGroupCode"],
        schemeCode: json["SchemeCode"],
        officeCode: json["officeCode"],
        statusCode: json["statusCode"],
    );

    Map<String, dynamic> toMap() => {
        "EIC": eic,
        "idNo": idNo,
        "recNo": recNo,
        "firstName": firstName,
        "lastName": lastName,
        "middleName": middleName,
        "extName": extName,
        "birthdate": birthdate,
        "birthplace": birthplace,
        "fullnameFirst": fullnameFirst,
        "fullnameLast": fullnameLast,
        "designation": designation,
        "empGroupCode": empGroupCode,
        "payGroupCode": payGroupCode,
        "SchemeCode": schemeCode,
        "officeCode": officeCode,
        "statusCode": statusCode,
    };
}
