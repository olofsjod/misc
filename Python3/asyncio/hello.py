import asyncio

async def hello():
    print("Hello world!")
    asyncio.sleep(1)

loop = asyncio.get_event_loop()

loop.run_until_complete(hello())
loop.close()
