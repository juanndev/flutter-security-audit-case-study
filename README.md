# 🛡️ Mobile AppSec Audit & Remediation Study
### Estudo de Caso de Auditoria e Remediação de Segurança Mobile

---

## 🇺🇸 English Summary
This repository documents a comprehensive security audit and technical remediation process performed on a production-scale E-commerce application built with Flutter. The project strictly followed the **OWASP Mobile Application Security Verification Standard (MASVS)** to identify and fix critical vulnerabilities.

**Key Results:**
*   Eliminated critical hardcoded cloud credentials (AWS/Imgur) and internal service secrets (OneSignal/Chat)[cite: 3, 4].
*   Migrated local data persistence to hardware-backed encrypted storage[cite: 3, 4].
*   Decoupled cryptographic signing (HMAC) to a secure backend proxy.
*   Removed legacy QA backdoors and secured build-signing configurations (Gradle Keystore).
*   Implemented network hardening (SSL Pinning/HTTPS enforcement) and WebView security[cite: 3, 4].
*   Achieved "Verified Fixed" status across all identified attack vectors[cite: 3, 4].

---

## 🇧🇷 Resumo em Português
Este repositório documenta um processo completo de auditoria de segurança e remediação técnica realizado em um aplicativo de e-commerce de larga escala. O projeto seguiu rigorosamente o padrão internacional **OWASP MASVS** para mitigar riscos críticos[cite: 3, 4].

**Resultados Principais:**
*   Eliminação de segredos, credenciais de nuvem (AWS/Imgur) e chaves de serviços internos (OneSignal/Chat) expostas no código[cite: 3, 4].
*   Migração do armazenamento local para persistência criptografada em hardware[cite: 3, 4].
*   Desacoplamento de assinaturas criptográficas (HMAC) para um proxy seguro no backend[cite: 4].
*   Remoção de "backdoors" de teste (QA) e proteção de arquivos de assinatura do app (Gradle Keystore)[cite: 4].
*   Implementação de blindagem de rede (SSL Pinning/HTTPS) e segurança em WebViews[cite: 3, 4].
*   Status de "Verified Fixed" (Corrigido e Validado) em todos os vetores de ataque[cite: 3, 4].

---

## 📂 Navigation / Navegação
*   [**REPORTS.md**](./REPORTS.md): Detailed audit findings and remediation history.
*   [**SOLUTIONS.md**](./SOLUTIONS.md): Technical code examples.