import aiohttp
import asyncio
import time

# Async function to fetch a single post
async def fetch_post(session, post_id):
    # Construct the URL for the given post ID
    url = f"https://jsonplaceholder.typicode.com/posts/{post_id}"
    try:
        # Perform an asynchronous GET request with a timeout
        async with session.get(url, timeout=aiohttp.ClientTimeout(total=5)) as response:
            response.raise_for_status()  # Raise an error if status is not 200 OK
            return await response.json()  # Parse and return JSON response
    except Exception as e:
        # Handle any error (network, timeout, etc.)
        print(f"Failed to fetch post {post_id}: {e}")
        return {"id": post_id, "title": "Error"}  # Fallback result if failed

# Main coroutine to fetch all posts
async def main():
    # Start timing
    start_time = time.time()

    # Create one reusable session for all HTTP requests
    async with aiohttp.ClientSession() as session:
        # Create a list of 10 async tasks (fetching posts 1–10)
        tasks = [fetch_post(session, post_id) for post_id in range(1, 11)]

        # Run all tasks concurrently and wait for them to complete
        results = await asyncio.gather(*tasks)

        # Print the title of each fetched post
        for result in results:
            print(f"✅ Post {result['id']}: {result['title']}")

    # Measure total runtime
    duration = time.time() - start_time
    print(f"\nTotal time (async): {duration:.2f} seconds")

# Entry point of the script
if __name__ == "__main__":
    asyncio.run(main())  # Run the main coroutine
