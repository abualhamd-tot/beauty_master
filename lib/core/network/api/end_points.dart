abstract class EndPoints {
  static const baseUrl = "https://dev.alkhbaz.totplatform.net/";
  static const _security = "api/platform/security";
  //? authentication
  static const login = "connect/token";
  static const logout = "$_security/logout";

  //? profile data
  static const currentUserID = "$_security/currentuser";
  static const userDetails = "$_security/users/id/";

  //? orders
  static const orders = "api/order/customerOrders/search";
  static const updateOrder = "api/order/customerOrders";
}
