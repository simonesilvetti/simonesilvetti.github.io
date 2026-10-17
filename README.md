# Website

Blog tecnico e portfolio personale scritto con **Ruby on Rails**, **ERB**, **Tailwind CSS** e **Markdown**.
Niente database, niente CMS: articoli e progetti sono file `.md` nella cartella `content/`.

## Come funziona

```
Richiesta HTTP → Router Rails → Controller → File Markdown → Commonmarker → HTML sanitizzato → ERB → Browser
```

Un esempio concreto, aprendo `/posts/imparare-ruby`:

1. `config/routes.rb` manda la richiesta a `PostsController#show` con `params[:slug] = "imparare-ruby"`.
2. Il controller chiama `Post.find("imparare-ruby")`.
3. `Post` (in `app/models/post.rb`, eredita da `app/models/markdown_file.rb`) legge `content/posts/imparare-ruby.md`.
4. Il front matter YAML diventa `title`, `date`, `description`…; il corpo Markdown diventa HTML con Commonmarker e viene ripulito dal sanitizer di Rails.
5. La vista `app/views/posts/show.html.erb` mostra il risultato dentro il layout `app/views/layouts/application.html.erb`.

### I file importanti

| File | Cosa fa |
|------|---------|
| `config/site.yml` | Nome, biografia, foto, link social |
| `config/routes.rb` | Gli URL del sito |
| `app/models/markdown_file.rb` | Legge un file `.md`: front matter, HTML, tempo di lettura |
| `app/models/post.rb`, `project.rb`, `paper.rb` | Articoli, progetti e papers (solo i campi specifici) |
| `app/controllers/*` | Tre controller da poche righe |
| `app/views/layouts/application.html.erb` | Header, footer, script del tema |
| `app/views/pages/home.html.erb` | La homepage |
| `app/assets/tailwind/application.css` | Colori, font, larghezza della colonna, stile degli articoli |
| `content/posts/`, `content/projects/`, `content/papers/`, `content/pages/` | I contenuti |

## Installazione

Servono Ruby (vedi `.ruby-version`) e Bundler.

```sh
bundle install
```

## Avviare il sito in sviluppo

```sh
bin/dev
```

`bin/dev` avvia insieme il server Rails e il watcher di Tailwind (vedi `Procfile.dev`), che ricompila il CSS quando cambi una classe in una vista.
Il sito è su http://localhost:3000.

Se preferisci avviarli separatamente:

```sh
bin/rails server
bin/rails tailwindcss:watch   # in un altro terminale
```

I file Markdown vengono riletti a ogni richiesta: aggiungi, modifica o elimina un `.md` e ricarica la pagina.

## Informazioni personali

Tutto è in `config/site.yml`: nome, descrizione (meta description), saluto, biografia, foto, GitHub, LinkedIn, email.
L'email non compare mai nell'HTML, così i bot non la raccolgono: la pagina contiene solo i due pezzi dell'indirizzo scritti al contrario, e lo script nel layout costruisce il link `mailto:` quando qualcuno passa sopra l'icona, ci arriva con la tastiera o la tocca.
Lascia un link vuoto (`""`) per nasconderlo. Dopo aver modificato il file **riavvia il server**.

Il testo della pagina About è in `content/pages/about.md` e quello della pagina Research in `content/pages/research.md`, in Markdown come i post (nel front matter basta `title`, la data non serve; `description` è facoltativa e finisce nel meta tag description, altrimenti si usa quella di `config/site.yml`).
Nella pagina About i link social sono aggiunti in fondo da soli.

### Foto profilo

Copia la tua foto in `app/assets/images/` (ad esempio `io.jpg`) e aggiorna `config/site.yml`:

```yaml
avatar: "io.jpg"
```

Un'immagine quadrata di almeno 320×320 px rende bene nel cerchio.

## Articoli

### Creare un articolo

Crea un file in `content/posts/`. Il nome del file diventa l'URL: `content/posts/imparare-ruby.md` → `/posts/imparare-ruby`.
Usa lettere minuscole, numeri e trattini.

```markdown
---
title: "Imparare Ruby"
date: 2026-10-07
description: "Appunti sul mio percorso con Ruby"
tags:
  - ruby
  - programming
---

# Imparare Ruby

Oggi ho iniziato a studiare Ruby.
```

