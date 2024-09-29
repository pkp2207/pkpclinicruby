class WelcomeController < ApplicationController
    def index
      # Logic for your home page (if necessary)
    end
  
    def manifest
      render json: {
        "short_name": "PKPClinicRuby",
        "name": "Clinic Application",
        "icons": [
          {
            "src": "/icon.png",
            "sizes": "192x192",
            "type": "image/png"
          }
        ],
        "start_url": "/",
        "display": "standalone",
        "theme_color": "#ffffff",
        "background_color": "#ffffff"
      }
    end
  end
  