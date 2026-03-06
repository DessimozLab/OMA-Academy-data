#!/usr/bin/env bash
set -e

# Install FastOMA (repo must exist first)
cd Module4_FastOMA/working_dir

wget https://github.com/DessimozLab/FastOMA/archive/refs/heads/dev.zip
unzip dev.zip
mv FastOMA-dev FastOMA

pip install ./FastOMA[report]

# clone phylogenetic repo
cd ../../Module5_SpeciesTrees/working_dir
git clone https://github.com/DessimozLab/f1000_PhylogeneticTree.git

echo 'export PATH=$PATH:/workspaces/SIBBiodiversityBioinformatics2025/Module5_SpeciesTrees/working_dir/f1000_PhylogeneticTree/' >> ~/.bashrc
