# Gordion — birlikte geliştirme ve öğrenme rehberi

Created by @kemalselimkoc.

Güncelleme: 1 Ekim 2026. Bu belge günlük takip içindir; teknik kabul kriterleri [MVP yol haritasında](roadmap.md) kalır. Büyük mimari kararlar birlikte onaylanır. Süre tahmini yerine çalışan sonuçlarla ilerleriz.

## Şu an neredeyiz?

- [x] Gordion adı, ayrı repository düzeni ve TypeScript Core + C# Agent seçildi.
- [x] Node.js, npm, .NET, Git ve GitHub CLI hazır; geliştirme terminalini Kemal doğruladı.
- [x] Foundation belgeleri ve Core kodu ayrı GitHub repository'lerinde.
- [x] Core demo, oturum, iptal ve sınırları hazır; 10 test yerelde ve GitHub Windows ortamında geçti.
- [x] Kemal demoyu çalıştırdı; iki mesajın 1 ve 2 olarak sayıldığı ekran görüntüsüyle doğrulandı.
- [ ] /usage ve /reset davranışını dene, temel dosyaları tanı. **Şimdiki görev.**
- [ ] OpenAI model/bütçe seçimi ve gerçek bağlantı testi yapılacak.
- [ ] Kalıcı kullanım kaydı ve harcama denetimi tamamlanacak.

Henüz çalışan bir Windows kontrolü, sesli asistan veya telefon uygulaması yok. Metin çekirdeğinin iskeleti hazır. Lisans seçimi, Visual Studio workload kontrolü ve GitHub kimlik bilgisini işletim sistemi kasasına taşıma da takip edilecek.

## Nasıl birlikte çalışacağız?

2 Ekim 2026 notu: Tasarım molası kullanıcı isteğiyle kapatıldı. Gordion platform adı; ana ajan Bora, diğer ajanlar Bilge ve Pars olacak. Renkler sırasıyla mavi, mor ve turuncu olarak onaylandı. Gerçek zamanlı 3D hedefi kaydedildi; motor seçimi ve çoklu ajan uygulaması henüz yapılmadı. Önce metin Core öğrenme akışına dönüyoruz.

Her oturumda tek küçük hedef seçeriz:

1. **Anla:** Ne yapacağımızı ve nedenini birkaç cümleyle açıklarım.
2. **Dene:** Sana bir küçük görev ve beklenen sonucu veririm. İstersen önce kendin yaparsın; kodu birlikte inceleriz.
3. **Doğrula:** Çalışan sonucu veya hatayı değerlendiririz. Hata çıkması öğrenme sürecinin parçasıdır.
4. **Kaydet:** Değişikliği test eder, diff'i inceler, anlamlı commit ve push yaparız.
5. **İşaretle:** Bu rehberde tamamlanan görevi ve sıradaki tek adımı güncelleriz.

Bir aşamayı öğrenmek için bütün dili önceden bitirmek gerekmiyor. İhtiyaç duyduğumuz kavramı gerçek Gordion kodunda öğreniriz. Büyük özellikleri arka arkaya ekleyip açıklamayı sona bırakmayız.

## Aşama planı

