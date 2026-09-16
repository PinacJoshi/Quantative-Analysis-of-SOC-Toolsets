# Week 1: Literature Review, Scope Finalization & Metric Formalization

**Phase:** 1 — Scope & Lab Architecture  
**Period:** Week 1 (2026-08-31 → 2026-09-06)  
**Deliverable:** Initial Project Scope Document & Metric Definition Sheet

---

## Task Checklist

- [x] Review literature on SOC benchmarking, alert fatigue, and detection engineering evaluations.
- [x] Finalize the 4 toolsets under study across host detection, network detection, case management, and SOAR automation.
- [x] Formulate experimental hypotheses.
- [x] Mathematically formalize evaluation metrics.
- [X] Align with academic supervisor on scope, tool selection rationale, and deliverables.

---

## 1. Literature Review

> [!IMPORTANT]
> 20 sources are catalogued below across 5 thematic clusters. Priority designation: ⭐ = peer-reviewed journal/top-tier conference, 🏛 = government/standards body, 📊 = reputable industry report, 📖 = technical/project documentation.

> [!Warning]
> AI was used to summarise the found research papers

### 1.1 SOC Benchmarking Methodologies & Quantitative Evaluation Frameworks

**[1] ⭐ "Cybersecurity on a Budget: Evaluating Security and Performance of Open-Source SIEM Solutions for SMEs"**  
*Manzoor, J., Waleed, A., Jamali, A. F., Masood, A. — PLOS ONE, Vol. 19, Issue 3, e0301183, 2024*  
🔗 https://doi.org/10.1371/journal.pone.0301183  
> Peer-reviewed empirical study that tests open-source SIEM tools including Wazuh in simulated enterprise-grade SME environments, measuring resource utilization, real-time event processing, and functional security features. Directly comparable experimental methodology — closest published antecedent to this study's benchmarking design.

**[2] ⭐ "Towards a Systematic Evaluation of Cyber Intrusion Detection Systems"**  
*Apruzzese, G., Colajanni, M., Ferretti, L., Marchetti, M. — IEEE Transactions on Network and Service Management, 2022*  
🔗 https://ieeexplore.ieee.org/document/9810255  
> Proposes a rigorous evaluation methodology for IDS/SIEM tools including reproducible testbed design, ground truth construction, and statistical significance testing — the methodological reference closest to this study's experimental design in Weeks 7–10.

**[3] 🏛 NIST SP 800-137: Information Security Continuous Monitoring (ISCM)**  
*Dempsey, K. et al. — NIST, 2011 (authoritative ongoing reference)*  
🔗 https://csrc.nist.gov/publications/detail/sp/800-137/final  
> Defines the authoritative 6-step ISCM cycle (Define → Establish → Implement → Analyze/Report → Respond → Review) and metric categories (effectiveness, efficiency, impact). Justifies using automated SOC tools as MTTD/MTTR data-collection mechanisms and provides a normative framework for metric validation.

**[4] 📖 SOC-CMM: Security Operations Center – Capability Maturity Model**  
*Kok, S. — SOC-CMM Foundation, v2.0+, 2020–2024*  
🔗 https://www.soc-cmm.com/  
> Globally recognized open standard that evaluates SOC domains on a 0–5 maturity scale covering people, process, technology, and business alignment. Provides a benchmark scaffolding structure for contextualizing quantitative KPIs (MTTD, MTTR, FPR, alert backlog) within operational maturity levels.

---

### 1.2 Alert Fatigue in Security Operations Centers

**[5] ⭐ "99% False Positives: A Qualitative Study of SOC Analysts' Perspectives on Security Alarms"**  
*Alahmadi, B. A., Axon, L., Martinovic, I. (University of Oxford) — USENIX Security Symposium, 2022*  
🔗 https://www.usenix.org/conference/usenixsecurity22/presentation/alahmadi  
> Top-tier peer-reviewed study surveying 20+ SOC practitioners. Finds analysts perceive the vast majority of alarms as false positives, leading to alarm burnout and desensitization. Introduces five properties of effective security alarms (Reliable, Explainable, Analytical, Contextual, Transferable) — directly frames the alert quality evaluation criteria applied to Wazuh and Suricata in this study.

