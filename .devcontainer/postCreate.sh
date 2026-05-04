#!/usr/bin/env bash
set -e

# download dbs
if [ ! -f /workspaces/OMA-Academy-data/Module4_FastOMA/working_dir/in_folder/omamerdb.h5 ]; then
  curl -L -O https://zenodo.org/records/17826591/files/Saccharomyceta.h5?download=1
  cp Saccharomyceta.h5 /workspaces/OMA-Academy-data/Module4_FastOMA/working_dir/in_folder/omamerdb.h5
  mv Saccharomyceta.h5 /workspaces/OMA-Academy-data/Module2_OMAmer/working_dir/omamer_databases/
fi
# METAZOA DOWNLOAD LINK WAS NOT UPDATED YET TO FACILITATE CREATION OF NEW WORKSPACE
# WHEN YOU ARE READY, CHANGE TO THIS ONE: https://zenodo.org/records/17826591/files/Metazoa.h5?download=1
if [ ! -f /workspaces/OMA-Academy-data/Module2_OMAmer/working_dir/omamer_databases/ ]; then
  curl -L -O https://omabrowser.org/All.Jul2024/Metazoa.h5
  mv Metazoa.h5 /workspaces/OMA-Academy-data/Module2_OMAmer/working_dir/omamer_databases/
fi

# Install FastOMA (repo must exist first)
cd /workspaces/OMA-Academy-data/Module4_FastOMA/working_dir

wget https://github.com/DessimozLab/FastOMA/archive/refs/heads/dev.zip
unzip dev.zip
mv FastOMA-dev FastOMA

pip install ./FastOMA[report]

# clone phylogenetic repo
cd /workspaces/OMA-Academy-data/Module5_SpeciesTrees/working_dir
git clone https://github.com/DessimozLab/f1000_PhylogeneticTree.git

echo 'export PATH=$PATH:/workspaces/OMA-Academy-data/Module5_SpeciesTrees/working_dir/f1000_PhylogeneticTree/' >> ~/.bashrc
