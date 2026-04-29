# BlushMetrics 

> *Does the hype match the ratings? A data engineering deep dive into Sephora's review data.*

TikTok moves fast. Brands drop products weekly. Influencers review everything. But do the ratings actually back up the buzz — or does the hype die in 3 months?

BlushMetrics is an end-to-end data engineering pipeline analyzing 1M+ Sephora product reviews to answer that question. Built on a full cloud stack with BigQuery, dbt, and Airflow.

---

## The analytical questions

- Which brands consistently back up their hype with real ratings?
- Which product categories are the most oversaturated?
- Do newly launched products hold their ratings after the initial buzz fades?
- Is there a correlation between review volume spikes and rating drops?

---

## Stack

| Layer | Tool |
|---|---|
| Cloud Warehouse | BigQuery (GCP) |
| Transformation | dbt |
| Orchestration | Airflow |
| Ingestion | Python (pandas, SQLAlchemy) |
| Visualization | Looker Studio |
| Data Source | Sephora Products & Reviews — Kaggle |

---

## Planned architecture

```
Kaggle Dataset (1M+ rows)
        ↓
   Python ingestion
        ↓
   BigQuery (raw layer)
        ↓
   dbt (staging → mart models)
        ↓
   Airflow DAG (scheduled pipeline)
        ↓
   Looker Studio dashboard
```

---

## dbt model plan

**Staging layer**
- `stg_products` — cleaned product catalog with brand, category, price tier
- `stg_reviews` — cleaned review data with rating, date, verified purchase flag

**Mart layer**
- `mart_brand_performance` — avg rating, review volume, rating trend over time per brand
- `mart_category_saturation` — product launch velocity vs avg rating by category
- `mart_hype_decay` — rating trajectory for products in first 90 days post-launch

**Business metrics**
- Hype score (review volume spike relative to rating)
- Rating retention rate (day 0 vs day 90 avg rating)
- Category saturation index

---

## Status

| Phase | Status |
|---|---|
| Dataset sourced | ✅ |
| Schema + ERD designed | 🔄 In progress |
| BigQuery setup | ⏳ Planned |
| dbt models | ⏳ Planned |
| Airflow orchestration | ⏳ Planned |
| Looker Studio dashboard | ⏳ Planned |

**Expected completion:** July 2025

---

## Why this

I'm a Sephora customer — VIB member, chronically on BeautyTok. I see both sides: brands dropping new products weekly, influencers hyping something different every day. It's easy to get swept up in it. But I started wondering — does the rating actually back up the buzz, or does the hype die in 3 months? That's the question BlushMetrics is built to answer
