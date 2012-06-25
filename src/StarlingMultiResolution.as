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
		const STAGE_WIDTH:uint = 320;
		const STAGE_HEIGHT:uint = 480;
		
		public function StarlingMultiResolution()
		{
			super();
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var screenWidth:int  = stage.fullScreenWidth;
			var screenHeight:int = stage.fullScreenHeight;
			
			var stage_aspect_ratio:Number = STAGE_HEIGHT / STAGE_WIDTH;
			var screen_aspect_ration:Number = screenHeight / screenWidth;
			var viewport:Rectangle = new Rectangle();
			
			trace(stage_aspect_ratio + " , " + screen_aspect_ration); 
			if(stage_aspect_ratio < screen_aspect_ration) {
				//ステージの縦横比に比べると縦長
				viewport.width = screenWidth;
				viewport.height = int( (screenWidth / STAGE_WIDTH) * STAGE_HEIGHT );
			} else if(stage_aspect_ratio > screen_aspect_ration) {
				//ステージの縦横比に比べると横長
				viewport.height = screenHeight;
				viewport.width = int( (screenHeight / STAGE_HEIGHT) * STAGE_WIDTH );
			} else {
				//ステージの縦横比と同じ
				viewport.width = screenWidth;
				viewport.height = screenHeight;
			}
			
			trace(viewport.width + "," + viewport.height);
			viewport.x = int( (screenWidth - viewport.width) / 2);
			viewport.y = int( (screenHeight - viewport.height) / 2);
			
			var st:Starling = new Starling(MainSprite, stage, viewport);
			st.stage.stageWidth  = STAGE_WIDTH;
			st.stage.stageHeight = STAGE_HEIGHT;
			st.start();
		}
	}
}