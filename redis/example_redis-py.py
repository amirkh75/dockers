import redis
import time


r = redis.Redis(
    host='redis',
    port=6379,
    db=0)


while(True):
    time.sleep(1)
    try:
        r.set('foo', 'bar1')
        value = r.get('foo')
        print(value.decode('UTF-8'))
    except:
        print("error...")
