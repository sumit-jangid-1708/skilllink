# Customer API integration

Existing live AppUrl.baseUrl, login controller/service/models, AppStorage, route definitions,
theme, dependencies and backend are unchanged. New files use the existing models,
view_models/controller and view_models/services folders.

## Connected screens

| Screen | Controller / service | Backend calls |
| --- | --- | --- |
| Login | Existing AuthController / AuthService | Send OTP, verify OTP (unchanged) |
| Home | HomeController / HomeService | Me, categories, technicians with category/city/sort filters |
| Categories | CategoriesController / CategoriesService | Categories; existing search filters loaded categories |
| Profile | ProfileController / ProfileService | Me and nested customer profile |
| Edit Profile | EditProfileController / EditProfileService | GET customer profile, GET me, PATCH profile, multipart photo upload/removal |
| Request Service | RequestServiceController / RequestServiceService | Categories, customer address, POST request with optional image |
| My Requests | RequestsController / RequestsService | GET current customer's requests |
| Request Details | RequestDetailsController / RequestDetailsService | GET request, PATCH cancellation, POST review |
| Worker Profile | WorkerProfileController / WorkerProfileService | GET technician, GET saved, POST save, DELETE unsave |
| Saved Workers | StarController / StarService | GET saved technicians |

Saved-list and review-input UI were explicitly authorized. Other screen changes bind
API data, selected IDs, loading state and callbacks to existing widgets. Existing route
definitions and transitions remain unchanged. Profile updates use PATCH; a duplicate
PUT implementation is unnecessary for the existing Save action.

## Verification

- Android debug APK builds successfully.
- Customer API tests use mocked HTTP responses, not live mutations.
- Tests cover existing bearer-token attachment, URLs, verbs, request payloads,
  multipart uploads, validation errors, nullable/decimal responses, cancellation state
  updates and category/request screen bindings.
- Existing counter-template test is unrelated to this app and was not changed.

## Existing limitations intentionally left unchanged

- The Requests screen's floating filter tabs extend outside their Stack's hit-test
  bounds. The existing filter callback works, but taps in the overflow area can miss.
- The request date picker now supports the next year. Follow-up fixes use a future
  default time and reopen time selection when a chosen time has expired.
- Customer profile API cannot update phone number, date of birth, gender or state.
  Those existing UI fields are not sent as invented backend fields.
- Backend accepts one customer request image. The existing upload action now selects
  one image and sends it under image; technician before/after photos are not used
  to store extra customer attachments.
- Technician distance, About text, detailed service prices and bill breakdown are
  absent from backend responses. Unavailable dynamic values show a dash rather than
  fabricated API data. Existing static UI labels are retained.
- Existing chat, invoice, support and unrelated placeholder actions have no matching
  backend APIs and remain outside this integration.
- A booking cannot target a technician directly: creation serializer marks technician
  read-only. Book Now passes the technician's category; assignment stays with backend.
- No live authenticated end-to-end test or device interaction was performed.
