# Examing the yields from NovaSeqX 25B lane with first batch of the baym sandlance libraries

library(tidyverse)


novaseq <- read_csv("data/sandlance_baym_batch1_novaseq_nov2024.csv")

sum(novaseq$gb)

novaseq |> 
  ggplot() + 
  geom_histogram(aes(x = gb)) +
  labs(x = "Gb raw data per sample",
       title = "Yields on NovaSeq",
       subtitle = "Sandlance Baym batch 1, Nov 2024") +
  theme_classic()

ggsave(file = "plots/sandlance_baym_batch1_novaseq_yield_per_library.png")


miseq <- read_csv("data/sandlance_baym_batch1_miseq_nov2024.csv")

intersect(novaseq$sample_id, miseq$Sample)
intersect(novaseq$id, miseq$id)
setdiff(novaseq$id, miseq$id)
setdiff(miseq$id, novaseq$id)

dim(novaseq)
dim(miseq)


novaseq |> 
  left_join(miseq) |> 
  ggplot() +
  geom_point(aes(x = Vol_to_pool, y = gb)) +
  labs(x = "Volume pooled (ul)",
       y = "Gb raw data",
       title = "Yields on NovaSeq",
       subtitle = "Sandlance Baym batch 1, Nov 2024") +
  theme_classic()

ggsave(file = "plots/sandlance_baym_batch1_novaseq_volpooled_vs_yield.png")


