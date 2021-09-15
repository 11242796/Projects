


import mmap

filename= 'memdump.mem'

def regular_io_find(filename):
    with open(filename, mode="r", encoding="utf-8") as file_obj:
        text = file_obj.read()
        print(text.find(" the "))

def mmap_io_find(filename):
    with open(filename, mode="r", encoding="utf-8") as file_obj:
        with mmap.mmap(file_obj.fileno(), length=0, access=mmap.ACCESS_READ) as mmap_obj:
            print(mmap_obj.find(b" the "))