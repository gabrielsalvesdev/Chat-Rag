from sentence_transformers import SentenceTransformer
import json

def create_embeddings(text_data):
    model = SentenceTransformer('paraphrase-MiniLM-L6-v2')
    embeddings = {}
    
    for filename, text in text_data.items():
        sentences = text.split('. ')  # Split text into sentences
        embeddings[filename] = model.encode(sentences).tolist()  # Generate embeddings
    
    # Save embeddings to a JSON file for future use
    with open('embeddings.json', 'w') as f:
        json.dump(embeddings, f)

# Example usage
# text_data = {'example.pdf': 'This is an example text.'}
# create_embeddings(text_data)
