require 'watir'
require 'webdrivers/chromedriver'

options = {
  args: %w[
    --disable-infobars
    --disable-dev-shm-usage
    --no-sandbox
  ]
}

browser = Watir::Browser.new(:chrome, headless: true, options: options )
browser.window.resize_to(2_300, 900) # width, height

browser.goto 'watir.com'
browser.link(text: 'Guides').click

puts browser.title
# => 'Guides – Watir Project'

browser.screenshot.save('pic/screenshot.png')

browser.close
