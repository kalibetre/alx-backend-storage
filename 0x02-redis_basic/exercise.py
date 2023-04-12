#!/usr/bin/env python3
""" exercise module """
import uuid
from typing import Union

import redis


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

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """
        saves a data to the redis store using a uuid key and returns the
        key
        """
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key
