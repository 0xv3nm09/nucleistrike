# nuclei strike


# 🧠 Nucleistrike - Modular Recon & Vulnerability Scanner

A fully interactive, modular wrapper for [Nuclei](https://github.com/projectdiscovery/nuclei) with integrated **XSS testing (Dalfox + XSStrike)**, **recon**, **CVE detection**, **IDOR/SSRF/LFI** scans, and **directory fuzzing** via Gobuster.

---

## 🎯 Features

- 🌐 Probe targets with `httpx`
- 🧠 Smart logic: custom headers, rate-limited scanning, severity filtering
- ⚡ Fast module selection:
  - XSS (Nuclei + Dalfox + XSStrike)
  - Recon templates (tech stack, panels, exposures)
  - CVEs
  - SSRF, IDOR, LFI
  - Hidden Parameters + Gobuster Directory Fuzz
- 🔐 Optional custom header injection
- 🌈 Color-coded CLI for clarity
- 📁 Auto output to `~/Desktop/work/nucleistrike_<timestamp>/`

---

## ⚙️ Scan Speed Levels

| Level | Requests/sec |
|-------|---------------|
| 1     | 1             |
| 2     | 2             |
| 3     | 4             |
| 4     | 6             |
| 5     | 8             |
| 6     | 12            |
| 7     | 16            |
| 8     | 18            |
| 9     | 20            |
| 10    | 25            |

---

## 🛡️ Safety & Fail-Safes

- Creates unique timestamped output folders
- Validates target, headers, severity before running
- Prevents crashes with empty inputs
- Silent mode for clean terminal view
- Warns if no findings are returned

---

## 🔧 Modules

1. **XSS Scanner**
   - `nuclei` with XSS templates
   - Optionally run `dalfox` and `xsstrike`

2. **Recon Scanner**
   - `nuclei` tags: `recon`, `panel`, `exposure`

3. **CVE Scanner**
   - `nuclei` tag: `cve`

4. **SSRF/IDOR/LFI Tester**
   - `nuclei` tags: `ssrf`, `idor`, `lfi`

5. **Hidden Parameters + Directory Fuzz**
   - `nuclei` tag: `fuzzing`
   - Optional Gobuster run with wordlist of your choice

---

## 🧪 Example Usage

```bash
bash nucleistrike.sh
```

Follow interactive prompts for:
- Target
- Header
- Scan speed
- Severity
- Module selection

---

## 📄 Output

Results saved to:
```
~/Desktop/work/nucleistrike_YYYY-MM-DD_HH-MM-SS/
```

---

## ⚖️ Legal

**This tool is for ethical use only.**  
Only run on targets you own or are explicitly allowed to test (e.g., bug bounty programs).

---

## 👨‍💻 Author

**`0xv3nm09`** – Bug Bounty Hunter | Script Crafter | Recon Addict  
🔗 [GitHub](https://github.com/0xv3nm09) | [TryHackMe](https://tryhackme.com/p/0xv3nm09)

🧬 "Modular. Ethical. Tactical." – Nucleistrike
