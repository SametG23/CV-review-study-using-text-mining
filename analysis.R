
 CV TEXT MINING ANALYSIS (ARTS)
required_packages <- c("pdftools", "tm", "tidyverse", "tidytext", "topicmodels", "wordcloud")

installed <- rownames(installed.packages())
for (p in required_packages) {
  if (!(p %in% installed)) install.packages(p)
  library(p, character.only = TRUE)
}


klasor <- "data/CV/ARTS"

dosyalar <- list.files(klasor, pattern = "\\.pdf$", full.names = TRUE)

metinler <- lapply(dosyalar, pdf_text)
metinler <- lapply(metinler, paste, collapse = " ")

df <- data.frame(
  id = 1:length(metinler),
  text = unlist(metinler)
)

corpus <- VCorpus(VectorSource(df$text))

corpus <- corpus %>%
  tm_map(content_transformer(tolower)) %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(removeWords, stopwords("english"))

df$clean_text <- sapply(corpus, as.character)

tidy_df <- df %>%
  unnest_tokens(word, clean_text)

tidy_df <- tidy_df %>%
  anti_join(stop_words, by = "word")

kelime_frekans <- tidy_df %>%
  count(word, sort = TRUE)

top_words <- kelime_frekans %>% slice_max(n, n = 20)

print(top_words)

ggplot(top_words, aes(x = reorder(word, n), y = n)) +
  geom_col() +
  coord_flip() +
  labs(title = "Top 20 Words in ART CVs", x = "Words", y = "Frequency")


tfidf <- tidy_df %>%
  count(id, word, sort = TRUE) %>%
  bind_tf_idf(word, id, n) %>%
  arrange(desc(tf_idf))

print(head(tfidf, 20))

dtm <- tidy_df %>%
  count(id, word) %>%
  cast_dtm(id, word, n)

k <- 4

lda_model <- LDA(dtm, k = k, control = list(seed = 1234))

topics <- tidy(lda_model, matrix = "beta")

top_terms <- topics %>%
  group_by(topic) %>%
  slice_max(beta, n = 10) %>%
  ungroup()

print(top_terms)

skills <- c("photoshop","illustrator","design","painting","music","adobe")

skill_freq <- tidy_df %>%
  filter(word %in% skills) %>%
  count(word, sort = TRUE)

print(skill_freq)


wordcloud(
  words = kelime_frekans$word,
  freq = kelime_frekans$n,
  max.words = 100,
  random.order = FALSE
)

write.csv(kelime_frekans, "outputs/kelime_frekans.csv", row.names = FALSE)
write.csv(tfidf, "outputs/tfidf.csv", row.names = FALSE)
write.csv(skill_freq, "outputs/skill_freq.csv", row.names = FALSE)

# ================================
# BİTTİ
# ================================
