package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	
	import jp.co.piisu.sample.starling.multi_resolution.MainSprite;
	
	import starling.core.Starling;
	
	public class StarlingMultiResolution extends Sprite
	{
		public function StarlingMultiResolution()
		{
			super();
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var screenWidth:int  = stage.fullScreenWidth;
			var screenHeight:int = stage.fullScreenHeight;
			
			var st:Starling = new Starling(MainSprite, stage, new Rectangle(0, 0, screenWidth, screenHeight) );
			st.stage.stageWidth  = 320;
			st.stage.stageHeight = 480;
			st.start();
		}
	}
}