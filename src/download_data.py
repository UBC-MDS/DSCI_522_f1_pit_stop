# author: Flora Ouedraogo
# date: 2021-11-20

"""This script will download pit_stops.csv from the web to a local filepath as either a csv or feather file format.

Usage: src/down_data.py --url=<url> --out_file=<out_file>

Options:
--url=<url>              URL from where to download the data (must be in standard csv format)
--out_file=<out_file>    Path (including filename) of where to locally write the file
"""
#comment
from docopt import docopt
import pandas as pd
import os

opt = docopt(__doc__)

def main(url, out_file):

  data = pd.read_csv(url)

  os.makedirs(os.path.dirname(out_file))

   data.to_csv(out_file, index = False)

if __name__ == "__main__":
  main(opt["--url"], opt["--out_file"])
