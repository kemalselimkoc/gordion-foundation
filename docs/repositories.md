# Gordion — repository ve Git düzeni

## Monorepo / multi-repo

| Düzen | Faydası | Maliyeti |
|---|---|---|
| Platform monorepo | Core, Agent, sözleşme ve docs değişikliği aynı commit; tek kişi için kolay koordinasyon | Dil bazlı build ayrımı ve ileride path bazlı CI gerekir. |
| Baştan multi-repo | Bağımsız erişim ve release | Protokol paketlerini yayınlamak, sürüm uyuşmasını ve çapraz repo değişikliklerini yönetmek gerekir. |

Karar: kullanıcı baştan multi-repo istedi; monorepo önerisi kabul edilmedi. Kullanıcı daha sonra açık kaynak hedefini belirtti; önceki private başlangıç önerisi buna göre değişti. Kaynak repository'leri public yayın hedefiyle hazırlanacak; secrets, cihaz bilgileri ve kişisel veriler bu kapsama girmez. Ayrıntılı bölünme aşağıdaki taslaktır; bütün repository'ler bugün açılmayacak.

## Önerilen ayrı repository'ler

```text
gordion-foundation/             # Bu başlangıç paketi için önerilen GitHub adı
  README.md
  SECURITY.md
  CONTRIBUTING.md
  .gitignore
  .editorconfig
  .github/
    workflows/                 # Uygulama geliştirme başladığında
  docs/
    environment.md
    architecture.md
    security.md
    roadmap.md
    decisions.md
    adr/
  contracts/                   # Başlangıçta şema/fixture önerisi; henüz oluşturulmadı

gordion-core/                   # TypeScript/Node.js; metin MVP'sinde
gordion-windows-agent/          # C#/.NET; yerel tool aşamasında

# Geliştirme sırası geldikçe ayrı repository önerileri:
gordion-cloud/
gordion-ios/
gordion-web/                    # Dashboard; public site ile erişim ayrımı değerlendirilecek
portfolio-storefront/
product-<gecici-urun-adi>/
```

Voice/memory Core içinde modül olarak başlayabilir; IoT adapter'ları kendi repository'lerine ihtiyaç oluşunca ayrılabilir. Cloud'un Core'dan ayrı ürün/servis sınırı uzaktan erişim aşamasında onaylanacak. Bugün boş repository filosu veya framework scaffold oluşturulmaz. C# ve TypeScript sözleşmeleri ortak şema/fixture üzerinden doğrulanır. Repo sayısı ile süreç/servis sayısı aynı şey değildir.

## Sözleşme ve sürüm yönetimi

Başlangıç önerisi: foundation repo'sunda protocol_version, JSON Schema, fixture ve Core/Agent compatibility tablosu; her uygulama kendi bağımlı sözleşme sürümünü sabitler. Şemaları repo'lar arasında elle farklılaştırmak yerine doğrulanmış release artifact/tag kullanılır. Bir çağrı protokolü değişince iki repo için uyumlu değişiklik/release planı hazırlanır. Contracts package registry seçimi şimdilik açık.

## GitHub düzeni

- Public/açık kaynak yayın hedefi kullanıcı tarafından belirtildi; lisans seçimi açık. Kullanıcı adı `kemalselimkoc`; önerilen owner bu hesaptır, GitHub oturumu ve repo oluşturma erişimi ayrıca doğrulanacak.
- `main` çalışır ve incelenmiş temel olarak tutulur; anlamlı özellikler `feat/...`, düzeltmeler `fix/...`, belgeler `docs/...` branch'lerinde ilerleyebilir.
- Commit'ler küçük ve anlamlı: `docs: add platform vision and security draft`, `feat(core): add text conversation flow`, `feat(agent): add allowlisted app launch`.
- Her commit sonrası otomatik push zorunlu değil; tamamlanmış mantıklı aşamalarda diff/secret kontrolü, commit ve push.
- Kod başlayınca Windows Agent build'i Windows runner'da, Core build'i uygun runner'da doğrulanır. CI permissions dar; dağıtım aşamasında mümkünse OIDC, uzun ömürlü cloud secret yerine kullanılır.
- Lisans kararı açık kaynak ve ürün stratejisiyle birlikte verilir; kendiliğinden MIT/Apache veya başka lisans eklenmez. README/AUTHORS ve önemli özgün kaynak dosyalarında `Created by @kemalselimkoc` imzası korunur.

## İlk commit planı

1. Multi-repo ve teknoloji kararları alındı. Temel/dokümantasyon repo'su bu paket içinde `main` branch'inde başlatıldı.
2. GitHub owner/oturumu belirlenir; önerilen `gordion-foundation` adına sahip mevcut repo olup olmadığı kontrol edilir.
3. Bu paket temel/dokümantasyon repository'si olarak sürümlenir; onaylanan karar ADR'ye işlendi. Uygulama kaynak klasörleri daha sonra seçilir.
4. Dokümantasyon için `.gitignore`, `.gitattributes`, `.editorconfig`, SECURITY/CONTRIBUTING eklendi. Uygulama repo'larının ignore/build dosyaları onaylı stack'e göre sonra hazırlanır.
5. Kimlik kontrolü, staged diff/secret incelemesi ve whitespace kontrolü yapıldı.
6. İlk yerel commit tamamlandı: `dfdf350` — `docs: initialize platform vision, security and multi-repo roadmap`.
7. Yayınlanacak kapsam ve lisans netleştirilir; public GitHub repo oluşturulur veya doğrulanmış mevcut remote bağlanır; push yapılır; branch/commit remote üzerinde doğrulanır.

GitHub Desktop bu iş akışını yapabilir; GitHub CLI zorunlu değildir. İlk yerel repository bu dokümantasyon paketidir; uygulama kaynağı içermez. Yerel klasör adı mevcut bağlantıları korumak için `agent-platform-baslangic` olarak kalıyor; önerilen GitHub repo adı `gordion-foundation`. GitHub owner ve authenticated remote bilinmeden push tamamlandı sayılmayacak.
