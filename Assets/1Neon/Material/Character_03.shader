// Upgrade NOTE: upgraded instancing buffer 'NewAmplifyShader' to new syntax.

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New AmplifyShader"
{
	Properties
	{
		_E("E", 2D) = "white" {}
		_E_Intensity("E_Intensity", Float) = 400
		_E_Color("E_Color", Color) = (0,0,0,0)
		_E_Speed_1("E_Speed_1", Vector) = (0.1,-0.1,0,0)
		_E_Speed_2("E_Speed_2", Vector) = (-0.1,0.1,0,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Back
		CGINCLUDE
		#include "UnityShaderVariables.cginc"
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#pragma multi_compile_instancing
		struct Input
		{
			float3 worldPos;
			float3 worldNormal;
			float2 uv_texcoord;
		};

		uniform sampler2D _E;

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
			o.Albedo = float4(0,0,0,0).rgb;
			float4 _E_Color_Instance = UNITY_ACCESS_INSTANCED_PROP(_E_Color_arr, _E_Color);
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = i.worldNormal;
			float fresnelNDotV26 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode26 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNDotV26, 1.0 ) );
			float2 _E_Speed_2_Instance = UNITY_ACCESS_INSTANCED_PROP(_E_Speed_2_arr, _E_Speed_2);
			float2 uv_TexCoord6 = i.uv_texcoord * float2( 1,1 ) + float2( 0,0 );
			float2 panner13 = ( uv_TexCoord6 + 1.0 * _Time.y * _E_Speed_2_Instance);
			float2 _E_Speed_1_Instance = UNITY_ACCESS_INSTANCED_PROP(_E_Speed_1_arr, _E_Speed_1);
			float2 panner5 = ( uv_TexCoord6 + 1.0 * _Time.y * _E_Speed_1_Instance);
			float _E_Intensity_Instance = UNITY_ACCESS_INSTANCED_PROP(_E_Intensity_arr, _E_Intensity);
			float temp_output_15_0 = ( ( ( fresnelNode26 * 0.01 ) + ( tex2D( _E, panner13 ).g * ( tex2D( _E, panner5 ).r * tex2D( _E, uv_TexCoord6 ).b ) ) ) * _E_Intensity_Instance );
			o.Emission = ( _E_Color_Instance * temp_output_15_0 ).rgb;
			float temp_output_23_0 = 0.0;
			o.Metallic = temp_output_23_0;
			o.Smoothness = temp_output_23_0;
			o.Alpha = temp_output_15_0;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Standard alpha:fade keepalpha fullforwardshadows 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			sampler3D _DitherMaskLOD;
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float3 worldPos : TEXCOORD2;
				float3 worldNormal : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				fixed3 worldNormal = UnityObjectToWorldNormal( v.normal );
				o.worldNormal = worldNormal;
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				o.worldPos = worldPos;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			fixed4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				float3 worldPos = IN.worldPos;
				fixed3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = IN.worldNormal;
				SurfaceOutputStandard o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputStandard, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				half alphaRef = tex3D( _DitherMaskLOD, float3( vpos.xy * 0.25, o.Alpha * 0.9375 ) ).a;
				clip( alphaRef - 0.01 );
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=14001
7;29;1426;824;2341.157;751.7729;1.6;True;True
Node;AmplifyShaderEditor.TextureCoordinatesNode;6;-3168.026,222.2327;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;7;-2869.63,336.3147;Float;False;InstancedProperty;_E_Speed_1;E_Speed_1;3;0;0.1,-0.1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.PannerNode;5;-2607.239,218.0714;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1.0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;12;-2864.015,-211.0906;Float;False;InstancedProperty;_E_Speed_2;E_Speed_2;4;0;-0.1,0.1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TexturePropertyNode;8;-2455.815,497.7776;Float;True;Property;_E;E;0;0;Assets/1Neon/Textures/Character/Character_01_E.png;False;white;Auto;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.SamplerNode;10;-2096.283,769.0272;Float;True;Property;_TextureSample0;Texture Sample 0;8;0;Assets/1Neon/Textures/Character/Character_01_E.png;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;27;-1769.961,-108.5729;Float;False;Constant;_Float1;Float 1;5;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3;-2096.625,194.6528;Float;True;Property;_TextureSample2;Texture Sample 2;3;0;Assets/1Neon/Textures/Character/Character_01_E.png;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;13;-2599.06,-324.2068;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1.0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-1571.558,11.42718;Float;False;Constant;_Float2;Float 2;5;0;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;26;-1600.358,-164.5736;Float;False;Tangent;4;0;FLOAT3;0,0,0;False;1;FLOAT;0.0;False;2;FLOAT;1.0;False;3;FLOAT;5.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-1746.076,285.9991;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;11;-2091.109,-336.7891;Float;True;Property;_TextureSample1;Texture Sample 1;5;0;Assets/1Neon/Textures/Character/Character_01_E.png;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;-1361.958,-166.1733;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-1566.452,155.6656;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;25;-1264.357,136.2259;Float;True;2;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-1001.587,212.6852;Float;False;InstancedProperty;_E_Intensity;E_Intensity;1;0;400;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;18;-867.6987,-50.85491;Float;False;InstancedProperty;_E_Color;E_Color;2;0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-804.9949,130.3017;Float;False;2;2;0;FLOAT;0,0,0,0;False;1;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;-614.462,34.93368;Float;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0.0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;19;-430.5084,-228.6685;Float;False;Constant;_D;D;7;0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;23;-162.5328,115.3964;Float;False;Constant;_Float0;Float 0;5;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;New AmplifyShader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;Back;0;0;False;0;0;Transparent;0.5;True;True;0;False;Transparent;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;0;0;0;0;False;2;15;10;25;False;0.5;True;2;SrcAlpha;OneMinusSrcAlpha;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;FLOAT;0.0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;0;6;0
WireConnection;5;2;7;0
WireConnection;10;0;8;0
WireConnection;10;1;6;0
WireConnection;3;0;8;0
WireConnection;3;1;5;0
WireConnection;13;0;6;0
WireConnection;13;2;12;0
WireConnection;26;3;27;0
WireConnection;9;0;3;1
WireConnection;9;1;10;3
WireConnection;11;0;8;0
WireConnection;11;1;13;0
WireConnection;28;0;26;0
WireConnection;28;1;29;0
WireConnection;14;0;11;2
WireConnection;14;1;9;0
WireConnection;25;0;28;0
WireConnection;25;1;14;0
WireConnection;15;0;25;0
WireConnection;15;1;16;0
WireConnection;17;0;18;0
WireConnection;17;1;15;0
WireConnection;0;0;19;0
WireConnection;0;2;17;0
WireConnection;0;3;23;0
WireConnection;0;4;23;0
WireConnection;0;9;15;0
ASEEND*/
//CHKSM=96AED11D8EC2377B617FDB5C0C6AE5255E5387BB