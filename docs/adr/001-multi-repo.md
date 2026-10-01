# ADR-001 — Başlangıçtan itibaren ayrı repository'ler

Durum: kabul edildi. Tarih: 1 Ekim 2026.

## Karar

Kullanıcı “Baştan ayrı repository’ler kullanalım” seçimini yaptı. Gordion ekosistemi multi-repo olarak ilerleyecek. Başlangıç teknoloji seçimi ayrı [ADR-002](002-core-and-agent-stack.md) ile onaylandı.

## Sonuçlar

Core, Windows Agent ve temel docs ayrı sürümlenir. Bağımsız ürünler kendi repository'lerine sahip olur. Yeni repository'ler gerçek geliştirme ihtiyacı oluştuğunda açılır. Ortak sözleşmelerin protocol_version ve compatibility tablosu takip edilir; örnek request/result fixture'ları karşılıklı CI'da doğrulanır.

Başlangıç sözleşmeleri temel/docs repo'sunda JSON Schema ve fixture olarak tutulması önerilir. Yayınlanan bir contracts paketine geçiş ayrı teknik karar olacaktır. Core/Agent değişikliği protokolü kırıyorsa ilgili iki repo için eşleşen değişiklik ve release planı hazırlanır.

Bu karar tek başına GitHub owner, repository adları, erişim düzeyi veya hosting seçimini kesinleştirmez. Proje adı daha sonra kullanıcı tarafından Gordion olarak belirlendi; repository adları bu isme göre öneriliyor.
