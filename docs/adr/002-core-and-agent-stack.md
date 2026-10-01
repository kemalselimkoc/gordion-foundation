# ADR-002 — TypeScript AI Core ve C# Windows Agent

Durum: kabul edildi. Tarih: 1 Ekim 2026. Proje: Gordion.

## Karar ve yetki

Kullanıcı “ilk seçeneği seçiyorum ben de” diyerek TypeScript/Node.js AI Core + C#/.NET Windows Agent seçeneğini onayladı. Aynı mesajda proje adını Gordion olarak belirledi.

## Sorumluluklar

- AI Core: TypeScript/Node.js; konuşma oturumu, OpenAI adapter, tool çağrısı yönetimi, policy/onay akışı ve sonuç sunumu.
- Windows Agent: C#/.NET; tiplenmiş ve izinli Windows capability'leri, yerel policy doğrulaması ve işlem sonucu.
- Ayrı repository ve süreçler; ortak sürümlü protokol, JSON Schema ve fixture'lar üzerinden uyumluluk doğrulanır.

## Gerekçe ve sonuçlar

Core için backend/web tarafında TypeScript araçları kullanılabilir; Agent için Windows entegrasyonları C# ile geliştirilir. İki toolchain'in kurulumu ve çapraz dil sözleşme yönetimi gerekir. Minimum yetki, kritik işlem onayı ve outbound bağlantı gereksinimleri korunur.

Tamamen C#/.NET başlangıcı daha az toolchain gerektiren alternatif olarak değerlendirildi; seçilmedi. Python Core seçilmedi; Python gerektiğinde yardımcı araç olabilir.

Bu karar OpenAI modelini, UI framework'ünü, cloud sağlayıcısını, iOS teknolojisini, yerel IPC seçimini veya bütün mimari önerileri otomatik onaylamaz. Mevcut kapsam önce metin MVP'si, ardından birkaç güvenli Windows işlemidir.
