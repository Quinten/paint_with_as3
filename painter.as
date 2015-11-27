package {
    import flash.display.Sprite;
    import flash.display.LineScaleMode;
    import flash.display.CapsStyle;
    import flash.display.JointStyle;
    import flash.display.Shape;
		import flash.events.MouseEvent;
		import flash.events.Event;

    public class painter extends Sprite {
		
		public var mouseIsDown:Boolean = false;		
		public var painting:Shape = new Shape();
		
    public function painter() {
			painting.graphics.lineStyle(3, 0x000000, 1, false, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.ROUND, 3);
			this.addChild(painting);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDOWN);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUP);
			this.addEventListener(Event.ENTER_FRAME, animationLoop);
		}
		
		private function onMouseDOWN(e:MouseEvent):void
		{
			mouseIsDown = true;
			painting.graphics.moveTo(stage.mouseX, stage.mouseY);
		}
		
		private function onMouseUP(e:MouseEvent):void
		{
			mouseIsDown = false;
		}
		
		private function animationLoop(e:Event):void
		{
			if(mouseIsDown){
				painting.graphics.lineTo(stage.mouseX, stage.mouseY);
			}
		}
}
}