# Agent Platform — başlangıç paketi

Tarih: 1 Ekim 2026 · Durum: multi-repo onaylandı; teknoloji seçimi bekliyor · Geçici çalışma adı.

## Amaç

OpenAI ile doğal yazılı ve sesli iletişim kuran, kullanıcının açıkça yetkilendirdiği bilgisayar ve cihaz işlemlerini gerçekleştiren kişisel agent platformu. İleride ürünleştirilecek araçlar, satış sitesi ve portfolyo aynı ekosistemin parçaları olacak.

Bu paket çalışır uygulama değildir. İlk geliştirme için incelemeye hazır kapsam ve karar önerileri içerir. Uygulama kodu yazılmadı, uygulama geliştirme bağımlılıkları kurulmadı ve OpenAI isteği gönderilmedi. Kullanıcının ek bağlantı talebi üzerine VS Code'a resmi Codex eklentisi kuruldu ve sürümü doğrulandı; hesap girişi kullanıcı tarafından tamamlanacak. Bu paket ayrı yerel temel/dokümantasyon repository'si olarak `main` branch'inde başlatıldı; GitHub owner/remote henüz belirlenmedi.

## Belgeler

- [Ortam kontrolü](docs/environment.md): ölçülen durum, doğrulanamayan noktalar ve kurulum sırası.
- [Ana mimari](docs/architecture.md): uzun vadeli sınırlar ve MVP akışı.
- [Güvenlik taslağı](docs/security.md): yetki, pairing, approval, secrets ve tehditler.
- [MVP yol haritası](docs/roadmap.md): aşamalar ve geçiş kriterleri.
- [Repository ve Git düzeni](docs/repositories.md): monorepo/multi-repo karşılaştırması ve ilk commit planı.
- [Karar kayıtları](docs/decisions.md): henüz kesinleştirilmemiş kararlar.
- [Günlükten gelen ürün vizyonu](docs/vision.md): asıl motivasyon ve somut kullanım senaryoları.
- [Geliştirme araçları bağlantısı](docs/integrations.md): Codex, GitHub Desktop, Visual Studio ve VS Code düzeni.

## Repository kararı ve teknoloji seçenekleri

Kullanıcı baştan ayrı repository'ler kullanılmasını onayladı. Temel/dokümantasyon, AI Core ve Windows Agent ayrı tutulacak; web, cloud, iOS ve diğer ürün repository'leri geliştirme sırası geldiğinde oluşturulacak. Ayrıntılı bölünme repositories.md'de öneridir. Teknoloji kararı açık: TypeScript/Node.js Core + C#/.NET Agent veya Core ve Agent için C#/.NET. İki C# repository kullanmak da multi-repo düzeniyle uyumludur.

## İlk geliştirme kapsamı

1. Yazı → yerel AI Core → OpenAI → yazılı cevap.
2. İstenirse kısa, kullanıcı tarafından başlatılan mikrofon kaydı → metne çeviri → aynı Core.
3. Core → policy/approval → Windows Agent → birkaç izinli işlem → gerçek işlem sonucu.

Gerçek zamanlı ses, wake word, kalıcı hafıza, uzaktan erişim, cloud, iPhone, IoT ve ticari katmanlar aşamalı eklenecek. Model seçimi, kalıcı marka ve hosting sağlayıcısı henüz belirlenmedi.

## Devam için gereken karar

Multi-repo kararı alındı. Teknoloji seçimi açıklama sonrasında yapılacak. İlk temel/dokümantasyon repository'si uygulama dilinden bağımsız başlatılabilir; GitHub push için owner/hesap bilgisi ve erişimi gereklidir. Uygulama repository'leri ve toolchain kurulumu teknoloji seçiminin ardından hazırlanır.
