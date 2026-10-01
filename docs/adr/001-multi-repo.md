# ADR-001 — Başlangıçtan itibaren ayrı repository'ler

Durum: kabul edildi. Tarih: 1 Ekim 2026.

## Karar

Kullanıcı “Baştan ayrı repository’ler kullanalım” seçimini yaptı. Proje ekosistemi multi-repo olarak ilerleyecek. Teknoloji seçimi bu karardan bağımsızdır ve henüz onaylanmadı.

## Sonuçlar

Core, Windows Agent ve temel docs ayrı sürümlenir. Bağımsız ürünler kendi repository'lerine sahip olur. Yeni repository'ler gerçek geliştirme ihtiyacı oluştuğunda açılır. Ortak sözleşmelerin protocol_version ve compatibility tablosu takip edilir; örnek request/result fixture'ları karşılıklı CI'da doğrulanır.

Başlangıç sözleşmeleri temel/docs repo'sunda JSON Schema ve fixture olarak tutulması önerilir. Yayınlanan bir contracts paketine geçiş ayrı teknik karar olacaktır. Core/Agent değişikliği protokolü kırıyorsa ilgili iki repo için eşleşen değişiklik ve release planı hazırlanır.

Bu karar tek başına GitHub owner, repository adları, erişim düzeyi, hosting veya teknoloji seçimini kesinleştirmez. Geçici isimler kalıcı marka değildir.