**[6] ⭐ "SoK: Lessons Learned from Cyber Ranges and Emulation Testbeds"**  
*Yamin, M. M., Katt, B., Gkioulos, V. — Computers & Security, 2020*  
🔗 https://www.sciencedirect.com/science/article/pii/S0167404820302030  
> Systematizes knowledge on building isolated cyber range testbeds for security experimentation, covering isolation requirements, traffic generation, and reproducibility. Critical guidance for Week 2 lab architecture and ensuring experimental validity.

**[7] 📊 Tines "Voice of the SOC" Annual Report**  
*Tines — Industry Report, 2023*  
🔗 https://www.tines.com/reports/voice-of-the-soc  
> Widely cited industry survey documenting that ~71% of SOC analysts experience burnout, average analyst tenure is under 18 months, and ~40–60% of alerts are false positives each requiring 10–15 minutes of manual investigation. Provides the quantified industry context that motivates examining SOAR automation (Shuffle) as an alert-fatigue mitigation tool in this study.

---

### 1.3 MITRE ATT&CK Framework, Adversary Emulation & Detection Engineering Metrics

**[8] 🏛 "MITRE ATT&CK: Design and Philosophy"**  
*Strom, B., Applebaum, A., Miller, D., Nickels, K., Pennington, A., Thomas, C. — MITRE Corporation, 2020*  
🔗 https://attack.mitre.org/docs/MITRE_ATTACK_Design_and_Philosophy_March_2020.pdf  
> Foundational reference for the ATT&CK framework structure, tactic/technique taxonomy, and intended use for adversary emulation planning and detection gap analysis. Required reading for Week 4 test corpus design and Week 11 Navigator layer construction.

**[9] 🏛 MITRE Engenuity ATT&CK Evaluations – Enterprise Round 6**  
*MITRE Engenuity — 2024*  
🔗 https://attackevals.mitre-engenuity.org/enterprise/  
> Independent evaluation of commercial and open-source security products against emulated CL0P and LockBit ransomware TTPs using ATT&CK technique coverage as the primary metric. Provides the methodological reference standard — including refined false-positive measurement methodology — for ATT&CK-aligned detection evaluation in this study.

**[10] 🏛 CISA: "Best Practices for MITRE ATT&CK Mapping"**  
*CISA — US Cybersecurity and Infrastructure Security Agency, 2021*  
🔗 https://www.cisa.gov/sites/default/files/publications/best-practices-for-mitre-attck-mapping.pdf  
> Official government guidance on mapping defender telemetry to ATT&CK techniques, identifying visibility gaps, and prioritizing detection engineering investment. Directly supports the Week 11 methodology for computing per-toolset detection coverage scores and identifying blind spots.

**[11] 📊 FIRST: Metrics for Threat Detection Engineering**  
*Forum of Incident Response and Security Teams — Working Group Publication, 2022*  
🔗 https://www.first.org/resources/guides/metrics-for-threat-detection-engineering  
> Authoritative practitioner-community document defining TPR, FPR, Precision, Recall, F1-score, MTTD, and incident conversion rate for detection engineering, aligning technical metrics with organizational risk tolerance. Provides the definitional justification for this study's evaluation metric rubric.

**[12] 📖 Atomic Red Team — Open-Source Adversary Emulation Library**  
*Red Canary — GitHub, actively maintained 2023–2024*  
🔗 https://github.com/redcanaryco/atomic-red-team  
> Core technical reference for Atomic Red Team's YAML test definition structure, ground truth metadata schema, and integration patterns with endpoint security tools. The primary execution framework for generating labeled TP/FN ground truth in Weeks 7–9.

---

### 1.4 Tool-Specific Technical Literature

**[13] ⭐ "Enhancing Security Monitoring with Machine Learning Integration in Wazuh SIEM"**  
*Kurnia et al. — MDPI Sensors, 2025*  
🔗 https://www.mdpi.com/1424-8220 *(search: "Kurnia Wazuh machine learning MDPI Sensors 2025")*  
> Empirically demonstrates Wazuh maintaining linear performance scalability up to 500 events/second with ~45 ms average processing latency. Hybrid Random Forest + DBSCAN integration achieves 97.2% detection accuracy with significantly reduced FPR — establishes a quantitative performance baseline for Wazuh evaluation in this study.

