import glob
import os
import requests
from acdh_tei_pyutils.tei import TeiReader
from tqdm import tqdm

print("script to download images from transkribus")

image_dir = "images"
os.makedirs(image_dir, exist_ok=True)
files = glob.glob("./data/editions/*.xml")
images = glob.glob(f"{image_dir}/*")

print("collecting image data")
items = []
for x in files:
    doc_id = os.path.splitext(os.path.basename(x))[0]
    doc = TeiReader(x)
    for i, pb in enumerate(doc.any_xpath(".//tei:pb"), start=1):
        item = {}
        item["doc_id"] = doc_id
        try:
            item["url"] = pb.attrib["source"]
        except KeyError:
            print(f"failed to fetch image from doc: {doc_id}")
            continue
        item["image_name"] = f"{doc_id}___{i:04}.jpg"
        items.append(item)

print(f"collected {len(items)} images")
failed = []
for x in tqdm(items):
    save_path = os.path.join(image_dir, x["image_name"])
    if os.path.exists(save_path):
        continue
    else:
        try:
            r = requests.get(x["url"])
        except Exception as e:
            print(x, e)
            failed.append(x)
            continue
        if r.status_code == 200:
            with open(save_path, "wb") as f:
                f.write(r.content)
        else:
            failed.append(x)
if failed:
    print("failed download for following files")
    for x in failed:
        print(x)
print("done")
print(f'{len(glob.glob(f"{image_dir}/*"))} images are now saved in {image_dir}')
