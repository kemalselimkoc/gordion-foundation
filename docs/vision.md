# Günlükten gelen ürün vizyonu

Kaynak: kullanıcının 1 Ekim 2026'da paylaştığı, daha önce kişisel günlüğüne/ChatGPT çalışma planına yazdığı metin. Bu belge özeti ve teknik yorumudur; ilk gereksinim listesinin yerini almaz.

## Hedef deneyim

Kullanıcı, format sonrası temiz Windows ortamında kendisiyle konuşan ve sohbet eden, Jarvis benzeri fakat kendi adı ve kimliği olan bir platform geliştirmek istiyor. Dışarıdayken telefondan sesli komut vererek evdeki bilgisayara iş yaptırmak ve izinli ev cihazlarını kontrol etmek istiyor. Geliştirilen yazılım ve AI araçları ileride web sitesinden satılacak. Site aynı zamanda yazılım, tasarım, AI ve siber güvenlik portfolyosu olacak; demo ve girişte AI'ı temsil eden 3D robotik animasyon gibi deneyimler sunacak.

## Kullanım senaryoları ve ürün gereksinimleri

| Senaryo | Teknik karşılık |
|---|---|
| Dışarıdayken PC'ye indirme işi verip eve gelince hazır bulmak | Sınırlandırılmış download/job adapter; hedef klasör, kaynak ve boyut izinleri; progress, iptal ve sonuç bildirimi. Kullanıcının erişim hakkı olan kaynaklar üzerinden tasarlanacak. |
| Bulaşık makinesini kapatmak | Gerçek cihazın desteklediği API ve yetki; kapat/durdur komutunun doğru semantiği; fiziksel risk ve cihaz durumu kontrolü. Akıllı prizle güç kesmek, cihazın güvenli program durdurmasıyla eşdeğer varsayılmaz. |
| Telefondan doğal sesli etkileşim | iOS giriş/ses UI, backend ve outbound Agent; güvenilir onay ekranı, cihaz pairing ve revoke. |
| Satılan uygulamalara hesapla giriş | Auth sağlayıcısı, passkey/MFA ve gerektiğinde e-posta/parola; sunucu tarafı entitlement/lisans kontrolü. |
| Ürün demoları ve 3D robot giriş animasyonu | Daha sonraki web tasarım aşaması; mobil performans, erişilebilirlik ve reduced-motion desteği. |

## Beklentilerin netleştirilmesi

Codex geliştirme ortağıdır. Çalışan platform kendi Core/Agent/backend yazılımımız ve OpenAI API entegrasyonuyla kurulacak; bu sohbetin veya Codex masaüstü uygulamasının üretim sistemi olarak sürekli açık kalmasına bağımlı tasarlanmayacak.

Hiçbir istemci yazılımı için “kesinlikle kırılamaz” sözü verilmez. Sunucu tarafında değerli işlevler, entitlement kontrolü, kısa oturumlar, cihaz politikaları, imzalı güncellemeler ve kötüye kullanım takibiyle risk azaltılır. E-posta/parola ile giriş tek başına korsan kullanım koruması değildir. Offline lisans gereksinimi ayrıca karar ister.

Apple Developer Program'a şimdi kaydolmak metin/Windows MVP'sinin ön koşulu değil. Kendi cihazında temel testler ücretsiz Apple Account/Personal Team ile yapılabilir; yeniden provisioning kısıtları vardır. Dağıtım ve gelişmiş servisler için ücretli program değerlendirilir. iOS build/signing için macOS/Xcode erişimi ayrıca planlanmalı; Windows geliştirme ortamı bu ihtiyacı tek başına karşılamaz. [Apple hesap ve Personal Team açıklaması](https://developer.apple.com/help/account/basics/about-your-developer-account), [Xcode cihaz testleri](https://developer.apple.com/documentation/Xcode/running-your-app-on-simulated-or-physical-devices).

## Başlangıca etkisi

Ana plan değişmiyor: önce yerel metin akışı, ardından birkaç güvenli Windows capability. Günlükteki senaryolar cloud/iPhone/IoT ve ticari aşamaların kabul senaryolarına dönüşecek. Download, bulaşık makinesi kontrolü, satış ve 3D site ilk MVP'ye eklenmeyecek.
