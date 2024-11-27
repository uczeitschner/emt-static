import os
import glob
from acdh_tei_pyutils.tei import TeiReader

print("check which letters are not included into cmif file")

all_ids = set()
for x in sorted(glob.glob("./data/editions/*.xml")):
    doc_id = os.path.split(x)[-1].replace(".xml", ".html")
    all_ids.add(doc_id)
print(len(all_ids))

cmif_ids = set()
doc = TeiReader("./data/indices/cmif.xml")
for x in doc.any_xpath(".//tei:correspDesc[@ref]/@ref"):
    doc_id = x.split("/")[-1]
    cmif_ids.add(doc_id)
print(len(cmif_ids))

no_cmif = set()
for x in all_ids:
    if x in cmif_ids:
        pass
    else:
        print(os.path.join("data", "editions", x).replace(".html", ".xml"))
        no_cmif.add(os.path.join("data", "editions", x).replace(".html", ".xml"))
print(len(no_cmif))
