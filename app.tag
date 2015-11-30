<hello-world>
	<p>{ opts.greeting } <trim value="Casamia" length="4" /></p>
	<button onclick="{ tags.trim.startAnimation }">Start</button>
	<button onclick="{ tags.trim.stopAnimation }">Stop</button>
	<input name="whatInput" type="text" value=" { what }" onkeyup="{ whatChange }">
	<script>
		var self = this;
		this.what = "sebastian"
		this.whatChange = function(e){
			this.what = self.whatInput.value;
		}
	</script>
	
</hello-world>	

<trim>
	<span>
		{ opts.value.substr(0, opts.length) }
	</span>
	<script>
		var self = this,
			interval,
			count = 0;
			
		this.length = opts.length;
		//methods
		this.on('update', function(){
			// contruction + execute + html + update
			console.log('update');
		});
		
		this.on('mount', function(){
			// contruction + execute + html + update
			console.log('mount');
			// self.startAnimation();
		});
		
		this.on('unmount', function(){
			// contruction + execute + html + update
			console.log('unmount');
			self.stopAnimation();
		});
		
		// this.one('event', function(){
			
		// })
		
		// this.off('event', function(){
			
		// })
		
		// this.trigger('event', function(){
			
		// })
		
		this.startAnimation = function(){
		interval = setInterval(function(){
			self.length++;
			if (self.length > opts.value.length) {
				count++;
				if(count > 10) self.unmount();
				self.length = 0;
			}
			// update after each interval( like scope apply )
			self.update();
		}, 50);
		};
	
		this.stopAnimation = function(){
		clearInterval(interval);
		interval = null;
		}
	</script>
</trim>