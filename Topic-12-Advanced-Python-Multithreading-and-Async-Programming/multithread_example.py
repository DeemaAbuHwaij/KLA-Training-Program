import requests
from concurrent.futures import ThreadPoolExecutor  # For running threads in parallel
import time

# Function to fetch a single post by ID
def fetch_post(post_id):
    url = f"https://jsonplaceholder.typicode.com/posts/{post_id}"
    try:
        # Make a synchronous HTTP GET request with a timeout of 5 seconds
        response = requests.get(url, timeout=5)
        response.raise_for_status()  # Raise exception for HTTP errors
        return response.json()       # Return parsed JSON response
    except Exception as e:
        # Handle request errors (e.g., timeout, connection error)
        print(f"Failed to fetch post {post_id}: {e}")
        return {"id": post_id, "title": "Error"}  # Return a fallback result

# Main function to run threaded execution
def main():
    # Start measuring time
    start_time = time.time()

    # Create a thread pool with 5 workers
    with ThreadPoolExecutor(max_workers=5) as executor:
        # Map the fetch_post function to post IDs 1 through 10
        results = list(executor.map(fetch_post, range(1, 11)))

    # Print results (post ID and title) from each thread
    for result in results:
        print(f"✅ Post {result['id']}: {result['title']}")

    # Calculate and print total duration
    duration = time.time() - start_time
    print(f"\nTotal time (multithreaded): {duration:.2f} seconds")

if __name__ == "__main__":
    main()
