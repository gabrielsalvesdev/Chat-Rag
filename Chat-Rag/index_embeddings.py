import faiss
import numpy as np
import json

def index_embeddings(embeddings_file):
    with open(embeddings_file, 'r') as f:
        embeddings = json.load(f)

    # Flatten the embeddings and create a numpy array
    all_embeddings = []
    filenames = []
    
    for filename, emb in embeddings.items():
        all_embeddings.extend(emb)
        filenames.extend([filename] * len(emb))

    all_embeddings = np.array(all_embeddings).astype('float32')

    # Create a FAISS index
    index = faiss.IndexFlatL2(all_embeddings.shape[1])  # L2 distance
    index.add(all_embeddings)

    # Save the index to a file
    faiss.write_index(index, 'embeddings.index')

    return filenames

# Example usage
# filenames = index_embeddings('embeddings.json')
# print(filenames)
