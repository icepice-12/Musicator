package it.generationitaly.musicator.repository;

import java.util.List;

import it.generationitaly.musicator.entity.Album;

public interface AlbumRepository extends JpaRepository<Album, Long>{
	/*findByTitolo List
	findByArtista Album
	findByBrano List
	findByGenere List */
	List<Album> findByTitolo(String titolo);
	Album findByArtista(String pseudonimo);
	List<Album> findByBrano(String titolo);
	List<Album> findByGenere(String nome);
}