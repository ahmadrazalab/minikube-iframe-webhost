### localrun
```
pip install Flask
python3 web_browser.py
```

### create server to run in background
sudo nano /etc/systemd/system/web_browser.service

```
[Unit]
Description=Web Browser Flask App
After=network.target

[Service]
User=<your_username>
Group=<your_group>
WorkingDirectory=/path/to/your/app
ExecStart=/usr/bin/python /path/to/your/app/web_browser.py
Restart=always

[Install]
WantedBy=multi-user.target
```

sudo systemctl daemon-reload
sudo systemctl start web_browser
sudo systemctl enable web_browser



### setup nginx reverse proxy
```
server {
    listen 80;
    server_name your_domain_or_ip;

    location / {
        proxy_pass http://localhost:5000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```