| Sıra | Çalışan sonuç | Senin öğreneceğin | Birlikte yapacağımız | Tamamlanma ölçütü |
|---|---|---|---|---|
| 1 — Projeyi tanı | Demo terminalinde iki mesaj | Terminal, klasör, npm script, kaynak dosya | Demoyu çalıştırıp bir mesajın dosyalar arasındaki yolunu izlemek | Demo ve gerçek AI farkını açıklayıp /reset ve /exit kullanabilmen |
| 2 — İlk gerçek sohbet | Yazdığın mesaja OpenAI cevabı | API, model, ortam değişkeni, secret, istek/yanıt | Model ve küçük deneme bütçesini birlikte seçip yerel ayarı yapmak | İki turlu gerçek Türkçe sohbet; anahtar Git'e girmiyor |
| 3 — Sağlam metin MVP | Hata ve kullanım kontrolü olan sohbet | async/await, TypeScript tipleri, hata, test, token | Kod incelemesi, küçük değişiklik, kullanım kaydı ve bütçe denetimi | İptal, timeout, kota, bağlam ve bütçe testleri geçiyor; teknik aşama 1 kriterleri tamam |
| 4 — İlk Windows işlemi | İzin verilen 2–3 basit işlem | C#, .NET, süreçler arası iletişim, izin listesi | Önerilen ilk işlemleri seçmek; örneğin Not Defteri açma ve sistem saati okuma | Agent gerçek sonuç döndürüyor; izinsiz istek reddediliyor; işlem kaydı var |
| 5 — Ses | Mikrofonla konuşup yanıt almak | Ses kaydı, metne çeviri, gecikme, iptal | Önce bas-konuş, sonra gerçek zamanlı ses; wake word daha sonra | Kayıt görünür ve durdurulabilir; Türkçe konuşma anlaşılır |
| 6 — Hafıza ve projeler | Seçtiğin bilgiyi hatırlama | Kalıcı veri, kaynak, kapsam, silme | Açıkça seçilen bilgiyi saklayıp düzenlemek/silmek; bir projeye adapter eklemek | Bilginin nereden geldiği görülebiliyor ve tamamen silinebiliyor |
| 7 — Güvenli uzaktan erişim | Ev dışından sınırlı PC işlemi | Backend, authentication, pairing, TLS, audit | Cloud ve cihaz bağlantısı kararlarını onaylamak; outbound Agent bağlantısı kurmak | Başka ağdan işlem çalışıyor; yetkisiz/replay istekleri reddediliyor; PC'ye port açılmıyor |
| 8 — iPhone | Telefondan aynı sisteme erişim | Mobil arayüz, güvenli token saklama, bildirim | iOS geliştirme/imzalama ihtiyaçlarını o aşamada incelemek | Telefonda komutun gerçek durumu/sonucu; kayıp cihaz erişimi iptal edilebiliyor |
| 9 — IoT ve otomasyon | Seçilen bir cihazı kontrollü yönetme | Cihaz protokolü, zamanlama, plugin sınırları | Önce tek cihaz ve tek otomasyon; fiziksel etkiler için onay | Yetki iptali, hata ve durdurma senaryoları çalışıyor |
| 10 — Ürün ve portfolyo | Demo ve ürün sunan site | Web, tasarım, dağıtım, hesap, ödeme ve lisans | Önce portfolyo/demolar, sonra satış ve abonelik; AI/3D deneyimleri | Site yayınlanmış; ürün erişimi, ödeme ve destek akışı doğrulanmış |

Ses ve sonraki aşamaların ayrıntıları öneridir; uygulamaya geçerken kapsamı onaylarız. İstenirse küçük portfolyo çalışması daha erken ayrı hedef olarak ele alınabilir. Şimdi VPS, Apple üyeliği veya IoT cihazı satın almak bu görevlerin ön koşulu değil.

## Önümüzdeki dört çalışma oturumu

### Oturum 1 — Çalışan projeyi tanı

- [ ] Aşağıdaki demoyu çalıştır.
- [ ] `src/cli.ts`: terminalde yazıyı alan giriş noktası.
- [ ] `src/core.ts`: oturum ve limit kuralları.
- [ ] `src/provider.ts`: demo veya OpenAI ile konuşan katman.
- [ ] `src/config.ts`: ayarları doğrulayan katman.
- [ ] `package.json`: çalıştırma komutları ve bağımlılıklar.

Öğrenme sorusu: Demo cevabını hangi dosya üretiyor? Önce birlikte dosyayı bulacağız; sonra küçük bir metin değişikliğini deneyip test/commit döngüsünü öğreneceğiz.

