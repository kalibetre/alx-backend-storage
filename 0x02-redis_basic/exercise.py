#!/usr/bin/env python3
""" exercise module """
import uuid
from functools import wraps
from typing import Callable, Optional, Union

import redis


def count_calls(method: Callable) -> Callable:
    """
    decorates a method to count how many times it was called
    """

    @wraps(method)
    def wrapper(self, *args, **kwargs):
        """
        wrapper function
        """
        self._redis.incr(method.__qualname__)
        return method(self, *args, **kwargs)

    return wrapper


class Cache:
    """
    A Cache class that uses redis to store and retrieve data
    """

    def __init__(self) -> None:
        """
        initializes a redis store
        """
        self._redis = redis.Redis(host='localhost', port=6379, db=0)
        self._redis.flushdb()

    @count_calls
    def store(self, data: Union[str, bytes, int, float]) -> str:
        """
        saves a data to the redis store using a uuid key and returns the
        key
        """
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

    def get(
        self,
        key: str,
        fn: Optional[Callable] = None,
    ) -> Union[str, bytes, int, float, None]:
        """
        returns the value stored in the redis store at the key by converting it
        to its original data type by calling the function fn. if the key is not
        found, it returns None
        """
        value = self._redis.get(key)
        if value is not None and fn is not None:
            value = fn(value)
        return value

    def get_int(self, key: str) -> Union[int, None]:
        """
        returns the value stored in the redis store at the key as an int
        """
        return self.get(key, int)  # type: ignore

    def get_str(self, key: str) -> Union[str, None]:
        """
        returns the value stored in the reds store at the key as str
        """
        return self.get(key, str)  # type: ignore
