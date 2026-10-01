# Repository ve Git düzeni — multi-repo kabul edildi

## Monorepo / multi-repo

| Düzen | Faydası | Maliyeti |
|---|---|---|
| Platform monorepo | Core, Agent, sözleşme ve docs değişikliği aynı commit; tek kişi için kolay koordinasyon | Dil bazlı build ayrımı ve ileride path bazlı CI gerekir. |
| Baştan multi-repo | Bağımsız erişim ve release | Protokol paketlerini yayınlamak, sürüm uyuşmasını ve çapraz repo değişikliklerini yönetmek gerekir. |

Karar: kullanıcı baştan multi-repo istedi; monorepo önerisi kabul edilmedi. Repository erişimi için private başlangıç önerisi korunuyor. Ayrıntılı bölünme aşağıdaki taslaktır; bütün repository'ler bugün açılmayacak.

## Önerilen ayrı repository'ler

```text
agent-platform-foundation/      # Bu başlangıç paketi; geçici önerilen GitHub adı
  README.md
  SECURITY.md
  CONTRIBUTING.md
  .gitignore
  .editorconfig
  .github/
    workflows/                 # Dil/toolchain onayından sonra
  docs/
    environment.md
    architecture.md
    security.md
    roadmap.md
    decisions.md
    adr/
  contracts/                   # Başlangıçta şema/fixture önerisi; henüz oluşturulmadı

agent-platform-core/            # Metin MVP'sinde; ayrı repository
agent-platform-windows-agent/   # Yerel tool aşamasında; ayrı repository

# Geliştirme sırası geldikçe ayrı repository önerileri:
agent-platform-cloud/
agent-platform-ios/
agent-platform-web/             # Dashboard; public site ile erişim ayrımı değerlendirilecek
portfolio-storefront/
product-<gecici-urun-adi>/
```

Voice/memory Core içinde modül olarak başlayabilir; IoT adapter'ları kendi repository'lerine ihtiyaç oluşunca ayrılabilir. Cloud'un Core'dan ayrı ürün/servis sınırı uzaktan erişim aşamasında onaylanacak. Bugün boş repository filosu veya framework scaffold oluşturulmaz. C# ve TypeScript sözleşmeleri ortak şema/fixture üzerinden doğrulanır. Repo sayısı ile süreç/servis sayısı aynı şey değildir.

## Sözleşme ve sürüm yönetimi

Başlangıç önerisi: foundation repo'sunda protocol_version, JSON Schema, fixture ve Core/Agent compatibility tablosu; her uygulama kendi bağımlı sözleşme sürümünü sabitler. Şemaları repo'lar arasında elle farklılaştırmak yerine doğrulanmış release artifact/tag kullanılır. Bir çağrı protokolü değişince iki repo için uyumlu değişiklik/release planı hazırlanır. Contracts package registry seçimi şimdilik açık.

## GitHub düzeni

- İlk depo private önerilir; owner kullanıcı hesabı veya seçilecek organization olabilir.
- `main` çalışır ve incelenmiş temel olarak tutulur; anlamlı özellikler `feat/...`, düzeltmeler `fix/...`, belgeler `docs/...` branch'lerinde ilerleyebilir.
- Commit'ler küçük ve anlamlı: `docs: add platform vision and security draft`, `feat(core): add text conversation flow`, `feat(agent): add allowlisted app launch`.
- Her commit sonrası otomatik push zorunlu değil; tamamlanmış mantıklı aşamalarda diff/secret kontrolü, commit ve push.
- Kod başlayınca Windows Agent build'i Windows runner'da, Core build'i uygun runner'da doğrulanır. CI permissions dar; dağıtım aşamasında mümkünse OIDC, uzun ömürlü cloud secret yerine kullanılır.
- Lisans kararı ürün stratejisiyle birlikte verilir; private repo için kendiliğinden MIT/Apache lisansı eklenmez.

## İlk commit planı

1. Multi-repo kararı alındı. Temel/dokümantasyon repo'su bu paket içinde yerel olarak başlatılabilir; uygulama repo'ları teknoloji onayını bekler.
2. GitHub owner/oturumu ve geçici repo adı belirlenir; aynı amaçlı mevcut repo olup olmadığı kontrol edilir.
3. Bu paket temel/dokümantasyon repository'si olarak sürümlenir; onaylanan karar ADR'ye işlendi. Uygulama kaynak klasörleri daha sonra seçilir.
4. Dokümantasyon için `.gitignore` ve `.editorconfig`, SECURITY/CONTRIBUTING eklenir. Uygulama repo'larının ignore/build dosyaları onaylı stack'e göre sonra hazırlanır.
5. `git init -b main`; kimlik kontrolü; `git status` ve staged diff/secret incelemesi.
6. İlk commit: `docs: initialize platform vision, architecture and MVP roadmap`.
7. Private GitHub repo oluşturulur veya doğrulanmış mevcut remote bağlanır; push yapılır; branch/commit remote üzerinde doğrulanır.

GitHub Desktop bu iş akışını yapabilir; GitHub CLI zorunlu değildir. İlk yerel repository bu dokümantasyon paketi olacak; uygulama kaynağı içermez. GitHub owner ve authenticated remote bilinmeden push tamamlandı sayılmayacak.
