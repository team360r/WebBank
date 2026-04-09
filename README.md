# WebBank — Flutter Web Accessibility Tutorial

**Learn Flutter web accessibility by building a banking dashboard.**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue.svg)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

## What is this?

WebBank is a hands-on Flutter web accessibility tutorial where you build an accessible banking dashboard — one chapter at a time. You will learn how Flutter renders to the web, how responsive layouts adapt from mobile to desktop, and how to make web apps keyboard-navigable, screen-reader-friendly, and WCAG-compliant.

The tutorial is delivered through a **browser-based guide** (Docusaurus site) with a **live app preview** embedded directly in the chapter pages. Edit code in your IDE, and the embedded preview updates instantly. A **before/after toggle** lets you compare the inaccessible original with each accessible improvement as you build it. No prior web accessibility knowledge is needed — that's what we're here for!

---

## Prerequisites

- [ ] Flutter SDK 3.x+ — [Install Flutter](https://docs.flutter.dev/get-started/install)
- [ ] Node.js 20+ — [nodejs.org](https://nodejs.org) — for the tutorial guide
- [ ] VS Code — [Set up VS Code for Flutter](https://docs.flutter.dev/tools/vs-code) OR Android Studio — [Set up Android Studio](https://docs.flutter.dev/tools/android-studio)
- [ ] Chrome browser (for Flutter web development)
- [ ] Basic Flutter knowledge (built at least one app)
- [ ] Completed [AccessBank](https://github.com/team360r/AccessBank) or equivalent mobile accessibility experience recommended
- [ ] No web accessibility experience needed!

---

## Quick Start

```bash
git clone git@github.com:team360r/WebBank.git
cd WebBank
./setup.sh
```

`setup.sh` installs all Flutter and Node.js dependencies.

Then start everything with one command:

```bash
./start.sh
```

This launches both the tutorial guide at `http://localhost:3000` and the Flutter web app at `http://localhost:8080`. The tutorial pages embed the web app in an iframe for side-by-side learning.

Finally, open the project in your IDE:

```bash
code .              # VS Code
# or open the WebBank/ folder in Android Studio
```

---

## How This Tutorial Works

WebBank uses a unique **embedded preview** approach. The Docusaurus tutorial site loads the Flutter web app in an iframe, with a postMessage bridge that lets the tutorial control the app — navigating to specific routes, toggling accessible mode, and reloading after code changes.

| Panel | What's Here |
|-------|-------------|
| **Browser** | Tutorial guide at `localhost:3000` — instructions, code diffs, and live app preview |
| **IDE** | VS Code or Android Studio — where you edit the Flutter code |
| **Preview** | Flutter web app at `localhost:8080` — embedded in the tutorial, updates on hot reload |

### Before/After Toggle

Every screen in WebBank has two modes — the original inaccessible version and the accessible version you build chapter by chapter. The toggle in the embedded preview lets you switch between them while following along.

### Chapter Branches

Every chapter has a matching **git branch** containing the app exactly as it should look after completing that chapter. The branches build incrementally:

| Branch | What it contains |
|--------|-----------------|
| `chapter-0-toolkit` | Starter app, web DevTools setup |
| `chapter-1-hello` | + App structure, adaptive scaffold, NavigationRail |
| `chapter-2-responsive` | + Responsive breakpoints, LayoutBuilder, MediaQuery |
| `chapter-3-routing` | + go_router, URL-based navigation, deep links |
| `chapter-4-semantics` | + Web semantics, ARIA roles, semantic HTML output |
| `chapter-5-keyboard` | + Keyboard navigation, focus management, skip links |
| `chapter-6-forms` | + Accessible forms, labels, validation, error announcements |
| `chapter-7-visual` | + Contrast, text scaling, reduced motion, dark mode |
| `chapter-8-testing` | + Widget tests, integration tests, Lighthouse CI |
| `chapter-9-deploy` | + Flutter web build, PWA, GitHub Pages deployment |
| `chapter-10-porting` | + Porting mobile accessibility patterns to web |
| `completed` | The fully accessible web app |

**Stuck on a chapter?** Check out the branch to see the solution:

```bash
# See the completed code for chapter 4
git checkout chapter-4-semantics

# Compare your work against the solution
git diff chapter-4-semantics -- lib/

# Go back to your working branch
git checkout main
```

> **Tip:** You don't need to use the branches at all if you're following along and writing the code yourself — they're a safety net, not a requirement.

---

## Chapter Overview

| # | Chapter | Focus | Time |
|---|---------|-------|------|
| 0 | Your Web Toolkit | Chrome DevTools, Lighthouse, screen readers on web | ~15 min |
| 1 | Hello WebBank | App structure, adaptive scaffold, NavigationRail | ~25 min |
| 2 | Think Responsive | LayoutBuilder, breakpoints, MediaQuery | ~25 min |
| 3 | Every Page Has an Address | go_router, URL navigation, deep links | ~25 min |
| 4 | The Semantics Web | Web semantics, ARIA output, semantic HTML | ~25 min |
| 5 | Keyboard is King | Tab order, focus traps, skip links | ~25 min |
| 6 | Forms That Work | Labels, validation, error announcements | ~25 min |
| 7 | See It Clearly | Contrast, scaling, reduced motion, dark mode | ~25 min |
| 8 | Test the Web | Widget tests, Lighthouse CI, axe-core | ~30 min |
| 9 | Ship It | Flutter web build, PWA, GitHub Pages | ~25 min |
| 10 | From Mobile to Web | Porting AccessBank patterns to the web | ~25 min |

**Total time:** ~4.5 hours

---

## Project Structure

```
WebBank/
├── docs-site/                  # Tutorial website (Docusaurus)
│   ├── docs/chapters/          #   11 chapters (0-10)
│   ├── src/components/         #   WebBankEmbed (iframe bridge), Quiz
│   ├── src/hooks/              #   Progress tracking
│   └── src/theme/              #   Resume banner + visited checkmarks
│
├── lib/                        # WebBank app (Flutter web)
│   ├── screens/                #   Login, Dashboard, Transactions, Transfer, Settings
│   ├── widgets/                #   WebBankScaffold (adaptive), reusable components
│   ├── router.dart             #   go_router configuration
│   ├── app_state.dart          #   ChangeNotifier state management
│   ├── data/                   #   Models, mock data (GBP)
│   ├── theme/                  #   Material 3 accessible palette
│   └── tutorial/               #   PostMessage bridge for docs-site communication
│
├── web/                        # Flutter web assets
├── test/                       # Widget and unit tests
├── setup.sh                    # Install Flutter + Node deps
└── start.sh                    # Launch tutorial + web app
```

---

## What Makes Web Different?

Flutter web has unique accessibility challenges that native mobile doesn't:

- **Keyboard navigation** is expected — every interactive element must be reachable via Tab
- **URLs matter** — screen readers use page titles and headings for navigation
- **Responsive layout** — the same app must work on a phone screen and a 4K monitor
- **HTML semantics** — Flutter renders to a shadow DOM; you control what the accessibility tree looks like
- **Lighthouse audits** — automated WCAG compliance checking via Chrome DevTools

WebBank teaches all of these, building on the mobile accessibility foundations from [AccessBank](https://github.com/team360r/AccessBank).

---

## Tech Stack

**Tutorial site:** Docusaurus 3.9, React 19, TypeScript, Mermaid diagrams, WebBankEmbed (postMessage iframe bridge)

**WebBank app:** Flutter 3.22+ (web), ChangeNotifier state management, go_router, Material 3

---

## Useful Resources

### Flutter Web

- [Flutter Web Overview](https://docs.flutter.dev/platform-integration/web)
- [Building a Web App with Flutter](https://docs.flutter.dev/get-started/web)
- [Web Renderers](https://docs.flutter.dev/platform-integration/web/renderers)

### Web Accessibility

- [WCAG 2.1 Quick Reference](https://www.w3.org/WAI/WCAG21/quickref/)
- [WAI-ARIA Authoring Practices](https://www.w3.org/WAI/ARIA/apd/)
- [Lighthouse Accessibility Audits](https://developer.chrome.com/docs/lighthouse/accessibility/)

### Tools

- [Chrome DevTools Accessibility](https://developer.chrome.com/docs/devtools/accessibility/reference)
- [axe DevTools Extension](https://www.deque.com/axe/devtools/)
- [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/)

---

## Troubleshooting

**"Tutorial site won't start"**
Check that Node.js 20+ is installed (`node --version`). Then run `cd docs-site && npm install` and try `./start.sh` again.

**"Flutter web app won't load"**
Make sure Chrome is installed and `flutter config --enable-web` has been run. Try `flutter run -d chrome --web-port=8080` manually.

**"Embedded preview shows a blank iframe"**
The Flutter web app must be running on port 8080 for the embedded preview to work. Check that `./start.sh` launched both servers.

**"Hot reload not working on web"**
Flutter web uses hot restart, not hot reload. Press `R` (capital) in the terminal running the Flutter web server, or save a file with your IDE configured for hot restart.

**"App looks different from the chapter branch"**
Check which branch you are on (`git branch`) and run `flutter pub get` after switching branches.

---

## Related Tutorials

WebBank is part of the **\*Bank tutorial series**:

| Tutorial | Focus |
|----------|-------|
| [AccessBank](https://github.com/team360r/AccessBank) | Flutter mobile accessibility (iOS/Android) |
| **WebBank** (this repo) | Flutter web accessibility |
| [CoreBank](https://github.com/team360r/CoreBank) | Flutter fundamentals |
| [SecureBank](https://github.com/team360r/SecureBank) | Flutter security (OWASP Mobile Top 10) |
| [CheckBank](https://github.com/team360r/CheckBank) | Flutter accessibility testing |

---

## Contributing & License

This project is licensed under the [MIT License](LICENSE). Contributions are welcome — please open an issue first to discuss any significant changes.
