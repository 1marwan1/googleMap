// ignore: constant_identifier_names
enum TypeImageInMarker { ME_LOCATION, CUSTOMER_LOCATION }

extension TypeImageInMarkerX on TypeImageInMarker {
  String value() {
    switch (this) {
      case TypeImageInMarker.ME_LOCATION:
        return "assets/icons/me.png";
      case TypeImageInMarker.CUSTOMER_LOCATION:
        return "assets/icons/customer.png";
    }
  }
}
