import argparse
import requests
import re

parser = argparse.ArgumentParser("files_extractor")
parser.add_argument("base_uri", help="The dataset page URI.", type=str)
args = parser.parse_args()
base_uri = args.base_uri

res = requests.get(base_uri)
res_text = res.text

re_urls = re.finditer(r"https?://dados.educacao.sp.gov.br/sites/default/files/.*.(csv|xlsx)", res_text)
urls = []
for re_obj in re_urls:
    url = re_obj.group(0)
    urls.append(url)

urls_concat = " ".join(urls)
print(urls_concat)
