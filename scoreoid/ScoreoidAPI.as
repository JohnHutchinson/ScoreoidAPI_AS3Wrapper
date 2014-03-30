package com.rubberduckygames.scoreoid
{
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;

	internal class ScoreoidAPI
	{
		private var apiKey:String;
		private var gameID:String;
		private var responseType:String;
		
		private var onResponseCallback:Function;
		
		private var urlRequest:URLRequest;
		private var urlLoader:URLLoader;
		
		/** prevents simultaneous API calls **/
		private var busy:Boolean;
		
		public function ScoreoidAPI(apiKey:String, gameID:String, responseType:String)
		{
			this.apiKey = apiKey;
			setGameID(gameID);
			setResponseType(responseType);
			
			urlRequest = new URLRequest();
			urlRequest.method = URLRequestMethod.POST;
			
			urlLoader = new URLLoader();
			urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
			
			busy = false;
		}
		
		public function get isBusy():Boolean
		{
			return busy;
		}
		
		public function setGameID(gameID:String):void
		{
			this.gameID = gameID;
		}
		
		public function setResponseType(responseType:String):void
		{
			this.responseType = responseType;
		}
		
		public function call(onResponseCallback:Function, url:String, urlVariables:URLVariables = null):void
		{
			this.onResponseCallback = onResponseCallback;
			
			if (busy)
			{
				responseWithError("Cannot call Scoreoid API while busy");
			}
			else
			{
				busy = true;
				
				if (urlVariables == null)
					urlVariables = new URLVariables();
				urlVariables.api_key = apiKey;
				urlVariables.game_id = gameID;
				urlVariables.response = responseType;
				
				urlRequest.url = url;
				urlRequest.data = urlVariables;
				
				addListeners();
				urlLoader.load(urlRequest);
			}
		}
		
		private function addListeners():void
		{
			urlLoader.addEventListener(Event.COMPLETE, onAPICallResponse);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onAPICallNoReponse);
			urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onAPICallNoReponse);
			urlLoader.addEventListener(ErrorEvent.ERROR, onAPICallNoReponse);
		}
		
		private function removeListeners():void
		{
			urlLoader.removeEventListener(Event.COMPLETE, onAPICallResponse);
			urlLoader.removeEventListener(IOErrorEvent.IO_ERROR, onAPICallNoReponse);
			urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onAPICallNoReponse);
			urlLoader.removeEventListener(ErrorEvent.ERROR, onAPICallNoReponse);
		}
		
		/** Used to purge api requests when they are no longer needed.
		 * For example, when changing screens. **/
		public function cancel():void
		{
			removeListeners();
			busy = false;
		}
		
		private function onAPICallResponse(event:Event):void
		{
			cancel();
			
			if (onResponseCallback != null)
			{
				trace("Scoreoid API Call Got A Response");
				if (responseType == Scoreoid.JSON)
					onResponseCallback(JSON.parse(event.target.data as String));
				else // XML
					onResponseCallback(new XML(event.target.data as String));
			}
		}
		
		private function onAPICallNoReponse(event:Event):void
		{
			cancel();
			
			if (onResponseCallback != null)
			{
				trace("Scoreoid URL Request Failure");
				responseWithError(event.toString());
			}
		}
		
		private function responseWithError(errorString:String):void
		{
			var object:Object = new Object;
			object.error = errorString;
			onResponseCallback(object);
		}
	}
}

