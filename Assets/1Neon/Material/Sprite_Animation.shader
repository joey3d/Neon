// Upgrade NOTE: upgraded instancing buffer 'Sprite_Animation' to new syntax.

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Sprite_Animation"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_A1("A1", 2D) = "white" {}
		_Rows("Rows", Float) = 2
		_Speed("Speed", Float) = 0.5
		_Columns("Columns", Float) = 4
		_E("E", Color) = (0,0,0,0)
		_E_Intensity("E_Intensity", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "Transparent+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma multi_compile_instancing
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _A1;
		uniform float _Cutoff = 0.5;

		UNITY_INSTANCING_BUFFER_START(Sprite_Animation)
			UNITY_DEFINE_INSTANCED_PROP(float4, _E)
#define _E_arr Sprite_Animation
			UNITY_DEFINE_INSTANCED_PROP(float, _E_Intensity)
#define _E_Intensity_arr Sprite_Animation
			UNITY_DEFINE_INSTANCED_PROP(float, _Columns)
#define _Columns_arr Sprite_Animation
			UNITY_DEFINE_INSTANCED_PROP(float, _Rows)
#define _Rows_arr Sprite_Animation
			UNITY_DEFINE_INSTANCED_PROP(float, _Speed)
#define _Speed_arr Sprite_Animation
		UNITY_INSTANCING_BUFFER_END(Sprite_Animation)

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float3 temp_cast_0 = (0.0).xxx;
			o.Albedo = temp_cast_0;
			float4 _E_Instance = UNITY_ACCESS_INSTANCED_PROP(_E_arr, _E);
			float _E_Intensity_Instance = UNITY_ACCESS_INSTANCED_PROP(_E_Intensity_arr, _E_Intensity);
			o.Emission = ( _E_Instance * _E_Intensity_Instance ).rgb;
			o.Alpha = 1;
			float2 uv_TexCoord2 = i.uv_texcoord * float2( 1,1 ) + float2( 0,0 );
			float _Columns_Instance = UNITY_ACCESS_INSTANCED_PROP(_Columns_arr, _Columns);
			float _Rows_Instance = UNITY_ACCESS_INSTANCED_PROP(_Rows_arr, _Rows);
			float _Speed_Instance = UNITY_ACCESS_INSTANCED_PROP(_Speed_arr, _Speed);
			// *** BEGIN Flipbook UV Animation vars ***
			// Total tiles of Flipbook Texture
			float fbtotaltiles1 = _Columns_Instance * _Rows_Instance;
			// Offsets for cols and rows of Flipbook Texture
			float fbcolsoffset1 = 1.0f / _Columns_Instance;
			float fbrowsoffset1 = 1.0f / _Rows_Instance;
			// Speed of animation
			float fbspeed1 = _Time[ 1 ] * _Speed_Instance;
			// UV Tiling (col and row offset)
			float2 fbtiling1 = float2(fbcolsoffset1, fbrowsoffset1);
			// UV Offset - calculate current tile linear index, and convert it to (X * coloffset, Y * rowoffset)
			// Calculate current tile linear index
			float fbcurrenttileindex1 = round( fmod( fbspeed1 + 0.0, fbtotaltiles1) );
			fbcurrenttileindex1 += ( fbcurrenttileindex1 < 0) ? fbtotaltiles1 : 0;
			// Obtain Offset X coordinate from current tile linear index
			float fblinearindextox1 = round ( fmod ( fbcurrenttileindex1, _Columns_Instance ) );
			// Multiply Offset X by coloffset
			float fboffsetx1 = fblinearindextox1 * fbcolsoffset1;
			// Obtain Offset Y coordinate from current tile linear index
			float fblinearindextoy1 = round( fmod( ( fbcurrenttileindex1 - fblinearindextox1 ) / _Columns_Instance, _Rows_Instance ) );
			// Reverse Y to get tiles from Top to Bottom
			fblinearindextoy1 = (int)(_Rows_Instance-1) - fblinearindextoy1;
			// Multiply Offset Y by rowoffset
			float fboffsety1 = fblinearindextoy1 * fbrowsoffset1;
			// UV Offset
			float2 fboffset1 = float2(fboffsetx1, fboffsety1);
			// Flipbook UV
			half2 fbuv1 = uv_TexCoord2 * fbtiling1 + fboffset1;
			// *** END Flipbook UV Animation vars ***
			clip( tex2D( _A1, fbuv1 ).r - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=14001
-1749;144;1426;824;1761.758;339.5099;1.81703;True;True
Node;AmplifyShaderEditor.TextureCoordinatesNode;2;-1180.374,308.8598;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;5;-1144.838,627.9541;Float;False;InstancedProperty;_Speed;Speed;3;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4;-1142.213,541.292;Float;False;InstancedProperty;_Rows;Rows;2;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3;-1142.213,452.0042;Float;False;InstancedProperty;_Columns;Columns;4;0;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCFlipBookUVAnimation;1;-854.3723,312.8597;Float;False;0;0;6;0;FLOAT2;0,0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;10;-606.7129,136.3497;Float;False;InstancedProperty;_E_Intensity;E_Intensity;6;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;8;-647.0393,-42.70081;Float;False;InstancedProperty;_E;E;5;0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;7;-280.8726,-34.63547;Float;False;Constant;_Float0;Float 0;4;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-413.1436,60.53552;Float;False;2;2;0;COLOR;0.0;False;1;FLOAT;0.0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;6;-572.3422,282.0191;Float;True;Property;_A1;A1;1;0;Assets/1Neon/Textures/Sprit_Animation.png;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;Sprite_Animation;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;0;False;0;0;Custom;0.5;True;True;0;False;TransparentCutout;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;0;0;0;0;False;2;15;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;0;0;False;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;FLOAT;0.0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;1;0;2;0
WireConnection;1;1;3;0
WireConnection;1;2;4;0
WireConnection;1;3;5;0
WireConnection;9;0;8;0
WireConnection;9;1;10;0
WireConnection;6;1;1;0
WireConnection;0;0;7;0
WireConnection;0;2;9;0
WireConnection;0;10;6;1
ASEEND*/
//CHKSM=D65B33582EB29EDE5265FDF2DD4DF98323A42778