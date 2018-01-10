// Upgrade NOTE: upgraded instancing buffer 'NewAmplifyShader' to new syntax.

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New AmplifyShader"
{
	Properties
	{
		_D("D", 2D) = "white" {}
		_M("M", 2D) = "white" {}
		_AO("AO", 2D) = "white" {}
		_E("E", 2D) = "white" {}
		_E_Intensity("E_Intensity", Float) = 0
		_E_Color("E_Color", Color) = (0,0,0,0)
		_E_Speed_1("E_Speed_1", Vector) = (0.1,-0.1,0,0)
		_E_Speed_2("E_Speed_2", Vector) = (-0.1,0.1,0,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma multi_compile_instancing
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _D;
		uniform float4 _D_ST;
		uniform sampler2D _E;
		uniform sampler2D _M;
		uniform float4 _M_ST;
		uniform sampler2D _AO;
		uniform float4 _AO_ST;

		UNITY_INSTANCING_BUFFER_START(NewAmplifyShader)
			UNITY_DEFINE_INSTANCED_PROP(float4, _E_Color)
#define _E_Color_arr NewAmplifyShader
			UNITY_DEFINE_INSTANCED_PROP(float2, _E_Speed_2)
#define _E_Speed_2_arr NewAmplifyShader
			UNITY_DEFINE_INSTANCED_PROP(float2, _E_Speed_1)
#define _E_Speed_1_arr NewAmplifyShader
			UNITY_DEFINE_INSTANCED_PROP(float, _E_Intensity)
#define _E_Intensity_arr NewAmplifyShader
		UNITY_INSTANCING_BUFFER_END(NewAmplifyShader)

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_D = i.uv_texcoord * _D_ST.xy + _D_ST.zw;
			o.Albedo = tex2D( _D, uv_D ).rgb;
			float4 _E_Color_Instance = UNITY_ACCESS_INSTANCED_PROP(_E_Color_arr, _E_Color);
			float2 _E_Speed_2_Instance = UNITY_ACCESS_INSTANCED_PROP(_E_Speed_2_arr, _E_Speed_2);
			float2 uv_TexCoord6 = i.uv_texcoord * float2( 1,1 ) + float2( 0,0 );
			float2 panner13 = ( uv_TexCoord6 + 1.0 * _Time.y * _E_Speed_2_Instance);
			float2 _E_Speed_1_Instance = UNITY_ACCESS_INSTANCED_PROP(_E_Speed_1_arr, _E_Speed_1);
			float2 panner5 = ( uv_TexCoord6 + 1.0 * _Time.y * _E_Speed_1_Instance);
			float _E_Intensity_Instance = UNITY_ACCESS_INSTANCED_PROP(_E_Intensity_arr, _E_Intensity);
			o.Emission = ( _E_Color_Instance * ( ( tex2D( _E, panner13 ).g * ( tex2D( _E, panner5 ).r * tex2D( _E, uv_TexCoord6 ).b ) ) * _E_Intensity_Instance ) ).rgb;
			float2 uv_M = i.uv_texcoord * _M_ST.xy + _M_ST.zw;
			float4 tex2DNode4 = tex2D( _M, uv_M );
			o.Metallic = tex2DNode4.r;
			o.Smoothness = tex2DNode4.g;
			float2 uv_AO = i.uv_texcoord * _AO_ST.xy + _AO_ST.zw;
			o.Occlusion = tex2D( _AO, uv_AO ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=14001
-1791;117;1426;824;3216.775;855.0914;2.62;True;True
Node;AmplifyShaderEditor.TextureCoordinatesNode;6;-3902.427,386.3928;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;7;-3604.031,500.4748;Float;False;InstancedProperty;_E_Speed_1;E_Speed_1;6;0;0.1,-0.1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;12;-3598.416,-46.93052;Float;False;InstancedProperty;_E_Speed_2;E_Speed_2;7;0;-0.1,0.1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TexturePropertyNode;8;-3152.218,682.8381;Float;True;Property;_E;E;3;0;None;False;white;Auto;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.PannerNode;5;-3339.076,387.3585;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1.0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;10;-2830.684,933.1874;Float;True;Property;_TextureSample0;Texture Sample 0;5;0;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-2831.026,358.8129;Float;True;Property;_TextureSample2;Texture Sample 2;2;0;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;13;-3333.461,-160.0468;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1.0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-2409.884,466.4491;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;11;-2825.51,-172.629;Float;True;Property;_TextureSample1;Texture Sample 1;5;0;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-2143.378,223.8957;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-1335.966,310.9203;Float;False;InstancedProperty;_E_Intensity;E_Intensity;4;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-1092.785,56.09169;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;18;-1180.249,-279.8116;Float;False;InstancedProperty;_E_Color;E_Color;5;0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-336.6075,448.5287;Float;True;Property;_AO;AO;2;0;Assets/1Neon/Textures/Character/Character_01_AO.png;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;-648.1389,-314.16;Float;True;Property;_M;M;1;0;Assets/1Neon/Textures/Character/Character_01_M.png;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;-863.049,-99.1117;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0.0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;1;-678.6721,-526.6755;Float;True;Property;_D;D;0;0;Assets/1Neon/Textures/Character/Character_01_D.png;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;New AmplifyShader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;0;False;0;0;Opaque;0.5;True;True;0;False;Opaque;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;0;0;0;0;False;2;15;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;FLOAT;0.0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;0;6;0
WireConnection;5;2;7;0
WireConnection;10;0;8;0
WireConnection;10;1;6;0
WireConnection;3;0;8;0
WireConnection;3;1;5;0
WireConnection;13;0;6;0
WireConnection;13;2;12;0
WireConnection;9;0;3;1
WireConnection;9;1;10;3
WireConnection;11;0;8;0
WireConnection;11;1;13;0
WireConnection;14;0;11;2
WireConnection;14;1;9;0
WireConnection;15;0;14;0
WireConnection;15;1;16;0
WireConnection;17;0;18;0
WireConnection;17;1;15;0
WireConnection;0;0;1;0
WireConnection;0;2;17;0
WireConnection;0;3;4;1
WireConnection;0;4;4;2
WireConnection;0;5;2;0
ASEEND*/
//CHKSM=F65729182F5B6211D50EE81FE64C15C698A6794C