import aiohttp
import asyncio
import time

API_URL = "https://jsonplaceholder.typicode.com/posts/{}"

async def fetch_post(session, post_id):
    async with session.get(API_URL.format(post_id)) as response:
        return await response.json()

async def main():
    start = time.time()
    async with aiohttp.ClientSession() as session:
        tasks = [fetch_post(session, i) for i in range(1, 21)]  # 20 calls
        results = await asyncio.gather(*tasks)
    duration = time.time() - start
    print(f"Async execution time: {duration:.2f} seconds")
    print(f"Fetched {len(results)} posts")

if __name__ == "__main__":
    asyncio.run(main())