### Oturum 2 — Gerçek bağlantı hazırlığı

- [ ] OpenAI hesap/proje erişimini kontrol et.
- [ ] Güncel model ve maliyet seçeneklerini birlikte incele; deneme bütçesini sen belirle.
- [ ] `.env.example` → yerel `.env`; anahtar sohbet veya GitHub'a gönderilmez.
- [ ] Bir gerçek mesaj ve ardından bağlamı sınayan ikinci mesaj.
- [ ] Beklenen cevap, hata ve kullanım sonucunu kaydet; secret veya özel sohbet içeriğini yayınlama.

### Oturum 3 — Kodu anlayarak ilk değişiklik

- [ ] Bir fonksiyonun girdisini/çıktısını ve `await` kullanımını kodda göster.
- [ ] Tek küçük davranış değişikliği seç.
- [ ] Gerekiyorsa davranışı doğrulayan test ekle ve `npm test` çalıştır.
- [ ] GitHub Desktop'ta diff, commit ve push kavramlarını uygula.
- [ ] GitHub Actions sonucunu bul. Yeşil testin yalnızca test edilen davranışları doğruladığını konuş.

### Oturum 4 — Metin MVP'sini tamamlama

- [ ] Mevcut istek sınırı ile para cinsinden bütçe arasındaki farkı incele.
- [ ] Kullanım kaydı, saklama süresi ve bütçe davranışını birlikte kararlaştır.
- [ ] İptal/timeout sonrası bilinmeyen kullanım ve yeniden başlatma senaryolarını ele al.
- [ ] Teknik yol haritasındaki metin aşamasını değerlendir; açık maddeler kapanmadan Windows Agent'a geçme.

## Şimdi yapacağın tek görev

[Geliştirme terminalini](../scripts/dev-terminal.cmd) aç. Bu başlatıcı foundation klasöründe başlar. Şunları sırayla çalıştır:

```bat
cd ..\gordion-core
npm run demo
```

`Gordion | DEMO: API çağrısı yapılmaz` yazısını görmelisin. Sonra her satırı ayrı gönder ve cevabı bekle:

```text
Merhaba Gordion
Bu ikinci mesajım
/usage
/reset
Yeni sohbet
/exit
```

Beklenen: ilk iki cevapta kullanıcı mesajı sayısı 1 ve 2 olur. `/usage` iki girişim ve sıfır token gösterir. `/reset` sonrası yeni mesajın sohbet sayısı 1 olur; süreç kullanım sayacı korunur. `/exit` terminal komut satırına geri döndürür. Demo anlamsal bir AI cevabı üretmez.

Terminal zaten `gordion-core` içindeyse tekrar `cd` çalıştırma; yalnızca `npm run demo` yeterli. Bittiğinde hangi çıktıyı gördüğünü söyle; hata varsa anahtar içermeyen hata metnini paylaş. Sonraki görev dosyaların içinden bu akışı birlikte takip etmek.

## Küçük sözlük

| Kavram | Bu projede anlamı |
|---|---|
| Repository / repo | Bir projenin dosyaları ve Git geçmişi |
| Core | Konuşmayı ve kuralları yöneten çekirdek |
| Agent | Yetki verilmiş cihaz işlemlerini yapan ayrı uygulama |
| Node.js | TypeScript'ten derlenen JavaScript'i bilgisayarda çalıştıran ortam |
| npm | Proje bağımlılıklarını ve package.json komutlarını yöneten araç |
| Build | Kaynak kodu çalıştırılabilir çıktıya dönüştürme |
| API | Uygulamaların istek ve yanıtla haberleştiği arayüz |
| Commit / push | Yerel değişiklik kaydı / bu kayıtları GitHub'a gönderme |
| CI | GitHub'ın değişikliklerde otomatik kontroller çalıştırması |
| MVP | Belirlediğimiz küçük işi güvenilir şekilde yapan ilk sürüm |
