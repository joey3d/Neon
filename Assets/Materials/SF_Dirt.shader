// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Terrain"
{
	Properties
	{
		_TessPhongStrength( "Phong Tess Strength", Range( 0, 1 ) ) = 1
		_SandNormal("Sand Normal", 2D) = "bump" {}
		[Header(SF_Dirt)]
		_Texture2("Texture 2", 2D) = "bump" {}
		_Texture0("Texture 0", 2D) = "bump" {}
		_Texture1("Texture 1", 2D) = "white" {}
		_Texture3("Texture 3", 2D) = "white" {}
		_Sand("Sand", 2D) = "white" {}
		_Scale("Scale", Range( 0 , 2)) = 0
		_Height3("Height3", 2D) = "white" {}
		_Height2("Height2", 2D) = "white" {}
		_Height1("Height1", 2D) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IgnoreProjector" = "True" }
		Cull Back
		CGPROGRAM
		#include "Tessellation.cginc"
		#pragma target 5.0
		#pragma surface surf Standard keepalpha vertex:vertexDataFunc tessellate:tessFunction tessphong:_TessPhongStrength 
		struct Input
		{
			float4 vertexColor : COLOR;
			float3 worldPos;
			float3 worldNormal;
			INTERNAL_DATA
		};

		struct appdata
		{
			float4 vertex : POSITION;
			float4 tangent : TANGENT;
			float3 normal : NORMAL;
			float4 texcoord : TEXCOORD0;
			float4 texcoord1 : TEXCOORD1;
			float4 texcoord2 : TEXCOORD2;
			float4 texcoord3 : TEXCOORD3;
			fixed4 color : COLOR;
			UNITY_VERTEX_INPUT_INSTANCE_ID
		};

		uniform sampler2D _SandNormal;
		uniform sampler2D _Texture2;
		uniform sampler2D _Texture0;
		uniform sampler2D _Texture3;
		uniform sampler2D _Sand;
		uniform sampler2D _Texture1;
		uniform sampler2D _Height1;
		uniform sampler2D _Height2;
		uniform sampler2D _Height3;
		uniform float _Scale;
		uniform float _TessPhongStrength;


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


		inline float4 TriplanarSamplingSV( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float tilling, float3 index )
		{
			float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
			projNormal /= projNormal.x + projNormal.y + projNormal.z;
			float3 nsign = sign( worldNormal );
			half4 xNorm; half4 yNorm; half4 zNorm;
			xNorm = ( tex2Dlod( topTexMap, float4( tilling * worldPos.zy * float2( nsign.x, 1.0 ), 0, 0 ) ) );
			yNorm = ( tex2Dlod( topTexMap, float4( tilling * worldPos.xz * float2( nsign.y, 1.0 ), 0, 0 ) ) );
			zNorm = ( tex2Dlod( topTexMap, float4( tilling * worldPos.xy * float2( -nsign.z, 1.0 ), 0, 0 ) ) );
			return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
		}


		float4 tessFunction( appdata v0, appdata v1, appdata v2 )
		{
			return UnityDistanceBasedTess( v0.vertex, v1.vertex, v2.vertex, 0.0,30.0,30.0);
		}

		void vertexDataFunc( inout appdata v )
		{
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float3 ase_worldNormal = UnityObjectToWorldNormal( v.normal );
			float4 triplanar98 = TriplanarSamplingSV( _Height1, ase_worldPos, ase_worldNormal, 0.5, 0.25, 0 );
			float4 triplanar99 = TriplanarSamplingSV( _Height2, ase_worldPos, ase_worldNormal, 0.5, 0.25, 0 );
			float lerpResult115 = lerp( triplanar98.x , triplanar99.x , v.color.b);
			float4 triplanar100 = TriplanarSamplingSV( _Height3, ase_worldPos, ase_worldNormal, 0.5, 0.25, 0 );
			float lerpResult116 = lerp( lerpResult115 , triplanar100.x , v.color.b);
			float3 ase_vertexNormal = v.normal.xyz;
			v.vertex.xyz += ( ( lerpResult116 * _Scale ) * ase_vertexNormal );
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_worldTangent = WorldNormalVector( i, float3( 1, 0, 0 ) );
			float3 ase_worldBitangent = WorldNormalVector( i, float3( 0, 1, 0 ) );
			float3x3 ase_worldToTangent = float3x3( ase_worldTangent, ase_worldBitangent, ase_worldNormal );
			float3 triplanar33_g52 = TriplanarSamplingSNF( _SandNormal, ase_worldPos, ase_worldNormal, 1.0, 0.25, 0 );
			float3 tanTriplanarNormal33_g52 = mul( ase_worldToTangent, triplanar33_g52 );
			float3 triplanar35_g52 = TriplanarSamplingSNF( _Texture2, ase_worldPos, ase_worldNormal, 1.0, 0.25, 0 );
			float3 tanTriplanarNormal35_g52 = mul( ase_worldToTangent, triplanar35_g52 );
			float layeredBlendVar51 = i.vertexColor.r;
			float3 layeredBlend51 = ( lerp( tanTriplanarNormal33_g52,tanTriplanarNormal35_g52 , layeredBlendVar51 ) );
			float3 triplanar36_g52 = TriplanarSamplingSNF( _Texture0, ase_worldPos, ase_worldNormal, 1.0, 0.25, 0 );
			float3 tanTriplanarNormal36_g52 = mul( ase_worldToTangent, triplanar36_g52 );
			float layeredBlendVar57 = i.vertexColor.b;
			float3 layeredBlend57 = ( lerp( layeredBlend51,tanTriplanarNormal36_g52 , layeredBlendVar57 ) );
			o.Normal = layeredBlend57;
			float4 triplanar34_g52 = TriplanarSamplingSF( _Texture3, ase_worldPos, ase_worldNormal, 1.0, 0.25, 0 );
			float4 triplanar32_g52 = TriplanarSamplingSF( _Sand, ase_worldPos, ase_worldNormal, 1.0, 0.25, 0 );
			float layeredBlendVar50 = i.vertexColor.r;
			float4 layeredBlend50 = ( lerp( triplanar34_g52,triplanar32_g52 , layeredBlendVar50 ) );
			float4 triplanar37_g52 = TriplanarSamplingSF( _Texture1, ase_worldPos, ase_worldNormal, 1.0, 0.25, 0 );
			float layeredBlendVar54 = i.vertexColor.b;
			float4 layeredBlend54 = ( lerp( layeredBlend50,triplanar37_g52 , layeredBlendVar54 ) );
			o.Albedo = layeredBlend54.xyz;
			o.Smoothness = 0.45;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=14001
-153;270;1906;1004;1505.252;-673.816;1;True;True
Node;AmplifyShaderEditor.TexturePropertyNode;96;-2651.348,722.7911;Float;True;Property;_Height2;Height2;9;0;None;False;white;Auto;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.RangedFloatNode;101;-3219.643,408.9487;Float;False;Constant;_Float3;Float 3;4;0;0.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;95;-2450.666,302.2083;Float;True;Property;_Height1;Height1;10;0;None;False;white;Auto;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.RangedFloatNode;102;-3253.948,907.0957;Float;False;Constant;_Float4;Float 4;4;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TriplanarNode;98;-2147.191,468.3906;Float;True;Spherical;World;False;Top Texture 0;_TopTexture0;white;-1;None;Mid Texture 4;_MidTexture4;white;-1;None;Bot Texture 4;_BotTexture4;white;-1;None;Triplanar Sampler;False;8;0;SAMPLER2D;;False;5;FLOAT;1.0;False;1;SAMPLER2D;;False;6;FLOAT;0.0;False;2;SAMPLER2D;;False;7;FLOAT;0.0;False;3;FLOAT;1.0;False;4;FLOAT;1.0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TriplanarNode;99;-2158.423,756.0591;Float;True;Spherical;World;False;Top Texture 1;_TopTexture1;white;-1;None;Mid Texture 5;_MidTexture5;white;-1;None;Bot Texture 5;_BotTexture5;white;-1;None;Triplanar Sampler;False;8;0;SAMPLER2D;;False;5;FLOAT;1.0;False;1;SAMPLER2D;;False;6;FLOAT;0.0;False;2;SAMPLER2D;;False;7;FLOAT;0.0;False;3;FLOAT;1.0;False;4;FLOAT;1.0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;97;-2449.558,1122.413;Float;True;Property;_Height3;Height3;8;0;None;False;white;Auto;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.VertexColorNode;6;-2554.625,117.1729;Float;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;115;-1375.197,749.374;Float;False;3;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TriplanarNode;100;-2071.986,1125.088;Float;True;Spherical;World;False;Top Texture 0;_TopTexture0;white;-1;None;Mid Texture 0;_MidTexture0;white;-1;None;Bot Texture 0;_BotTexture0;white;-1;None;Triplanar Sampler;False;8;0;SAMPLER2D;;False;5;FLOAT;1.0;False;1;SAMPLER2D;;False;6;FLOAT;0.0;False;2;SAMPLER2D;;False;7;FLOAT;0.0;False;3;FLOAT;1.0;False;4;FLOAT;1.0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;130;-2768.419,-708.3405;Float;True;SF_Dirt;0;;52;d7c94d906cf2ff749845754037e31460;0;6;FLOAT3;0;FLOAT3;1;FLOAT3;2;FLOAT4;3;FLOAT4;4;FLOAT4;5
Node;AmplifyShaderEditor.CommentaryNode;58;-1999.133,-1454.467;Float;False;510.4386;469.5946;Dirt and Mud;1;50;;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;116;-837.9775,743.921;Float;False;3;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;111;-1365.911,445.7124;Float;False;Property;_Scale;Scale;7;0;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;112;-401.4976,586.006;Float;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;108;-613.1498,1289.45;Float;False;Constant;_Float0;Float 0;4;0;30;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;107;-722.765,965.082;Float;False;Constant;_Float5;Float 5;4;0;30;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;59;-1369.516,-1449.577;Float;False;327.8551;387.256;Grassy Dirt;1;54;;1,1,1,1;0;0
Node;AmplifyShaderEditor.LayeredBlendNode;51;-2247.698,-622.9502;Float;False;6;0;FLOAT;0.0;False;1;FLOAT3;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LayeredBlendNode;50;-1876.902,-1214.176;Float;False;6;0;FLOAT;0.0;False;1;FLOAT4;0;False;2;FLOAT4;0.0,0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;109;-400.248,398.3557;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LayeredBlendNode;54;-1317.183,-1266.049;Float;False;6;0;FLOAT;0.0;False;1;FLOAT4;0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;120;-1186.815,162.5087;Float;False;3;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;131;-456.6074,23.48242;Float;False;Constant;_Float2;Float 2;5;0;0.45;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;119;-1416.922,285.7799;Float;False;3;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LayeredBlendNode;57;-1934.177,-913.8677;Float;False;6;0;FLOAT;0.0;False;1;FLOAT3;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DistanceBasedTessNode;132;-308.8085,997.6959;Float;False;3;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;42;-1376.527,70.01457;Float;False;Constant;_Float1;Float 1;1;0;0.8;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;110;-212.8318,408.5216;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT3;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;-1104.4,29.97388;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;60,0;Float;False;True;7;Float;ASEMaterialInspector;0;0;Standard;Terrain;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;Back;0;0;False;0;0;Opaque;0.5;True;False;0;False;Opaque;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;0;0;0;0;True;2;15;10;25;True;1;True;0;Zero;Zero;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;FLOAT;0.0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;98;0;95;0
WireConnection;98;3;101;0
WireConnection;98;4;102;0
WireConnection;99;0;96;0
WireConnection;99;3;101;0
WireConnection;99;4;102;0
WireConnection;115;0;98;1
WireConnection;115;1;99;1
WireConnection;115;2;6;3
WireConnection;100;0;97;0
WireConnection;100;3;101;0
WireConnection;100;4;102;0
WireConnection;116;0;115;0
WireConnection;116;1;100;1
WireConnection;116;2;6;3
WireConnection;51;0;6;1
WireConnection;51;1;130;0
WireConnection;51;2;130;1
WireConnection;50;0;6;1
WireConnection;50;1;130;5
WireConnection;50;2;130;4
WireConnection;109;0;116;0
WireConnection;109;1;111;0
WireConnection;54;0;6;3
WireConnection;54;1;50;0
WireConnection;54;2;130;3
WireConnection;120;0;119;0
WireConnection;120;1;100;2
WireConnection;120;2;6;3
WireConnection;119;0;99;2
WireConnection;119;1;98;2
WireConnection;119;2;6;1
WireConnection;57;0;6;3
WireConnection;57;1;51;0
WireConnection;57;2;130;2
WireConnection;132;0;107;0
WireConnection;132;2;108;0
WireConnection;110;0;109;0
WireConnection;110;1;112;0
WireConnection;41;0;6;2
WireConnection;41;1;42;0
WireConnection;0;0;54;0
WireConnection;0;1;57;0
WireConnection;0;4;131;0
WireConnection;0;11;110;0
WireConnection;0;14;132;0
ASEEND*/
//CHKSM=26267CCCDB91289BFCD7562419EE67BDA4616A03