import glob
import os
import pandas as pd
from acdh_cidoc_pyutils import extract_begin_end
from acdh_tei_pyutils.tei import TeiReader
from acdh_tei_pyutils.utils import extract_fulltext
from tqdm import tqdm

files = sorted(glob.glob("./data/editions/*.xml"))

transcribed = []
rs_tagged = []
abstract = []
items = []
for x in tqdm(files):
    _, doc_id = os.path.split(x)
    item = {"id": doc_id}
    doc = TeiReader(x)
    fulltext = extract_fulltext(doc.any_xpath(".//tei:body")[0])
    if fulltext:
        transcribed.append(x)
        item["full_text"] = "ja"
    else:
        item["full_text"] = "nein"
    rs_tags = doc.any_xpath(".//tei:body//tei:rs")
    if rs_tags:
        rs_tagged.append(x)
        item["entities"] = "ja"
    else:
        item["entities"] = "nein"
    try:
        regest = extract_fulltext(doc.any_xpath(".//tei:abstract[@n='regest']")[0])
    except:
        regest = ""
    if regest:
        abstract.append(x)
        item["regest"] = "ja"
    else:
        item["regest"] = "nein"

    try:
        item["sender_name"] = doc.any_xpath(
            ".//tei:correspAction[@type='sent']/tei:persName/text()"
        )[0]
    except IndexError:
        item["sender_name"] = ""
    try:
        item["sender_id"] = doc.any_xpath(
            ".//tei:correspAction[@type='sent']/tei:persName/@ref"
        )[0]
    except IndexError:
        item["sender_id"] = ""
    try:
        item["receiver_name"] = doc.any_xpath(
            ".//tei:correspAction[@type='received']/tei:persName/text()"
        )[0]
    except IndexError:
        item["receiver_name"] = ""
    try:
        item["receiver_id"] = doc.any_xpath(
            ".//tei:correspAction[@type='received']/tei:persName/@ref"
        )[0]
    except IndexError:
        item["receiver_id"] = ""
    try:
        item["sender_date"] = extract_begin_end(
            doc.any_xpath(".//tei:correspAction[@type='sent']/tei:date")[0]
        )[0]
    except IndexError:
        item["sender_date"] = ""

    items.append(item)


df = pd.DataFrame(items)

df.to_csv("html/report.csv", index=False)
