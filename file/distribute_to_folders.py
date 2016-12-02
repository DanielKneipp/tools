import os

FOLDER_FILES = '192-168-127-252-8554-live-sdp_2016-08-25-15-55-00-703_/naotem'
NUM_FILES_PER_FOLDER = 700

file_count = 0
folder_count = 0

for file in os.listdir(FOLDER_FILES):
    src_file = os.path.join(FOLDER_FILES, file)

    if os.path.isfile(src_file):
        file_count += 1
        # Create new folder if necessary
        if (file_count - 1) % NUM_FILES_PER_FOLDER == 0:
            folder_count += 1
            dst_pth = os.path.join(FOLDER_FILES, str(folder_count))
            print 'Setting next folder: ' + str(dst_pth)
            if not os.path.exists(dst_pth):
                print 'Folder doesn\'t exist. I\'m creating it'
                os.makedirs(dst_pth)

        # Move the file to the folder
        src_file = os.path.join(FOLDER_FILES, file)
        dst_file = os.path.join(os.path.join(FOLDER_FILES, str(folder_count)), file)
        print 'Moving file ' + str(src_file) + ' to ' + str(dst_file)
        os.rename(src_file, dst_file)
