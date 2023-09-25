#!/usr/bin/env python3

from swiplserver import PrologMQI, PrologThread, create_posix_path
import re
from abc import ABC, abstractmethod
import signal
import sys

KNOWLEDGE_BASE_PATH = '../task1/src2.pl'


class AbstractQueryProcessor(ABC):
    def run(self, prolog: PrologThread):
        res = prolog.query(self.form_query())
        if not res or len(res) == 0:
            self.handle_failure(res)
        else:
            self.handle_success(res)

    @abstractmethod
    def form_query(self):
        pass

    @abstractmethod
    def handle_success(self, res):
        pass

    @abstractmethod
    def handle_failure(self, res):
        pass


class KaguneFinder(AbstractQueryProcessor):
    def __init__(self, kagune: str):
        self.kagune = kagune

    def form_query(self):
        return f'has_kagune(X, {self.kagune})'

    def handle_success(self, res):
        res = set([line['X'] for line in res])
        print(f'Found {len(res)} ghouls with {self.kagune} kagune')
        for index, line in enumerate(res, 1):
            print(f'{index}.', line)

    def handle_failure(self, res):
        print(f"No enemy with {self.kagune} kagune")


class FoundIn(AbstractQueryProcessor):
    def __init__(self, city: str):
        self.city = city

    def form_query(self):
        return f'found_in(X, {self.city})'

    def handle_success(self, res):
        res = set([line['X'] for line in res])
        print(f'Found {len(res)} enemies with {self.city} kagune')
        for index, line in enumerate(res, 1):
            print(f'{index}.', line)

    def handle_failure(self, res):
        print(f"No enemy with {self.city} kagune")


patterns = {
    r'Who have kagune (.+)\?': KaguneFinder,
    r'Found in (.+)\?': FoundIn,
}


def signal_handler(sig, frame):
    print('You pressed Ctrl+C!')
    sys.exit(0)


with PrologMQI() as mqi:
    signal.signal(signal.SIGINT, signal_handler)

    with mqi.create_thread() as prolog:
        path = create_posix_path(KNOWLEDGE_BASE_PATH)
        print(prolog.query(f'consult("{path}")'))

        while True:
            query = input('> ')
            if query.lower() == 'exit':
                break

            for pattern in patterns:
                match = re.match(pattern, query, re.IGNORECASE)
                if match is None:
                    continue
                processor = patterns[pattern](*match.groups())
                processor.run(prolog)
                break
            else:
                print("Invalid query!")