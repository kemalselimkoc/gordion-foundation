# Gordion — karar kaydı

1 Ekim 2026. `Önerildi` kabul edildi anlamına gelmez. Kullanıcının temel gereksinimleri mimari alternatiflerden ayrılır.

## Kullanıcı tarafından verilen sınırlar

- Windows 11 ve GitHub merkezli geliştirme; anlamlı aşamalarda açıklayıcı commit ve push.
- Önce ortam, mimari, güvenlik, roadmap ve belgeler; ardından küçük MVP.
- PC doğrudan internete açılmayacak; Agent outbound şifreli bağlantı kuracak.
- Pairing, minimum yetki, audit, secret management ve kritik işlem confirmation baştan tasarlanacak.
- Büyük mimari kararlar kullanıcı onayından önce kesinleştirilmeyecek.
- Proje adı kullanıcı tarafından Gordion olarak belirlendi.
- GitHub kullanıcı adı/imzası: `kemalselimkoc`; standart yazar satırı `Created by @kemalselimkoc`.
- Kullanıcı açık kaynak geliştirme hedefini belirtti; lisans henüz seçilmedi.

## Karar önerileri

| ID | Karar | Durum | Öneri / gerekçe |
|---|---|---|---|
| ADR-001 | Repository düzeni | Kabul edildi | Kullanıcı: “Baştan ayrı repository’ler kullanalım.” Multi-repo; ayrıntılı bileşen bölünmesi repositories.md'de öneri olarak tutuluyor. |
| ADR-002 | İlk teknoloji seti | Kabul edildi | Kullanıcı ilk seçeneği onayladı: TypeScript/Node.js AI Core + C#/.NET Windows Agent. Ayrıntı: adr/002-core-and-agent-stack.md. |
| ADR-003 | MVP etkileşimi | Önerildi | Önce metin; isteğe bağlı kısa push-to-talk; Realtime/wake word sonraki aşama. |
| ADR-004 | Yerel Agent sınırı | Önerildi | Ayrı standard-user süreç + mevcut kullanıcıya sınırlı named pipe; 2–3 typed capability. |
| ADR-005 | Uzaktan güven modeli | Taslak | TLS outbound, key-bound cihaz kimliği, kısa token, replay/dedup ve yerel policy; mTLS seçimi cloud aşamasında. |
| ADR-006 | Core dağıtım modeli | Önerildi | Yerel modüler başlangıç, ileride cloud'da modüler backend; mikroservis zorunlu değil. |

## Daha sonra verilecek kararlar

OpenAI modeli ve bütçe, UI, voice transport/wake-word motoru, memory retention/veritabanı, auth sağlayıcısı, cloud/VPS, kuyruk, iOS framework/build, IoT protokolü, satış sağlayıcısı, lisans ve görsel marka kimliği. Bir karar gerekli olduğunda alternatif, maliyet, güvenlik etkisi ve geri dönüş planıyla kullanıcıya sunulacak.

## Onaydan sonra

Kabul edilen karar ADR dosyasında gerekçe ve sonuçlarıyla kaydedilir. Belgeler aynı repo'da güncel tutulur. Bu kayıttaki öneriler sessizce uygulanmış karara çevrilmez.
