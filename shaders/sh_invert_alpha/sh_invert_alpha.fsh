//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    // This following line is added; inverts alpha
    gl_FragColor.a = 1.0 - gl_FragColor.a;
}

