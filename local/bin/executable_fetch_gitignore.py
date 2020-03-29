#!/usr/bin/env python3
import os

import requests

#https://github.com/15cm/gitignore

misc_ignore_src_names = [
    'macOS', 'JetBrains', 'Emacs', 'Xcode', 'JEnv', 'Vim', 'Tags', 'Windows',
    'Emacs'
]

language_ignore_src_names = ['Python', 'Ruby']

misc_github_link_template = 'https://raw.githubusercontent.com/15cm/gitignore/master/Global/{0}.gitignore'
language_github_link_template = 'https://raw.githubusercontent.com/15cm/gitignore/master/{0}.gitignore'
local_ignore_file = os.path.expanduser('~/.gitignore_global.local')
ignore_file = os.path.expanduser('~/.gitignore_global')

ignore_src_links = list(
    map(lambda x: misc_github_link_template.format(x),
        misc_ignore_src_names)) + list(
            map(lambda x: language_github_link_template.format(x),
                language_ignore_src_names))
remote_ignore_texts = list(
    map(lambda link: requests.get(link).text, ignore_src_links))
with open(local_ignore_file) as f:
    local_ignore_lines = f.readlines()

with open(ignore_file, 'w') as f:
    f.writelines(
        map(lambda x: x + '\n', local_ignore_lines + remote_ignore_texts))
