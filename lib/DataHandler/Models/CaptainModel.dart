class CaptainModel {
  String? uid;
  final String? email;
  final String? name;
  final String? phone;
  final String? type;
  final String? carModel;
  final String? carNumber;
  final String? carColor;
  final String? carTax;
  final String? cnic;
  final String? licenseNumber;
  final String? cityOfLicense;
  final String? expiry;
  CaptainModel(

      {this.uid = '',
         this.name,
         this.email,
         this.phone,
         this.carModel,
         this.carNumber,
         this.carColor,
         this.carTax,
         this.cnic,
         this.licenseNumber,
         this.cityOfLicense,
         this.expiry,
        this.type,


      });

  Map<String, dynamic> toJson() =>
      {
        'uid': uid,
        'name': name,
        'email': email,
        'phone': phone,
        'carModel':carModel,
        'carNumber':carNumber,
        'carNumber':carColor,
        'carTax':carTax,
        'cnic':cnic,
        'licenseNumber':licenseNumber,
        'cityOfLicense':cityOfLicense,
        'expiry':expiry,
        'type' : type

      };
  static CaptainModel fromJson(Map<String, dynamic> json) => CaptainModel(
    uid: json['uid'],
    name: json['name'],
    email: json['email'],
    phone: json['phone'],
    carModel: json['car_model'],
    carNumber: json['registration_number'],
    carColor: json['engine_number'],
    carTax: json['tax-payment'],
    cnic: json['cnic-number'],
    licenseNumber: json['license_number'],
    cityOfLicense: json['city-of-license'],
    expiry: json['expiry'],
    type: json['type'],
  );
}