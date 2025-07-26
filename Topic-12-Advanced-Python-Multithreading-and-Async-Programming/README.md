# Topic 12: Advanced Python – Multithreading and Async Programming

## What You'll Learn
- Using `ThreadPoolExecutor` for parallelism
- Working with `asyncio`, coroutines, and `aiohttp`
- Comparing the performance of synchronous vs asynchronous programming in Python
- 

---

## Tasks Completed

### 1. `multithread_example.py`
- Makes 10 concurrent API calls using `ThreadPoolExecutor` and the `requests` library.
- Demonstrates multithreading for I/O-bound operations.

### 2. `async_example.py`
- Uses `asyncio` and `aiohttp` to make the same 10 API calls asynchronously.
- Illustrates modern non-blocking asynchronous programming.

### 3. `comparison.md`
- A markdown file documenting the runtime difference and performance comparison between the two methods.

---

## Files Included

Topic-12-Advanced-Python-Concurrency/
├── multithread_example.py # ThreadPoolExecutor version
├── async_example.py # asyncio + aiohttp version
├── comparison.md # Runtime analysis
└── README.md # This guide


---

## API Used
All examples use the free public API:  
`https://jsonplaceholder.typicode.com/posts/{id}`

---

## How to Run

### 1. Install requirements 

### 2. Run multithreaded version
python multithread_example.py

### 3. Run async version
python async_example.py