**[14] ⭐ "A Realistic Experimental Comparison of Suricata and Snort Intrusion-Detection Systems"**  
*Albin, E. & Rowe, N. — Naval Postgraduate School (FINA / MILCOM), 2012*  
🔗 https://faculty.nps.edu/ncrowe/albin_rowe_fina2012.pdf  
> Seminal benchmark study comparing Suricata and Snort on real backbone traffic, measuring throughput, packet drop rate, memory consumption, and detection accuracy. Establishes the experimental comparison methodology — speed, memory, and detection accuracy trade-offs — that this study replicates with modern Suricata 7.x and contemporary workloads.

**[15] ⭐ "Comparative Analysis of Snort 3 and Suricata" (IEEE IAS Global Conference)**  
*University of Portsmouth Research Group — IEEE IAS, 2023*  
🔗 https://eprints.port.ac.uk *(search: "Snort 3 Suricata comparative IEEE IAS 2023")*  
> Recent (2023) IEEE conference paper analysing whether Snort 3's multi-threaded architecture narrows the performance gap with Suricata. Evaluates throughput, rule scalability, and CPU utilization under modern traffic loads — directly applicable to benchmarking Suricata in this study's lab environment.

**[16] 📖 Suricata 7.x Official Documentation — EVE JSON Output & Rule Engine**  
*Open Information Security Foundation (OISF) — 2024*  
🔗 https://docs.suricata.io/en/suricata-7.0.0/  
> Technical reference for Suricata's structured EVE JSON output format, capture modes (AF_PACKET, DPDK), rule syntax, and Emerging Threats ruleset integration. Directly informs the log parsing pipeline design in Week 6.

**[17] 📖 TheHive 5 Official Documentation — Case Management API & Cortex Integration**  
*StrangeBee — 2024*  
🔗 https://docs.thehive-project.org/ | https://docs.strangebee.com/cortex/  
> Authoritative reference for TheHive 5's REST API, case and alert data models, and Cortex's 300+ analyzer/responder architecture. Defines the data structures required for programmatic MTTR measurement and alert routing pipeline design.

**[18] 📖 Shuffle SOAR — Official Documentation & Architecture Guide**  
*Fredrik Ødegård / Shuffle Project — GitHub & shuffler.io, 2020–2024*  
🔗 https://github.com/Shuffle/Shuffle | https://shuffler.io/docs  
> Technical documentation covering Shuffle's workflow engine, OpenAPI-driven integration model, webhook-based alert ingestion, execution logging, and out-of-the-box Wazuh/TheHive app integrations. Primary reference for instrumented MTTR measurement in Week 9.

---

### 1.5 SOAR Effectiveness, MTTR Reduction & Statistical Methods

**[19] ⭐ "The Base-Rate Fallacy and Its Implications for the Difficulty of Intrusion Detection"**  
*Axelsson, S. — ACM Conference on Computer and Communications Security (CCS), 1999*  
🔗 https://dl.acm.org/doi/10.1145/319709.319710  
> Seminal work establishing the mathematical relationship between base rates, TPR, FPR, and Bayesian posterior probabilities in intrusion detection — the essential theoretical grounding for interpreting confusion matrix results in a low-attack-frequency lab environment where FPR can dominate PPV.

**[20] 📊 IBM Security "Cost of a Data Breach Report 2023"**  
*IBM Security / Ponemon Institute — 2023*  
🔗 https://www.ibm.com/reports/data-breach  
> Industry benchmark documenting that organizations using AI and automation in security operations save an average of \$1.76M per breach and achieve 108-day faster containment than non-automated peers. Provides the business-impact quantitative context motivating SOAR (Shuffle) MTTR reduction goals and underpins H3.

**[21] 📊 CICIDS2017 — Intrusion Detection Evaluation Dataset**  
*Sharafaldin, I., Habibi Lashkari, A., Ghorbani, A. A. — Canadian Institute for Cybersecurity / UNB, 2017*  
🔗 https://www.unb.ca/cic/datasets/ids-2017.html  
> The most widely-used benchmark dataset for evaluating NIDS detection accuracy, containing labelled network traffic for DoS, DDoS, Brute Force, Heartbleed, and Botnet attacks. Applicable to this study's Suricata evaluation as a ground-truth reference standard for validating TPR, FPR, and F1-score measurement methodology.

---

### Literature Review Summary Table

