import 'package:saigontour/models/payment_method.dart';
import 'package:saigontour/models/tour_detail.dart';

class Customer {
  int? userId;
  String fullname;
  int age;
  String phoneNumber;
  Set<PaymentMethod> paymentMethods;
  List<TourDetail> tourDetails;

  Customer(this.userId, this.fullname, this.age, this.phoneNumber,
      this.paymentMethods, this.tourDetails);
}
