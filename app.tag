<app>
  
  <router>
    <route path="first">
      <div id="boardContainer">
        <!-- <board></board> -->
        <div id="boardHolder"></div>
        <div > 
            <div class="unselectable addBoardButton" onclick="addBoard()" tabindex="0">
                  Add Board
            </div>
         </div>
      </div>
    </route>
    <route path="second">
      <div>
      LABELS
      </div>

    </route>
  </router>
<nav>
    <a href="#first" class="unselectable">Boards</a>
    <!-- <a href="#second">Second</a> -->
  </nav>
  
  <script>
    window.boardTags = [];
    this.on('mount', function() {
      route('first');

       makeRequest("GET", "/api/getBoards",null,(data) => { window.boards = data; createExistingBoards()},(err)=> {
          console.log("Nope :(");
        })
    });

    createExistingBoards = () => {
      if(window.boards) {
        console.log("Adding existing boards");
        for(var i = 0 ; i < boards.boards.length; i++) {
          var boardObject = boards.boards[i];

           var list = document.getElementById("boardHolder");
            var tag = document.createElement('board');
            var className = Math.random().toString(36).substring(7);
            boardTags.push(className);
            list.appendChild(tag)
            riot.mount(tag, { boardTitle: boardObject.boardTitle, items: boardObject.cards, classNameForCards: className});
        }
      } else {
                console.log("Can't add existing boards");
                if(boards) {
                  console.log("Wrong Identifier chief");
                }
      }
    }

    addBoard = () => {

      var list = document.getElementById("boardHolder");
        var tag = document.createElement('board');
        var className = Math.random().toString(36).substring(7);
        boardTags.push(className);
        list.appendChild(tag)
        riot.mount(tag, { classNameForCards: className});
    }
  </script>

  <style>
    #boardHolder{
      display:flex;
      flex-direction: row;
    }
    #boardContainer{
      display:flex;
      flex-direction: row;
      margin-bottom:25px;
    }
    :scope {
      display: block;
      font-family: sans-serif;
      margin: 0;
      padding: 1em;
      text-align: center;
      color: #666;
    }
    nav {
      display: block;
      border-top: 1px solid #666;
      padding: 0 0 1em;
      padding-top:10px;
    }
    nav > a {
      display: inline-block;
      padding: 0 .8em;
    }
    nav > a:not(:first-child) {
      border-left: 1px solid #eee;
    }
    
    div {
    }

    .addBoardButton{
      font-size: 2em;
      padding-top:10px;
      padding-bottom:10px;
      width:200px;
      background-color: #ccc;
    }

    .unselectable {
      -webkit-user-select: none; /* Safari */        
      -moz-user-select: none; /* Firefox */
      -ms-user-select: none; /* IE10+/Edge */
      user-select: none; /* Standard */
    }

  </style>
</app>
