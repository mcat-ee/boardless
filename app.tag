<app>
  
  <router>
    <route path="first">
      <div id="boardContainer">
        <!-- <board></board> -->
        <div id="boardHolder"></div>
        <div > 
            <div class="addBoardButton" onclick="addBoard()">
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
    <a href="#first">Boards</a>
    <a href="#second">Second</a>
  </nav>
  
  <script>
    window.boardTags = [];
    this.on('mount', function() {
      route('first');
    });

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
    }
    nav > a {
      display: inline-block;
      padding: 0 .8em;
    }
    nav > a:not(:first-child) {
      border-left: 1px solid #eee;
    }
    
    div {
      margin-top: 10px;
    }

    .addBoardButton{
      font-size: 2em;
      padding-top:10px;
      padding-bottom:10px;
      width:200px;
      background-color: #ccc;
    }
  </style>
</app>
