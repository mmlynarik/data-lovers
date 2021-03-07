import math
import random
import sys
import time

import multiprocessing as mp
import numpy as np
import pandas as pd

# List comprehension

a = [random.randint(1, 100) for _ in range(1000000)]
b = [random.randint(1, 100) for _ in range(1000000)]

start_time = time.perf_counter()

[x * y for x, y in zip(a, b)]

print(f"--- List comprehension took ---\n{time.perf_counter() - start_time} seconds ")

# Vectorized with numpy

a = np.array([random.randint(1, 100) for _ in range(1000000)])
b = np.array([random.randint(1, 100) for _ in range(1000000)])

start_time = time.perf_counter()

a * b

print(f"--- Numpy vectorization took ---\n{time.perf_counter() - start_time} seconds ")

# Harversine formula (great circle distance of two points on Earth)


def haversine(row):
    """
    Non-vectorized harversine
    """
    a_lat, a_lng, b_lat, b_lng = row
    R = 6371  # earth radius in km

    a_lat = math.radians(a_lat)
    a_lng = math.radians(a_lng)
    b_lat = math.radians(b_lat)
    b_lng = math.radians(b_lng)

    d_lat = b_lat - a_lat
    d_lng = b_lng - a_lng

    a = math.pow(math.sin(d_lat / 2), 2) + math.cos(a_lat) * math.cos(b_lat) * math.pow(
        math.sin(d_lng / 2), 2
    )
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))

    return R * c


n_values = 10000

coords = np.array(
    [
        np.random.uniform(-90, 90, n_values),  # random origin latitude
        np.random.uniform(-180, 180, n_values),  # random origin longitude
        np.random.uniform(-90, 90, n_values),  # random destination latitude
        np.random.uniform(-180, 180, n_values), # random destination longitude
    ]
).T  

start_time = time.perf_counter()

np.apply_along_axis(haversine, 1, coords)

print(
    f"--- Non-vectorized harversine took ---\n{time.perf_counter() - start_time} seconds "
)


def vec_haversine(a_lat, a_lng, b_lat, b_lng):
    """
    Vectorized harversine
    """
    R = 6371  # earth radius in km

    a_lat = np.radians(a_lat)
    a_lng = np.radians(a_lng)
    b_lat = np.radians(b_lat)
    b_lng = np.radians(b_lng)

    d_lat = b_lat - a_lat
    d_lng = b_lng - a_lng

    d_lat_sq = np.sin(d_lat / 2) ** 2
    d_lng_sq = np.sin(d_lng / 2) ** 2

    a = d_lat_sq + np.cos(a_lat) * np.cos(b_lat) * d_lng_sq
    c = 2 * np.arctan2(np.sqrt(a), np.sqrt(1 - a))

    return R * c  # returns distance between a and b in km


start_time = time.perf_counter()

vec_haversine(coords[:, 0], coords[:, 1], coords[:, 2], coords[:, 3])

print(
    f"--- Vectorized harversine took ---\n{time.perf_counter() - start_time} seconds "
)

# Harversine with pandas

df_coords = pd.DataFrame(
    coords,
    columns=["origin_lat", "origin_lng", "destination_lat", "destination_lng"],
)

start_time = time.perf_counter()

vec_haversine(
    df_coords.origin_lat,
    df_coords.origin_lng,
    df_coords.destination_lat,
    df_coords.destination_lng,
)

print(
    f"--- Vectorized harversine on dataframe took ---\n{time.perf_counter() - start_time} seconds "
)

# Multi-processing


def process_chunk(proc_chunk):
    chunk_res = vec_haversine(
        proc_chunk.origin_lat,
        proc_chunk.origin_lng,
        proc_chunk.destination_lat,
        proc_chunk.destination_lng,
    )
    chunk_res.index = proc_chunk.index

    return chunk_res


n_proc = mp.cpu_count()

start_time = time.perf_counter()

chunksize = len(df_coords)

proc_chunks = []
for i_proc in range(n_proc):
    chunkstart = i_proc * chunksize
    # make sure to include the division remainder for the last process
    chunkend = (i_proc + 1) * chunksize if i_proc < n_proc - 1 else None

    proc_chunks.append(df_coords.iloc[slice(chunkstart, chunkend)])

# check whether all data are assigned to a process
assert sum(map(len, proc_chunks)) == len(df_coords)

with mp.Pool(processes=n_proc) as pool:
    # starts the sub-processes without blocking
    # pass the chunk to each worker process
    proc_results = [
        pool.apply_async(process_chunk, args=(chunk,)) for chunk in proc_chunks
    ]

    # blocks until all results are fetched
    result_chunks = [r.get() for r in proc_results]

results = pd.concat(result_chunks)
results = pd.concat((df_coords, results), axis=1)
# make sure we got a result for each coordinate pair:
assert len(results) == len(df_coords)

print(f"--- Parallel processes took ---\n{time.perf_counter() - start_time} seconds ")
