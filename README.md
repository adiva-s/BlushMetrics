# BlushMetrics
> *Beauty brand hype vs. reality — tracked in the data.*

TikTok moves fast. Founders go viral. Products sell out overnight. 
But when the internet has opinions about a brand — does search 
interest spike, hold, or collapse? BlushMetrics tracks the signal 
underneath the noise.

BlushMetrics is a data engineering pipeline tracking Google Trends 
search interest for 7 beauty brands across distinct hype archetypes. 
Built with Python, BigQuery, and dbt.

---

## The Central Question
When hype hits a beauty brand — a founder controversy, a viral 
product drop, a cultural moment — what actually happens to search 
interest? And does it last?

---

## Brand Lineup
| Brand | Archetype |
|---|---|
| Rhode | Celebrity brand / polarizing founder |
| Rare Beauty | Celebrity brand / sympathy hype |
| Fenty Beauty | Cultural reset / longevity test |
| Beauty of Joseon | K-beauty category wave |
| Drunk Elephant | Generational backlash |
| Sacheu | Pure TikTok virality |
| Youthforia | Reputation collapse |

---

## Stack
| Layer | Tool |
|---|---|
| Data Source | Google Trends via pytrends |
| Cloud Warehouse | BigQuery (GCP) |
| Transformation | dbt |
| Ingestion | Python + pandas |

---

## Pipeline
```
Google Trends (pytrends)
         ↓
 Python ingestion script
         ↓
  BigQuery (raw layer)
         ↓
dbt (staging → mart models)
```
---

## Status
| Phase | Status |
|---|---|
| Brand lineup finalized | ✅ |
| pytrends extraction script | ✅ |
| Raw trends data pulled | ✅ |
| BigQuery loading | ⏳ |
| dbt models | ⏳ |
| README findings | ⏳ |

---

## Early Findings
- Rhode peaked at **100** on 2/15/26 — tied to Caffeine Reset + 
  Peptide Lip Boost launch
- Beauty of Joseon peaked at **100** on 4/5/26 — K-beauty 
  is not a passing trend
- Youthforia flatlined at **0** the entire year — brand 
  collapse confirmed in the data
- Rhode consistently dominates search interest across all 7 brands

---

## Why this
I'm a Sephora customer — VIB member, chronically on BeautyTok. I see both sides: brands dropping new products weekly, influencers hyping something different every day. It's easy to get swept up in it. But I started wondering — does the rating actually back up the buzz, or does the hype die in 3 months? That's the question BlushMetrics is built to answer
