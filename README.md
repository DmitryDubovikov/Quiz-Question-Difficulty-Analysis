# Quiz Question Difficulty Analysis

## Quick Start

### Using Make
```bash
make create     # Create virtual environment and install dependencies
make start      # Open Jupyter notebook to run analysis
```

### Using Shell Script (alternative)
```bash
chmod +x setup.sh    # Make script executable (first time only)
./setup.sh create    # Create virtual environment and install dependencies
./setup.sh start     # Open Jupyter notebook to run analysis
```

Once Jupyter opens, navigate to [analysis.ipynb](analysis.ipynb) and optionally run all the cells to reproduce the analysis.

## Research Question

**What words or phrases appear more frequently in questions that students tend to do poorly on, and what appear more frequently in questions that students do well on?**

## Methodology

We compare the vocabulary of questions where students performed poorly (<40% correct) versus well (>60% correct).

1. **Feature Extraction:** We analyze single words (unigrams) and two-word phrases (bigrams), removing common stopwords.
2. **Statistical Analysis:** We measure the association of each term with difficulty using the **Log-Odds Ratio** with **Haldane-Anscombe correction** (smoothing with 0.5).
3. **Significance Testing:** To identify statistically significant terms, we use **Fisher's Exact Test** for rare terms (expected frequency < 5) and the **Chi-Square Test** for common terms, applying the **Benjamini-Hochberg correction** to control the False Discovery Rate (FDR < 0.05).

## Key Findings

### Difficult Questions
**Questions that students do poorly on more often include analytical, inference-heavy, and structure-focused language.** These questions use words and phrases like `idiomatic`, `claim`, `overall structure`, `central idea`, `paragraph`, `provides evidence`, `best supports`, `draws connection`, and `author’s`. They require interpreting arguments, evaluating evidence, and understanding relationships between parts of a text.

### Easy Questions
**Questions that students do well on more often contain direct vocabulary or factual lookup cues.** These questions use words and phrases like `meaning`, `synonym`, `what word`, `what meaning`, `used in the sentence`, `how many`, `what effect`, and `according to the article`. They typically ask for literal meaning, simple definitions, or directly stated information.

## Visualizations

### Top Significant Unigrams
![Top Unigrams](outputs/top_features_unigrams.png)

### Top Significant Bigrams
![Top Bigrams](outputs/top_features_bigrams.png)
