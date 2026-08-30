# Technical Requirement Document (TRD)

> **Document Version:** 1.0.0  
> **Last Updated:** [YYYY-MM-DD]  
> **Status:** [Active | Living]  
> **Repository:** [Repo Name / URL]

---

## 1. System Architecture & Tech Stack

### 1.1 Technology Stack Matrix

| Layer | Technology / Library | Version | Selection Rationale |
| :--- | :--- | :--- | :--- |
| **Frontend Framework** | [e.g. Next.js / React / SvelteKit] | [e.g. 15.x] | [App router, SSR/SSG, fast initial load] |
| **Language & Runtime** | [e.g. TypeScript / Node.js / Python] | [e.g. 5.x / 22.x] | [Type safety, rich ecosystem, speed] |
| **Styling & UI Kit** | [e.g. Tailwind CSS + shadcn/ui] | [e.g. 4.x] | [Rapid atomic styling, accessible primitives] |
| **State Management** | [e.g. Zustand / TanStack Query] | [e.g. 5.x] | [Lightweight global state, cached server sync] |
| **Backend / API** | [e.g. Next.js Server Actions / FastAPI] | [e.g. Latest] | [Unified deployment, type-safe RPC] |
| **Database & ORM** | [e.g. PostgreSQL + Prisma / Drizzle] | [e.g. Latest] | [Relational integrity, automated migrations] |
| **Authentication** | [e.g. NextAuth / Supabase Auth / Clerk] | [e.g. Latest] | [Turnkey OAuth, JWT session handling] |
| **Deployment / Cloud** | [e.g. Vercel / Railway / Cloudflare] | [e.g. Edge] | [Instant CI/CD, global CDN distribution] |

---

## 2. Directory & Workspace Structure

```text
├── src/ / app/               # Core application source
│   ├── (auth)/               # Authentication route group
│   ├── (dashboard)/          # Authenticated app views
│   ├── api/                  # API endpoints / route handlers
│   ├── components/           # Reusable UI & layout components
│   │   ├── ui/               # Primitive design tokens / widgets
│   │   └── modules/          # Domain-specific composite widgets
│   ├── hooks/                # Custom React hooks / composables
│   ├── lib/                  # Shared utilities, DB client, helpers
│   ├── server/               # Backend logic, services, database queries
│   └── types/                # TypeScript interfaces and type definitions
├── docs/                     # Vibemax Living Documentation (Single Source of Truth)
├── public/                   # Static assets, icons, fonts
├── prisma/ / db/             # Schema definitions and migrations
├── .env.example              # Sanitized environment template
└── package.json / pyproject  # Project manifest and scripts
```

---

## 3. Environment Variables & Secret Configuration

| Variable Key | Purpose | Required? | Example / Default |
| :--- | :--- | :--- | :--- |
| `DATABASE_URL` | Database connection string | Yes | `postgresql://user:pass@localhost:5432/dbname` |
| `AUTH_SECRET` | Encryption secret for session tokens | Yes | `random-32-byte-base64-string` |
| `NEXT_PUBLIC_APP_URL`| Public URL of the frontend | Yes | `http://localhost:3000` |
| `THIRD_PARTY_API_KEY`| External service integration key | No | `sk_test_...` |

---

## 4. Build, Development & Test Commands

```bash
# Install dependencies
npm install  # or pnpm install / bun install

# Start local development server
npm run dev

# Run type checker & linting
npm run lint && npm run typecheck

# Run database migrations
npx prisma migrate dev

# Run automated tests
npm run test
```

---

## 5. Third-Party Integrations & External APIs

- **[Service 1: e.g. Stripe]**: Handles payment processing, subscriptions, and webhooks (`/api/webhooks/stripe`).
- **[Service 2: e.g. OpenAI / Anthropic / Gemini API]**: LLM provider for core generative features, streaming responses with edge timeouts.
- **[Service 3: e.g. Resend / SendGrid]**: Transactional emails for auth and system alerts.

---

## 6. Technical Guardrails & AI Coding Constraints

> [!IMPORTANT]
> **Enforced Guardrails for AI & Developers**:
> 1. **Zero Secret Leaks**: Never hardcode credentials, API keys, or raw passwords in code. Always load from `process.env` or validated config schema (e.g. Zod `env.ts`).
> 2. **Strict Typing**: No explicit `any` types allowed in TypeScript. All API payloads and database inputs/outputs must be typed.
> 3. **Error Boundaries**: Every async operation must implement try/catch or handled error states with user-friendly UI toasts.
> 4. **No Direct Mutation**: Database schema changes MUST be performed via ORM migration scripts, never manual SQL edits on production.
