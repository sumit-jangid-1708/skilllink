# Customer screen data audit

Based on the current Flutter code and local Django serializers/views. Live authenticated
responses and the reported worker's exact photo URL were not supplied.

## Data connected to APIs

- OTP login and bearer token.
- Customer name, phone, email, address, city, pincode and profile photo.
- Categories and descriptions; category icons are still local mappings.
- Technician name, skills, rating, review count, experience, availability,
  verification status, profile photo and latest review rating/comment/date.
- Service creation, request list/details, status/timeline, schedule, amount,
  cancellation and review submission.
- Saved worker list and save/unsave actions.

## Backend does not provide these displayed values/features

| Area | Missing backend data |
| --- | --- |
| Home | Offer/banner data including First Service FREE, dynamic greeting |
| Technician | Distance/location coordinates, About/bio, individual service price list |
| Reviews | Reviewer's name/avatar (UI currently uses Customer and a static initial) |
| Bill | Service-charge/material-cost/platform-fee breakdown and invoice |
| Edit profile | Date of birth, gender, state; phone is readable but this profile endpoint cannot update it |
| Other actions | Chat, notifications, support content, payment processing, app-rating/privacy links |

## Backend has data, but current UI does not fully expose it

- Request photos: API returns image/photo_before/photo_after; details show attachment
  count, but the attachment tap does not open a photo viewer.
- Request display ID, sub_category, urgency and is_paid are not displayed.
- Technician completion_rate and city are available but not shown in technician details.
- Request-details technician rating/review count/verification text remain placeholders,
  although the technician endpoint has these fields.
- Category icon is returned by API but UI chooses its icon from local category-name mappings.

## Existing inactive actions

Profile My Requests, Saved Workers and Logout shortcuts; Saved Explore Professionals;
Home Top Workers View All/header buttons; Request Location Change; invoice, call/chat,
support, share and some View All buttons are still empty callbacks or placeholders.
This audit does not add functionality to those unrelated actions.

## Fixes in this change

- Time picker defaults five minutes ahead; changing the date clears an incompatible
  past time. Submit reopens time selection if the previously selected time has passed.
  Past bookings are still rejected, not silently rescheduled.
- Relative media paths resolve against the existing live origin. Same-host HTTP media
  URLs use the existing HTTPS scheme; external image hosts are preserved.
- Worker profile has loading/error rendering, avoiding a broken-image error box.
- Request details fetch the assigned technician's photo instead of using a hardcoded
  empty image URL.

The local Django URL configuration contains no media-serving route. Flutter cannot
recover a file that the deployed server does not serve. The exact live photo URL is
still needed to verify whether the reported image returns 404 or another server error.
Backend and live base URL were not changed.
