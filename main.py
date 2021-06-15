from pyvirtualdisplay import Display
from selenium import webdriver

display = Display(color_depth=24, size=(1920, 1080))
display.start()
drive = webdriver.Firefox(log_path='./firefox.log')

drive.get('https://mangareader.tv/alphabetical')

for link in drive.find_elements_by_xpath('//ul[@class="d46"]/li/a'):
    print(link.get_attribute('href'))

drive.quit()
display.stop()