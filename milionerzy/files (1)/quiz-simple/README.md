# Quiz Programistyczny

Prosty quiz z pytaniami generowanymi przez Gemini AI.

## Uruchomienie

```bash
docker compose up -d
```

Otwórz: http://localhost:8080

---

## Dwa tryby pracy

### Tryb Gemini (domyślny — bez n8n)

1. Otwórz `frontend/index.html`
2. Wstaw swój klucz Gemini API w linii:
   ```js
   const GEMINI_KEY = 'WSTAW_TUTAJ_KLUCZ_GEMINI';
   ```
3. Historia zapisywana do localStorage przeglądarki.

Klucz Gemini: https://aistudio.google.com/app/apikey (bezpłatny)

### Tryb n8n (pełny stack z MySQL)

1. Zmień w `frontend/index.html`:
   ```js
   const MODE = 'n8n';
   ```
2. Uruchom kontenery: `docker compose up -d`
3. Wejdź na http://localhost:5678
4. Dodaj credentials:
   - **MySQL** → host: `mysql`, port: `3306`, db: `quiz_db`, user: `quiz_user`, pass: `quiz_pass`
   - **HTTP Header Auth** → Authorization: `Bearer TWOJ_KLUCZ_GEMINI`
5. Importuj 3 pliki z `n8n/workflows/` i aktywuj każdy.

---

## Endpointy (tryb n8n)

| Metoda | URL | Opis |
|--------|-----|------|
| POST | `/api/generate` | Generuje pytania przez Gemini |
| POST | `/api/save` | Zapisuje wynik do MySQL |
| GET | `/api/history` | Pobiera historię |

---

## Struktura plików

```
quiz-simple/
├── docker-compose.yml
├── README.md
├── frontend/
│   └── index.html
├── nginx/
│   └── nginx.conf
├── mysql/
│   └── init/schema.sql
└── n8n/workflows/
    ├── 01_generate.json
    ├── 02_save.json
    └── 03_history.json
```