> [!Warning]
> AI was used to make this summary table

| # | Source | Venue | Year | Relevance to Study |
|---|--------|-------|------|--------------------|
| [1] | Manzoor et al. — Open-Source SIEM for SMEs | PLOS ONE | 2024 | Wazuh empirical benchmark |
| [2] | Apruzzese et al. — IDS Evaluation | IEEE TNSM | 2022 | Testbed & metric methodology |
| [3] | NIST SP 800-137 | NIST | 2011 | MTTD/MTTR normative framework |
| [4] | SOC-CMM | SOC-CMM Foundation | 2020+ | Maturity scaffold for KPIs |
| [5] | Alahmadi et al. — 99% False Positives | USENIX Security | 2022 | Alert fatigue & alarm quality |
| [6] | Yamin et al. — Cyber Ranges SoK | Computers & Security | 2020 | Testbed design & isolation |
| [7] | Tines Voice of the SOC | Industry Report | 2023 | FPR baseline & analyst burnout |
| [8] | MITRE ATT&CK Design | MITRE Corp. | 2020 | ATT&CK framework reference |
| [9] | MITRE Engenuity ATT&CK Evals Rd. 6 | MITRE Engenuity | 2024 | ATT&CK evaluation methodology |
| [10] | CISA ATT&CK Mapping Best Practices | CISA | 2021 | Coverage scoring & gap analysis |
| [11] | FIRST Detection Engineering Metrics | FIRST | 2022 | Metric definitions & rationale |
| [12] | Atomic Red Team | Red Canary / GitHub | 2023–24 | Execution harness & ground truth |
| [13] | Kurnia et al. — Wazuh ML Integration | MDPI Sensors | 2025 | Wazuh performance baseline |
| [14] | Albin & Rowe — Suricata vs. Snort | NPS / MILCOM | 2012 | Suricata benchmark methodology |
| [15] | Snort 3 vs. Suricata Comparison | IEEE IAS | 2023 | Suricata modern throughput data |
| [16] | Suricata 7.x Official Docs | OISF | 2024 | EVE JSON & rule engine reference |
| [17] | TheHive 5 + Cortex Official Docs | StrangeBee | 2024 | MTTR instrumentation design |
| [18] | Shuffle SOAR Docs | Shuffle Project | 2024 | SOAR MTTR measurement |
| [19] | Axelsson — Base-Rate Fallacy | ACM CCS | 1999 | Statistical interpretation of FPR |
| [20] | IBM Cost of Data Breach 2023 | IBM / Ponemon | 2023 | SOAR MTTR business impact |
| [21] | CICIDS2017 Dataset | UNB / CIC | 2017 | NIDS ground-truth benchmark data |

---

## 2. Toolset Finalization

The four toolsets under study have been **confirmed and finalized**:

| # | Category | Toolset | Role in Study |
|---|----------|---------|---------------|
| 1 | **SIEM / Host EDR / XDR** | **Wazuh** | Host-level telemetry collection, log analysis, FIM, and rule-based threat detection. Primary source of endpoint TP/FP/FN data. |
| 2 | **Network IDS / IPS** | **Suricata** | Signature-based and protocol anomaly network traffic inspection. Primary source of network-layer detection data. |
| 3 | **Case Management & Triage** | **TheHive + Cortex** | Incident aggregation, observable enrichment via Cortex analyzers, and triage time tracking for MTTR measurement. |
| 4 | **SOAR & Workflow Automation** | **Shuffle** | Open-source automation engine for alert routing, enrichment, and automated response. Primary MTTR measurement instrument. |

### Rationale for Selection

- **Wazuh** — Selected for its fully open-source licensing, native agent-based host telemetry, built-in FIM engine, and active community rule ecosystem.
- **Suricata** — Selected for multi threaded performance, native EVE JSON structured output, and the Emerging Threats Open ruleset which provides a reproducible, detection baseline.
- **TheHive + Cortex** — The open-source case management standard for SOC operations. Its REST API enables programmatic case creation and timestamp tracking required for automated MTTR measurement without manual analyst timing.
- **Shuffle** — Selected for its SOC-native workflow templates, native Wazuh and TheHive integrations via built-in apps, and execution log timestamps that enable latency measurement at the automation layer.

### Excluded Alternatives

