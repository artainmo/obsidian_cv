build: # Retrieve the note from obsidian 
	tail -n +2 Obsidian/Obsidian/curriculum-vitae,\ web.md >> obsidian-html/index.md # When appending omit the first line of tags
	cp -R Obsidian/Obsidian/.obsidian obsidian-html
	cd obsidian-html && python -m obsidianhtml convert -i config.yml
	cd obsidian-html && chmod +x transform.sh && ./transform.sh
	tail -n +5  obsidian-html/output/md/index.md >> index.md
	# Also add local images
	cp Obsidian/Obsidian/web\ et\ mobile.png . 
	cp Obsidian/Obsidian/applicative\ programming.png . 
	cp Obsidian/Obsidian/database\ architecture\ and\ data.png . 
	cp Obsidian/Obsidian/AWS\ Certified\ Cloud\ Practitioner\ certificate.pdf . 
	cp Obsidian/Obsidian/AWS\ Certified\ Cloud\ Practitioner.pdf . 
	cp Obsidian/Obsidian/AWS\ Certified\ Machine\ Learning\ -\ Specialty\ certificate.pdf .
	cp Obsidian/Obsidian/AWS\ Certified\ Machine\ Learning\ -\ Specialty.pdf .
	cp Obsidian/Obsidian/Coursera\ 4V4FNOHS1GBM.pdf .
	cp Obsidian/Obsidian/Screenshot\ 2025-05-05\ at\ 16.31.24.png .
	cp Obsidian/Obsidian/Certificate_NSL_Recognised.pdf .
	cp Obsidian/Obsidian/D45DE426-60F6-4FED-9EAC-4CFC3F061C67_1_201_a.jpeg .
	cp Obsidian/Obsidian/Capture\ d’écran\ 2019-05-16\ à\ 10.18.54.png .
	cp Obsidian/Obsidian/Birdhouse\ accelerator.png .

update: # update obsidian to have latest cv note
	git submodule update --remote # Git knows what to update thanks to the .gitmodules file
	git add .
	git commit -m "Automatically update submodule to latest versions"
	git push

.PHONY: build update
