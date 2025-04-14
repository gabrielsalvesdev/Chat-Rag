import streamlit as st
from search import search

def main():
    st.title("Interface de Chat para Busca de Artigos")
    
    query = st.text_input("Digite sua consulta:")
    
    if st.button("Buscar"):
        if query:
            results = search(query, "embeddings.index", "embeddings.json")
            st.write("Resultados da Busca:")
            for filename, distance in results:
                st.write(f"Artigo: {filename}, Distância: {distance}")
        else:
            st.warning("Por favor, insira uma consulta.")

if __name__ == "__main__":
    main()
