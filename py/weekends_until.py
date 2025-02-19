from enum import Enum, IntEnum
from datetime import datetime, timedelta, date
from dateutil import relativedelta, rrule
from dataclasses import dataclass
import logging


UNTIL_DATE="2025-05-15"

LOG = logging.getLogger(__name__)


def parse_to_date(in_date:str)->date:
    INPUT_DATE_FORMAT = "%Y-%m-%d"
    return datetime.strptime(in_date, INPUT_DATE_FORMAT).date()

    
def weekends_until(target_date:date)->int:

    assert isinstance(target_date, date), f"{target_date} must be date object, is {type(target_date)}"

    today = date.today()

    # if target date has already passed
    if target_date > today:
        return 0

    curr, end = min(today, target_date), target_date
    
    count = 0
    while curr <= end:
        if curr.weekday() == 5:  # 5 represents Saturday
            count += 1
            curr += timedelta(days=7)
        # get to the first saturday
        else:
            curr += timedelta(days=1)
    
    return count


class TestWeekendsUntil:
    def test_calc(self):
        until_date = parse_to_date(UNTIL_DATE)

        res1 = weekends_until(until_date)
        print(f"{res1} weekends until {until_date}")

        res2 = parse_to_date("2025-05-17")
        print(f"{res2}, y={res2.year}")

        res2 = parse_to_date("2025-01-17")
        res2r = weekends_until(res2)

        print(f"{res2}, weekends_result={res2r}")



