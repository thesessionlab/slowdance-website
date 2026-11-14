# Slowdance Productions website

Plain HTML and CSS, no build step. Hosted free on GitHub Pages.

```
index.html                         Home
about/index.html                   About (Jade and Andy)
home/<project>/index.html          One page per project
assets/style.css                   All styling
assets/site.js                     Menu, header colour, fade in
404.html                           Page not found
localise-images.sh                 Copies images off Squarespace (run once)
```

The project pages keep the same addresses as the Squarespace site
(`/about`, `/home/duty-of-care-audible` and so on), so existing links keep working.

## 1. Put it on GitHub

1. Go to github.com/new and make a repository called `slowdance-website` (public).
2. On the new repo page click **uploading an existing file**, drag in everything
   from this folder (including the `assets`, `about` and `home` folders), and commit.
3. Go to **Settings → Pages**. Under *Build and deployment* choose
   **Deploy from a branch**, branch `main`, folder `/ (root)`, and save.
4. After a minute the site is live at `https://<your-username>.github.io/slowdance-website/`.

## 2. Images

The first time the site publishes, the "Publish site" GitHub Action copies every image
off Squarespace and Unsplash into `assets/img/` and commits them, so the site no longer
depends on either. You can also run `bash localise-images.sh` yourself.

## Enquiry form

The form on the home page posts through FormSubmit (formsubmit.co) to jade@slowdanceproductions.com
and copies podcast@slowdanceproductions.com. The very first submission triggers an activation
email to jade@: click the link in it once and every enquiry after that arrives normally.

## 3. Point slowdanceproductions.com at GitHub

1. In the repo: **Settings → Pages → Custom domain**, enter `www.slowdanceproductions.com` and save.
   GitHub adds a `CNAME` file to the repo for you.
2. At your domain registrar (or in Squarespace Domains if the domain is registered there),
   replace the existing records with:

| Type  | Host | Value |
|-------|------|-------|
| CNAME | www  | `<your-username>.github.io` |
| A     | @    | 185.199.108.153 |
| A     | @    | 185.199.109.153 |
| A     | @    | 185.199.110.153 |
| A     | @    | 185.199.111.153 |

3. Once the domain shows as verified in Settings → Pages, tick **Enforce HTTPS**.

DNS changes can take up to a day to settle.

## Editing

Text lives directly in the HTML files. Open one in GitHub, click the pencil icon,
change the words and commit. Colours and fonts are at the top of `assets/style.css`:

```
--bg:   #F8F8F1   page background
--ink:  #000      text
--mute: #6E6D68   secondary text
--foot: #C7D3D9   footer
```

To add a project, copy one of the folders in `home/`, rename it, swap the
text and image, then add a card for it on the home page and a link in the footer.

## Stock photography

The four studio and set photos on the home page are stock images. To swap any of them,
save the new image into `assets/img/` with the same file name
(`stock-studio-mic.jpg`, `stock-voice-booth.jpg`, `stock-film-set.jpg`, `stock-sound-recordist.jpg`)
after running `localise-images.sh`.
