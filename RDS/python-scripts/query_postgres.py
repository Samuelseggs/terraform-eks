#!/usr/bin/env python3

import argparse
import psycopg2

from db_config import config

conn = None  # global variable


def set_connection(section):
    """
    Gets connection to PostgreSQL database instance
    :param section: section of database configuration file to use
    :return: db connection
    """

    try:
        params = config(filename='database.ini', section=section)
        global conn
        conn = psycopg2.connect(**params)
        print('Connection to database created')
    except (Exception, psycopg2.DatabaseError) as err:
        print(set_connection.__name__, err)
        exit(1)

def close_conn():
    """
    Closes database connection
    """
    if conn is not None:
        conn.close()
        print('Database connection closed')


def parse_args():
    """
    Read in command-line parameters
    """
    parser = argparse.ArgumentParser()
    parser.add_argument("-i", "--instance", default="master", help="Database instance")

    return parser.parse_args()
