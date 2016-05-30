#!/usr/bin/env python

from setuptools import setup, find_packages
import os
import sys
import logging

from armory_utxsvr import config

required_packages = [
    'appdirs',
    'flask',
    'json-rpc',
    'pytest',
    'requests'
]

setup_options = {
    'name': 'armory_utxsvr',
    'version': config.VERSION,
    'author': 'Counterparty Developers',
    'author_email': 'support@counterparty.io',
    'maintainer': 'Counteparty Developers',
    'maintainer_email': 'dev@counterparty.io',
    'url': 'http://counterparty.io',
    'license': 'MIT',
    'description': 'armory UTXsvr',
    'long_description': 'Provides a JSON RPC interface to armory for production and signing of offline transactions',
    'keywords': 'counterparty, bitcoin, armory, armory_utxsvr',
    'classifiers': [
      "Programming Language :: Python",
    ],
    'download_url': 'https://github.com/CounterpartyXCP/armory_utxsvr/releases/tag/%s' % config.VERSION,
    'provides': ['armory_utxsvr'],
    'packages': find_packages(),
    'zip_safe': False,
    'setup_requires': ['appdirs'],
    'install_requires': required_packages,
    'include_package_data': True,
    'entry_points': {
        'console_scripts': [
            'armory_utxsvr = armory_utxsvr:server_main',
        ]
    },
}

if os.name == "nt":
    sys.exit("Windows installs not supported")

setup(**setup_options)