| Considered | Category | Excluded Reason |
|------------|----------|-----------------|
| Elastic SIEM | SIEM | SSPL licensing complexity; higher resource footprint for single-researcher lab |
| Splunk | SIEM | Proprietary; ingest limits on free tier incompatible with high-volume experiments |
| Snort | Network IDS | Single-threaded; less structured output format; lower community momentum |
| n8n | SOAR | No SOC-native integrations; requires custom node development for Wazuh/TheHive |
| Velociraptor | EDR | Overlaps significantly with Wazuh's scope; adds complexity without differentiation |

---

## 3. Experimental Hypotheses

### H1 — Detection Latency vs. Noise Trade-off

> **H₁₀ (Null):** There is no statistically significant difference in Mean Time to Detect (MTTD) between Wazuh's default ruleset configuration and a tuned/reduced ruleset configuration across the same set of adversary emulation test cases.
>
> **H₁ₐ (Alternative):** A tuned ruleset configuration produces a statistically significantly lower MTTD compared to the default configuration, as reduced alert noise decreases indexing and correlation overhead.

**Rationale:** Tighter rulesets reduce the volume of log events processed and indexed per second. This is expected to yield measurable latency improvements but at the potential cost of True Positive Rate.

**Statistical Test:** Wilcoxon Signed Rank Test (paired, non-parametric) on per-test MTTD observations. Significance threshold: **α = 0.05**.

---

### H2 — Rule Sensitivity vs. False Discovery Rate

> **H₂₀ (Null):** Wazuh's default detection rule sensitivity level does not produce a significantly higher False Discovery Rate (FDR = 1 − Precision) than the tuned/reduced rule configuration when evaluated against benign background traffic.
>
> **H₂ₐ (Alternative):** Default rule sensitivity produces a significantly higher FDR than the tuned configuration, as broader default signatures match a wider class of benign system events.

**Rationale:** Default rulesets are conservative and broad by design. When exposed to realistic background activity, they are hypothesized to produce a meaningfully higher proportion of false positives relative to total alerts. Source [7] reports ~40–60% FPR in real SOC deployments as a contextual upper bound.

**Statistical Test:** McNemar's Test on paired binary alert classifications (TP vs. FP) under both configurations. Significance threshold: **α = 0.05**.

---

### H3 — Automated SOAR Response Reduces MTTR

> **H₃₀ (Null):** Shuffle SOAR automation does not produce a statistically significant reduction in Mean Time to Respond (MTTR) compared to a simulated manual-only response baseline.
>
> **H₃ₐ (Alternative):** Shuffle SOAR automation produces a statistically significantly lower MTTR compared to the manual baseline, as automated alert enrichment and case creation eliminates analyst wait time for initial triage steps.

**Rationale:** Automated workflows (Shuffle → TheHive case creation → Cortex enrichment → notification dispatch) eliminate manual steps that add variable human latency. The manual baseline MTTR uses literature reported analyst triage times of 10–15 minutes per alert (source [7]) vs. measured automated pipeline execution timestamps.

**Statistical Test:** Mann–Whitney U Test (unpaired, non-parametric) comparing automated vs. manual MTTR distributions. Significance threshold: **α = 0.05**.

---

## 4. Metric Formalization

### 4.1 Confusion Matrix Foundations

For each adversary emulation test case $i$ and toolset $T$, each alert is classified as one of four outcomes:

| Symbol | Name | Definition |
|--------|------|-----------|
| **TP** | True Positive | An alert is raised and the corresponding attack technique was executed. |
| **FP** | False Positive | An alert is raised but no attack technique was executed (benign trigger). |
| **FN** | False Negative | An attack technique was executed but no alert was raised within the observation window. |
| **TN** | True Negative | No alert is raised during a benign activity session. |

**Ground Truth Construction:** A test case alert is attributed as TP if and only if:
1. It is raised within a configurable detection window $\Delta t_{\max}$ after the execution timestamp $t_0$.
2. Its rule mapping or alert description matches the expected artifact taxonomy for the executed technique.

---

### 4.2 Detection Performance Metrics

$$\text{TPR (Recall / Sensitivity)} = \frac{TP}{TP + FN}$$

Proportion of executed attack techniques that were correctly detected. The primary measure of detection coverage.

