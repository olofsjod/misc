# BlockShaper.py
# A script that generates sprites to the tetris game

# by medik 170730

from PIL import Image
import os

class Block:
    def __init__(self, name, arr):
        self.name = name
        self.block_arr = arr

def create_block(inp):
    block = inp["block"]
    tile = inp["tile"]
    tilesize = inp["tilesize"]
    
    # Create a 4x4 tiles canvas
    canvassize = (tilesize[0]*4, tilesize[1]*4)
    canvasmode = tile.mode
    canvas = Image.new(canvasmode, canvassize)

    for n in range(len(block)):
        for m in range(len(block[n])):
            #print(n,m)
            if block[n][m] == 1:
                topleftcorner = (m*tilesize[0], n*tilesize[1])
                canvas.paste(tile, topleftcorner)
    return canvas

def gen_all_rotations(im):
    ret = []

    for i in range(4):
        ret.append(im.rotate(90*i))
    return ret

def transpose_arr(arr):
    ret = []

    for n in range(len(arr)):
        tmp = []
        for m in range(len(arr[n])):
            tmp.append(arr[m][n])

        ret.append(tmp)
    return ret

def parse_blocks_file(name, filep):
    o = open(filep)
    lines = o.readlines()

    arr = []
    for l in lines:
        # Remove \n
        newl = l.strip()

        # Create an array with comma as a delimiter
        newl = l.split(',')

        # Convert all items to integers
        temparr = []
        for i in newl:
            temparr.append(int(i))

        # Save result
        arr.append(temparr)

    #arr = transpose_arr(arr)

    ret = Block(name, arr)
    return ret
        
    
def load_blocks(dirp):
    ret = []
    with os.scandir(dirp) as it:
        for entry in it:
            if not entry.name.startswith('.') and entry.is_file():
                name = entry.name.split(".")[0]
                ret.append(parse_blocks_file(name, entry.path))
    return ret

def gen_all_blocks(inp):
    blocks = load_blocks(inp["blocksdir"])

    if not hasattr(inp, 'savepath'):
        inp["savepath"] = "output"

    if not os.path.exists(inp["savepath"]):
        os.makedirs(inp["savepath"])

    if not hasattr(inp, 'extension'):
        inp["extension"] = "png"
    
    for b in blocks:
        t = {}
        t["tile"] = inp["tile"]
        t["tilesize"] = inp["tilesize"]
        t["block"] = b.block_arr
        
        canvas = create_block(t)
        permutations = gen_all_rotations(canvas)

        for i in range(len(permutations)):
            path = inp["savepath"] + "/" + b.name +"_" + str(i) + "." + inp["extension"]
            permutations[i].save(path)

def main():
    im = Image.open("BlockShape.png")
    
    tilesize = (32,32)
    im = im.resize(tilesize)

    inp = {}
    inp["savepath"] = "output"
    inp["blocksdir"] = "blocks"
    inp["tile"] = im
    inp["tilesize"] = tilesize
    
    gen_all_blocks(inp)

main()
    
