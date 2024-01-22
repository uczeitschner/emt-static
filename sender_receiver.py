import glob
from acdh_tei_pyutils.tei import TeiReader
import lxml.etree as ET
from tqdm import tqdm

print("creating markup for sender, receiver and sender places")
files = sorted(glob.glob("./data/editions/*.xml"))

sender = set()
receiver = set()
send_place = set()
for x in tqdm(files, total=len(files)):
    doc = TeiReader(x)
    for item in doc.any_xpath(".//tei:correspAction[@type='sent']/tei:persName/@ref"):
        sender.add(item[1:])
    for item in doc.any_xpath(
        ".//tei:correspAction[@type='received']/tei:persName/@ref"
    ):
        receiver.add(item[1:])
    for item in doc.any_xpath(".//tei:correspAction[@type='sent']/tei:placeName/@ref"):
        send_place.add(item[1:])

print("writing sender, receiver, send place infos as tei:state into index files")
doc = TeiReader("./data/indices/listperson.xml")
for bad in doc.any_xpath(".//tei:fs"):
    bad.getparent().remove(bad)
for x in doc.any_xpath(".//tei:person[@xml:id]"):
    xmlid = x.attrib["{http://www.w3.org/XML/1998/namespace}id"]
    if xmlid in sender:
        state = ET.Element("{http://www.tei-c.org/ns/1.0}state")
        label = ET.Element("{http://www.tei-c.org/ns/1.0}label")
        state.append(label)
        state.attrib["type"] = "sender"
        label.text = "Sender"
        x.append(state)
for x in doc.any_xpath(".//tei:person[@xml:id]"):
    xmlid = x.attrib["{http://www.w3.org/XML/1998/namespace}id"]
    if xmlid in receiver:
        state = ET.Element("{http://www.tei-c.org/ns/1.0}state")
        label = ET.Element("{http://www.tei-c.org/ns/1.0}label")
        state.append(label)
        state.attrib["type"] = "receiver"
        label.text = "Empfänger"
        x.append(state)
doc.tree_to_file("./data/indices/listperson.xml")

doc = TeiReader("./data/indices/listplace.xml")
for bad in doc.any_xpath(".//tei:state"):
    bad.getparent().remove(bad)
for x in doc.any_xpath(".//tei:place[@xml:id]"):
    xmlid = x.attrib["{http://www.w3.org/XML/1998/namespace}id"]
    if xmlid in send_place:
        state = ET.Element("{http://www.tei-c.org/ns/1.0}state")
        label = ET.Element("{http://www.tei-c.org/ns/1.0}label")
        state.append(label)
        state.attrib["type"] = "sender"
        label.text = "Absendeort"
        x.insert(1, state)
doc.tree_to_file("./data/indices/listplace.xml")
