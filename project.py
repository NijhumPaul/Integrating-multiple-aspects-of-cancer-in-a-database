#!/usr/bin/env python
# coding: utf-8

# In[2]:


import pandas as pd
import codecs


# COSMIC

# In[3]:


census = pd.read_csv("data/Census_All[22180]_Long.csv")
census_genes = list(census["Gene Symbol"])
census_genes_synonym = list(census["Synonym"])

print("Gene list from Gene_Symbol:",len(set(census_genes)))
print("Gene list from Synonym:",len(set(census_genes)))


# TSGene database

# In[4]:


doc = codecs.open('data/tumor_suppressor.txt','rU')
tumor_suppressor_df = pd.read_csv(doc, sep='\t')
#print(tumor_suppressor)
ts_genes = list(tumor_suppressor_df["GeneSymbol"])
print("Total genes in TSGene database:", len(ts_genes))


# In[5]:


combined_genes_TS_COSMIC = set(census_genes + ts_genes)
print("Combined oncogenes of two databases:",len(combined_genes_TS_COSMIC))


# Other resources 

# In[6]:


sample_gene_list = ["AKT1","CCND1","ERBB2","ESR1","ETV6","FOXA1","GATA3","IRS4","MAP2K4","MAP3K1","MAP3K13","NOTCH1","NTRK3","PIK3CA","PPM1D","SALL4","TBX3","TP53"]
print(len(sample_gene_list))
additional_genes = ["BRCA1", "BRCA2","PALB2","PTEN","ATM","CDH1","CHEK2","NBN","NF1","STK11","BARD1","BRIP1","MLH1", 
                    "MSH2", "MSH6", "PMS2", "EPCAM","RAD51C", "RAD51D","CASP8","CTLA4","NBN","CYP19A1","TERT","XRCC3","AKT1", "APC", "ATR", 
                    "BABAM1", "BAP1", "BARD1", "BMPR1A", "CDK4", "CDKN2A", "CHEK1", "CTNNA1", "EPCAM", "FAM175A", "MLH1", "MRE11A", 
                    "MSH2", "MSH6", "MUTYH", "NBN", "PIK3CA", "PMS2", "POLD1", "POLE", "PRSS1", "RAD50", "RAD51", "RAD51C", "RAD51D", 
                    "RET", "SDHB", "SDHC", "SDHD", "SMAD4", "TP53BP1", "VHL", "XRCC2","BMPR1A", "EPCAM", "GALNT12", "GREM1", 
                    "MLH1", "MSH2", "MSH6", "MUTYH", "PMS2", "SMAD4","BARD1", "MRE11A", "MUTYH", "NBN", "NF1", "RAD50", "RAD51C",
                    "RAD51D","EPCAM", "MRE11A", "BLM", "FANCC", "HOXB13", "MLH1", "MRE11A", "XRCC2","AXIN2", "BLM", "FANCC", 
                    "PALLD", "PMS2", "RAD50", "RAD51C", "RAD51D", "SMAD4", "VHL", "XRCC2", "PMS1", "CDC73", "CDKN1C", "CDKN2A", "FH", "FLCN", 
                    "GPC3", "MAX", "MEN1", "MET", "NF1", "NF2", "PHOX2B", "PRKAR1A", "PTCH1", "RAD51C", "RAD51D", "RET", "SDHAF2", "SDHB", 
                    "SDHC", "SDHD", "SUFU", "TMEM127", "VHL", "WT1","ERCC4", "RAD51C", "RAD51D", "XRCC2", "FAM175A", "FANCA", "FANCC", "FANCD2", 
                    "FANCE", "FANCF", "FANCG", "MEN1", "MLH1", "MRE11A", "MSH2", "MSH3", "MSH6", "PTCH1", "RAD50", "RAD51C", "RAD51D", "SLX4", 
                    "UIMC1", "XRCC2"]
sample_gene_list.extend(additional_genes)
total_sample_genes = set(sample_gene_list)
print(len(total_sample_genes))


# In[7]:


overall_combined_genes = set(list(combined_genes_TS_COSMIC) + list(sample_gene_list))
print("Overall genes", ((set(overall_combined_genes))))


# In[ ]:




