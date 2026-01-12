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
conda activate llm-finetune

# Run the Python script
 python /home/yw30f/OneDrive/LLM/code/UBDC_proximity/UBDC_proximity/scripts/process_listings.py \
 -m "unsloth/Llama-3.3-70B-Instruct-bnb-4bit" \
 -p "/home/yw30f/OneDrive/LLM/code/UBDC_proximity/UBDC_proximity/prompts/prompt_template.txt" \
 -i "/home/yw30f/OneDrive/LLM/code/UBDC_proximity/UBDC_proximity/prompts/instruction_template.txt" \
 -k "/home/yw30f/OneDrive/LLM/code/UBDC_proximity/UBDC_proximity/huggingface_key.txt" \
 -d "/home/yw30f/OneDrive/LLM/code/UBDC_proximity/UBDC_proximity/data/analysis_descriptions.csv" \
 -s "/home/yw30f/OneDrive/LLM/code/UBDC_proximity/UBDC_proximity/results/llama70b_full_output_prompt_2.json" \