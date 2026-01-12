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
#source ~/miniconda3/etc/profile.d/conda.sh
#conda activate air-bnb-proximity

# # Run the Python script
#  python ~/OneDrive/LLM/code/UBDC_proximity/UBDC_proximity/scripts/process_listings_yw.py \
#  -m "unsloth/Meta-Llama-3.1-8B-Instruct-bnb-4bit" \
#  -p "/mnt/shared-scratch/jws10y/UBDC_proximity/prompts/prompt_template.txt" \
#  -i "/mnt/shared-scratch/jws10y/UBDC_proximity/prompts/instruction_template.txt" \
#  -k "/mnt/shared-scratch/jws10y/UBDC_proximity/huggingface_key.txt" \
#  -d "/mnt/shared-scratch/jws10y/UBDC_proximity/data/validation_descriptions.csv" \
#  -s "/mnt/shared-scratch/jws10y/UBDC_proximity/results/llama8b_test_output.json" \


# Run the Python script
 python /home/yw30f/OneDrive/LLM/code/UBDC_proximity/UBDC_proximity/scripts/process_listings_yw.py \
 -m "ywang-gla/ProxiLlama-3.1-8b_trn6500" \
 -p "/home/yw30f/OneDrive/LLM/code/UBDC_proximity/UBDC_proximity/prompts/prompt_template.txt" \
 -i "/home/yw30f/OneDrive/LLM/code/UBDC_proximity/UBDC_proximity/prompts/instruction_template.txt" \
 -k "/home/yw30f/OneDrive/LLM/code/UBDC_proximity/UBDC_proximity/huggingface_key.txt" \
 -d "/home/yw30f/OneDrive/LLM/pricePredicton/Data/additionalLLM/2022-09-11_listings_description.csv" \
 -s "/home/yw30f/OneDrive/LLM/pricePredicton/Data/additionalLLM/out_2022-09-11_listings_description.json"