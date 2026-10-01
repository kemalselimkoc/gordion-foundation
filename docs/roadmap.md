# MVP ve genişleme yol haritası

Durum: öneri. Takvim tahmini yerine ölçülebilir aşama çıkışları kullanılır. Aşama tamamlanmadan sonraki kapsam açılmaz.

1 Ekim 2026 ilerleme: Kullanıcı geliştirme terminalinin çalıştığını doğruladı. Ayrı public [gordion-core](https://github.com/kemalselimkoc/gordion-core) repository'sinde metin CLI, demo modu, Responses adapter, oturum bağlamı, iptal/timeout ve istek/çıktı sınırları hazır; 10 yerel test geçti. Gerçek API testi, model seçimi, para cinsinden bütçe denetimi ve kalıcı kullanım kaydı bekliyor; aşama 1 henüz tamamlanmadı. Workflow yetkisi kullanıcı tarafından onaylandı; GitHub CI etkin ve ilk Windows çalıştırması başarılı: https://github.com/kemalselimkoc/gordion-core/actions/runs/36883824185 .

| Aşama | Teslim | Geçiş kriteri |
|---|---|---|
| 0 — Hazırlık | Ortam, repository/stack onayı, açık kaynak repo/lisans hazırlığı, docs, ilk commit/push | Normal terminal toolchain çalışır; README kurulum yolunu anlatır; GitHub yedeği doğrulanır; gerçek secret yok. |
| 1 — Metin çekirdeği | Kullanıcı → yazı → Core → OpenAI → cevap | Türkçe konuşma; aynı oturum bağlamı; timeout, iptal, API hata/429 davranışı; model yapılandırması; kullanım kaydı ve uygulama tarafı bütçe sınırı. |
| 1b — Basit mikrofon, tercihe bağlı | Push-to-talk kısa kayıt → transcription → Core → yazılı cevap | Mikrofon izni, görünür kayıt, başlat/durdur, anlaşılır transcription hatası; ham kayıt retention kararı. Realtime/wake word gerekmez. |
| 2 — Yerel Windows Agent | Kimliği doğrulanan yerel IPC, 2–3 typed capability, audit | İzinli işlem gerçek sonuç verir; yasak capability/parametre/path reddedilir; onay gerektiren akış çalışır; standard user yeterlidir. |
| 3 — Sesli konuşma | Realtime ses, VAD, konuşmayı kesebilme; sonra wake word denemesi | Türkçe latency/kalite ölçülür; konuşma kesilebilir; gürültü/false wake test edilir; kritik işlem sesle tek başına onaylanmaz. |
| 4 — Hafıza ve projeler | Kullanıcı/proje hafızası; ilk proje adapter'ı | Kaynak gösterme, düzenleme/silme, kapsam izolasyonu; secret ve yetkisiz proje içeriği aktarılmaz. |
| 5 — Cloud/remote | Auth, device registry/pairing, gateway, outbound Agent, minimal web kontrolü | Dış ağdan kendi cihazına komut ve doğru sonuç; revocation/replay/başka cihaz testleri; offline/timeout/unknown davranışı; backup/restore. |
| 6 — iPhone | Login, pairing, metin/ses, command status ve notification | Telefon → backend → PC → telefon akışı; token saklama, kritik approval, kayıp cihaz revoke. iOS build/signing gereksinimleri bu aşamadan önce planlanır. |
| 7 — IoT/otomasyon/plugins | Bir kontrollü IoT adapter, sınırlı otomasyon, plugin manifest | Cihaz izinleri ve fiziksel risk onayı; revoke, cancel ve audit; otomasyon izni süresiz sınırsız yetki değil. |
| 8 — Ürün/portfolyo | Dashboard genişlemesi, satış/lisans, portfolyo ve AI/3D deneyimleri | Tenant izolasyonu, ödeme webhook doğrulama, lisans iptali, signed updates, operasyon/docs ve destek süreçleri. |

## İlk uygulama için dar backlog

1. Onaylı toolchain sürümlerini sabitle; küçük CLI veya minimal chat arayüzü seç.
2. Core içinde konuşma oturumu, OpenAI adapter, iptal/timeout ve anlaşılır hata akışı oluştur.
3. Mock provider ile hata davranışlarını doğrula; gerçek API smoke test'i hesap/bütçe hazır olduğunda yap.
4. Tool sözleşmelerini ve policy testlerini Agent'tan önce tanımla.
5. Windows Agent'ı normal kullanıcı süreci olarak başlat; dar IPC ve izinli işlemleri ekle.
6. Gerçek sonuç/deny/onay/audit akışını uçtan uca doğrula; anlamlı aşamalarda commit ve push yap.

İlk MVP'de kapsam dışı: keyfi PowerShell, admin servis, sürekli ekran izleme, internetten PC portu, çok kullanıcılı SaaS, ödeme, genel plugin marketplace, özel vector database ve wake word. Bunlar sonraki aşamalar için belgelerde yer alır.

## Kontrol ve commit disiplini

Dokümantasyon için bağlantı/şema/secret kontrolü; uygulama için build, ilgili lint/typecheck ve riskli sınırları doğrulayan testler. Özellikle policy, path kaçışı, invalid tool arguments ve auth failure testleri zorunlu kabul edilir. Basit kozmetik değişikliklerde gereksiz test eklenmez. API başarısızlığı veya erişim eksikliği “test geçti” olarak raporlanmaz.
