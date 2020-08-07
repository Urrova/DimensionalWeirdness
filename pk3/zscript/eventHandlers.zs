//Handler de los shaders, para el shader negativo
class ShaderHandler : StaticEventHandler {
	override void RenderOverlay(RenderEvent e) {
		PlayerInfo p = players[consoleplayer];
		if (CVar.GetCVar("SIGTAGNY2_Shader", p).GetInt() == 1) {
			Shader.SetEnabled(p, "NegativeShader", true);
			Shader.SetEnabled(p, "NegativeShader", true);
		}
		else{
			Shader.SetEnabled(p, "NegativeShader", false);
			Shader.SetEnabled(p, "NegativeShader", false);
		}
	}
}