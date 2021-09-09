// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

SignupUser categoryFromJson(String str) => SignupUser.fromJson(json.decode(str));

String categoryToJson(SignupUser data) => json.encode(data.toJson());

class SignupUser {
    SignupUser({
        this.fullName,
        this.email,
        this.contactNo,
        this.city,
        this.country,
        this.age,
        this.password,
        this.town,
        this.district,
        this.nysCallUpNo,
        this.placeofPrimaryAssignment,
        this.localGovtArea,
        this.communityDevelopmentProject,
        this.locationOfProject,
        this.dateofRegistration,
        this.periodInstitutionQualification,
        this.areaofSpecialization,
        this.districtofOrigin,
        this.employeerDuringPrimaryAssignment,
        this.communityofPrimaryAssignment,
        this.typeOfAssignment,
        this.periodCoveredByreport,
    });

    String fullName;
    String email;
    String contactNo;
    String city;
    String country;
    int age;
    String password;
    String town;
    String district;
    String nysCallUpNo;
    String placeofPrimaryAssignment;
    String localGovtArea;
    String communityDevelopmentProject;
    String locationOfProject;
    String dateofRegistration;
    String periodInstitutionQualification;
    String areaofSpecialization;
    String districtofOrigin;
    String employeerDuringPrimaryAssignment;
    String communityofPrimaryAssignment;
    String typeOfAssignment;
    String periodCoveredByreport;

    factory SignupUser.fromJson(Map<String, dynamic> json) => SignupUser(
        fullName: json["FullName"],
        email: json["Email"],
        contactNo: json["ContactNo"],
        city: json["City"],
        country: json["Country"],
        age: json["Age"],
        password: json["Password"],
        town: json["Town"],
        district: json["District"],
        nysCallUpNo: json["NYSCallUpNo"],
        placeofPrimaryAssignment: json["PlaceofPrimaryAssignment"],
        localGovtArea: json["LocalGovtArea"],
        communityDevelopmentProject: json["CommunityDevelopmentProject"],
        locationOfProject: json["LocationOfProject"],
        dateofRegistration: json["DateofRegistration"],
        periodInstitutionQualification: json["Period_Institution_Qualification"],
        areaofSpecialization: json["AreaofSpecialization"],
        districtofOrigin: json["DistrictofOrigin"],
        employeerDuringPrimaryAssignment: json["EmployeerDuringPrimaryAssignment"],
        communityofPrimaryAssignment: json["CommunityofPrimaryAssignment"],
        typeOfAssignment: json["TypeOfAssignment"],
        periodCoveredByreport: json["PeriodCoveredByreport"],
    );

    Map<String, dynamic> toJson() => {
        "FullName": fullName,
        "Email": email,
        "ContactNo": contactNo,
        "City": city,
        "Country": country,
        "Age": age,
        "Password": password,
        "Town": town,
        "District": district,
        "NYSCallUpNo": nysCallUpNo,
        "PlaceofPrimaryAssignment": placeofPrimaryAssignment,
        "LocalGovtArea": localGovtArea,
        "CommunityDevelopmentProject": communityDevelopmentProject,
        "LocationOfProject": locationOfProject,
        "DateofRegistration": dateofRegistration,
        "Period_Institution_Qualification": periodInstitutionQualification,
        "AreaofSpecialization": areaofSpecialization,
        "DistrictofOrigin": districtofOrigin,
        "EmployeerDuringPrimaryAssignment": employeerDuringPrimaryAssignment,
        "CommunityofPrimaryAssignment": communityofPrimaryAssignment,
        "TypeOfAssignment": typeOfAssignment,
        "PeriodCoveredByreport": periodCoveredByreport,
    };
}
