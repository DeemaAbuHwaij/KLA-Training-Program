import requests
from concurrent.futures import ThreadPoolExecutor
import time

API_URL = "https://jsonplaceholder.typicode.com/posts/{}"

def fetch_post(post_id):
    response = requests.get(API_URL.format(post_id))
    return response.json()

def main():
    start = time.time()
    with ThreadPoolExecutor(max_workers=10) as executor:
        results = list(executor.map(fetch_post, range(1, 21)))  # 20 calls
    duration = time.time() - start
    print(f"Multithreaded execution time: {duration:.2f} seconds")
    print(f"Fetched {len(results)} posts")

if __name__ == "__main__":
    main()
