# UI/UX Design Spec Sheet & Design System Tokens

> **Document Version:** 1.0.0  
> **Last Updated:** [YYYY-MM-DD]  
> **Status:** [Active | Living]  
> **Repository:** [Repo Name]

---

## 1. Visual Design Philosophy & Aesthetics

- **Design Tone**: Clean, modern, high-density developer-friendly interface with crisp contrast and subtle micro-interactions.
- **Design Tokens Source**: Tailwind CSS / CSS Custom Properties in `globals.css` and `tailwind.config.ts`.
- **Mode Support**: Dark Mode (Default) + Light Mode with instant toggle and zero-flash initialization.

---

## 2. Color Palette & Design Tokens

### 2.1 Dark Mode Palette (Primary)

| Token Name | CSS Variable | Hex / HSL Value | Usage Description |
| :--- | :--- | :--- | :--- |
| **Background (Canvas)** | `--bg-primary` | `#0B0F17` / `hsl(222, 47%, 7%)` | App background, page canvas |
| **Surface / Card** | `--bg-surface` | `#111827` / `hsl(217, 33%, 11%)` | Cards, modals, sidebars, popovers |
| **Surface Elevated** | `--bg-elevated`| `#1F2937` / `hsl(215, 28%, 17%)` | Hover states, active tabs, dropdowns |
| **Border / Divider** | `--border-subtle`| `#374151` / `hsl(217, 19%, 27%)` | Card borders, input outlines, dividers |
| **Primary Accent** | `--accent-primary`| `#6366F1` / `hsl(239, 84%, 67%)` | Primary buttons, active focus rings, links |
| **Primary Hover** | `--accent-hover` | `#4F46E5` / `hsl(243, 75%, 59%)` | Button hover and pressed state |
| **Success** | `--status-success`| `#10B981` / `hsl(160, 84%, 39%)` | Success badges, toast alerts, passing states |
| **Warning** | `--status-warning`| `#F59E0B` / `hsl(38, 92%, 50%)` | Warning banners, rate limit notices |
| **Error / Destructive** | `--status-error`| `#EF4444` / `hsl(0, 84%, 60%)` | Error badges, delete buttons, form errors |
| **Text Primary** | `--text-primary` | `#F9FAFB` / `hsl(210, 40%, 98%)` | Headers, primary labels, main body text |
| **Text Secondary** | `--text-secondary`| `#9CA3AF` / `hsl(218, 11%, 65%)` | Subtitles, helper text, timestamps |
| **Text Muted** | `--text-muted` | `#6B7280` / `hsl(220, 9%, 46%)` | Placeholders, disabled states, icon tints |

---

## 3. Typography Hierarchy

- **Primary Font Family**: `Inter`, `-apple-system`, `BlinkMacSystemFont`, `sans-serif`
- **Monospace Font Family**: `JetBrains Mono`, `Fira Code`, `monospace`

| Style Level | Font Size | Line Height | Weight | Letter Spacing | Example CSS / Tailwind |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Display H1** | `2.25rem (36px)`| `2.5rem` | `700 (Bold)` | `-0.025em` | `text-4xl font-bold tracking-tight` |
| **Section H2** | `1.875rem (30px)`| `2.25rem`| `600 (Semibold)`| `-0.02em` | `text-3xl font-semibold tracking-tight` |
| **Card H3** | `1.5rem (24px)` | `2.0rem` | `600 (Semibold)`| `-0.015em` | `text-2xl font-semibold` |
| **Subhead H4** | `1.125rem (18px)`| `1.5rem` | `500 (Medium)` | `normal` | `text-lg font-medium` |
| **Body (Default)**| `0.875rem (14px)`| `1.25rem`| `400 (Regular)`| `normal` | `text-sm font-normal text-foreground` |
| **Caption / Small**| `0.75rem (12px)` | `1.0rem` | `400 (Regular)`| `normal` | `text-xs text-muted-foreground` |
| **Code / Snippet** | `0.8125rem (13px)`| `1.2rem` | `400 (Regular)`| `normal` | `font-mono text-[13px]` |

---

## 4. Reusable Component Matrix & Formatting Rules

### 4.1 Buttons
- **Primary**: `bg-indigo-600 hover:bg-indigo-500 text-white font-medium px-4 py-2 rounded-lg shadow-sm transition-all focus:ring-2 focus:ring-indigo-400`
- **Secondary / Outline**: `border border-slate-700 bg-slate-800/50 hover:bg-slate-800 text-slate-200 px-4 py-2 rounded-lg transition-colors`
- **Ghost**: `hover:bg-slate-800 text-slate-400 hover:text-slate-100 px-3 py-1.5 rounded-md`
- **Destructive**: `bg-red-600/10 border border-red-500/20 text-red-400 hover:bg-red-600 hover:text-white px-4 py-2 rounded-lg`

### 4.2 Form Inputs & Controls
- **Text Input**: `bg-slate-900 border border-slate-700 focus:border-indigo-500 focus:ring-1 focus:ring-indigo-500 text-slate-100 placeholder-slate-500 rounded-lg px-3.5 py-2 text-sm`
- **Select / Dropdown**: Framer-motion or Radix UI animated popover with matching surface styling.
- **Toggle / Switch**: Smooth animated pill with clear active state glow.

### 4.3 Cards & Containers
- **Card**: `bg-slate-900/60 border border-slate-800/80 rounded-xl p-5 backdrop-blur-sm shadow-md hover:border-slate-700 transition-all`
- **Modal / Dialog**: `bg-slate-900 border border-slate-700 rounded-2xl p-6 shadow-2xl max-w-lg w-full backdrop-blur-md`

---

## 5. Spacing, Radii & Grid System

- **Standard Radii**:
  - Small / Badge: `rounded-md (6px)`
  - Input / Button: `rounded-lg (8px)`
  - Card / Modal: `rounded-xl (12px)` to `rounded-2xl (16px)`
- **Grid System**: 12-column responsive grid (`grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6`).
- **Container Max Width**: `max-w-7xl mx-auto px-4 sm:px-6 lg:px-8`.

---

## 6. Micro-Interactions & Animation Guidelines

- **Transitions**: Use fast, natural durations (`duration-150` for buttons, `duration-200` for modals/drawers).
- **Loading States**: Skeleton loaders (`animate-pulse bg-slate-800 rounded`) over generic spinners for page elements.
- **Empty States**: Centered illustration/icon + clear title + 1 primary call-to-action button.
