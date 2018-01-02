class PagesController < ApplicationController
  def home
    @rooms = Room.order("RANDOM()").limit(3)
    # Cherche dans la table Room 3 donnees aleatoire
  end

  def search
    if params[:search].present? && params[:search].strip != ''
      session[:airbnb_search] = params[:search]
      # Valide que l'on demarre une recherche avec un lieu
    end

    arrResult = []
    # Tableau de resultat

    if session[:airbnb_search] && session[:airbnb_search] != ''
      @rooms_address = Room.where(active: true).near(session[:airbnb_search], 5, order: 'distance')
    # affiche logement plus proche s'il y a une recherche et un lieu, affiche annonces actives par distances.
    # Si active: = false (pas d'adresse) pas d'affichage de lieu
    # !!! -> Nbr de logement a afficher >= nbr de logement creer sinon !Unsupported argument type: 0 (Fixnum)!
    else
      @rooms_address = Room.where(active: true).all
      # sinon affiche toutes les annonces
    end

    @search = @rooms_address.ransack(params[:q])
    # @search = pour @rooms.adress utilise la gem ransack
    # [:q] = Fonction de ransack pour qu'il recherche dans le formulaire de recherche
    @rooms = @search.result
    # @rooms = resultat de la recherche

    @arrRooms = @rooms.to_a
    # @rooms convertit en array

    if params[:start_date] && params[:end_date] && !params[:start_date].empty? & !params[:end_date].empty?
      # !x = negation de x
      # .empty? = vide?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      # .parse = convertie au format date (DD/MM/YYYY)

      @rooms.each do |room|
        not_available = room.reservations.where("(? <= start_date AND start_date <= ?) OR
        (? <= end_date AND end_date <= ?) OR (start_date < ? AND ? < end_date)", start_date, end_date,
                                                start_date, end_date, start_date, end_date).limit(1)
        # Test la disponibilite d'un logment
        @arrRooms.delete(room) unless not_available.empty?
        # supprime du tableau les annonces d'on les dates ne sont pas disponibles
      end
    end
  end
end
