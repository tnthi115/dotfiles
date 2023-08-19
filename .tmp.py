# Description: Python script to test github copilot
# create a game with 2 players
# each player takes turns guessing a random number between 1 and 10
# the player who guesses the number closest to the random number wins
# input comes from the terminal
# output goes to the terminal

import random


# create a player class
class Player:
    def __init__(self, name: str):
        self.name = name
        self.guess

    def get_guess(self) -> None:
        self.guess = int(input("Enter a number: "))

    def __str__(self) -> str:
        return self.name


# create a game class
class Game:
    def __init__(self, player1: Player, player2: Player):
        self.player1 = player1
        self.player2 = player2
        self.random_number
        self.winner

    def get_random_number(self) -> None:
        self.random_number = random.randint(1, 10)

    def get_winner(self) -> None:
        if self.player1.guess == self.player2.guess:
            self.winner = "Tie"
        elif abs(self.player1.guess - self.random_number) < abs(
            self.player2.guess - self.random_number
        ):
            self.winner = self.player1.__str__()
        else:
            self.winner = self.player2.__str__()

    def __str__(self) -> str:
        return f"{self.winner} wins!"


# create game loop
def main() -> None:
    player1 = Player("Player 1")
    player2 = Player("Player 2")
    game = Game(player1, player2)

    game.get_random_number()

    player1.get_guess()
    player2.get_guess()

    game.get_winner()

    print(game)

    # ask if they want to play again
    play_again = input("Do you want to play again? (y/n): ")
    if play_again == "y":
        main()
    else:
        print("Thanks for playing!")


if __name__ == "__main__":
    main()
