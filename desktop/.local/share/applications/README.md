A bunch of this files refer to PWAs installed with google-chrome-unstable.

The associated configuration isn't in this repository for obvious privacy and security reasons. In order to use those, you'll need to:
1. open chrome and go the the associated website (ex: https://web.dev)
2. install the PWA (using the associated button, menu entry or install banner)
3. go the `chrome://apps`
4. right click on the PWA and select 'create shortcuts'
5. replace the app-id by the one you'll find in the new desktop entry in `.local/share/applications/chrome-<app-id>-Default.desktop`
5. delete this new desktop entry