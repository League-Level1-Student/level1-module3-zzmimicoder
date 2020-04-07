package _06_gridworld;

import java.awt.Color;
import java.util.Random;
import info.gridworld.actor.Bug;
import info.gridworld.actor.Flower;
import info.gridworld.grid.Location;
import info.gridworld.world.World;

public class GridWorldRunner {
	public static void main(String[] args) {
		World world = new World();
		Bug bug = new Bug();
		Color bugColor = new Color(0, 0, 255);
		int bugX = new Random().nextInt(10);
		int bugY = new Random().nextInt(10);
		Location bugLocation = new Location(bugX, bugY);
		bug.setColor(bugColor);
		Location flowerLocation;
		Flower flower;
		for (int flowerX = 0; flowerX < 10; flowerX++) {
			for (int flowerY = 0; flowerY < 10; flowerY++) {
				if (!(flowerX == bugX && flowerY == bugY)) {
					flowerLocation = new Location(flowerX, flowerY);
					flower = new Flower();
					world.add(flowerLocation, flower);
				}
			}
		}
		world.add(bugLocation, bug);
		world.show();
	}
}
