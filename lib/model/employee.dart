import 'dart:convert';

class Employee {
    int? id;
    String? firstName;
    String? lastName;
    String? middleName;
    String? phoneNumber;

    Employee({
        this.id,
        this.firstName,
        this.lastName,
        this.middleName,
        this.phoneNumber,
    });

    Employee copyWith({
        int? id,
        String? firstName,
        String? lastName,
        String? middleName,
        String? phoneNumber,
    }) => 
        Employee(
            id: id ?? this.id,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            middleName: middleName ?? this.middleName,
            phoneNumber: phoneNumber ?? this.phoneNumber,
        );

    factory Employee.fromJson(String str) => Employee.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Employee.fromMap(Map<String, dynamic> json) => Employee(
        id: json["Id"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        middleName: json["MiddleName"],
        phoneNumber: json["PhoneNumber"],
    );

    Map<String, dynamic> toMap() => {
        "Id": id,
        "FirstName": firstName,
        "LastName": lastName,
        "MiddleName": middleName,
        "PhoneNumber": phoneNumber,
    };

    Map<String, dynamic> toMapNoId() => {
        "FirstName": firstName,
        "LastName": lastName,
        "MiddleName": middleName,
        "PhoneNumber": phoneNumber,
    };
}
