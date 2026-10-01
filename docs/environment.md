# Windows geliştirme ortamı kontrolü

1 Ekim 2026. Salt okunur PowerShell kontrolleriyle hazırlanmıştır.

## Bulgular

| Bileşen | Gözlem | Anlamı / sonraki işlem |
|---|---|---|
| Windows | Build 26300.9550; DisplayVersion 26H2; registry ProductName `Windows 10 Pro` | Kullanıcı Windows 11 bildirdi. Registry'deki eski ürün etiketi tek başına sürüm kararı için kullanılmamalı; Settings/About ile edition teyidi açık. |
| Git | Codex runtime içinde 2.53.0.windows.3 çalışıyor | Sistem PATH'inde bağımsız Git görünmüyor; standart `C:\Program Files\Git` yolu yok. Normal terminal/GitHub Desktop ortamı ayrıca doğrulanmalı. |
| Git kimliği | İsim ve e-posta yapılandırılmış; credential helper `manager` | E-posta rapora kopyalanmadı. GitHub oturumunun açık olduğunu veya push yetkisini kanıtlamaz. |
| GitHub Desktop | Kullanıcının kurulum bildirimi; kullanıcı klasörü mevcut | Klasör içeriği okunamadı; sürüm ve oturum doğrulanamadı. |
| Visual Studio | Kullanıcı kurulduğunu bildirdi; `devenv` PATH'te yok | Standart kurulum yollarında ve vswhere kontrolünde doğrulama elde edilemedi. Kurulu değil denemez; IDE sürümü ve workload kontrolü açık. |
| VS Code | `code --version`: 1.140.0, x64 | Visual Studio'dan ayrı üründür. Eklenti kontrol/kurulum kaydı integrations.md'de. |
| .NET | `C:\Program Files\dotnet\dotnet.exe`; runtime 3.1.32 | `dotnet --list-sdks` boş çıktı verdi. Görünen dotnet kökünde geliştirme SDK'sı yok. Başka kurulum kökleri taranmadı. |
| Node.js | Codex runtime içinde v24.19.0 | Sistem PATH'inde bağımsız Node.js görünmüyor; standart kurulum yolu yok. |
| npm | Komut bulunamadı | TypeScript seçilirse bağımsız Node.js + npm kurulumu gerekiyor. |
| Python / py | Komut bulunamadı; standart kullanıcı Python klasörü yok | Başka yere kurulu olma ihtimali dışlanmadı. İlk MVP için zorunlu değil. |
| FFmpeg / ffprobe | Komut bulunamadı | Ses/video dönüşüm ihtiyacı çıktığında kurulum; ilk metin MVP'si için zorunlu değil. |
| PowerShell | Codex runtime içinde 7.6.5 | Sistem PATH'inde Windows PowerShell yolu var; normal terminalde PowerShell 7 ayrıca doğrulanmalı. |
| GitHub CLI | İlk kontrolde PATH'te yoktu; sonra resmî v2.102.0 taşınabilir paket kuruldu ve çalışması doğrulandı | `C:\Users\kemal\Documents\Codex\tools\github-cli\bin\gh.exe`. Sistem/user PATH değişmedi; tam yolla çağrılıyor. GitHub hesap yetkilendirmesi ayrı adım. |
| WinGet | Komut bulunamadı; WindowsApps yolu erişim engeline takıldı | Eksik kurulum olarak değerlendirilmedi. |
| OpenAI ortam değişkenleri | `OPENAI_API_KEY`, project/org değişkenleri process/user/machine kapsamlarında bulunmadı | Bu yalnızca ortam değişkeni kontrolüdür; başka secret depoları incelenmedi. API key değerleri okunmadı/yazdırılmadı. |
| Proje klasörü | `outputs/` ve `work/`; Git repository yok | Uygulama projesi henüz başlatılmamış. |
| Donanım | CIM/WMI OS, CPU ve RAM sorguları erişim engeline takıldı | CPU, RAM, GPU, mikrofon, disk boşluğu ve sanallaştırma doğrulanmadı. |

## Kontrolün sınırları

Codex araç PATH'i ile Windows kullanıcı/sistem PATH'i ayrı incelendi. PATH'te bulunamayan bir araç bütün bilgisayarda yok kabul edilmedi. Uygulama klasörleri için ek salt okunur izin verilmesine rağmen bazı klasörler erişim engeli döndürmeye devam etti. Ortam incelemesinde genel disk taraması, secret dosyası okuması, kurulum, firewall veya sistem ayarı değişikliği yapılmadı. Daha sonraki kullanıcı bağlantı talebiyle resmi VS Code Codex eklentisi kuruldu; ayrıntı integrations.md'de.

## Tamamlanacak kısa kontrol

Normal Windows terminalinde `git --version`, `node --version`, `npm --version`, `dotnet --list-sdks` ve `$PSVersionTable.PSVersion` tekrar çalıştırılmalı. GitHub Desktop'ta giriş durumu; Visual Studio'da Help/About ve Visual Studio Installer'da kurulu workload'lar kontrol edilmeli. C# seçilirse .NET desktop development; ASP.NET kullanılacaksa ASP.NET and web development ihtiyaca göre eklenmeli. Önce mevcut IDE'nin seçilen SDK ile uyumluluğu doğrulanmalı.

GitHub Desktop ve Visual Studio'nun kullanıcıya görünür kurulum durumu, makinenin işlemci mimarisi, boş disk ve mikrofon erişimi bu doğrulamada kaydedilecek. Ortam farklılıkları çözülmeden tekrarlanabilir geliştirme hazır kabul edilmeyecek.

## Kurulum önerisi — henüz uygulanmadı

1. Normal terminalde Git erişimini doğrula; gerekiyorsa bağımsız Git for Windows kur.
2. C#/.NET seçilirse .NET 10 LTS SDK ve uyumlu Visual Studio workload'larını hazırla. Mevcut 3.1 runtime proje hedefi olarak kullanılmayacak; başka uygulamanın bağımlılığı olabilir, kaldırılmayacak.
3. TypeScript seçilirse Node.js 24 LTS ve npm'yi bağımsız geliştirici kurulumu olarak hazırla. İlk aşamada npm yeterli; başka paket yöneticisi zorunlu değil.
4. Python, FFmpeg ve PowerShell 7'yi ihtiyaç çıktığında ekle. Docker/WSL/veritabanı sunucusu ilk MVP'nin ön koşulu değil.
5. OpenAI proje erişimini ve harcama limitlerini doğrula; anahtarı sohbet veya Git dosyaları yerine uygun secret deposunda tut.

Sürüm kanıtları: [Node.js sürüm takvimi](https://nodejs.org/en/about/previous-releases), [.NET destek politikası](https://dotnet.microsoft.com/en-us/platform/support/policy). 1 Ekim 2026 itibarıyla Node.js 24 LTS ve .NET 10 LTS öneri için uygun destek hatlarıdır; kurulum anında yama sürümü yeniden kontrol edilecek.
