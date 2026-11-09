AAB-E-KHIZRI v9.8  (naya server)
================================
Server: Supabase project "aab-khizri" (pxbqszxpbreyxtsnslrw). Tables/functions pehle se bane hue hain,
SQL chalane ki zaroorat NAHI. (token_approval.sql aur registration_approval.sql ab shamil nahi, server mein andar hain.)

1) Is folder ki SAARI files (aur .github folder bhi) GitHub repo mein upload karein, purani files replace karein.
2) GitHub > Actions > keep-server-awake > Run workflow  (ek baar). Isse server pause nahi hoga.
3) App kholein, neeche "Aab-e-Khizri . v9.8" dikhe. Admin login: ID S.S.S

Token approval: shopkeeper review > admin "Token approval" > Approve (tokens ki ginti badal sakte hain) > tokens milte hain.

v9.8 mein naya: shopkeeper ka chhota fixed header (logo + Order/My Orders/Tokens + menu), logo par tap = search,
5 minute login, admin menu mein Tokens/Discounts, printing slip admin Settings mein editable (aur website orders ki printing),
app khulte hi 4 second logo, chat notifications aur auto-reply.
v9.8: Admin Settings mein "Offer ticker" - shopkeeper page par product ke upar chalti hui offer ki patti (text, direction, speed, colors admin set karta hai).
v9.8: photo upload mein background khud hat jata hai (sirf bottle), video ab chalti hai (CSP mein media-src add), video ki white background invisible.
v9.8: video ka background bhi khud hat jata hai (mask se), photo jaisa.
v9.8: version label theek (footer v9.8), video background removal aur mazboot + admin ko status paigham, "What is new" popup.
v9.9: opening logo par tap se skip; admin video background on/off; server/diagnose.sql (website order error, AI chatbot aur push ke liye pehle ye chalayen).
v9.10: Admin mein naya "📈 Dashboard" tab (tokens jari/istemal/baqi, ₨ value, top dukandar, redemption rate, discount ginti).
v9.10: Promo ke din sirf 5 se 10 (dropdown). Discount list mein dukandar ka naam dukan list se bhi dikhta hai (agar naam na ho to #number).
v9.10: Dukandar ko approved discount ke saath promo ki muddat (ps/pe) dikhti hai — server ko ye fields bhejni hongi (neeche SQL note).
v9.11: Admin mein 🎬 Videos tab: bottle/promo video (order page par bottle ki jagah) aur bundle packing video (Place your order ke upar). Bucket aab-media, 30 MB tak, mp4/webm/mov.
v9.11: Admin mein 🤖 AI tab (read-only): live sales, dukandar, discount aur tokens ke sawal. Edge Function "admin-ai" use karta hai.
v9.11 SETUP: Supabase > Edge Functions > Secrets mein ANTHROPIC_API_KEY add karein, phir AI tab kaam karega.
v9.11: CSP mein media-src mein Supabase storage allow kiya.
v9.12: Chat auto-reply ab server par, sirf EK dafa (Walaikum Assalam), phir tab tak nahi jab tak user/admin reply na kare.
v9.13: Chat auto-reply: pehla message par greeting (ek dafa); uske baad har message par "team masroof hai" reply, jab tak user/admin reply na kare.
v9.14: Admin 📈 Dashboard naye design mein: pastel KPI cards, tokens bar chart, redemption donut, 14 din ki sale line, leaderboard aur discount cards.
v9.15: Admin 📈 Dashboard poora naye sire se: upar live date aur time, scorecard tiles, pastel shopkeeper cards, sales line chart, navy donut, tokens bar chart, is mahine ka calendar, discount cards aur leaderboard.
v9.16: Admin Dashboard ab main bar mein. Purana 📊 Dashboard aur 🤖 AI hata diye. Date range select karke aaya/gaya/bana, sale, tokens aur din-ba-din table dekhein. Auto-chat active hai.
v9.17: Dashboard: city/state filter, date range, aur har card/bar/dukandar/din par click karke poori list khulti hai (orders, tokens, balance).
v9.19: Video aur picture ke liye zoom, crop, IN/OUT cut aur background removal (promo, pack, bottle photo). Dashboard mein Previous/Next se agli cheez khulti hai.
v9.20: Video aur photo ka real crop (upload se pehle). Photo par promo banner (tap = order form). Dashboard: pichle muddat se comparison, funnel aur insight.
v9.21: Chat bubbles: jo hum bhejein wo ek side par, jo doosra bheje wo dusri side par (server field "sender" ke mutabiq).
v9.22: Dashboard ka naam "Khoobsurat Dashboard" (🌸). Naya city-wise sales map: shehar ki bubble par tap karke pura dashboard us shehar par filter hota hai.
v9.23: Admin 🔘 Buttons tab: promo buttons banaye, edit, hide/show, delete. Customer page par rangeen buttons (order form, page top, ya https link). Date se start/end.

v10.0: Customer header: bigger logo fills the empty left space beside Menu and the 3 buttons. Version now 10.0 (next: 10.01, 10.02 ...).

v11.0: Website video upload now saves the video first and removes the background as a separate step (so the video always appears). Live refresh every 30 s in the app; website live sales, tokens and contact. Shopkeeper sales (booked and sold) and token table on every tab. Website footer shows the version.

v11.0 (fixes): auto-reply now replies at once in English and Urdu (Walaikum Assalam; team contacts within 1 hour; after 1 hour "surely soon"). Admin gets chat notifications (asks permission on first tap). Customers get a notification when a token request changes. Old embedded website code removed. Website video background mask uploads now allowed by storage policy.

v11.0 (reset + tracker): all data cleared except the admin login; website tracking shown as a route-map with stops (received, approved, dispatched, on the way, delivered), also on order confirmation.

v11.0 (prices and tokens): admin Website price tab (rate, bottles per bundle, tax, delivery) updates the website and the order calculation; token settings no longer reset to the 10-bundle default while editing; shopkeepers see the website price; save messages confirm.

v11.01: Every uploaded video (website bottle, promo, packing) gets its background removed automatically, and the admin chooses the crop before upload. The shape is kept exactly as cropped (portrait or landscape). Crop and background mask are applied on playback in the app and on the website. Version label now 11.01.

v11.01 (update): customer IDs start at 100; order progress shows all stages in one line (New, Waiting for approval, Approved, Dispatch, Shipping, On the way, Delivered); website shows live rates, bundle size, delivery, tokens and new-customer offer; website live-update functions restored; all data cleared except admin.

v11.01 (discounts): a discount given to a customer and the new-customer offer are fixed for one full year; they cannot be lowered, switched off or removed before the year ends (the server enforces this). The admin sees a clear message when a change is blocked.

v11.01 (new-customer offer): admin sets a percentage and the first N new customers (0 = no limit). Each new customer gets the discount automatically on approval. When N customers have received it the offer ends automatically. The website shows the offer and how many are left.

v11.01 (shopkeeper): every delivered order shows its 7-day delivery deadline (overdue is highlighted). After delivery the shopkeeper uploads the bill photo with a message; tokens are added only after the bill photo is uploaded. Claims: the admin switches them on or off in the new Claims tab; when on, shopkeepers submit a claim with a photo, the number of bottles, a reason (leakage, second expiry, third leak, other) and a note; the admin approves or rejects with a note.

v11.01 (pricing and areas): base rate 250, 12 bottles per bundle with 4 free, bulk 240+ bottles at 200 (app). Customer discount period is one year from the day it was given. Claim reasons: bottle leakage, secondary expiry, mouse cut. Order form has a village/area list per city (editable by admin in Villages & areas). Website price tab has free bottles.

v11.01 (places): cities, villages and areas come from the places list (11 cities, 141 entries). Choose a city, then its villages/areas/cities appear, then type the house address. Kamalia added to the city list. The admin edits the list in Cities, villages and areas.

v11.02: The default bottle video is removed. The website shows the bottle video only after the admin uploads one. Version 11.02.

v11.02 (fixes): bill and claim photos open the live camera. Admin action failures show the real reason (token approval now explains a missing bill photo) instead of "Wrong ID or password", which now appears only on the login screen.

v11.02 (bills): the delivery bill photo and message now reach the admin (order cards and the token review) and the shopkeeper sees it received. The admin sees when a bill has not arrived yet.

v10.05 (variant 11.05): all activity data cleared; accounts (customers, shopkeepers, admin, user) and settings kept. Admin verifies the delivery bill (Verify / Not valid) before tokens can be approved. Website price tab holds the bundle-to-token table. Website order shows the tokens for the chosen bundles.

Website offer: 12 bottles per bundle with 4 free (all website text updated, DB price bundle 12, free 4).

Logo updated everywhere: app header and login, website, print slip, app icons (all roles), banners and videos. New logo has a transparent background.

Role names: the home-screen name and page title show Aab-e-Khizri for customers, Aab-e-Khizri User for users, and Aab-e-Khizri Admin for the admin. The install button shows the role name.
