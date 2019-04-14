<board>
	<style type="text/css">
		.cardContainer{
			min-width: 300px;
			width:300px;
			background-color: #fefefe; 
			margin-right:15px;
		}

		#cards{
			  display:flex;
			  flex-direction: column;
			  padding-top:10px;
			  padding-bottom:10px;
			  background-color:#ededed;
			  padding-left:5px;
			  padding-right:5px;
			  box-shadow: inset 0px 2px 2px -2px #888, inset 0px 0 0px 0px #CCC;
		}

		.unselectable {
			-webkit-user-select: none; /* Safari */        
			-moz-user-select: none; /* Firefox */
			-ms-user-select: none; /* IE10+/Edge */
			user-select: none; /* Standard */
		}

		.addCardButton{
			width:100%;
			padding-top:25px;
			padding-bottom:25px;
			text-align: center;
			background-color: #dedede;
			color:green;
		}

		.boardTitle:focus{
			border-bottom: 2px dotted green;
		}

		.boardTitle{
			font-size: 2em;
			background-color:#dedede;
			padding-top:10px;
			padding-bottom:10px;
		}

		[contenteditable=true]:empty:before {
		  content: attr(placeholder);
		  display: block;  
		}

		.cardText{
			flex: 1;
			line-height: 30px;
			width:25%;
			padding-right:20px;
		}

		.cardText:focus{
		    line-height: 30px;
		}
		.rowContainer{
			display: flex;
			flex-direction: row;
			margin-bottom:5px;
			background-color: #fdfdfd; 
			box-shadow: 0px 2px 2px #888;
			padding:5px;
		}

		.handle {
			flex: 0.15;
		}

		.handle:after {
			  content: '\2807';
			  font-size: 35px;
		 }
		 
		 .menuToggle {
		 	flex: 0.25;
		 	
		 }

		  .menuToggle:after {
		  	content: '\2809';
		  font-size: 35px;
		  }
	</style>
	<div class="cardContainer">
		<div class="unselectable boardTitle" contenteditable="true" placeholder="Enter title here">{this.boardTitle}</div>
		<div id="cards" class={"cards " + this.opts.classNameForCards}>
			<div each={item in items} class="rowContainer">
				<div class="handle"></div>
				<div class="cardText" contenteditable="true" placeholder="Enter text here">{item || ''}</div>
				<div class="menuToggle" tabindex="0"></div>
			</div>
		</div>
		<div class="addCardButton unselectable" onclick={() => this.addCard()} tabindex="0">
			Add Card
		</div>
	</div>

	<script type="text/javascript">
		this.items = opts.items || [];
		this.boardTitle = opts.boardTitle || '';
		this.addCard = () => {
			this.items.push("");
			this.update();
		};

		$( function() {
			var boardTags = window.boardTags.map(item => "."+item);
			$(".cards").each (function() 
				{
					var boardElement = $(this);
					boardElement.sortable({
					 	 cursor: "move",
						 delay: 150,
						 distance: 5,
						 handle: ".handle",
						 connectWith: boardTags,
					}); 
			});				
		});

	</script>
</board>