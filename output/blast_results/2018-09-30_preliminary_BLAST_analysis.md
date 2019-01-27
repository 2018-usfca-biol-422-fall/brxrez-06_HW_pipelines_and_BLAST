#You wish you knew this like the back of your hand

Brian Rezende 
September 30, 2018
Bioinformatics 

#Introduction 
This project focused on running quality control checks on sequencing data from the University of California San Diego Microbiome Initiative, which examined bacterial communities. In my analysis I will further examine the various bacterial taxa that were found on male and female hands and their commonalities. Especially on a campus where hundreds of students share mice, it is important to be aware of the kinds of organisms that are lurking at our fingertips.

When utilizing FASTQC for quality control, the program will attempt to identify the file format of the input file. Depending on the file extension it could either be opened as SAM/BAM, but in most case the files will be treated as FASTQ. FastQC eliminates the need to sort through data that has poor quality when dealing with high throughput sequencing. To begin, we utilize the [Trimmomatic](http://www.usadellab.org/cms/index.php?page=trimmomatic) tool, which trims the sample sequences, based off their quality scores. The tool discards leading and/or trailing Ns and will discard any sequence below a length of 150 base pairs. By filtering through less important data it gives the user a better look at prominent and higher scoring results. By placing a set of FastQC program features into for loops, the user can apply the code to an arbitrary number of files and analyze a vast amount of sequence data while ensuring quality. 

Moreover, conversion of the fastq files to fasta files is needed for using the trimmed files on BLAST queries. Upon running these sequences and BLASTing them, 20 runs were found that tested the human skin meta genome and a computer mouse metagenome. In the human hand samples they tested both male and female from varying ages and multiple computer mice. 

It was discovered that the 5 most common bacterial communities that matched the sequences in these runs were: 
* Solemya pervernicosa gill symbiont **(2371)** 
* Bartonella washoeensis **(1583)**
* Bacterioidetes endosymbiont of Metaseiulus occidentalis **(1164)**
* Acinetobacter haemolyticus **(750)** 
* Aquitalea sp. **(635)** 

See **Bacteria** section to learn more

#this was discovered using the following command: cat *.trim_blast_results.csv | cut –f 1 –d “,” | sort | uniq –c | sort 

In the sample that examined male 25 year olds hand bacteria, the sequence failed at most places such as per base sequence content, sequence duplication levels, and per base sequence quality. The set of sequences performed relatively identical, each of them indicating zero sequences that were flagged as poor quality. Most often than not there would be errors and some failure on per base sequence content and sequence duplication levels. Some major differences in these samples are size of the results after trimming. For instance, in the 34-year-old male sample it had a much greater output than the other male sample. Although there was a smaller community being tested, several of the same sequences were found in each respective environment. 

**Bacterial Taxa:** 

In four out of the five male subjects that were tested and sequenced, *Solemya pervernicosa gill symbiont* was the most prevalent, followed by *Acinetobacter haemolyticus *. *Solemya pervenicosa* are thioautotrophs that were previously known as a bathyal species restricted to northeastern Japan [Source](file:///Users/brezende2015/Downloads/vjmsj-v68n1-2p27-37.pdf). Historically they are collected on and around sperm whale bodies found off the coast of the Satsuma Peninsula in Kyushu in 2002. These clams are dependent on chemoautotrophic symbionts in environments such as hydrothermal vents and organic-rich sediments. It is increasingly interesting since this bacteria has traveled from such a distance, yet is extremely prevalent on the hands of older males and computer mice. 

Next, *acinetobacter haemolyticus* is an aerobic gram-negative environmental isolate that was used to combat contamination in water systems. Its origins trace back to Malaysia and extracted from a batek effluent. This effluent was found to contain a mixture of heavy metals and slightly higher than the limit according to Malaysian standards [Source](https://www.sciencedirect.com/science/article/pii/S0304389406014142). 

Though both these bacteria hail from such distance lands, it is possibly that they have made themselves present through our water system or through the aid of humans. It is possible that through simple tasks such as washing hands, doing dishes, or showering, men are somehow increasingly exposed to these bacteria, more than women. 

On the other hand, in the female subject samples, it was observed that a common bacterial community was Bartonella washoeensis and acidovorax species. 

Bartonella washoeensis (BA) was originally isolated from a dog who had mitral valve endocarditis. This spread from dogs to squirrels and it was correlated to causing meningitis in humans [Source](https://jcm.asm.org/content/41/11/5327?utm_source=TrendMDJClinMicrobiol&utm_medium=TrendMDJClinMicrobiol&utm_campaign=TrendMD_JCMCLIN_0). The original infection occurred in a 12-year old female Doberman pinscher dog who had previously been treated for a detected heart murmur. Now in humans, there are eight species that are pathogenic for humans. The species washoensis in particular is a cause of myocarditis in humans and this continues to be a concern due to ground squirrels being harbors and reservoir for this species located around Nevada and California. 

Another common bacteria taxa found in females was acidovorax species. This species has several subspecies, but overall they are a genus of [proteobacteria](https://en.wikipedia.org/wiki/Acidovorax). They most recently have been linked to being found in watermelon seed and [honeydew](https://apsjournals.apsnet.org/doi/abs/10.1094/PDIS.1997.81.6.694C). This is expected as this proteobacteria cause bacterial fruit blotch on cucurbit crops. 

Overall, it is fascinating to see how these types of bacteria have grown to infect our populations and how they are so commonly found on objects such as computer mice and even the back of our hands. These four mentioned are only a fraction of what else is out there and what has yet to be identified.  







