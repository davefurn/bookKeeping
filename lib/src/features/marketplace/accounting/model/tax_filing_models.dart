class TaxFilingModel {
  final String email;
  final String phone;
  final String serviceName;
  final int industryId;

  final String country;
  final String state;
  final String city;
  final String officeAddress;
  final String postalCode;
  final String serviceDescription;
  final int user;

  TaxFilingModel({
    required this.user,
    required this.email,
    required this.phone,
    required this.serviceName,
    required this.industryId,
    required this.country,
    required this.state,
    required this.city,
    required this.officeAddress,
    required this.postalCode,
    required this.serviceDescription,
  });

  factory TaxFilingModel.fromJson(Map<String, dynamic> data) {
    return TaxFilingModel(
      user: data['user'],
      city: data['city'],
      country: data['country'],
      email: data['service_email'],
      industryId: data['industry'],
      officeAddress: data['office_address'],
      phone: data['service_phone_number'],
      postalCode: data['postal_code'],
      serviceDescription: data['service_description'],
      serviceName: data['service_name'],
      state: data['state'],
    );
  }
}
