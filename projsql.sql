
------CREATE TABLE genes(
------gene_id INT NOT NULL,
------gene_name VARCHAR(200),
------gene_desc VARCHAR(500),
------resources VARCHAR(200),
------PRIMARY KEY(gene_id)
------);

------INSERT INTO genes(gene_id,gene_name,gene_desc, resources)
------VALUES
------(1,'MIR375','microRNAs (miRNAs) are short (20-24 nt) non-coding RNAs that are involved in post-transcriptional regulation of gene expression in multicellular organisms by affecting both the stability and translation of mRNAs.','Genecards.org'),
------(2,'ARMC10','This gene encodes a protein that contains an armadillo repeat and transmembrane domain. ','Genecards.org'),
------(3,'ANXA1','This gene encodes a membrane-localized protein that binds phospholipids.','Genecards.org'),
------(4,'MIR504','microRNAs (miRNAs) are short (20-24 nt) non-coding RNAs that are involved in post-transcriptional regulation of gene expression in multicellular organisms by affecting both the stability and translation of mRNAs. ','Genecards.org'),
------(5,'CD79A','The B lymphocyte antigen receptor is a multimeric complex that includes the antigen-specific component, surface immunoglobulin (Ig).','Genecards.org'),
------(6,'HTRA2','This gene encodes a serine protease. The protein has been localized in the endoplasmic reticulum and interacts with an alternatively spliced form of mitogen-activated protein kinase 14.','Genecards.org'),
------(7,'LLGL1','This gene encodes a protein that is similar to a tumor suppressor in Drosophila. The protein is part of a cytoskeletal network and is associated with nonmuscle myosin II heavy chain and a kinase that specifically phosphorylates this protein at serine residues. ','Genecards.org'),
------(8,'JAK1','This gene encodes a membrane protein that is a member of a class of protein-tyrosine kinases (PTK) characterized by the presence of a second phosphotransferase-related domain immediately N-terminal to the PTK domain.','Genecards.org');

------CREATE TABLE cancer(
------cancer_id INT NOT NULL,
------cancer_name VARCHAR(200),
------treatment VARCHAR(200),
------survival_rate VARCHAR(200),
------PRIMARY KEY(cancer_id)
------);


------INSERT INTO cancer(cancer_id, cancer_name, treatment, survival_rate)
------VALUES
------(101, 'breast cancer', 'Surgery, Radiation, Chemotherapy, Hormone therapy', '90%'),
------(102, 'pancreatic cancer', 'Surgery, Radiation,Ablation and Embolization, Chemotherapy', '11%'),
------(103, 'skin cancer', 'Radiation, Chemotherapy, Freezing, Excisional surgery', '93%'),
------(104, 'lung cancer', 'surgery, chemotherapy, radiation therapy, targeted therapy', '18.6%'),
------(105, 'prostate cancer', 'Surgery, Radiation, Chemotherapy, Immunotherapy', '98%'),
------(106, 'kidney cancer', 'Surgery, Radiation, Chemotherapy, Ablation and Other Local Therapy', '76%'),
------(107, 'colorectal cancer', 'Surgery, Radiation, Chemotherapy, Immunotherapy', '65%');

------CREATE TABLE gene_cancer(
------gene_cancer_id INT NOT NULL,
------gene_id INT NOT NULL,
------cancer_id INT NOT NULL,
------PRIMARY KEY(gene_cancer_id),
------FOREIGN KEY(gene_id) REFERENCES genes(gene_id) ON DELETE CASCADE,
------FOREIGN KEY(cancer_id) REFERENCES cancer(cancer_id)
------);

------INSERT INTO gene_cancer(gene_cancer_id, gene_id, cancer_id)
------VALUES
------(11,1,101),
------(12,2,107),
------(13,3,103),
------(14,4,104),
------(15,5,105),
------(16,5,102),
------(17,8,106),
------(18,8,105),
------(19,6,105);

------CREATE TABLE aiTool(
------tool_id INT NOT NULL,
------cancer_id INT NOT NULL,
------tool_name VARCHAR(200),
------created_by VARCHAR(200),
------create_time VARCHAR(200),
------PRIMARY KEY(tool_id),
------FOREIGN KEY(cancer_id) REFERENCES cancer(cancer_id)
------);

------INSERT INTO aiTool(tool_id, cancer_id, tool_name, created_by, create_time)
------VALUES
------(1001, 101, 'PREDICT', 'Ewan Gray', '2018'),
------(1002, 102, 'IRE', 'Chaobin He', '2020'),
------(1003, 103, 'cSCCscore', 'WeiWang', '2018'),
------(1004, 104, 'Lung Cancer Risk Assessment Tool', 'Memorial Sloan Kettering Cancer Center', '2022'),
------(1005, 105, 'PREDICT Prostate', 'Gaëtan Devos', '2020'),
------(1006, 106, 'Colon Cancer Survival Calculator', 'The University of Texas MD Anderson Cancer Center', '2022');


--------SELECT * FROM aiTool
--------ORDER BY create_time; 

--------SELECT * FROM cancer
--------ORDER BY survival_rate; 


--------SELECT genes.gene_name, genes.gene_desc,cancer.cancer_name
--------From cancer 
--------JOIN gene_cancer ON cancer.cancer_id = gene_cancer.cancer_id
--------JOIN genes ON gene_cancer.gene_id = genes.gene_id;


------SELECT genes.gene_id, genes.gene_name, count(*) as "number of cancers per gene"
------From cancer 
------JOIN gene_cancer ON cancer.cancer_id = gene_cancer.cancer_id
------JOIN genes ON gene_cancer.gene_id = genes.gene_id
------Group BY genes.gene_id, genes.gene_name
------ORDER BY count(*);

