import faiss
import numpy as np
import json
from sentence_transformers import SentenceTransformer

def search(query, index_file, embeddings_file, top_k=5):
    # Load the embeddings and index
    with open(embeddings_file, 'r') as f:
        embeddings = json.load(f)

    index = faiss.read_index(index_file)
    model = SentenceTransformer('paraphrase-MiniLM-L6-v2')

    # Generate embedding for the query
    query_embedding = model.encode([query]).astype('float32')

    # Search the index
    distances, indices = index.search(query_embedding, top_k)

    # Retrieve the filenames of the top_k results
    results = []
    for i in range(top_k):
        filename = list(embeddings.keys())[indices[0][i]]
        results.append((filename, distances[0][i]))

    return results

# Example usage
# results = search("Your query here", "embeddings.index", "embeddings.json")
# print(results)
