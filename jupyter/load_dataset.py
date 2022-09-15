import argparse
import requests
import re
import pandas as pd

# parser = argparse.ArgumentParser("load_datasets")
# parser.add_argument("dataset_file_path", help="The dataset file path.", type=str)
# args = parser.parse_args()
# dataset_file_path = args.dataset_file_path

def load(dataset_file_path):
    dataset_type = dataset_file_path.split(".")[-1].lower()
    path_splitted = dataset_file_path.split("/")
    base_path = path_splitted[1]
    dataset_name = path_splitted[2]
    dataset_file = path_splitted[3]
    print(f"Dataset file: {dataset_file_path}")
    df = None
    if dataset_type == 'csv':
        df = pd.read_csv(dataset_file_path, sep=";")
        print("TODO: Do load of csv dataset file")
    elif dataset_type == 'xlsx':
        print("TODO: Do load of xlsx dataset file")
    return df