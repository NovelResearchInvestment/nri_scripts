# -*- coding: utf-8 -*-

import sys; print('Python %s on %s' % (sys.version, sys.platform))
sys.path.extend([WORKING_DIR_AND_PYTHON_PATHS])

from importlib import reload

import pandas as pd
import numpy as np
import datetime

pd.set_option("display.max_rows",  50)
pd.set_option("display.max_columns",  20)
pd.set_option('display.width',  120)
pd.set_option("display.precision",  6)

import matplotlib.pyplot as plt
plt.rcParams['font.family'] = ['sans-serif']
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False