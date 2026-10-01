# Güvenlik modeli — taslak

Temel ilke: model çıktısı, ekran içeriği, dosya, web sayfası, plugin ve tool sonucu yetki vermez. İşlem ancak uygulamanın deterministik politikası izin verirse çalışır. Kullanıcının verdiği izin bir kullanıcı/cihaz/kaynak/işlem kapsamına bağlıdır.

## İlk Windows işlemleri

- `system.get_status`: sınırlı sistem bilgisi; kullanıcı adı, IP, secret veya bütün process listesi varsayılan sonuç değil.
- `app.launch`: yalnızca kullanıcının seçtiği sabit uygulama kimlikleri; model executable yolu veya keyfi argüman veremez.
- `workspace.list_files`: yalnızca seçilmiş proje klasörü; sonuç sayısı sınırı, canonical path ve reparse point/junction/symlink kontrolü.

Bunlar önerilen başlangıç capability'leridir. İlk MVP'de modelin verdiği PowerShell metni, dosya silme, registry/firewall değişimi veya admin işlemi çalıştırılmaz. PowerShell desteği ileride sabit, gözden geçirilmiş script kimlikleri ve tiplenmiş parametrelerle eklenir.

## İşlem hattı

1. Kullanıcı/oturum/cihaz kimliği doğrulanır.
2. Tool adı, parametreler, boyutlar ve kaynaklar şemaya göre doğrulanır; bilinmeyen alanlar reddedilir.
3. Capability ve kaynak bazlı policy uygulanır; varsayılan deny.
4. Gerekli onay, deterministik UI'da gerçek cihaz, işlem, parametre, hedef ve etki ile gösterilir.
5. Approval; immutable işlem özeti/hash'i, kullanıcı, cihaz ve süreye bağlanır. Parametre değişirse yeniden onay gerekir. Model onay metni üretemez veya onayı taklit edemez.
6. Agent kimliği, süreyi, replay bilgisini ve kendi yerel policy'sini tekrar kontrol eder. Agent server politikasından daha dar izin uygulayabilir.
7. İşlem timeout/iptal ve kaynak sınırları içinde çalışır. Gerçek sonuç kaydedilir; başarısız işlem başarılı diye sunulmaz.

Düşük riskli salt okunur işlemler capability bazında önceden izinli olabilir. Dosya yazma, veri gönderme, restart, hesap/izin değişikliği ve fiziksel etkili IoT işlemlerinde risk bazlı açık onay gerekir. Kullanıcı onayı policy tarafından yasaklanmış işlemi otomatik serbest bırakmaz. Wake word veya ses tanıma kimlik doğrulama sayılmaz; kritik onay güvenilir UI ve gerektiğinde yeniden authentication ister.

## Cloud ve device pairing

- Kullanıcı kimliği ile cihaz kimliği ayrılır. Passkey öncelikli login ve gerektiğinde MFA/yeniden authentication; kurtarma ve cihaz kaybı akışı birlikte tasarlanır.
- Agent yerelde benzersiz anahtar çifti üretir. Pairing kısa süreli, tek kullanımlık QR/kod challenge'ı ve oturum açmış kullanıcının açık onayı ile yapılır; kod denemeleri rate limit edilir.
- Pairing cihaz anahtarına ve doğru kullanıcıya bağlanır; komut sahibinin device registry kaydı her istekte kontrol edilir.
- Süreli, audience/scope kısıtlı access token; yenilenen ve iptal edilebilir cihaz kimlik bilgisi. MVP token süreleri cloud aşamasında belirlenecek.
- Agent outbound TLS kullanır ve sunucu sertifikasını doğrular. Sertifika doğrulamasını kapatmak kabul edilmez. Cihaz kimliği key-bound auth ile doğrulanır; mTLS seçeneği ADR'de değerlendirilir.
- Cihaz revoke edildiğinde aktif oturumlar kapatılır, bekleyen işler iptal edilir ve yeni teslimatlar reddedilir. Sunucuyla kimlik/policy doğrulanamıyorsa uzaktan yeni işlem çalışmaz.

## Komut protokolü

