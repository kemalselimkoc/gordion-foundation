# Gordion — başlangıç paketi

Tarih: 1 Ekim 2026 · Durum: Gordion adı, multi-repo düzeni ve başlangıç teknoloji seti onaylandı.

**Created by [@kemalselimkoc](https://github.com/kemalselimkoc)**

## Amaç

OpenAI ile doğal yazılı ve sesli iletişim kuran, kullanıcının açıkça yetkilendirdiği bilgisayar ve cihaz işlemlerini gerçekleştiren kişisel agent platformu. İleride ürünleştirilecek araçlar, satış sitesi ve portfolyo aynı ekosistemin parçaları olacak.

Bu paket çalışır uygulama değildir. İlk geliştirme için kapsam ve kararları içerir. Node.js/npm ve .NET SDK kuruldu; TypeScript ve C# derleme kontrolleri geçti. İlk metin sohbeti iskeleti ayrı [gordion-core](https://github.com/kemalselimkoc/gordion-core) repository'sinde hazır; 10 yerel test geçti. Henüz gerçek OpenAI isteği gönderilmedi. VS Code'a resmi Codex eklentisi kuruldu ve sürümü doğrulandı; IDE hesap girişi ayrıca tamamlanacak. Temel/dokümantasyon repository'si `main` branch'inde hazırlanmış ve [kemalselimkoc/gordion-foundation](https://github.com/kemalselimkoc/gordion-foundation) GitHub repository'sine bağlanmıştır.

## Belgeler

- [Ortam kontrolü](docs/environment.md): ölçülen durum, doğrulanamayan noktalar ve kurulum sırası.
- [Geliştirme ortamını kullanma](docs/development-setup.md): kurulu araçlar ve tek terminal başlatıcısı.
- [Ana mimari](docs/architecture.md): uzun vadeli sınırlar ve MVP akışı.
- [Güvenlik taslağı](docs/security.md): yetki, pairing, approval, secrets ve tehditler.
- [MVP yol haritası](docs/roadmap.md): aşamalar ve geçiş kriterleri.
- [Repository ve Git düzeni](docs/repositories.md): monorepo/multi-repo karşılaştırması ve ilk commit planı.
- [Karar kayıtları](docs/decisions.md): henüz kesinleştirilmemiş kararlar.
- [Günlükten gelen ürün vizyonu](docs/vision.md): asıl motivasyon ve somut kullanım senaryoları.
- [Geliştirme araçları bağlantısı](docs/integrations.md): Codex, GitHub Desktop, Visual Studio ve VS Code düzeni.
- [Yazar bilgisi](AUTHORS.md): proje imzası ve kaynak dosyalarında kullanım biçimi.

## Açık kaynak hedefi ve imza

Gordion kullanıcı isteğiyle açık kaynak olarak geliştirilecek. Ana imza `Created by @kemalselimkoc`; README, yazar bilgisi ve önemli özgün kaynak dosyalarında kısa yorum biçiminde kullanılacak. Lisans henüz seçilmedi ve imza teknik bir kopyalama engeli değildir. Kullanıcı secrets, cihaz kimlik bilgileri ve kişisel veriler yayınlanmaz.

## Repository ve teknoloji kararları

Kullanıcı proje adını Gordion olarak belirledi ve baştan ayrı repository'ler kullanılmasını onayladı. AI Core TypeScript/Node.js, Windows Agent C#/.NET ile geliştirilecek. Temel/dokümantasyon, AI Core ve Windows Agent ayrı tutulacak; web, cloud, iOS ve diğer ürün repository'leri geliştirme sırası geldiğinde oluşturulacak. Ayrıntılı bölünme repositories.md'de öneridir. [Teknoloji kararı](docs/adr/002-core-and-agent-stack.md).

## İlk geliştirme kapsamı

1. Yazı → yerel AI Core → OpenAI → yazılı cevap.
2. İstenirse kısa, kullanıcı tarafından başlatılan mikrofon kaydı → metne çeviri → aynı Core.
3. Core → policy/approval → Windows Agent → birkaç izinli işlem → gerçek işlem sonucu.

Gerçek zamanlı ses, wake word, kalıcı hafıza, uzaktan erişim, cloud, iPhone, IoT ve ticari katmanlar aşamalı eklenecek. OpenAI modeli, görsel marka kimliği ve hosting sağlayıcısı henüz belirlenmedi.

## Devam için gereken karar

Multi-repo ve teknoloji kararları alındı; GitHub hesabı `kemalselimkoc` doğrulandı ve public `gordion-foundation` repository'si oluşturuldu. Node.js/npm ve .NET SDK komut satırı araçları hazır. `gordion-core` repository'si ve TypeScript terminal iskeleti hazır. Sonraki adım OpenAI hesap/model/bütçe hazırlığı ve gerçek API doğrulamasıdır; Windows Agent sonrasında gelir. Core GitHub Actions etkinleştirildi; ilk Windows çalıştırmasında tip kontrolü ve testler geçti. Visual Studio IDE/workload doğrulaması ve kaynak lisansı seçimi açık. Yerel klasör adı mevcut bağlantıları korumak için `agent-platform-baslangic` olarak bırakıldı; bu klasör adı proje adı değildir.
