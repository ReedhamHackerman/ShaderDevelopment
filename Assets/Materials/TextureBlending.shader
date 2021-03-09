﻿Shader "Custom/TextureBlending"
{
    Properties
    {
       
        _MainTex ("Main texture", 2D) = "white" {}
	    _DecalTex("Decal texture", 2D) = "white" {}
		[Toggle] _ShowDecal("IsDecal On",Float) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;
	    sampler2D _DecalTex;
		float _ShowDecal;
        struct Input
        {
            float2 uv_MainTex;
        };

      

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
			fixed4 d = tex2D(_DecalTex, IN.uv_MainTex)*_ShowDecal;
			o.Albedo = d.r > 0.9 ? d.rgb : c.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
