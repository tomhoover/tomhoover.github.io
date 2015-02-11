default: serve

diff:
	diff -rx .git -x _config.yml -x _posts -x theme-setup -x navigation.yml -X .gitignore ../gh_mmistakes/so-simple-theme .

serve:
	bundle exec jekyll serve

drafts:
	bundle exec jekyll serve --drafts

publish: build
	rsync -avz --delete --exclude='.git/' _site/ ../tomhoover.github.io
	cd ../tomhoover.github.io && git add --all . && git commit -m "autoupdate `date '+%F %T'`" && git push origin master && cd -

build:
	bundle exec jekyll build
