// To parse this JSON data, do
//
//     final SignupUser = SignupUserFromJson(jsonString);

import 'dart:convert';

SignupUser signupUserFromJson(String str) => SignupUser.fromJson(json.decode(str));

String signupUserToJson(SignupUser data) => json.encode(data.toJson());

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
        this.description,
        this.userName,
        this.locationOfProject,
        this.dateofRegistration,
        this.periodInstitutionQualification,
        this.areaofSpecialization,
        this.districtofOrigin,
        this.employeerDuringPrimaryAssignment,
        this.communityofPrimaryAssignment,
        this.typeOfAssignment,
        this.periodCoveredByreport,
        this.period,
        this.institution,
        this.qualification,
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
    String description;
    String userName;
    String locationOfProject;
    String dateofRegistration;
    String periodInstitutionQualification;
    String areaofSpecialization;
    String districtofOrigin;
    String employeerDuringPrimaryAssignment;
    String communityofPrimaryAssignment;
    String typeOfAssignment;
    String periodCoveredByreport;
    String period;
    String institution;
    String qualification;

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
        description: json["Description"],
        userName: json["userName"],
        locationOfProject: json["LocationOfProject"],
        dateofRegistration: json["DateofRegistration"],
        periodInstitutionQualification: json["Period_Institution_Qualification"],
        areaofSpecialization: json["AreaofSpecialization"],
        districtofOrigin: json["DistrictofOrigin"],
        employeerDuringPrimaryAssignment: json["EmployeerDuringPrimaryAssignment"],
        communityofPrimaryAssignment: json["CommunityofPrimaryAssignment"],
        typeOfAssignment: json["TypeOfAssignment"],
        periodCoveredByreport: json["PeriodCoveredByreport"],
        period: json["Period"],
        institution: json["Institution"],
        qualification: json["Qualification"],
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
        "Description": description,
"userName": userName,
        "LocationOfProject": locationOfProject,
        "DateofRegistration": dateofRegistration,
        "Period_Institution_Qualification": periodInstitutionQualification,
        "AreaofSpecialization": areaofSpecialization,
        "DistrictofOrigin": districtofOrigin,
        "EmployeerDuringPrimaryAssignment": employeerDuringPrimaryAssignment,
        "CommunityofPrimaryAssignment": communityofPrimaryAssignment,
        "TypeOfAssignment": typeOfAssignment,
        "PeriodCoveredByreport": periodCoveredByreport,
        "Period": period,
        "Institution": institution,
        "Qualification": qualification,
    };
}