- `title` e `date` (formato `AAAA-MM-GG`) sono obbligatori; `description` e `tags` sono facoltativi.
- La riga `# Titolo` iniziale è facoltativa: se c'è viene saltata, perché la pagina mostra già il titolo.
- Gli articoli sono ordinati per data, dal più recente. La homepage mostra gli ultimi 5 articoli e gli ultimi 3 papers.
- Il tempo di lettura è calcolato a 200 parole al minuto.

Il Markdown supporta titoli, liste, link, immagini, citazioni, blocchi di codice, tabelle e testo barrato (GitHub Flavored Markdown).
Per le immagini, mettile in `public/images/` e scrivi `![descrizione](/images/foto.png)`.

### Modificare o eliminare un articolo

Modifica il file `.md` per cambiare l'articolo, eliminalo per toglierlo dal sito. Non c'è altro da fare.

### Bozze

Con `draft: true` nel front matter un file resta nella cartella ma il sito lo ignora: non compare negli elenchi e la sua pagina dà 404.
Vale per articoli, progetti e papers. Per pubblicarlo togli la riga.

Una sezione senza file pubblicati (vuota o con sole bozze) sparisce da sola: niente voce nel menu, niente blocco in homepage
e la sua pagina non viene generata nel sito statico. Ora articoli e progetti sono tutti bozze di esempio, quindi Posts e Projects sono nascosti.

### Se un file non è valido

Un file senza front matter, senza `title`, con una data sbagliata o YAML non valido genera un errore che indica il file e il problema,
ad esempio `content/posts/x.md: title is missing`. Il test `every file in content/ is valid` lo segnala prima del deploy.

## Progetti

Uguale agli articoli, nella cartella `content/projects/`:

```markdown
---
title: "Il mio primo progetto Rails"
date: 2026-10-07
description: "Un piccolo progetto realizzato con Ruby on Rails"
technologies:
  - Ruby
  - Rails
github: "https://github.com/USERNAME/REPOSITORY"
---

Descrizione del progetto…
```

La homepage mostra i 3 progetti più recenti. Il link `github` viene mostrato solo se inizia con `https://`.

## Papers

Le pubblicazioni sono in `content/papers/`, una per file, e compaiono in `/papers` raggruppate per anno:

```markdown
---
title: "Signal Convolution Logic"
date: 2018-09-30            # data di pubblicazione: serve per ordinare e per l'anno
description: "Riassunto breve, mostrato nell'elenco."
authors:
  - Simone Silvetti
  - Laura Nenzi
venue: "International Symposium on Automated Technology for Verification and Analysis (ATVA)"
pages: "267–283"            # facoltativo
url: "https://doi.org/10.1007/978-3-030-01090-4_16"   # facoltativo, solo https
preprint: "https://arxiv.org/abs/1806.00238"          # facoltativo, versione gratuita (arXiv, repository), solo https
---

Descrizione dettagliata, visibile nella pagina del paper.
```

Tra gli autori, il nome uguale a `name` in `config/site.yml` viene mostrato in grassetto.

## Personalizzare lo stile

Lo stile è scritto con classi Tailwind direttamente nelle viste ERB. Le impostazioni comuni sono tutte in `app/assets/tailwind/application.css`:

- **Colori**: le variabili in `:root` (tema chiaro) e `[data-theme=dark]` (tema scuro). `--accent` è il colore d'accento.
  Nelle viste si usano come classi: `text-accent`, `bg-background`, `border-border`…
