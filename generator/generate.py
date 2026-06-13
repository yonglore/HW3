import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["hero_name", "popularity", "kills_count", "team"]

def generate_row():

    return {
        "hero_name": random.choice(["Homelander", "Deep", "Black Noir", "Frenchie", "A-Train", "Starlight"]),
        "popularity": random.randint(1, 100),
        "kills_count": random.randint(0, 200),
        "team": random.choice(["The Seven", "Vought", "Independent"]),
    }


OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)