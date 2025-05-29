# obsidian_cv
Personal project. Git repository synchronized with obsidian submodule to take up-to-date curriculum vitae note and display it as a website using Jekyll, [obsidian-html](https://obsidian-html.github.io/) and custom transformations.

## Make changes
Change the website's content via the associated obsidian note.

Make custom changes on the website in the case the transformation from markdown to HTML went wrong via 'obsidian-html/transform.sh'.

Add pictures from obsidian to the website via the 'makefile'. 

## Custom domain
I used [this tutorial](https://www.youtube.com/watch?v=e5AwNU3Y2es).

I registered a custom domain at '[hello.cv](https://www.hello.cv/)'.<br>
On 'hello.cv' I added one DNS record type A for 'tainmontarthur.cv' at '185.199.108.153' with auto TLS.<br>
I added another DNS record type A for 'www.tainmontarthur.cv' at 'tainmontarthur.cv' with auto TLS.<br>
I changed the 'url' and 'baseulr' in '_config.yml'.<br>
Inside the site deployment github action, I added a step to create the CNAME file containing the custom domain; for the site to automatically launch itself on the custom domain.<br>
I went on github pages settings of this repository, verified everything is working, and enforced HTTPS.<br>
