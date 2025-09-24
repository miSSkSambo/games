<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Tic-Tac-Toe</title>
  <style>
    :root { --gap: 10px; --size: 110px; font-family: system-ui, Arial, sans-serif; }
    @media (max-width: 480px) {
      :root { --size: 90px; --gap: 8px; }
    }
    @media (max-width: 360px) {
      :root { --size: 80px; --gap: 6px; }
    }

    * { box-sizing: border-box; }
    body { display: grid; place-items: center; min-height: 100vh; margin: 0; background: #0b1020; color: #e6e6e6; }
    main { width: min(520px, 92vw); }
    h1 { margin: 12px 0 10px; font-weight: 800; letter-spacing: .3px; text-align: center; }

    .toolbar {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 8px;
      margin-bottom: 10px;
    }
    .toolbar select, .toolbar button {
      width: 100%;
      padding: 10px 12px;
      border: 0;
      border-radius: 12px;
      background: #111a2e;
      color: #e6e6e6;
      font-weight: 600;
      cursor: pointer;
    }
    .toolbar select { appearance: none; }
    .toolbar button.primary { background: #ffcb2f; color: #0b1020; }

    .board {
      display: grid;
      grid-template-columns: repeat(3, var(--size));
      grid-template-rows: repeat(3, var(--size));
      gap: var(--gap);
      justify-content: center;
      touch-action: manipulation;
      margin: 4px auto 10px;
    }
    .cell {
      display: grid;
      place-items: center;
      font-size: 52px;
      font-weight: 900;
      background: #0f1724;
      border: 0;
      border-radius: 18px;
      cursor: pointer;
      user-select: none;
      line-height: 1;
      box-shadow: 0 10px 30px rgba(0,0,0,.20);
      transition: transform .06s ease, box-shadow .2s ease;
      -webkit-tap-highlight-color: transparent;
    }
    .cell:active { transform: scale(.98); }
    .cell.x { color: #ff4d4d; }   /* Red for X */
    .cell.o { color: #4da6ff; }   /* Blue for O */

    /* Winner glow (color depends on winner) */
    .cell.win-x { animation: glowX 1s infinite alternate; }
    .cell.win-o { animation: glowO 1s infinite alternate; }
    @keyframes glowX {
      from { box-shadow: 0 0 10px 2px rgba(255,77,77,.9); }
      to   { box-shadow: 0 0 22px 8px rgba(255,77,77,.8); }
    }
    @keyframes glowO {
      from { box-shadow: 0 0 10px 2px rgba(77,166,255,.9); }
      to   { box-shadow: 0 0 22px 8px rgba(77,166,255,.8); }
    }

    .panel { margin-top: 8px; display: grid; grid-template-columns: 1fr auto auto; gap: 8px; align-items: center; }
    .status { font-weight: 700; }
    .btn { padding: 10px 14px; border: 0; border-radius: 12px; background: #182238; color: #e6e6e6; font-weight: 700; cursor: pointer; }
    .btn.yellow { background: #ffcb2f; color: #0b1020; }

    .scoreboard, .series {
      margin-top: 12px;
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 8px;
      text-align: center;
    }
    .card {
      background: #0f1724;
      border-radius: 14px;
      padding: 10px;
      box-shadow: 0 6px 20px rgba(0,0,0,.18);
    }
    .card h3 { margin: 0 0 4px; font-size: 14px; opacity: .9; font-weight: 700; }
    .big { font-size: 22px; font-weight: 900; }

    .history {
      margin-top: 12px;
      background: #0f1724;
      border-radius: 14px;
      padding: 10px;
      box-shadow: 0 6px 20px rgba(0,0,0,.18);
    }
    .history h3 { margin: 0 0 6px; font-size: 14px; opacity: .9; }
    .moves { margin: 0; padding-left: 18px; max-height: 140px; overflow: auto; }
    .moves li { margin: 2px 0; font-size: 13px; }

    .hint { margin-top: 8px; font-size: 12px; opacity: .8; text-align: center; }
  </style>
</head>
<body>
  <main>
    <h1>Tic-Tac-Toe</h1>

    <div class="toolbar">
      <select id="mode">
        <option value="pvp">Two Players</option>
        <option value="ai" selected>Vs AI (minimax)</option>
      </select>
      <select id="starter">
        <option value="X" selected>Start: X</option>
        <option value="O">Start: O</option>
      </select>
      <button id="newRound" class="primary">New Round</button>
      <button id="resetSeries">Reset Series</button>
    </div>

    <div class="board" id="board" aria-label="Tic-Tac-Toe board"></div>

    <div class="panel">
      <div class="status" id="status">Player X’s turn</div>
      <button class="btn" id="undo">Undo</button>
      <button class="btn yellow" id="reset">Reset</button>
    </div>

    <div class="scoreboard">
      <div class="card"><h3>X Wins</h3><div class="big" id="xWins">0</div></div>
      <div class="card"><h3>Draws</h3><div class="big" id="draws">0</div></div>
      <div class="card"><h3>O Wins</h3><div class="big" id="oWins">0</div></div>
    </div>

    <div class="series">
      <div class="card"><h3>Series (Best-of-3)</h3><div>First to 2 wins</div></div>
      <div class="card"><h3>X Series</h3><div class="big" id="xSeries">0</div></div>
      <div class="card"><h3>O Series</h3><div class="big" id="oSeries">0</div></div>
    </div>

    <div class="history">
      <h3>Move History</h3>
      <ol class="moves" id="moves"></ol>
    </div>

    <div class="hint">Tip: In Vs AI mode, the AI plays as <b>O</b>.</div>
  </main>

  <script>
    // Elements
    const boardEl = document.getElementById('board');
    const statusEl = document.getElementById('status');
    const resetBtn = document.getElementById('reset');
    const undoBtn = document.getElementById('undo');
    const movesEl = document.getElementById('moves');
    const modeSel = document.getElementById('mode');
    const starterSel = document.getElementById('starter');
    const newRoundBtn = document.getElementById('newRound');
    const resetSeriesBtn = document.getElementById('resetSeries');

    const xWinsEl = document.getElementById('xWins');
    const oWinsEl = document.getElementById('oWins');
    const drawsEl = document.getElementById('draws');
    const xSeriesEl = document.getElementById('xSeries');
    const oSeriesEl = document.getElementById('oSeries');

    // State
    let board, current, gameOver, winningCombo, winnerSymbol;
    let history;
    let totals = { X: 0, O: 0, D: 0 };
    let series = { X: 0, O: 0 }; // best-of-3

    const wins = [
      [0,1,2],[3,4,5],[6,7,8], // rows
      [0,3,6],[1,4,7],[2,5,8], // cols
      [0,4,8],[2,4,6]          // diagonals
    ];

    const AI = 'O'; // AI always plays O in Vs AI mode

    function initRound() {
      board = Array(9).fill(null);
      history = [];
      winningCombo = [];
      winnerSymbol = null;
      gameOver = false;
      current = starterSel.value; // X or O
      render();
      // If AI starts, let it move
      if (modeSel.value === 'ai' && current === AI) {
        aiMove();
      } else {
        updateStatus();
      }
    }

    function render() {
      boardEl.innerHTML = '';
      board.forEach((val, idx) => {
        const btn = document.createElement('button');
        btn.className = 'cell';
        if (val === 'X') btn.classList.add('x');
        if (val === 'O') btn.classList.add('o');
        if (winningCombo.includes(idx)) {
          btn.classList.add(winnerSymbol === 'X' ? 'win-x' : 'win-o');
        }
        btn.textContent = val ? val : '';
        btn.disabled = !!val || gameOver;
        btn.setAttribute('aria-label', `Cell ${idx+1}`);
        btn.addEventListener('click', () => handleMove(idx));
        boardEl.appendChild(btn);
      });
      renderHistory();
      updateScoreboard();
    }

    function handleMove(i) {
      if (board[i] || gameOver) return;
      board[i] = current;
      history.push({ index: i, player: current });
      const winner = getWinner(board);
      if (winner) {
        gameOver = true;
        winnerSymbol = winner.symbol;
        winningCombo = winner.combo;
        finishGame(winnerSymbol);
      } else if (board.every(x => x)) {
        gameOver = true;
        finishGame('D'); // draw
      } else {
        current = current === 'X' ? 'O' : 'X';
        updateStatus();
        render(); // re-render to disable the clicked cell
        // AI move if applicable
        if (!gameOver && modeSel.value === 'ai' && current === AI) {
          // small delay for UX
          setTimeout(aiMove, 150);
        }
      }
    }

    function aiMove() {
      const i = bestMove(board, AI);
      if (i == null) return; // should not happen
      board[i] = AI;
      history.push({ index: i, player: AI });
      const winner = getWinner(board);
      if (winner) {
        gameOver = true;
        winnerSymbol = winner.symbol;
        winningCombo = winner.combo;
        finishGame(winnerSymbol);
      } else if (board.every(x => x)) {
        gameOver = true;
        finishGame('D');
      } else {
        current = 'X';
        updateStatus();
        render();
      }
    }

    function getWinner(b) {
      for (const combo of wins) {
        const [a,b1,c] = combo;
        if (b[a] && b[a] === b[b1] && b[a] === b[c]) {
          return { symbol: b[a], combo };
        }
      }
      return null;
    }

    function updateStatus() {
      if (gameOver) return;
      statusEl.textContent = `Player ${current}'s turn`;
    }

    function finishGame(result) {
      if (result === 'D') {
        totals.D++;
        drawsEl.textContent = String(totals.D);
        statusEl.textContent = "It's a draw!";
      } else {
        totals[result]++;
        if (result === 'X') xWinsEl.textContent = String(totals.X);
        if (result === 'O') oWinsEl.textContent = String(totals.O);
        statusEl.textContent = `Player ${result} wins!`;
        series[result]++;
        xSeriesEl.textContent = String(series.X);
        oSeriesEl.textContent = String(series.O);
        // Best-of-3 check
        if (series[result] >= 2) {
          setTimeout(() => {
            alert(`Series over — ${result} wins the best-of-3!`);
          }, 10);
          // Auto reset series after announcement? Keep for manual reset.
        }
      }
      render(); // to apply glow
    }

    function renderHistory() {
      movesEl.innerHTML = '';
      history.forEach((m, idx) => {
        const li = document.createElement('li');
        const r = Math.floor(m.index / 3) + 1;
        const c = (m.index % 3) + 1;
        li.textContent = `${idx + 1}. ${m.player} → (${r}, ${c})`;
        movesEl.appendChild(li);
      });
    }

    // Undo last move (one ply)
    function undo() {
      if (history.length === 0) return;
      const last = history.pop();
      board[last.index] = null;
      // If we had a finished game, clear finish state
      winningCombo = [];
      winnerSymbol = null;
      gameOver = false;
      // Set turn back to the player who made the undone move
      current = last.player;
      updateStatus();
      render();
    }

    // --- Minimax AI ---
    function bestMove(b, aiSymbol) {
      // Return the index of the optimal move for aiSymbol
      let bestScore = -Infinity;
      let move = null;
      for (let i = 0; i < 9; i++) {
        if (!b[i]) {
          b[i] = aiSymbol;
          const score = minimax(b, 0, false, aiSymbol);
          b[i] = null;
          if (score > bestScore) {
            bestScore = score;
            move = i;
          }
        }
      }
      return move;
    }

    function minimax(b, depth, isMax, aiSymbol) {
      const human = aiSymbol === 'X' ? 'O' : 'X';
      const winner = getWinner(b);
      if (winner) {
        if (winner.symbol === aiSymbol) return 10 - depth;
        if (winner.symbol === human)   return depth - 10;
      }
      if (b.every(x => x)) return 0; // draw

      if (isMax) {
        let best = -Infinity;
        for (let i = 0; i < 9; i++) {
          if (!b[i]) {
            b[i] = aiSymbol;
            best = Math.max(best, minimax(b, depth + 1, false, aiSymbol));
            b[i] = null;
          }
        }
        return best;
      } else {
        let best = Infinity;
        for (let i = 0; i < 9; i++) {
          if (!b[i]) {
            b[i] = human;
            best = Math.min(best, minimax(b, depth + 1, true, aiSymbol));
            b[i] = null;
          }
        }
        return best;
      }
    }

    // Events
    resetBtn.addEventListener('click', () => initRound());
    newRoundBtn.addEventListener('click', () => initRound());
    modeSel.addEventListener('change', () => initRound());
    starterSel.addEventListener('change', () => initRound());
    undoBtn.addEventListener('click', () => {
      // If last move was AI in ai mode, pressing Undo twice brings it back to player's turn
      undo();
    });
    resetSeriesBtn.addEventListener('click', () => {
      series = { X: 0, O: 0 };
      xSeriesEl.textContent = '0';
      oSeriesEl.textContent = '0';
      totals = { X: 0, O: 0, D: 0 };
      xWinsEl.textContent = '0';
      oWinsEl.textContent = '0';
      drawsEl.textContent = '0';
      initRound();
    });

    // Start
    initRound();
  </script>
</body>
</html>
