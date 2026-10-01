# Codex ve geliştirme araçları bağlantısı

1 Ekim 2026. Visual Studio ile Visual Studio Code farklı ürünlerdir.

## Birlikte çalışma modeli

```text
              Aynı yerel Git repository
                 /        |         \
      Codex masaüstü   GitHub Desktop   Visual Studio / VS Code
      dosyaları düzenler commit/push     edit/build/debug
```

Bu ortak klasör modeli, uygulamalar arasında bir “hesap bağlama” işlemi gerektirmez. Uygulamaların GitHub/OpenAI oturumları ayrı olabilir. Bir uygulamada giriş yapılması diğerinde giriş yapılmış olduğunu kanıtlamaz.

- GitHub Desktop: `File → Add Local Repository` ile bu paketin klasörünü (`outputs/agent-platform-baslangic`) ekle; artık yerel `.git` içeriyor. Codex dosya değişiklikleri Desktop'ta diff olarak görünür. [GitHub rehberi](https://docs.github.com/en/desktop/adding-and-cloning-repositories/adding-a-repository-from-your-local-computer-to-github-desktop).
- Codex masaüstü: aynı klasörü local project olarak ekle. Bu oturum projectless başladı; listelemede bu yeni platforma bağlı yerel proje bulunmadı. Mevcut ChatGPT projesi yerel Git repository bağlantısı sayılmaz. Bu oturumun araçlarında local project ekleme veya mevcut sohbeti projeye taşıma işlemi yok; UI adımı kullanıcı tarafından tamamlanacak. [Yerel proje belgeleri](https://learn.chatgpt.com/docs/projects?surface=app).
- Visual Studio: aynı kaynak klasöründe C# solution/projeleriyle çalışır; bu uygulama içinde resmi Codex IDE eklentisi desteği doğrulanmadı. Kaynak klasörünün ortak olması Codex ile geliştirmeyi mümkün kılar.
- VS Code: 1.140.0 x64 kurulum doğrulandı. Resmi Codex IDE eklentisi destekleniyor. Eklenti kimliği `OpenAI.chatgpt`. [OpenAI Codex IDE belgesi](https://learn.chatgpt.com/docs/codex/ide).

## VS Code kontrol/kurulum kaydı

İlk `code --list-extensions` denemesi user-data klasörüne yazma izni olmadığı için başarısız oldu. Dar kapsamlı VS Code ayar/eklenti izinleri verildikten sonra komut başarılı ve boş liste döndürdü. Resmi eklenti kurulumu `code --install-extension OpenAI.chatgpt` ile tamamlandı (exit 0).

Doğrulanmış kurulum: `openai.chatgpt@26.928.31416`; beraberindeki `openai.codex-audio@26.928.31416`. Tekrar alınan eklenti listesi ve package manifest içindeki `publisher=openai`, `name=chatgpt`, version bilgisi kurulumu doğruladı. Manifest'te sidebar komutu `chatgpt.openSidebar` / `Open Codex Sidebar` olarak mevcut.

Başlangıç belgeleri klasörünü yeni VS Code penceresinde açma komutu başarıyla döndü. Pencere veya oturum açma durumu native UI'dan incelenmedi. Codex içinde README'yi açma isteği uygulama tarafından queued olarak alındı.

Kurulum başarılı olduğunda VS Code yeniden yüklenir/açılır; Codex ikonu veya `Codex: Open Codex Sidebar` komutuyla panel açılır; kullanıcı hesabıyla oturum açar. Bu adım tamamlanmadan OpenAI hesap bağlantısı kurulmuş kabul edilmez. Gerçek kaynak repo onaydan sonra açılacak; bugünkü dokümantasyon paketi source repo olarak kesinleştirilmedi.

## Güncel sınır

GitHub Desktop/Visual Studio uygulama pencerelerini bu oturumdan kontrol eden native UI API mevcut değil. Bu yüzden menülere tıklanmış, hesapların bağlanmış veya repository'nin uygulamalara eklenmiş olduğu iddia edilmeyecek. Repository oluştuktan sonra kullanıcıya gereken kısa UI adımları verilecek; Git ve eklenti gibi doğrulanabilir işlemler araçlarla yapılacak.
