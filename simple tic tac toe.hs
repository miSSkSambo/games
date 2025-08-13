<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Tic-Tac-Toe</title>
  <style>
    :root { --gap: 10px; --size: 100px; font-family: system-ui, Arial, sans-serif; }
    body { display: grid; place-items: center; min-height: 100vh; margin: 0; background: #0b1020; color: #e6e6e6; }
    h1 { margin: 0 0 16px; font-weight: 700; }
    .board { display: grid; grid-template-columns: repeat(3, var(--size)); grid-template-rows: repeat(3, var(--size)); gap: var(--gap); }
    .cell { display: grid; place-items: center; font-size: 48px; font-weight: 800; background: #0f1724; border-radius: 16px; cursor: pointer; user-select: none; box-shadow: 0 10px 30px rgba(0,0,0,.2); transition: 0.3s; }
    .cell.x { color: #ff4d4d; }   /* Red for X */
    .cell.o { color: #4da6ff; }   /* Blue for O */
    .cell.win { animation: glow 1s infinite alternate; }
    @keyframes glow {
      0% { box-shadow: 0 0 10px 2px #ffcb2f; }
      100% { box-shadow: 0 0 20px 5px #ffcb2f; }
    }
    .cell:disabled { opacity: .6; cursor: not-allowed; }
    .panel { margin-top: 16px; display: flex; gap: 12px; align-items: center; }
    button.reset { padding: 10px 16px; border: 0; border-radius: 10px; background: #ffcb2f; font-weight: 700; cursor: pointer; }
    .status { min-width: 260px; font-weight: 600; }
  </style>
</head>
<body>
  <main>
    <h1>Tic-Tac-Toe</h1>
    <div class="board" id="board" aria-label="Tic-Tac-Toe board"></div>
    <div class="panel">
      <div class="status" id="status">Player X's turn</div>
      <button class="reset" id="reset">Reset</button>
    </div>
  </main>

  <script>
    const boardEl = document.getElementById('board');
    const statusEl = document.getElementById('status');
    const resetBtn = document.getElementById('reset');

    let board = Array(9).fill(null);
    let current = 'X';
    let gameOver = false;
    let winningCombo = [];

    const wins = [
      [0,1,2],[3,4,5],[6,7,8], // rows
      [0,3,6],[1,4,7],[2,5,8], // cols
      [0,4,8],[2,4,6]          // diagonals
    ];

    function render() {
      boardEl.innerHTML = '';
      board.forEach((val, idx) => {
        const btn = document.createElement('button');
        btn.className = 'cell';
        if (val === 'X') btn.classList.add('x');
        if (val === 'O') btn.classList.add('o');
        if (winningCombo.includes(idx)) btn.classList.add('win');
        btn.textContent = val ? val : '';
        btn.disabled = !!val || gameOver;
        btn.setAttribute('aria-label', `Cell ${idx+1}`);
        btn.addEventListener('click', () => handleMove(idx));
        boardEl.appendChild(btn);
      });
    }

    function handleMove(i) {
      if (board[i] || gameOver) return;
      board[i] = current;
      const winner = getWinner();
      if (winner) {
        gameOver = true;
        winningCombo = winner.combo;
        statusEl.textContent = `Player ${winner.player} wins!`;
      } else if (board.every(x => x)) {
        gameOver = true;
        statusEl.textContent = "It's a draw!";
      } else {
        current = current === 'X' ? 'O' : 'X';
        statusEl.textContent = `Player ${current}'s turn`;
      }
      render();
    }

    function getWinner() {
      for (const [a,b,c] of wins) {
        if (board[a] && board[a] === board[b] && board[a] === board[c]) {
          return { player: board[a], combo: [a,b,c] };
        }
      }
      return null;
    }

    resetBtn.addEventListener('click', () => {
      board = Array(9).fill(null);
      current = 'X';
      gameOver = false;
      winningCombo = [];
      statusEl.textContent = "Player X's turn";
      render();
    });

    render();
  </script>
</body>
</html>
