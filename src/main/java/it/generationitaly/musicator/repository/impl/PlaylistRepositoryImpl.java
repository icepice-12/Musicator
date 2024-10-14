package it.generationitaly.musicator.repository.impl;

import java.util.List;

import it.generationitaly.musicator.entity.Brano;
import it.generationitaly.musicator.entity.Playlist;
import it.generationitaly.musicator.repository.PlaylistRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class PlaylistRepositoryImpl extends JpaRepositoryImpl<Playlist, Long> implements PlaylistRepository {

	public PlaylistRepositoryImpl() {
		super(Playlist.class);

	}

	@Override
	public List<Playlist> findByTitolo(String titolo) {
		List<Playlist> playlist = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Playlist> query = em.createQuery("FROM Playlist p WHERE p.titolo = :titolo", Playlist.class);
			query.setParameter("titolo", titolo);
			playlist = query.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return playlist;
	}



	@Override
	public List<Playlist> findByBrano(Brano brano) {
		List<Playlist> playlist = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Playlist> query = em.createQuery("FROM Playlist p INNER JOIN brano b WHERE b.titolo = :titolo", Playlist.class);
			query.setParameter("titolo", brano.getTitolo());
			playlist = query.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return playlist;
	}
}