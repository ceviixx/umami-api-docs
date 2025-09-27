# Orchestrated API Tests

Diese erweiterte Test-Suite führt CRUD-Operationen in der korrekten Reihenfolge aus und verwaltet IDs zwischen den Requests automatisch.

## 🎯 Konzept

### Problem
Die ursprünglichen Tests führten jeden API-Endpoint isoliert aus. Bei CRUD-Operationen wie `update`, `delete` oder `reset` führte dies zu Problemen, da diese Operationen gültige IDs benötigen, die durch vorherige `create`-Operationen generiert wurden. Zusätzlich führten URL-Parameter mit Leerzeichen und Sonderzeichen zu curl-Fehlern.

### Lösung
Die orchestrierten Tests führen CRUD-Operationen in der logischen Reihenfolge aus:
1. **Create** → Erstellt eine neue Ressource und extrahiert die ID
2. **Get** → Verwendet die ID um die Ressource abzurufen
3. **Update** → Verwendet die ID um die Ressource zu aktualisieren  
4. **Reset** → (nur bei Websites) Verwendet die ID um die Ressource zurückzusetzen
5. **Delete** → Verwendet die ID um die Ressource zu löschen

**Zusätzliche Verbesserungen:**
- Automatisches URL-Encoding für Parameter mit Leerzeichen und Sonderzeichen
- Robuste curl-Fehlerbehandlung verhindert Skript-Abstürze
- Automatische Failure-Dokumentation in separaten Dateien

## 📁 Struktur

```
.github/_scripts/test-orchestrated-api/
├── orchestrate-tests.sh           # Hauptscript für orchestrierte Tests
├── test-endpoint-enhanced.sh      # Erweiterte Version mit URL-Encoding und Fehlerbehandlung
├── crud-mapping.json              # Konfiguration der CRUD-Gruppen und Reihenfolge
├── test-state.json                # Temporäre Datei für ID-Management (zur Laufzeit)
└── failures/                      # Automatisch erstellte Failure-Dateien (zur Laufzeit)
```

## 🔧 Konfiguration

### CRUD-Gruppen
In `crud-mapping.json` sind die folgenden CRUD-Gruppen definiert:

- **teams**: create → get → update → delete
- **users**: create → get → update → delete  
- **websites**: create → get → update → reset → delete
- **reports**: create → get → delete
- **sessions**: list → stats → weekly → get → activity → properties

### Standalone Endpoints
Endpoints ohne CRUD-Abhängigkeiten werden weiterhin einzeln getestet:
- Authentication endpoints
- Me endpoints  
- Statistics endpoints
- etc.

## 🚀 Verwendung

### Lokal testen

```bash
# Alle Tests ausführen (CRUD + Standalone)
./orchestrate-tests.sh

# Nur CRUD-Tests
./orchestrate-tests.sh crud

# Nur Standalone-Tests
./orchestrate-tests.sh standalone

# Spezifische CRUD-Gruppe testen
./orchestrate-tests.sh teams
./orchestrate-tests.sh users
./orchestrate-tests.sh websites
./orchestrate-tests.sh reports
./orchestrate-tests.sh sessions

# Mit Debug-Ausgabe
DEBUG=true ./orchestrate-tests.sh teams
```

### Umgebungsvariablen
Erforderliche Umgebungsvariablen (gleich wie bei den ursprünglichen Tests):

```bash
export BASE_URL="https://api.umami.is/v1"
export API_KEY="your-api-key"
export TEST_WEBSITE_ID="existing-website-id"
export TEST_SESSION_ID="existing-session-id"  
export TEST_USER_ID="existing-user-id"
export DEBUG="false"  # Optional: für detaillierte Ausgabe auf "true" setzen
```

## 🔄 GitHub Workflow

Der Workflow `orchestrated-api-tests.yml` führt alle Tests über das orchestrierte System aus:

