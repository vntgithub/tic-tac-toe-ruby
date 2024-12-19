# Tic Tac Toe in Ruby

## Introduction
This is a simple implementation of the classic Tic Tac Toe game written in Ruby. The project is designed to help understand the basics of Ruby programming, including working with arrays, loops, conditionals, and user input.

## Features
- A 3x3 grid for the game board.
- Two-player gameplay (Player X and Player O).
- Input validation to ensure valid moves.
- Display of the game board after every move.
- Detection of win conditions and a tie.

## Requirements
- Ruby 2.7 or higher.

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/vntgithub/tic-tac-toe-ruby
   cd tic-tac-toeruby
   ```
2. Ensure Ruby is installed on your system:
   ```bash
   ruby --version
   ```

## How to Play
1. Run the game:
   ```bash
   ruby main.rb
   ```
2. Players take turns entering their moves by specifying the row and column numbers (e.g., `1 2` for row 1, column 2).
3. The game ends when:
   - A player gets three of their marks (X or O) in a row, column, or diagonal.
   - All cells are filled without a winner (tie).

## File Structure
```
project/
├── lib/
│   ├── board.rb        # The board logic
│   ├── player.rb       # Handles player information
│   └── tic_tac_toe.rb  # The main game logic
├── spec/
│   ├── board_spec.rb   # Tests for the board logic
│   └── spec_helper.rb  # RSpec configuration
├── .rspec              # RSpec configuration file
├── Gemfile             # Dependencies for the project
├── Gemfile.lock        # Locked dependencies for the project
├── main.rb             # File to run the game
├── README.md           # Project documentation
```

## Example Gameplay
```
Welcome to Tic Tac Toe!

 X |   |   
---------
   | O |   
---------
   |   | X

Player's name (X) wins!
```

## Running Tests
1. Install the testing framework (RSpec or Minitest):
   ```bash
   gem install rspec
   ```
2. Run the tests:
   ```bash
   rspec spec/tic_tac_toe_spec.rb
   ```

## Contributing
1. Fork the repository.
2. Create a feature branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Description of changes"
   ```
4. Push to the branch:
   ```bash
   git push origin feature-name
   ```
5. Open a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

