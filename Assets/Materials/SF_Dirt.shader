// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Terrain"
{
	Properties
	{
		_SandNormal("Sand Normal", 2D) = "bump" {}
		[Header(SF_Dirt)]
		_Texture2("Texture 2", 2D) = "bump" {}
		_Texture0("Texture 0", 2D) = "bump" {}
		_Texture1("Texture 1", 2D) = "white" {}
		_Texture3("Texture 3", 2D) = "white" {}
		_Sand("Sand", 2D) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IgnoreProjector" = "True" }
		Cull Back
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 5.0
		#ifdef UNITY_PASS_SHADOWCASTER
			#undef INTERNAL_DATA
			#undef WorldReflectionVector
			#undef WorldNormalVector
			#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
			#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
			#define WorldNormalVector(data,normal) fixed3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))
		#endif
		struct Input
		{
			float4 vertexColor : COLOR;
			float3 worldPos;
			float3 worldNormal;
			INTERNAL_DATA
		};

		uniform sampler2D _SandNormal;
		uniform sampler2D _Texture2;
		uniform sampler2D _Texture0;
		uniform sampler2D _Texture3;
		uniform sampler2D _Sand;
		uniform sampler2D _Texture1;


		inline float3 TriplanarSamplingSNF( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float tilling, float3 index )
		{
			float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
			projNormal /= projNormal.x + projNormal.y + projNormal.z;
			float3 nsign = sign( worldNormal );
			half4 xNorm; half4 yNorm; half4 zNorm;
			xNorm = ( tex2D( topTexMap, tilling * worldPos.zy * float2( nsign.x, 1.0 ) ) );
			yNorm = ( tex2D( topTexMap, tilling * worldPos.xz * float2( nsign.y, 1.0 ) ) );
			zNorm = ( tex2D( topTexMap, tilling * worldPos.xy * float2( -nsign.z, 1.0 ) ) );
			xNorm.xyz = half3( UnpackNormal( xNorm ).xy * float2( nsign.x, 1.0 ) + worldNormal.zy, worldNormal.x ).zyx;
			yNorm.xyz = half3( UnpackNormal( yNorm ).xy * float2( nsign.y, 1.0 ) + worldNormal.xz, worldNormal.y ).xzy;
			zNorm.xyz = half3( UnpackNormal( zNorm ).xy * float2( -nsign.z, 1.0 ) + worldNormal.xy, worldNormal.z ).xyz;
			return normalize( xNorm.xyz * projNormal.x + yNorm.xyz * projNormal.y + zNorm.xyz * projNormal.z );
		}


		inline float4 TriplanarSamplingSF( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float tilling, float3 index )
		{
			float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
			projNormal /= projNormal.x + projNormal.y + projNormal.z;
			float3 nsign = sign( worldNormal );
			half4 xNorm; half4 yNorm; half4 zNorm;
			xNorm = ( tex2D( topTexMap, tilling * worldPos.zy * float2( nsign.x, 1.0 ) ) );
			yNorm = ( tex2D( topTexMap, tilling * worldPos.xz * float2( nsign.y, 1.0 ) ) );
			zNorm = ( tex2D( topTexMap, tilling * worldPos.xy * float2( -nsign.z, 1.0 ) ) );
			return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
		}


		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_worldTangent = WorldNormalVector( i, float3( 1, 0, 0 ) );
			float3 ase_worldBitangent = WorldNormalVector( i, float3( 0, 1, 0 ) );
			float3x3 ase_worldToTangent = float3x3( ase_worldTangent, ase_worldBitangent, ase_worldNormal );
			float3 triplanar33_g40 = TriplanarSamplingSNF( _SandNormal, ase_worldPos, ase_worldNormal, 1.0, 0.1, 0 );
			float3 tanTriplanarNormal33_g40 = mul( ase_worldToTangent, triplanar33_g40 );
			float3 triplanar35_g40 = TriplanarSamplingSNF( _Texture2, ase_worldPos, ase_worldNormal, 1.0, 0.1, 0 );
			float3 tanTriplanarNormal35_g40 = mul( ase_worldToTangent, triplanar35_g40 );
			float layeredBlendVar51 = i.vertexColor.r;
			float3 layeredBlend51 = ( lerp( tanTriplanarNormal33_g40,tanTriplanarNormal35_g40 , layeredBlendVar51 ) );
			float3 triplanar36_g40 = TriplanarSamplingSNF( _Texture0, ase_worldPos, ase_worldNormal, 1.0, 0.1, 0 );
			float3 tanTriplanarNormal36_g40 = mul( ase_worldToTangent, triplanar36_g40 );
			float layeredBlendVar57 = i.vertexColor.b;
			float3 layeredBlend57 = ( lerp( layeredBlend51,tanTriplanarNormal36_g40 , layeredBlendVar57 ) );
			o.Normal = layeredBlend57;
			float4 triplanar34_g40 = TriplanarSamplingSF( _Texture3, ase_worldPos, ase_worldNormal, 1.0, 0.1, 0 );
			float4 triplanar32_g40 = TriplanarSamplingSF( _Sand, ase_worldPos, ase_worldNormal, 1.0, 0.1, 0 );
			float layeredBlendVar50 = i.vertexColor.r;
			float4 layeredBlend50 = ( lerp( triplanar34_g40,triplanar32_g40 , layeredBlendVar50 ) );
			float4 triplanar37_g40 = TriplanarSamplingSF( _Texture1, ase_worldPos, ase_worldNormal, 1.0, 0.1, 0 );
			float layeredBlendVar54 = i.vertexColor.b;
			float4 layeredBlend54 = ( lerp( layeredBlend50,triplanar37_g40 , layeredBlendVar54 ) );
			o.Albedo = layeredBlend54.xyz;
			o.Smoothness = ( i.vertexColor.g * 0.7 );
			o.Alpha = 1;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Standard keepalpha fullforwardshadows 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 5.0
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
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float4 tSpace0 : TEXCOORD1;
				float4 tSpace1 : TEXCOORD2;
				float4 tSpace2 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				fixed3 worldNormal = UnityObjectToWorldNormal( v.normal );
				fixed3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
				fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				fixed3 worldBinormal = cross( worldNormal, worldTangent ) * tangentSign;
				o.tSpace0 = float4( worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x );
				o.tSpace1 = float4( worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y );
				o.tSpace2 = float4( worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z );
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
				float3 worldPos = float3( IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w );
				fixed3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = float3( IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z );
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				SurfaceOutputStandard o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputStandard, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
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
153;1086;1813;1031;4748.441;1660.217;3.200669;True;True
Node;AmplifyShaderEditor.VertexColorNode;6;-2065.305,8.640305;Float;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;58;-1999.133,-1454.467;Float;False;510.4386;469.5946;Dirt and Mud;1;50;;1,1,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;85;-2566.118,-890.141;Float;True;SF_Dirt;0;;40;d7c94d906cf2ff749845754037e31460;0;6;FLOAT3;0;FLOAT3;1;FLOAT3;2;FLOAT4;3;FLOAT4;4;FLOAT4;5
Node;AmplifyShaderEditor.LayeredBlendNode;51;-1144.786,-716.6674;Float;False;6;0;FLOAT;0.0;False;1;FLOAT3;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LayeredBlendNode;50;-1896.135,-1203.35;Float;False;6;0;FLOAT;0.0;False;1;FLOAT4;0;False;2;FLOAT4;0.0,0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;59;-1369.516,-1449.577;Float;False;327.8551;387.256;Grassy Dirt;1;54;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;42;-1526.938,487.0939;Float;False;Constant;_Float1;Float 1;1;0;0.7;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LayeredBlendNode;57;-733.2916,-417.0385;Float;False;6;0;FLOAT;0.0;False;1;FLOAT3;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LayeredBlendNode;54;-1312.183,-1235.049;Float;False;6;0;FLOAT;0.0;False;1;FLOAT4;0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;62;-1057.849,184.6168;Float;False;3;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;-1104.4,29.97388;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;7;Float;ASEMaterialInspector;0;0;Standard;Terrain;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;Back;0;0;False;0;0;Opaque;0.5;True;True;0;False;Opaque;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;0;0;0;0;False;2;15;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;FLOAT;0.0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;51;0;6;1
WireConnection;51;1;85;0
WireConnection;51;2;85;1
WireConnection;50;0;6;1
WireConnection;50;1;85;5
WireConnection;50;2;85;4
WireConnection;57;0;6;3
WireConnection;57;1;51;0
WireConnection;57;2;85;2
WireConnection;54;0;6;3
WireConnection;54;1;50;0
WireConnection;54;2;85;3
WireConnection;41;0;6;2
WireConnection;41;1;42;0
WireConnection;0;0;54;0
WireConnection;0;1;57;0
WireConnection;0;4;41;0
ASEEND*/
//CHKSM=265535BB76B1255D73E373F03FD85EC8628A2600