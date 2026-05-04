# 🔍 Technical Audit & Remediation Report

## 🛠 Methodology
The audit mapped findings to the **OWASP Mobile Application Security Verification Standard (MASVS)**[cite: 3, 4].

## 🛑 Phase 1: Critical Findings (Before)
| Category | Vulnerability | Risk | Evidence |
| :--- | :--- | :---: | :--- |
| **MSTG-CRYPTO** | Hardcoded Cloud Keys (AWS/Imgur) | 🔴 Critical | Plaintext keys in service classes[cite: 3, 4]. |
| **MSTG-RESILIENCE** | Exposed Keystore Passwords | 🔴 Critical | Plaintext credentials found in `build.gradle`[cite: 4]. |
| **MSTG-PLATFORM** | QA Backdoor (Hardcoded Test Account) | 🔴 High | Bypass account `testing@qa.com` in production code[cite: 4]. |
| **MSTG-STORAGE** | Insecure Persistence (PII in SharedPreferences) | 🟠 High | Sensitive user data stored in unencrypted XML[cite: 3, 4]. |
| **MSTG-AUTH** | Client-Side HMAC & Third-Party Secrets | 🟠 High | Signing logic and service keys (OneSignal) exposed[cite: 4]. |
| **MSTG-NETWORK** | Lack of SSL Pinning & HTTP Acceptance | 🟠 Medium | Risk of Man-in-the-Middle (MitM) attacks[cite: 3, 4]. |
| **MSTG-PLATFORM** | Insecure WebView (JS Injection) | 🟠 Medium | Unrestricted JS execution and deep link logic[cite: 4]. |
| **MSTG-RESILIENCE** | Faulty Root & Emulator Detection | 🟠 Medium | Logic allowed bypass in common emulators[cite: 3, 4]. |

## ✅ Phase 2: Remediation & Sign-off (After)
| Target Fix | Action Taken | Status |
| :--- | :--- | :---: |
| Cloud Credentials | Migrated to build-time injection and backend-proxy[cite: 3, 4]. | **Verified Fixed** |
| Keystore Security | Moved credentials to gitignored `.properties` files[cite: 4]. | **Verified Fixed** |
| QA Backdoor | Removed test accounts and conditional bypasses from release[cite: 4]. | **Verified Fixed** |
| Local Storage | Migrated to `flutter_secure_storage` (Hardware-backed)[cite: 3, 4]. | **Verified Fixed** |
| Auth Architecture | Moved HMAC and REST API keys to the backend layer[cite: 4]. | **Verified Fixed** |
| Network Hardening | Enforced HTTPS-only and implemented SSL Certificate Pinning[cite: 3, 4]. | **Verified Fixed** |
| WebView Security | Implemented domain Allowlist and strict JavaScript modes[cite: 4]. | **Verified Fixed** |

> **Final Auditor Note:** The remediation process successfully moved the trust boundary from the client to the server, neutralizing the primary reverse-engineering vectors[cite: 3, 4].