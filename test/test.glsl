#ifdef GL_ES
precision highp float;
#endif

attribute vec3 position;
attribute vec3 normal;
attribute vec2 texcoord2d0;

uniform mat4 projection;
uniform mat4 modelview;
uniform vec4 diffuse;
uniform sampler2D diffuse0;

#ifdef MAGIC
const float magicValue = 4.2;
#endif

varying vec2 uv0;

vec4 lighting() {
	vec4 textureColor = texture2D(diffuse0, uv0);
	return textureColor;
}

void fragment(void) {
	vec4 color = lighting();
	gl_FragColor = clamp(color, 0.0, 1.0);
}

void vertex() {
	uv0 = texcoord2d0;
	gl_Position = projection * modelview * vec4(position, 1.0);
}
