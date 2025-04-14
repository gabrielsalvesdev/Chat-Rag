import os
import PyPDF2

def extract_text_from_pdfs(pdf_folder):
    text_data = {}
    for filename in os.listdir(pdf_folder):
        if filename.endswith('.pdf'):
            with open(os.path.join(pdf_folder, filename), 'rb') as file:
                reader = PyPDF2.PdfReader(file)
                text = ''
                for page in reader.pages:
                    text += page.extract_text() + '\n'
                text_data[filename] = clean_text(text)
    return text_data

def clean_text(text):
    # Implement text cleaning logic here (e.g., remove special characters, extra spaces)
    return text.replace('\n', ' ').strip()

# Example usage
# pdf_folder = 'path_to_your_pdf_folder'
# extracted_text = extract_text_from_pdfs(pdf_folder)
# print(extracted_text)
