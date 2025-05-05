# Use 'sed - i' to make specific changes in 'index.md' if necessary.

# Allow the display of pdf
sed -i '' 's/<img src="AWS%20Certified%20Cloud%20Practitioner%20certificate.pdf" alt="">/<embed src="AWS%20Certified%20Cloud%20Practitioner%20certificate.pdf" type="application\/pdf" width="100%" height="600px">/g' /output/md/index.md
sed -i '' 's/<img src="AWS%20Certified%20Cloud%20Practitioner.pdf" alt="">/<embed src="AWS%20Certified%20Cloud%20Practitioner.pdf" type="application\/pdf" width="100%" height="600px">/g' index.md
sed -i '' 's/<img src="AWS%20Certified%20Machine%20Learning%20-%20Specialty%20certificate.pdf" alt="">/<embed src="AWS%20Certified%20Machine%20Learning%20-%20Specialty%20certificate.pdf" type="application\/pdf" width="100%" height="600px">/g' /output/md/index.md
sed -i '' 's/<img src="AWS%20Certified%20Machine%20Learning%20-%20Specialty.pdf" alt="">/<embed src="AWS%20Certified%20Machine%20Learning%20-%20Specialty.pdf" type="application\/pdf" width="100%" height="600px">/g' /output/md/index.md
sed -i '' 's/<img src="Coursera%204V4FNOHS1GBM.pdf" alt="">/<embed src="Coursera%204V4FNOHS1GBM.pdf" type="application\/pdf" width="100%" height="600px">/g' /output/md/index.md
sed -i '' 's/<img src="Certificate_NSL_Recognised.pdf" alt="">/<embed src="Certificate_NSL_Recognised.pdf" type="application\/pdf" width="100%" height="600px">/g' /output/md/index.md
