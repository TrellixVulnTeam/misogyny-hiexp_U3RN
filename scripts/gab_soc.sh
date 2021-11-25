#!/bin/bash

# training with regularzing SOC explanations

if [[ -n "$1" ]]; then
    current_seed=$1
else
    current_seed=0
fi


if [[ -n "$2" ]]; then
    max_seeds=$2
else
    max_seeds=1
fi


reg_strength=0.1

echo "reg_strength is ${reg_strength}"

while(( $current_seed < $max_seeds ))
do
    python run_model.py --hiex --hiex_idxs hiex.json --algo soc --do_eval --explain --do_lower_case --data_dir ./data/majority_gab_dataset_25k/ --bert_model bert-base-uncased --max_seq_length 128 --train_batch_size 1 --eval_batch_size 1 --learning_rate 2e-5 --num_train_epochs 20 --early_stop 5 --output_dir runs/majority_gab_es_reg_nb5_h5_is_bal_pos_seed_0 --seed 0 --task_name gab --hiex_add_itself --reg_explanations --nb_range 5 --sample_n 5 --negative_weight 0.1 --reg_strength 0.1
    let current_seed++
done
