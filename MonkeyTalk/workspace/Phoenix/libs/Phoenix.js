/***** DO NOT EDIT THIS FILE *****/
// Phoenix.js generated by MonkeyTalk

load("libs/MonkeyTalkAPI.js");


var Phoenix = {};

/*** script -- LOGWelcomeView ***/
Phoenix.LOGWelcomeView = function(app) {
	MT.Script.call(this, app, "LOGWelcomeView.mt");
};

Phoenix.LOGWelcomeView.prototype = new MT.Script;

Phoenix.LOGWelcomeView.prototype.call = function() {
	//run: LOGWelcomeView.mt
	MT.Script.prototype.call(this);
};

MT.Application.prototype.lOGWelcomeView = function() {
	return new Phoenix.LOGWelcomeView(this);
};

