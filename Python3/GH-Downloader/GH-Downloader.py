#!python3

import requests
import json
import os

from git import Repo

"""
GH-Downloader by medik
170305

GPL v3
"""


def main():
    # List your repos
    # GET /user/repos

    USERNAME = ""
    PASSWORD = ""
    DL_PATH = ""

    repos = requests.get("https://api.github.com/user/repos", auth=(USERNAME, PASSWORD))

    res = repos.json()

    for item in res:
        path = DL_PATH + item["full_name"]
        # os.makedirs(path)
        # repo = Repo(path)
        git_url = item["ssh_url"]
        print(git_url)
        Repo.clone_from(git_url, path)


main()
