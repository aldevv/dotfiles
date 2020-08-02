
# -*- coding: utf-8 -*-

from mtranslate import translate

#https://github.com/mouuff/mtranslate
def main():
    to_translate = input()
    # to_translate = 'Bonjour comment allez vous?'
    print(translate(to_translate, 'ja'))
    # print(translate(to_translate))
    # print(translate(to_translate, 'ar'))
    # print(translate(to_translate, 'ru'))

if __name__ == '__main__':
    main()