Komut zarfı önerisi: `protocol_version`, `command_id`, `request_id`, `actor_id`, `device_id`, `capability`, `validated_arguments`, `issued_at`, `expires_at`, `nonce`, `policy_version`, `approval_reference`. Kimlikler kullanıcı/model girdisinden güvenilir kabul edilmez; doğrulanmış bağlama bağlanır.

Kısa ömür ve nonce/replay denetimi; kalıcı command_id/dedup kaydı; bounded clock skew; süre aşımında reject. Dağıtık sistemde “tam bir kez” yürütme varsayılmaz. Yeniden teslimatta mevcut sonuç dönülür. Yan etki tamamlandıktan sonra sonuç kaydı oluşmadan bağlantı/süreç kaybı olursa durum `unknown` olur; idempotent olmayan işlem otomatik tekrarlanmaz.

Job durumları: queued → delivered → running → succeeded/failed/canceled/expired; gerekiyorsa unknown. PC offline olduğunda sessiz başarı dönülmez. Kritik komutlar bağlantı geri geldiğinde eskimiş onayla çalıştırılmaz. Sonuç boyutu sınırı ve secret redaction uygulanır.

## Secrets, veri ve audit

- OpenAI API key repo'ya, iPhone paketine, web client bundle'ına veya log'a konmaz. Yerel prototipte Core'un uygun OS secret deposunda; cloud sürümünde server-side secret manager'da tutulur.
- Windows için Credential Manager/DPAPI adaydır. Bunlar hesabın veya makinenin ele geçirilmesine karşı mutlak koruma değildir. [Microsoft secret saklama rehberi](https://learn.microsoft.com/en-us/windows/win32/secbp/handling-passwords).
- `.env.example` yalnızca boş/örnek değer içerir; `.env` ve gerçek anahtar dosyaları Git dışında tutulur. Anahtar sızarsa dosya silmek yeterli değildir; revoke/rotate gerekir.
- Audit: actor, device, capability, güvenli parametre özeti, policy/approval kararı, command_id, durum ve zaman. Token/secret/raw ses/screenshots varsayılan log'a alınmaz.
- Yerel log bozulabilir; cloud aşamasında erişimi ayrılmış, append-only/tamper-evident kayıt ve retention değerlendirilir.
- Hafıza açıkça gösterilebilir, düzeltilebilir ve silinebilir olmalı. Konuşma, ses ve ekran verisinin nereye gönderildiği kullanıcıya anlaşılır biçimde sunulur.
- Ekran/mikrofon erişimi görünür kullanım göstergesi ve kullanıcı kapsamıyla açılır. Cloud'a bütün ekranı veya dosyaları otomatik yüklemek varsayılan davranış değildir.

## Tehditler ve kontroller

| Tehdit | Kontrol / kalan sınır |
|---|---|
| Dosya/web/plugin kaynaklı prompt injection | Güvenilmeyen içerik ayrımı; dar capability; policy/approval; modelden bağımsız doğrulama. |
| Hesap veya telefon ele geçirilmesi | Passkey/MFA, kısa token, session/device revoke, kritik işlem yeniden authentication. |
| Başkasının cihazına komut | Her istekte actor/tenant/device sahipliği ve capability kontrolü. |
| Replay veya ağ kesintisi | Expiry/nonce, dedup, bounded retry, unknown sonuç ve manuel uzlaştırma. |
| Klasör kapsamından kaçış | Canonical path + reparse point + çalışma anı kaynak doğrulama; TOCTOU riski ele alınır. |
| Zararlı plugin/güncelleme | Manifest izinleri, sabit sürüm, izolasyon, imzalı dağıtım ve rollback planı. |
| Backend ele geçirilmesi | Yerel policy son sınır; sınırlı privilege ve hassas işlem local approval. Tam ele geçirilmiş altyapı için mutlak güvenlik iddiası yok. |
| PC hesabı ele geçirilmesi | Normal kullanıcı agent, ayrıcalık ayrımı ve OS güvenliği; aynı hesapta tam izolasyon varsayılmaz. |

Remote sürümden önce pairing saldırıları, expired/replayed komutlar, başka cihaz erişimi, revocation, offline/reconnect ve secret leakage senaryoları test edilmeden uzaktan işlem açılmayacak.
