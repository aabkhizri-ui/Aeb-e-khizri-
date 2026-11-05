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
