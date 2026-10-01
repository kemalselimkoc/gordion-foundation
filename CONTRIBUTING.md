# Geliştirme düzeni

Büyük mimari değişiklikler kullanıcı onayından sonra ADR'ye kaydedilir. Henüz seçilmemiş teknoloji, kabul edilmiş karar gibi belgelenmez.

Multi-repo'da her bileşen bağımsız sürümlenir. Protokol değişiklikleri Core/Agent compatibility tablosu ve eşleşen değişikliklerle ilerler. Commit'ler dar kapsamlı ve açıklayıcıdır; mantıklı aşamalarda diff/secret kontrolü sonrası push yapılır.

Dokümantasyon için bağlantı ve Markdown blokları kontrol edilir. Uygulama geliştirme başladığında build, ilgili type/lint kontrolleri ve güvenlik sınırlarının testleri eklenir. Lisans kararı henüz verilmedi.

Proje imzası `Created by @kemalselimkoc`. README ve [AUTHORS.md](AUTHORS.md) korunur; önemli özgün C#/TypeScript kaynak dosyalarının başında kısa yorum olarak kullanılır. Üçüncü taraf yazar/lisans bildirimleri korunur ve yeni katkılar kendi sahiplerine atfedilir. Açık kaynak hedefi kabul edildi; lisans seçimi ayrıca yapılacak.
