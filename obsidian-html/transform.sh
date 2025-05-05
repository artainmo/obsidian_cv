# Use 'sed - i' to make specific changes in 'index.md' if necessary.

# Allow the display of pdf
sed -i '' 's/!\[\[AWS Certified Cloud Practitioner certificate.pdf\]\]/<embed src="AWS%20Certified%20Cloud%20Practitioner%20certificate.pdf" type="application\/pdf">/g' index.md
sed -i '' 's/!\[\[AWS Certified Cloud Practitioner.pdf\]\]/<embed src="AWS%20Certified%20Cloud%20Practitioner.pdf" type="application\/pdf">/g' index.md
sed -i '' 's/!\[\[AWS Certified Machine Learning - Specialty certificate.pdf\]\]/<embed src="AWS%20Certified%20Machine%20Learning%20-%20Specialty%20certificate.pdf" type="application\/pdf">/g' index.md
sed -i '' 's/!\[\[AWS Certified Machine Learning - Specialty.pdf\]\]/<embed src="AWS%20Certified%20Machine%20Learning%20-%20Specialty.pdf" type="application\/pdf">/g' index.md
sed -i '' 's/!\[\[Coursera 4V4FNOHS1GBM.pdf\]\]/<embed src="Coursera%204V4FNOHS1GBM.pdf" type="application\/pdf">/g' index.md
sed -i '' 's/!\[\[Certificate_NSL_Recognised.pdf\]\]/<embed src="Certificate_NSL_Recognised.pdf" type="application\/pdf">/g' index.md
