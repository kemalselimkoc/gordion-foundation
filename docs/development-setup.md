# Gordion — geliştirme ortamı

Created by @kemalselimkoc. Doğrulama: 1 Ekim 2026.

## Kurulu komut satırı araçları

| Araç | Sürüm | Doğrulama |
|---|---|---|
| Node.js | 24.21.0 LTS | Resmî SHA-256 eşleşmesi ve `node --version`. |
| npm | 11.19.0 | Registry ping, yerel package install ve npm script çalıştırma. |
| TypeScript | 7.0.2, yalnızca geçici test projesinde | `tsc --noEmit --strict` geçti; ürün sürümü henüz sabitlenmedi. |
| .NET SDK | 10.0.401 | Restore, build ve örnek C# uygulaması çalıştırma; sıfır uyarı/hata. |
| .NET runtimes | 10.0.12 | .NET, ASP.NET Core ve Windows Desktop runtime listede doğrulandı. |
| Git for Windows / MinGit | 2.56.0.windows.1 | HTTPS okuma ve GitHub push. |
| GitHub CLI | 2.102.0 | kemalselimkoc hesabı ve repository erişimi. |

## Terminali açma

[scripts/dev-terminal.cmd](../scripts/dev-terminal.cmd) dosyasını çift tıklayarak aç. `node`, `npm`, `npx`, `dotnet`, `git` ve `gh` bu terminalde kullanılabilir. Terminal foundation repo klasöründe başlar; ürün repository'leri oluşturulduğunda `cd` ile ilgili klasöre geçilir.

Başlatıcı varsayılan olarak `%USERPROFILE%\Documents\Codex\tools` altındaki taşınabilir kurulumları kullanır. Farklı konum için `GORDION_TOOLS_ROOT` ayarlanabilir. `scripts\dev-terminal.cmd --check` etkileşimli pencere açmadan sürümleri kontrol eder.

Windows'un genel PATH'i ve kayıt defteri değiştirilmedi. Başlatıcı yalnızca açtığı terminalin PATH ve araç ortam değişkenlerini ayarlar. Diğer mevcut terminal pencerelerinin bu araçları otomatik bulacağı varsayılmamalı. Visual Studio'nun taşınabilir SDK'yı tanıması ayrıca doğrulanmalıdır.

## Codex sandbox notları

NuGet standart AppData klasörüne erişirken hata verdi. C# smoke testi yalnızca .NET child process'i için ayrı bir geçici APPDATA dizini ve açık NuGet.Config ile yapıldı; kullanıcı ayarları değiştirilmedi. Harici NuGet paketi indirme testi yapılmadı; test SDK içindeki framework referanslarını kullandı. Geliştirici terminali normal Windows kullanıcısının AppData konumunu değiştirmez.

SDK ilk kullanımının kullanıcı PATH'ini değiştirme girişimi `DOTNET_ADD_GLOBAL_TOOLS_TO_PATH=false` ile kapatıldı. CLI home, npm cache ve NuGet paket dizinleri araç klasöründe tutulur. Global npm/TypeScript kurulumu yapılmadı; ürün bağımlılıkları proje başına sabitlenecek.

GitHub token'ı repo dışında ve dosya erişimi sınırlandırılmış durumda; Windows credential store'a taşıma takip maddesidir. Codex'teki doğrulanmış Git push yöntemi integrations.md'de açıklanır. Normal kullanıcı terminalinden credential helper ile push ayrıca test edilmedi.

## İndirme doğrulaması

- Node.js ZIP SHA-256: `158f7685b44de51f6c0df1d153526cbcd3e1bc739a8dfc607721cef75de9e541`.
- .NET SDK ZIP SHA-512: `24b670ad3d923bfcf47df6c3b034152398b42f6dbc388e10d783aee1cfb5e5817d399fc0ae2a12cfa822a55e61d34830ccb15c50ef6efee437ab874bb7c79430`.
- Kaynaklar: [Node.js resmî indirme](https://nodejs.org/en/download), [Microsoft .NET 10 indirme](https://dotnet.microsoft.com/en-us/download/dotnet/10.0).

Kalanlar: Visual Studio sürüm/workload kontrolü; Core repository'si ve TypeScript iskeleti; OpenAI proje erişimi, secret saklama ve bütçe. Python, FFmpeg, Docker, VPS ve Apple Developer üyeliği ilk metin MVP'sinin ön koşulu değildir.