$$\text{FPR (Fall-out)} = \frac{FP}{FP + TN}$$

Proportion of benign activity sessions that incorrectly triggered an alert. Primary measure of noise generation.

$$\text{Precision (Positive Predictive Value)} = \frac{TP}{TP + FP}$$

Proportion of raised alerts that correspond to an actual attack. Measures alert quality and actionability.

$$F_1\text{ Score} = 2 \cdot \frac{\text{Precision} \cdot \text{Recall}}{\text{Precision} + \text{Recall}}$$

Harmonic mean of Precision and Recall. The primary composite metric for comparing detection quality across toolset configurations where both false positives and false negatives carry operational cost.

$$\text{Specificity (TNR)} = \frac{TN}{TN + FP} = 1 - \text{FPR}$$

$$\text{False Discovery Rate (FDR)} = \frac{FP}{FP + TP} = 1 - \text{Precision}$$

Proportion of all alerts that are false positives, directly quantifies the analyst alert fatigue burden. 
<!-- Per source [19] (Axelsson), this value is highly sensitive to the base rate of actual attacks. -->

---

### 4.3 Temporal Performance Metrics

Let $N$ be the number of attack executions with a corresponding detection event.

**Mean Time to Detect (MTTD):**

$$\text{MTTD} = \frac{1}{N} \sum_{i=1}^{N} \left( t_{\text{alert},i} - t_{\text{execution},i} \right)$$

- $t_{\text{execution},i}$ = timestamp recorded by the harness when the attack technique completes (ground truth $t_0$).
- $t_{\text{alert},i}$ = timestamp of the first correlated alert raised by toolset $T$ for test case $i$.
- **Unit:** seconds. Reported as mean, median, standard deviation, and 95th percentile.

**Mean Time to Respond (MTTR):**

$$\text{MTTR} = \frac{1}{N} \sum_{i=1}^{N} \left( t_{\text{resolved},i} - t_{\text{alert},i} \right)$$

- $t_{\text{alert},i}$ = timestamp of first alert raised by Wazuh/Suricata for test case $i$.
- $t_{\text{resolved},i}$ = timestamp at which the Shuffle SOAR workflow completes (case created in TheHive + Cortex enrichment confirmed).
- **Unit:** seconds. Reported as mean, median, standard deviation, and 95th percentile.

<!-- > [!TIP]
> Both MTTD and MTTR will be analyzed as distributions (not just means) to capture tail latency. The 95th percentile is critical for worst-case operational planning. Per source [3] (NIST SP 800-137), both effectiveness and efficiency metrics should be reported together. -->

---

### 4.4 Operational Overhead Metrics

**Alert Volume Rate (AVR):**

$$\text{AVR} = \frac{\text{Total Alerts Generated}}{\text{Total Observation Time (hours)}}$$

Measured separately for benign-only sessions and attack sessions to characterize signal-to-noise behavior.

**Signal-to-Noise Ratio:**

$$\text{SNR} = \frac{TP}{TP + FP} = \text{Precision}$$

**Resource Utilization Overhead** (per toolset, per host):
- CPU utilization (%) — averaged over observation window
- RAM footprint (MB) — agent + server process combined
- Disk I/O (MB/s) — log write throughput
- Network bandwidth (Kbps) — agent-to-manager telemetry

<!-- Source [13] (Kurnia et al.) establishes Wazuh performance benchmarks of ~45 ms processing latency and linear scalability to 500 events/second as a reference baseline. -->

---

### 4.5 ATT&CK Coverage Metrics

**Technique Coverage Rate (per toolset):**

$$\text{Coverage}_{T} = \frac{|\text{Techniques detected by toolset } T|}{|\text{Total techniques in test corpus}|}$$

**Unique Coverage Contribution:**

$$\text{Unique}_{T} = \frac{|\text{Techniques detected by } T \text{ only, not by any other toolset}|}{|\text{Total techniques in test corpus}|}$$

**Combined Coverage:**

$$\text{Coverage}_{\text{combined}} = \frac{\left|\bigcup_{T} \text{Techniques}_{T}\right|}{|\text{Total techniques in test corpus}|}$$
<!-- 
Per source [10] (CISA), coverage scores will be computed per tactic category (Discovery, Execution, Persistence, etc.) in addition to the overall corpus. These will be exported as ATT&CK Navigator JSON layers in Week 11. -->

