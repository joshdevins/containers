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

RUN conda install -y \
  nose \
  blaze \
  pystan \
  plotly
