#!/usr/bin/env python3
""" exercise module """

from functools import wraps
from typing import Callable

import redis
import requests
from requests import Response


def counter(method: Callable) -> Callable:
    """
    a counter decorator that counts how many times a particular URL was
    accessed. The value is cached in Redis and will expire after 10 seconds
    """

    @wraps(method)
    def wrapper(*args, **kwargs):
        """
        wrapper function
        """
        _redis = redis.Redis(host='localhost', port=6379, db=0)
        key = f"count:{args[0]}"
        _redis.incr(key)
        _redis.expire(key, 10)
        return method(*args, **kwargs)

    return wrapper


@counter
def get_page(url: str) -> str:
    """
    a function that returns the HTML content of a particular URL
    """
    response: Response = requests.get(url)
    return response.text