- **Font**: JetBrains Mono, servito dal sito stesso (`app/assets/fonts/`). Per cambiarlo, sostituisci i file e aggiorna `@font-face` e `--font-mono`.
- **Larghezza della colonna**: `--container-site` (48rem = 768px), usata con la classe `max-w-site`.
- **Articoli**: il Markdown è formattato dal plugin ufficiale [Tailwind Typography](https://github.com/tailwindlabs/tailwindcss-typography)
  (classe `prose`); il blocco `.prose { … }` adatta i suoi colori a quelli del sito.

Il progetto usa Tailwind CSS v4, che si configura nel file CSS (non c'è `tailwind.config.js`).

## Dark mode

- Alla prima visita il tema segue la preferenza del sistema operativo.
- Il pulsante sole/luna nell'header cambia tema e salva la scelta in `localStorage`.
- Lo script è nel `<head>` del layout: imposta `data-theme="light"` o `"dark"` su `<html>` prima che la pagina venga disegnata, così non c'è il "flash" del tema sbagliato.
- Il CSS cambia le variabili dei colori in base a `data-theme`. Per casi particolari esiste la variante `dark:` (ad esempio le icone sole/luna).

## Test

```sh
bin/rails test
```

I test usano i contenuti di `test/fixtures/content/` (impostato in `config/environments/test.rb`) e verificano: lettura e ordinamento dei file,
front matter, conversione Markdown, slug, tempo di lettura, file mancanti, path traversal, XSS, pagine e route.

Lo stile del codice si controlla con `bin/rubocop`.

## Pubblicare (GitHub Pages)

Online va una versione **statica** del sito: Rails genera tutte le pagine come file HTML, e GitHub Pages le serve.
Non c'è nessun server Rails da tenere acceso, quindi le pagine sono subito veloci, anche alla prima visita.

Il flusso è:

1. Scrivi o modifica un file in `content/`.
2. `git add`, `git commit`, `git push`.
3. GitHub Actions (`.github/workflows/deploy.yml`) esegue i test, genera il sito e lo pubblica. Dopo 1–2 minuti è online.

Se un test fallisce, ad esempio per un file Markdown non valido, il sito online resta quello di prima.
Lo stato dei deploy si vede nella scheda **Actions** del repository.

### Come viene generato il sito

```sh
RAILS_ENV=production SECRET_KEY_BASE_DUMMY=1 bin/rails site:build
```

Il task in `lib/tasks/site.rake`:

1. compila CSS, font e immagini (`assets:precompile`);
2. chiede all'app Rails ogni pagina (home, about, elenchi, ogni articolo, progetto e paper) e la salva in `out/<percorso>/index.html`;
3. copia `public/` in `out/`.

Per vedere il risultato in locale: `cd out && python3 -m http.server 8000`, poi apri http://localhost:8000.

Ogni nuova pagina deve comparire in `site.rake`: se aggiungi una sezione nuova, aggiungi lì i suoi percorsi.

### Configurazione su GitHub (una volta sola)

- Il repository si chiama `<username>.github.io`, così il sito è servito dalla radice `https://<username>.github.io/`.
  Con un altro nome sarebbe in una sottocartella e i link del sito, che iniziano con `/`, non funzionerebbero.
- In **Settings → Pages**, alla voce *Source* è selezionato **GitHub Actions**.
- Per un dominio tuo: **Settings → Pages → Custom domain**, poi configura il DNS come indicato da GitHub.

## Conversione Markdown → HTML

Nessun parser scritto a mano: il lavoro lo fanno librerie mature.

1. **Front matter**: il testo tra i due `---` iniziali è letto con `YAML.safe_load`, che accetta solo tipi semplici (più `Date`):
   un file Markdown non può creare oggetti Ruby.
2. **Markdown**: [Commonmarker](https://github.com/gjtorikian/commonmarker) (basato su comrak, compatibile con GitHub Flavored Markdown)
   converte il corpo in HTML. L'opzione `unsafe: false` scarta l'HTML scritto dentro il Markdown e i link `javascript:`.
3. **Sanitizzazione**: l'HTML passa comunque dal sanitizer di Rails (`sanitize`), che tiene solo tag e attributi sicuri.
4. **Slug**: è il nome del file; sono accettati solo lettere, numeri, `_` e `-`, quindi un URL non può uscire dalla cartella `content/`.

I blocchi di codice non hanno syntax highlighting, per evitare JavaScript o CSS in più.

## Riferimenti stilistici

Il design riprende [steipete.me](https://steipete.me/) (basato sul tema AstroPaper), analizzando il sito e il suo CSS:

- colonna centrale da 48rem (`max-w-3xl`) con padding di 1rem, header con nome a sinistra e menu a destra, separatori sottili;
- foto circolare da 160px accanto al saluto (`text-3xl` grassetto), biografia e icone social piccole; su mobile tutto è centrato;
- lista verticale degli articoli senza card: titolo `text-lg` nel colore d'accento, data in corsivo e tempo di lettura con opacità 80%, descrizione;
- pagina articolo con titolo nel colore d'accento, metadati sotto, link sottolineati tratteggiati, h3 in corsivo, marcatori delle liste nel colore d'accento;
- tutto in font monospace; tema chiaro con i colori originali (`#fdfdfd`, `#282728`, accento `#006cac`);
- footer con icone social a destra.

Le influenze di [Omarchy](https://omarchy.org/) sono il font JetBrains Mono e il tema scuro, con i colori della palette Tokyo Night.
Le icone sono di [Tabler Icons](https://tabler.io/icons) (MIT), il font JetBrains Mono è distribuito con licenza SIL Open Font License.
