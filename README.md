# 📊 CV Skill Extraction with Text Mining (ARTS Domain)

## 📌 Project Overview

This project aims to analyze artistic CVs using Natural Language Processing (NLP) techniques in order to extract frequently mentioned skills and identify underlying patterns in candidate profiles.

The analysis is conducted on PDF-based resumes and focuses on uncovering key competencies in the arts domain.

---

## 🎯 Objectives

* Extract text data from CV PDFs
* Perform text preprocessing and cleaning
* Identify most frequent terms
* Compute TF-IDF scores to highlight important words
* Apply topic modeling (LDA) to discover hidden themes
* Analyze domain-specific skill frequencies

---

## 🛠️ Technologies & Libraries

* **R Programming Language**
* `pdftools` → PDF text extraction
* `tm` → Text preprocessing
* `tidyverse` → Data manipulation
* `tidytext` → NLP operations
* `topicmodels` → Topic modeling (LDA)
* `ggplot2` → Visualization
* `wordcloud` → Word cloud generation

---

## 📂 Project Structure

```
cv-skill-extraction-text-mining/
│
├── data/
│   └── CV/ARTS/           # PDF resumes
│
├── outputs/
│   ├── kelime_frekans.csv
│   ├── tfidf.csv
│   └── skill_freq.csv
│
├── analysis.R             # Main analysis script
└── README.md
```

---

## 🔍 Methodology

### 1. Data Collection

* Multiple CVs in PDF format are collected from the arts domain.

### 2. Text Preprocessing

* Lowercasing
* Removing punctuation, numbers
* Stopword removal

### 3. Tokenization

* Text is split into individual words using `tidytext`.

### 4. Frequency Analysis

* Most frequently used words are identified.

### 5. TF-IDF Analysis

* Highlights words that are important within specific CVs.

### 6. Topic Modeling (LDA)

* Latent Dirichlet Allocation is used to extract hidden topics.

### 7. Skill Extraction

* Predefined skill keywords are analyzed for frequency.

---

## 📈 Key Findings

> As a result of the text mining analysis, the most frequent term in arts-related CVs is **"design" (n=111)**.
> This is followed by **"music" (n=66)**, **"photoshop" (n=23)**, **"painting" (n=19)**, and **"adobe" (n=18)**.

These findings indicate that **design and digital skills are highly prominent** in the arts domain.

---

## ▶️ How to Run

1. Clone the repository:

```bash
git clone https://github.com/yourusername/cv-skill-extraction-text-mining.git
```

2. Open `analysis.R` in RStudio

3. Set your data folder path:

```r
klasor <- "data/CV/ARTS"
```

4. Run the script:

```r
source("analysis.R")
```

---

## 📊 Sample Outputs

* Top 20 most frequent words (bar chart)
* TF-IDF ranking table
* Topic distributions (LDA)
* Word cloud visualization
* Skill frequency table

---

## ⚠️ Disclaimer

* This project is for educational and research purposes only.
* Any personal data within CVs should be anonymized before use.

---

## 🚀 Future Improvements

* Bigram & trigram analysis
* Named Entity Recognition (NER)
* Machine Learning models (e.g., classification of CVs)
* Interactive dashboards (Shiny)

---

## 👤 Author

**Samed Gucuk**

---

## ⭐ If you like this project

Give it a star on GitHub and feel free to contribute!

