class AppUrl {
  static String mediaUrl(String? value) {
    if (value == null || value.trim().isEmpty) return '';
    final base = Uri.parse(baseUrl);
    final uri = Uri.tryParse(value.trim());
    if (uri == null) return '';
    if (uri.hasScheme) {
      return uri.host == base.host ? uri.replace(scheme: base.scheme).toString() : uri.toString();
    }
    return base.replace(path: '/', query: null, fragment: null).resolveUri(uri).toString();
  }
  static const String baseUrl = "https://skilllink-backend-v85z.onrender.com/api/auth";
  static const String sendOtp= "$baseUrl/send-otp/";
  static const String verifyOtp= "$baseUrl/verify-otp/";
  static const String customerProfile = "$baseUrl/profile/customer/";
  static const String me = "$baseUrl/me/";
  static final String categories = "${baseUrl.substring(0, baseUrl.length - 5)}/services/categories/";
  static final String requests = "${baseUrl.substring(0, baseUrl.length - 5)}/services/requests/";
  static final String createRequest = "${requests}create/";
  static final String technicians = "${baseUrl.substring(0, baseUrl.length - 5)}/services/technicians/";
  static final String saved = "${baseUrl.substring(0, baseUrl.length - 5)}/services/saved/";
  static const String userListApi =
      "https://webhook.site/050cd547-2d6e-44f7-8efb-d0a071ce4828";
}
