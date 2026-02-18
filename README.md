# Unsaid — AI Emotional Reading App (Flutter)

Unsaid is a Flutter mobile app that generates emotionally reflective readings from a user’s input.

Instead of predicting outcomes, it interprets emotional subtext, internal tension, and what remains unsaid beneath surface language.

Full-stack Personal Project (Flutter + Firebase + Cloud Functions + Gemini)

---

## Demo / Screenshots
- Demo video: 
- Screenshots: 

---

## Key Highlights
- Server-side AI orchestration (Gemini API key never exposed to client)
- Summary / Full split to reduce Firestore read cost and payload size
- Cursor-based pagination for scalable history browsing
- Soft delete lifecycle with transactional consistency
- Firebase Auth + ID token verification via Admin SDK
- Clean API layer using Cloud Functions (Node + TypeScript)

---

## Tech Stack

### Mobile
- Flutter (iOS / Android)
- BLoC state management
- Freezed (immutable models / union states)
- Firebase Authentication (Google Sign-In)

### Backend
- Firebase Cloud Functions (Node + TypeScript)
- Firestore
- Firebase Admin SDK

### AI
- Google Gemini API (server-side only)

---

## Flutter Architecture

### State Management (BLoC + Freezed)
- Feature-level BLoC controls UI state transitions (loading → success/failure).
- Freezed is used for:
  - Immutable state/data models
  - Union/sealed-style states (e.g., idle/loading/success/failure)
  - Safer pattern matching via `when` / `map`

### Layering (Project Convention)
- Presentation: widgets/pages + BLoC
- Domain: app-level models and business rules (where applicable)
- Data: Firebase / Cloud Functions integration, DTO mapping, repositories

### UI Principles
- Minimal, restrained UX designed to discourage repetitive prompting.
- History list uses lightweight summary payloads; detail view fetches full interpretation only when opened.

---

## Architecture Overview

```
+-------------+        ID Token        +--------------------+
|  Flutter    |  ------------------->  | Cloud Functions    |
|  App        |                        | (API Layer)        |
+-------------+                        +--------------------+
                                               |
                                               v
                                       +---------------+
                                       |   Firestore   |
                                       +---------------+
                                               |
                                               v
                                       +---------------+
                                       | Gemini API    |
                                       | (Server-side) |
                                       +---------------+
```

### Architectural Decisions
- AI API key is never exposed to the client.
- Cloud Functions acts as a single orchestration layer.
- Firestore reads are minimized through summary/full split.
- Soft delete lifecycle is implemented for safer data management.
- Cursor pagination reduces read cost and avoids deep offset queries.
- Transactional writes keep summary and full documents consistent.

---

## Application Flow

### 1) Authentication
1. User signs in with Google
2. Firebase ID Token issued
3. Token sent to server (Cloud Functions)
4. Server verifies token via Firebase Admin SDK
5. User document is upserted if missing

### 2) Reading Creation
1. User submits a question/prompt
2. Server:
   - Validates auth
   - Reads user birth (optional)
   - Calculates zodiac (optional contextual hint)
   - Calls Gemini API
   - Stores reading using Firestore transaction (full + summary)
3. Returns structured Reading model

### 3) Reading History
- Query `reading_summaries`
- Filter: status = active
- Cursor-based pagination
- Lightweight payload (summary only)

### 4) Reading Detail
- Fetch readings/{id}
- Ownership validation
- Return full interpretation

### 5) Deletion (Soft Delete)

Soft delete fields:
```
status = "deleted"
deleted_at = timestamp
```

Both summary and full documents are updated transactionally.

---

## Data Model

### ERD (Conceptual)
```
User (1) -------- (N) Reading
   |                    |
   |                    |
   |              ReadingSummary
   |
   +------ (1) UserSetting
```

### users/{uid}
```json
{
  "uid": "string",
  "email": "string",
  "birth": "YYYY-MM-DD | null",
  "daily_question_count": 0,
  "last_question_date": "YYYY-MM-DD",
  "created_at": "timestamp",
  "updated_at": "timestamp"
}
```

### user_settings/{uid}
```json
{
  "is_marketing": false,
  "created_at": "timestamp",
  "updated_at": "timestamp"
}
```

### readings/{id} (Full)
```json
{
  "id": "string",
  "uid": "string",
  "question": "string",
  "interpretation": "string",
  "unsaid_line": "string",
  "status": "active | deleted",
  "deleted_at": "timestamp | null",
  "created_at": "timestamp",
  "updated_at": "timestamp"
}
```

### reading_summaries/{id} (Lightweight)
```json
{
  "id": "string",
  "uid": "string",
  "question": "string",
  "unsaid_line": "string",
  "status": "active | deleted",
  "deleted_at": "timestamp | null",
  "created_at": "timestamp",
  "updated_at": "timestamp"
}
```

---

## API Specification (Cloud Functions)

### POST /gemini
Creates a reading.

Request:
```json
{
  "prompt": "I'm happy but also sad."
}
```

Response:
```json
{
  "data": {
    "id": "abc123",
    "question": "...",
    "interpretation": "...",
    "unsaid_line": "...",
    "created_at": "...",
    "updated_at": "..."
  }
}
```

### GET /readings
Cursor-based pagination.

Query parameters:
- limit
- cursor
- cursor_id

### GET /readings/:id
Returns full reading detail.

### DELETE /readings/:id
Soft delete.

### GET /user-settings
### PUT /user-settings

---

## Security Design
- Firebase Admin token verification
- Ownership validation for reads
- Environment-based secret management
- Soft delete lifecycle
- No client exposure of API keys

---

## Performance Strategy
- Cursor-based pagination
- Summary documents for list view
- Transactional writes
- Avoid N+1 read patterns
- Prompt length control

---

## Testing Strategy

### Unit
- Service layer (zodiac, prompt builder)
- Utility functions

### Integration
- Token verification
- Firestore transactions
- AI response validation

### Manual QA
- Auth flow
- Delete lifecycle
- Pagination boundary testing

---

## Local Development

### Flutter
```bash
flutter pub get
flutter run
```

### Build Runner
```bash
dart run build_runner build --delete-conflicting-outputs
```

### iOS (CocoaPods)
```bash
cd ios
pod install
cd ..
```

### Firebase Emulator (Functions only)
```bash
firebase emulators:start --only functions
```

---

## Deployment

### Functions
```bash
firebase deploy --only functions
```

### Required Environment Variables (Functions)
- GEMINI_API_KEY
- GEMINI_MODEL

---

## Roadmap
- Subscription model
- Enforced daily quota
- Rate limiting & abuse prevention
- Multi-language support
- Analytics-based personalization
- Prompt A/B testing
- Admin moderation dashboard

---

## Author
Full-stack Flutter + Firebase AI-integrated application designed and implemented independently.
