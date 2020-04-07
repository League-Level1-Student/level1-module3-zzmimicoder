package _05_netflix;

public class NetflixRunner {
	public static void main(String[] args) {
		Movie movie1 = new Movie("Twilight poop", 1);
		Movie movie2 = new Movie("Pee", 11);
		Movie movie3 = new Movie("Poop", 9);
		Movie movie4 = new Movie("Diarrhea", 10);
		Movie movie5 = new Movie("Barf", 25);
		System.out.println(movie1.getTicketPrice());
		NetflixQueue queue = new NetflixQueue();
		queue.addMovie(movie1);
		queue.addMovie(movie2);
		queue.addMovie(movie3);
		queue.addMovie(movie4);
		queue.addMovie(movie5);
		queue.printMovies();
		queue.sortMoviesByRating();
		System.out.println("The best movie is... " + queue.getBestMovie());
		System.out.println("The second best movie is... " + queue.getMovie(1));
	}
}
