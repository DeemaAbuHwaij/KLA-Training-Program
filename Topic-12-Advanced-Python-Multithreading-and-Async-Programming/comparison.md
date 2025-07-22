# Multithreading vs Async in Python

This topic explores the performance of concurrent API calls using:

- `ThreadPoolExecutor` (multithreading)
- `aiohttp` with `asyncio` (asynchronous programming)

## Test Setup
We fetched 20 fake blog posts from:
[https://jsonplaceholder.typicode.com/posts/{id}](https://jsonplaceholder.typicode.com/posts/{id})

## Observed Runtime (example results)
| Method            | Time (seconds) |
|------------------|----------------|
| ThreadPoolExecutor | ~1.40         |
| Asyncio + aiohttp | ~0.60         |

> Your results may vary depending on network latency.

## Summary
- **ThreadPoolExecutor** is easier to adopt and good for I/O-bound tasks with limited concurrency.
- **Asyncio** performs better when managing large numbers of I/O tasks with less overhead.
- **Async code** is more scalable and lightweight but requires a shift in thinking and structure.

## Conclusion
Use async programming for high-concurrency I/O-bound tasks. Threading is suitable for simpler parallel workloads or when working with blocking libraries like `requests`.
