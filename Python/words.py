#! /usr/bin/env/ python3
"""Retrieve and print words from a URL.

Usage:

    python3 words.py <URL>

"""
import sys
from urllib.request import urlopen

def fetch_words(url):
    """FETCHES A LIST OF WORDS FROM A URL.

    Args:
        url: The URL of a UTF-8 text document.

    Returns:
        A list of strings containing words from the url
    """
    with urlopen(url) as story:
        story_words =[]
        for line in story:
            line_words = line.decode('utf-8').split();
            for word in line_words:
                story_words.append(word)
    return story_words


def print_items(items):
    """Prints a set of items from any given list or array.

    Args:
        Items from a list of some sort

    Returns:
        Prints words
    """
    for item in items:
        print(item)


def main(url):
    words = fetch_words(url)
    print_items(words)


if __name__=='__main__':
    main(sys.argv[1])
