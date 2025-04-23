# obsidian_cv
Personal project. Git repository synchronized with obsidian submodule to take up-to-date curriculum vitae note and display it as a website using Jekyll, [obsidian-html](https://obsidian-html.github.io/) and custom transformations.

## Make changes
Change the website's content via the associated obsidian note.

Make custom changes on the website in the case the transformation from markdown to HTML went wrong via 'obsidian-html/transform.sh'.

Add pictures from obsidian to the website via the 'makefile'. 

## Custom domain
I registered a custom domain at '[hello.cv](https://www.hello.cv/)'.<br>
On 'hello.cv' I added one DNS record type A for 'tainmontarthur.cv' at '185.199.108.153' with auto TLS.<br>
I added another DNS record type A for 'www.tainmontarthur.cv' at 'tainmontarthur.cv' with auto TLS.<br>
I went on github pages settings of this repository, added the custom domain, and enforced HTTPS.<br>
Lastly, I changed the 'url' and 'baseulr' in '_config.yml'.