- **CRUD-Gruppen**: teams, users, websites, reports, sessions
- **Standalone-Endpoints**: Alle nicht-CRUD Endpoints werden als separate Gruppe getestet

### Matrix-Gruppen

**Orchestrated Tests:**
- teams, users, websites, reports, sessions, standalone

## ✨ Features

### Automatisches URL-Encoding
- **Leerzeichen** → `%20`
- **Doppelpunkte** → `%3A`
- **Pluszeichen** → `%2B`
- **Klammern** → `%28`, `%29`
- **Alle Sonderzeichen** werden automatisch URL-encoded
- Unterstützt komplexe Datums-Formate mit Leerzeichen und Sonderzeichen

### ID-Management
- Automatische Extraktion von IDs aus `create`-Responses
- Intelligente Ersetzung von Platzhaltern (`:teamId`, `:userId`, etc.) in URLs und Request Bodies
- Persistierung von IDs in einer State-Datei für die Dauer des Test-Laufs

### Robuste Fehlerbehandlung
- **Curl-Fehler-Sicherheit**: Tests brechen nicht bei malformierten URLs ab
- **Temporäres Deaktivieren von `set -e`** für kritische curl-Operationen
- **Automatische Failure-Dokumentation**: Erstellung von Failure-Dateien in `failures/` Verzeichnis
- **Detaillierte Failure-Reports**: Request/Response Details, URLs, Status Codes

### Enhanced Test Logic
- Behält alle ursprünglichen Test-Features bei (Response-Validierung, Type-Checking, etc.)
- Erweitert um ID-Ersetzung aus dem orchestrierten State
- Fallback zu ursprünglichen Umgebungsvariablen wenn kein State verfügbar

### Fehlerbehandlung & Monitoring
- **Failure-Dateien**: Automatische Dokumentation aller fehlgeschlagenen Tests in `failures/` Verzeichnis
- **Strukturierte Failure-Reports**: Group, Name, Method, Route, Status Codes, Request/Response Bodies
- **Debug-Informationen**: Detaillierte Logging-Ausgabe bei Aktivierung von `DEBUG=true`
- **CRUD-Abhängigkeiten**: Überspringen abhängiger Operationen wenn `create` fehlschlägt

## 🔍 Debug-Modus

Für detaillierte Ausgabe:

```bash
export DEBUG=true
./orchestrate-tests.sh teams
```

Debug-Ausgabe zeigt:
- **URL-Encoding-Details**: Originale vs. encodierte Parameter-Werte
- **Curl-Kommandos**: Vollständige curl-Befehle mit allen Headern
- **Request/Response Bodies**: Komplette HTTP-Kommunikation
- **ID-Extraktion und -Ersetzung**: State-Management-Operationen
- **Failure-Handling**: Fehlerbehandlung und Datei-Erstellung

## � Migration & Kompatibilität

Die ursprünglichen Tests bleiben unverändert und funktionsfähig. Die orchestrierten Tests sind eine Ergänzung, die für CRUD-Operationen eine realistischere Test-Umgebung bietet.

### Vorteile der neuen Struktur:
- ✅ **Realistische Test-Szenarien** für CRUD-Operationen
- ✅ **Automatisches URL-Encoding** für komplexe Parameter-Formate
- ✅ **Robuste Fehlerbehandlung** verhindert Skript-Abbrüche
- ✅ **Automatische Failure-Dokumentation** in strukturierten Dateien
- ✅ **Keine manuellen ID-Eingaben** erforderlich
- ✅ **Automatische Cleanup** durch Delete-Operationen
- ✅ **Bessere Abdeckung** von Abhängigkeiten zwischen Endpoints
- ✅ **Beibehaltung aller ursprünglichen Test-Features**

### Rückwärtskompatibilität:
- Alle bestehenden Umgebungsvariablen bleiben gültig
- Ursprüngliche `test-endpoint.sh` Aufrufe funktionieren weiterhin
- Neue Features sind opt-in und brechen keine bestehenden Workflows