---

## 5. Research Questions

| ID | Research Question |
|----|-------------------|
| **RQ1** | What is the host layer detection efficacy (TPR, FPR, F₁) of Wazuh across the curated MITRE ATT&CK test corpus, and how does configuration tuning affect these metrics? |
| **RQ2** | What is the network layer detection efficacy of Suricata with Emerging Threats Open rules, and which technique categories exhibit coverage gaps? |
| **RQ3** | How do Wazuh and Suricata complement each other in combined ATT&CK technique coverage, and what blind spots persist in the union of their detections? |
| **RQ4** | What MTTD distributions does each toolset exhibit across attack technique categories, and are configuration differences statistically significant? |
| **RQ5** | How much does Shuffle SOAR automation reduce MTTR relative to a simulated manual baseline, and is this reduction statistically significant? |
| **RQ6** | What resource overhead (CPU, RAM, disk I/O, network bandwidth) is imposed by each toolset, and how does it correlate with alert volume? |

---

## 6. Scope Document Summary

### In Scope
- Controlled, isolated lab environment (no production systems)
- 4 open-source SOC toolsets: Wazuh, Suricata, TheHive+Cortex, Shuffle
- Adversary emulation via Atomic Red Team and/or MITRE Caldera
- 20–30 MITRE ATT&CK techniques across 7 major tactic categories, 3 repeated trials each (N ≈ 60–90 observations per toolset)
- Quantitative metrics: TPR, FPR, Precision, Recall, F₁, FDR, MTTD, MTTR, AVR, resource utilization, ATT&CK coverage
- Statistical hypothesis testing (Wilcoxon Signed-Rank, Mann–Whitney U, McNemar's); α = 0.05
- ATT&CK Navigator JSON layer visualization
- Python analysis pipeline: `pandas`, `scipy`, `statsmodels`, `scikit-learn`, `matplotlib`, `seaborn`

### Out of Scope
- Real production SOC environments or live threat data
- Proprietary/commercial toolsets (Splunk, Elastic SIEM commercial, CrowdStrike, etc.)
- Threat Intelligence Platform (TIP) integration
- ML model training for detection
- Malware analysis or reverse engineering
- Human factors analysis beyond simulated manual MTTR baseline

---

<!-- ## 7. Supervisor Alignment Meeting Agenda

> [!IMPORTANT]
> The supervisor alignment task remains **⏳ open**. This meeting should occur before Week 2 lab build-out begins. The following agenda is prepared.

1. **Scope Approval** — Confirm 4-toolset scope is appropriate for 5 ECTS (135 hours).
2. **Tool Selection Rationale** — Present rationale from Section 2 with supporting literature (sources [1], [2], [13], [14]).
3. **Statistical Methodology** — Confirm Wilcoxon Signed-Rank, Mann–Whitney U, and McNemar's tests are appropriate for expected distributions and sample sizes (N ≈ 60–90 per toolset).
4. **Test Corpus Size** — Confirm whether 20–30 MITRE ATT&CK techniques × 3 trials provides sufficient statistical power.
5. **Ethics & Safety** — Confirm adversary emulation in the isolated lab is covered by ethical computing guidelines.
6. **Report Format** — Confirm expected length, citation style (IEEE recommended), and data appendix expectations.

### Open Questions for Supervisor
- Should the manual MTTR baseline use literature-reported analyst triage times (10–15 min/alert per source [7]), or is there access to real SOC triage time logs for comparison?
- Is ATT&CK Navigator JSON layer export sufficient for the coverage visualization deliverable, or is additional tooling expected?
- Is there a prescribed analysis environment preference (Jupyter Notebooks vs. RMarkdown)? -->

<!-- ---

## 8. Next Steps → Week 2

| Action Item | Due |
|-------------|-----|
| Design isolated multi-subnet virtual lab topology (Attacker / Target / SOC subnets) | Week 2 start |
| Set up Docker Compose environment for the SOC cluster | Week 2 |
| Provision target victim machines (Ubuntu Linux, Windows Server / Windows 10) | Week 2 |
| Provision attacker machine (Kali Linux / Ubuntu + execution harnesses) | Week 2 |
| Configure NTP synchronization across all VMs for sub-second timestamp accuracy | Week 2 |

--- -->
