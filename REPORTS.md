# 🔍 Technical Audit & Remediation Report

## 🛠 Methodology
The audit mapped findings to the **OWASP Mobile Application Security Verification Standard (MASVS)**.

## 🛑 Phase 1: Critical Findings (Before)
| Category | Vulnerability | Risk | Evidence |
| :--- | :--- | :---: | :--- |
| **MSTG-CRYPTO** | Hardcoded Cloud Keys (AWS/Imgur) | 🔴 Critical | Plaintext keys in service classes. |
| **MSTG-RESILIENCE** | Exposed Keystore Passwords | 🔴 Critical | Plaintext credentials found in `build.gradle`. |
| **MSTG-PLATFORM** | QA Backdoor (Hardcoded Test Account) | 🔴 High | Bypass account `testing@qa.com` in production code. |
| **MSTG-STORAGE** | Insecure Persistence (PII in SharedPreferences) | 🟠 High | Sensitive user data stored in unencrypted XML. |
| **MSTG-AUTH** | Client-Side HMAC & Third-Party Secrets | 🟠 High | Signing logic and service keys (OneSignal) exposed. |
| **MSTG-NETWORK** | Lack of SSL Pinning & HTTP Acceptance | 🟠 Medium | Risk of Man-in-the-Middle (MitM) attacks. |
| **MSTG-PLATFORM** | Insecure WebView (JS Injection) | 🟠 Medium | Unrestricted JS execution and deep link logic. |
| **MSTG-RESILIENCE** | Faulty Root & Emulator Detection | 🟠 Medium | Logic allowed bypass in common emulators. |

## ✅ Phase 2: Remediation & Sign-off (After)
| Target Fix | Action Taken | Status |
| :--- | :--- | :---: |
| Cloud Credentials | Migrated to build-time injection and backend-proxy. | **Verified Fixed** |
| Keystore Security | Moved credentials to gitignored `.properties` files. | **Verified Fixed** |
| QA Backdoor | Removed test accounts and conditional bypasses from release. | **Verified Fixed** |
| Local Storage | Migrated to `flutter_secure_storage` (Hardware-backed). | **Verified Fixed** |
| Auth Architecture | Moved HMAC and REST API keys to the backend layer. | **Verified Fixed** |
| Network Hardening | Enforced HTTPS-only and implemented SSL Certificate Pinning. | **Verified Fixed** |
| WebView Security | Implemented domain Allowlist and strict JavaScript modes. | **Verified Fixed** |

> **Final Auditor Note:** The remediation process successfully moved the trust boundary from the client to the server, neutralizing the primary reverse-engineering vectors.