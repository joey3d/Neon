// Upgrade NOTE: upgraded instancing buffer 'NewAmplifyShader' to new syntax.

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New AmplifyShader"
{
	Properties
	{
		_N1("N1", 2D) = "bump" {}
		_N2("N2", 2D) = "bump" {}
		_Roughness("Roughness", Float) = 0
		_Color("Color", Color) = (0,0,0,0)
		_E3("E3", 2D) = "white" {}
		_E1("E1", 2D) = "white" {}
		_E_Intensity("E_Intensity", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma multi_compile_instancing
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _N2;
		uniform sampler2D _N1;
		uniform sampler2D _E3;
		uniform sampler2D _E1;

		UNITY_INSTANCING_BUFFER_START(NewAmplifyShader)
			UNITY_DEFINE_INSTANCED_PROP(float4, _Color)
#define _Color_arr NewAmplifyShader
			UNITY_DEFINE_INSTANCED_PROP(float, _E_Intensity)
#define _E_Intensity_arr NewAmplifyShader
			UNITY_DEFINE_INSTANCED_PROP(float, _Roughness)
#define _Roughness_arr NewAmplifyShader
		UNITY_INSTANCING_BUFFER_END(NewAmplifyShader)

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_TexCoord2 = i.uv_texcoord * float2( 28,28 ) + float2( 0,0 );
			float2 panner1 = ( uv_TexCoord2 + 1.0 * _Time.y * float2( 0.1,-0.05 ));
			float2 panner4 = ( uv_TexCoord2 + 1.0 * _Time.y * float2( -0.125,0.05 ));
			o.Normal = BlendNormals( UnpackNormal( tex2D( _N2, panner1 ) ) , UnpackNormal( tex2D( _N1, panner4 ) ) );
			float4 _Color_Instance = UNITY_ACCESS_INSTANCED_PROP(_Color_arr, _Color);
			o.Albedo = _Color_Instance.rgb;
			float2 uv_TexCoord29 = i.uv_texcoord * float2( 2,3 ) + float2( 0,0 );
			float2 panner23 = ( uv_TexCoord29 + 1.0 * _Time.y * float2( 0.005,0.01 ));
			float2 uv_TexCoord27 = i.uv_texcoord * float2( 1,2 ) + float2( 0,0 );
			float2 panner15 = ( uv_TexCoord27 + 1.0 * _Time.y * float2( 0.02,0.005 ));
			float lerpResult33 = lerp( tex2D( _E1, panner15 ).r , 0.0 , 0.0);
			float _E_Intensity_Instance = UNITY_ACCESS_INSTANCED_PROP(_E_Intensity_arr, _E_Intensity);
			float3 temp_cast_1 = (( ( tex2D( _E3, panner23 ).b * lerpResult33 ) * _E_Intensity_Instance )).xxx;
			o.Emission = temp_cast_1;
			float _Roughness_Instance = UNITY_ACCESS_INSTANCED_PROP(_Roughness_arr, _Roughness);
			o.Smoothness = _Roughness_Instance;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=14001
7;29;1426;824;2931.72;561.2717;1.970375;True;True
Node;AmplifyShaderEditor.TextureCoordinatesNode;27;-2211.519,401.9648;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,2;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;29;-2221.699,184.5472;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;2,3;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;15;-1896.635,402.025;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0.02,0.005;False;1;FLOAT;1.0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;14;-1650.512,372.7518;Float;True;Property;_E1;E1;5;0;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;2;-1656.971,-148.5465;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;28,28;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;23;-1921.437,184.7559;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0.005,0.01;False;1;FLOAT;1.0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;1;-1350.549,-278.0462;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0.1,-0.05;False;1;FLOAT;1.0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;33;-1198.429,400.9722;Float;False;3;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;4;-1357.947,-34.22645;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;-0.125,0.05;False;1;FLOAT;1.0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;22;-1653.182,154.7412;Float;True;Property;_E3;E3;4;0;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;26;-796.6762,358.5376;Float;False;InstancedProperty;_E_Intensity;E_Intensity;6;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-942.7974,227.5178;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;11;-1166.666,-62.60465;Float;True;Property;_N1;N1;0;0;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;10;-1158.807,-307.9247;Float;True;Property;_N2;N2;1;0;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BlendNormalsNode;7;-824.7865,-141.3435;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;25;-592.1444,229.3053;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;8;-444.051,73.65016;Float;False;InstancedProperty;_Roughness;Roughness;2;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;13;-633.426,-343.7519;Float;False;InstancedProperty;_Color;Color;3;0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-19.62496,-15.69997;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;New AmplifyShader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;Back;0;0;False;0;0;Opaque;0.5;True;True;0;False;Opaque;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;0;0;0;0;False;2;15;10;25;False;0.5;True;0;SrcAlpha;OneMinusSrcAlpha;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;FLOAT;0.0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;15;0;27;0
WireConnection;14;1;15;0
WireConnection;23;0;29;0
WireConnection;1;0;2;0
WireConnection;33;0;14;1
WireConnection;4;0;2;0
WireConnection;22;1;23;0
WireConnection;32;0;22;3
WireConnection;32;1;33;0
WireConnection;11;1;4;0
WireConnection;10;1;1;0
WireConnection;7;0;10;0
WireConnection;7;1;11;0
WireConnection;25;0;32;0
WireConnection;25;1;26;0
WireConnection;0;0;13;0
WireConnection;0;1;7;0
WireConnection;0;2;25;0
WireConnection;0;4;8;0
ASEEND*/
//CHKSM=E8CCCE562CD697CB40F47D84E0911FC5B18AEED2