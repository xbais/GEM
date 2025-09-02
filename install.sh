#!/bin/bash

# Make python venv
python3 -m venv pyvenv && source pyvenv/bin/activate

# Install detectron2
export PATH="$PATH:/usr/local/cuda-12.8/bin"
pip install numpy
pip install torch torchvision --extra-index-url https://download.pytorch.org/whl/cu124
sudo apt update && sudo apt install -y build-essential cmake ninja-build

git clone https://github.com/facebookresearch/detectron2.git
cd detectron2
pip install -e . --no-build-isolation

# Clone GEM
cd ..
git clone https://github.com/xbais/GEM.git

# Install GEM Dependencies
pip install timm 
pip install ninja 
pip install einops 
pip install opencv-python 
pip install scipy 
pip install git+https://github.com/xbais/pydensecrf.git
cd GEM/maskdino/modeling/pixel_decoder/ops && sh make.sh
