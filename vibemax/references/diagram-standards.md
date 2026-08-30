# Mermaid Diagram Standards & Syntax Guidelines for Vibemax

To ensure every Mermaid diagram renders flawlessly across Antigravity, GitHub, GitLab, VS Code, and Cursor previews, adhere to these syntax rules:

---

## 1. Flowchart & Screen Navigation Rules (`docs/app-flow.md`)

1. **Direction**: Use `flowchart TD` (Top-to-Bottom) or `flowchart LR` (Left-to-Right) for clean readability.
2. **Node IDs & Safe Labels**:
   - Always use alphanumeric node identifiers without special characters (e.g. `LandingPage`, `DashboardView`, `ProjectEditor`).
   - Wrap labels with special characters (brackets, slashes, parens) in quotes:
     ```mermaid
     flowchart TD
         Landing["Landing Page (/)"] -->|"Click Auth"| AuthModal["Sign In / Sign Up Modal"]
         AuthModal -->|"Success"| Dashboard["Dashboard (/dashboard)"]
     ```
3. **Subgraphs**: Use subgraphs to logically group related screens (e.g. `subgraph Authenticated App`, `subgraph Onboarding Flow`).

---

## 2. Entity-Relationship (ER) Diagram Rules (`docs/backend-schema.md`)

1. **Header**: Always declare `erDiagram` at the top.
2. **Relationships & Cardinalities**:
   - `||--o{` : One-to-Many
   - `||--||` : One-to-One
   - `}|--|{` : Many-to-Many
   - `||--o|` : One-to-Zero/One
3. **Entity Syntax**:
   ```mermaid
   erDiagram
       User ||--o{ Post : "creates"
       User {
           string id PK
           string email UK "unique"
           string password_hash
           datetime created_at
       }
       Post {
           string id PK
           string user_id FK
           string title
           text body
           enum status "DRAFT, PUBLISHED"
       }
   ```

---

## 3. Sequence Diagram Rules (`docs/app-flow.md` & `docs/backend-schema.md`)

1. **Header**: Declare `sequenceDiagram` and enable `autonumber`.
2. **Actors & Participants**: Explicitly declare `actor` for humans and `participant` for UI, API, DB, and external services.
   ```mermaid
   sequenceDiagram
       autonumber
       actor User
       participant UI as Client Web
       participant API as Backend API
       participant DB as Postgres DB

       User->>UI: Clicks "Create Project"
       UI->>API: POST /api/projects
       API->>DB: INSERT INTO projects
       DB-->>API: Returns new record
       API-->>UI: HTTP 201 Created
       UI-->>User: Renders Canvas
   ```
