from os import listdir, walk
from os.path import isfile, join, realpath, isdir

OUT_FILE_LIST_NAME = 'image_list.txt'
OUT_FILE_PATH = 'database/banco'
IMG_EXTENSIONS = '.png'
IMGS_PATH = 'database/banco'
MAX_DEPTH = 1

def list_folder(pth, callback, curr_depth=1):
    if curr_depth <= MAX_DEPTH:
        for f in listdir(pth):
            file_with_path = join(pth, f)
            callback(file_with_path)
            if f != '.' and f != '..' and isdir(file_with_path):
                list_folder(file_with_path, callback, curr_depth + 1)
              
def write_pth_in_file(out_file_obj, pth):
    if isfile(pth) and pth.endswith(IMG_EXTENSIONS):
        out_file_obj.write(pth + '\n')

local_path = realpath(IMGS_PATH)
with open(join(realpath(OUT_FILE_PATH), OUT_FILE_LIST_NAME), 'w') as out_file_obj:
    list_folder(local_path, lambda pth: write_pth_in_file(out_file_obj, pth))
