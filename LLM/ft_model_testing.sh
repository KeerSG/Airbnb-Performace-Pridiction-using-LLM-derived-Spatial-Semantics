#!/bin/bash 

#SBATCH --job-name=UBDC_proximity_run 
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1 
#SBATCH --nodes=1 
#SBATCH --mem=16G 
#SBATCH --time 00-24:00:00 
#SBATCH --mail-user joseph.shingleton@glasgow.ac.uk 
#SBATCH --mail-type END,FAIL 
#SBATCH --output=llama_job%j.log
#SBATCH --error=llama_job%j.err
#SBATCH --ntasks=1

#cd ~/sharedscratch

# load env
source ~/miniconda3/etc/profile.d/conda.sh
conda activate air-bnb-proximity

# Run the Python script
 python UBDC_proximity/scripts/process_listings.py \
 -m "JoeShingleton/ProxiLlama-edb-3.3-70b" \
 -p "/mnt/shared-scratch/jws10y/UBDC_proximity/prompts/prompt_template.txt" \
 -i "/mnt/shared-scratch/jws10y/UBDC_proximity/prompts/instruction_template.txt" \
 -k "/mnt/shared-scratch/jws10y/UBDC_proximity/huggingface_key.txt" \
 -d "/mnt/shared-scratch/jws10y/UBDC_proximity/data/validation_descriptions.csv" \
 -s "/mnt/shared-scratch/jws10y/UBDC_proximity/results/proxillama_edb_70b_test_output.json" \