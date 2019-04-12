<app>
  
  <router>
    <route path="first">
      <div id="boardContainer">
        <!-- <board></board> -->
        <div id="boardHolder"></div>
        <div onclick="addBoard()">Add Board</div>
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
    this.on('mount', function() {
      route('first');
    });

    addBoard = () => {
      var list = document.getElementById("boardHolder");
        var tag = document.createElement('board');
        list.appendChild(tag)
        riot.mount(tag, '');
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
  </style>
</app>
