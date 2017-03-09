FROM jupyter/scipy-notebook:387f29b6ca83
MAINTAINER Josh Devins <hi@joshdevins.com>

# See: https://github.com/jupyter/docker-stacks/tree/master/scipy-notebook
# Add packages with conda: conda install -n python3 some-package

# Already expected to be there:
#  - python 3.5+
#  - jupyter
#  - numpy
#  - scipy
#  - scikit-learn
#  - statsmodels
#  - pandas
#  - matplotlib
#  - seaborn

# conda forge
RUN conda install -y \
  blaze \
  nose \
  plotly \
  pystan

# conda cloud
RUN conda install -y -c avishapiro cufflinks=0.8.2

# load matplotlib font caches
# see: https://github.com/matplotlib/matplotlib/issues/5836
RUN python -c "import matplotlib.pyplot"
