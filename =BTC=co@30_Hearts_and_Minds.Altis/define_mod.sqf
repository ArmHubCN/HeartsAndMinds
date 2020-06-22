btc_custom_loc = [
/*
    DESCRIPTION: [POS(Array),TYPE(String),NAME(String),RADIUS X(Number),RADIUS X(Number),IS OCCUPIED(Bool)]
    Possible types: "NameVillage","NameCity","NameCityCapital","NameLocal","Hill","Airport","NameMarine"
    EXAMPLE: [[13132.8,3315.07,0.00128174],"NameVillage","Mountain 1",800,800,true]
*/
];

/*
    Here you can specify which equipment should be added or removed from the arsenal.
    Please take care that there are different categories (weapons, magazines, items, backpacks) for different pieces of equipment into which you have to classify the classnames.
    In all cases, you need the classname of an object.

    Attention: The function of these lists depends on the setting in the mission parameter (Restrict arsenal).
        - "Full": here you have only the registered items in the arsenal available.
        - "Remove only": here all registered items are removed from the arsenal. This only works for the ACE3 arsenal!

    Example(s):
        private _weapons = [
            "arifle_MX_F",          //Classname for the rifle MX
            "arifle_MX_SW_F",       //Classname for the rifle MX LSW
            "arifle_MXC_F"          //Classname for the rifle MXC
        ];

        private _items = [
            "G_Shades_Black",
            "G_Shades_Blue",
            "G_Shades_Green"
        ];
*/
private _weapons = [
    "launch_B_Titan_short_tna_F",
    "launch_O_Titan_short_ghex_F",
    "launch_B_Titan_tna_F",
    "launch_O_Titan_ghex_F",
    "launch_I_Titan_eaf_F",
    "launch_B_Titan_olive_F",
    "launch_I_Titan_short_F",
    "launch_B_Titan_short_F",
    "launch_O_Titan_short_F",
    "launch_O_Titan_F",
    "launch_L_Titan_F",
    "launch_B_Titan_F",
    "launch_O_Vorona_brown_F",
    "launch_O_Vorona_green_F",
    "launch_MRAWS_olive_rail_F",
    "launch_MRAWS_sand_rail_F",
    "launch_MRAWS_green_rail_F",
    "launch_MRAWS_olive_F",
    "launch_MRAWS_sand_F",
    "launch_MRAWS_green_F"

];
private _magazines = [];
private _items = [
    "H_HelmetO_ViperSP_hex_F",
    "H_HelmetO_ViperSP_ghex_F",
    "NVGogglesB_gry_F",
    "NVGogglesB_grn_F",
    "NVGogglesB_blk_F",
    "V_PlateCarrierGL_mtp",
    "V_PlateCarrierGL_wdl",
    "V_PlateCarrierGL_rgr",
    "V_PlateCarrierGL_blk",
    "V_PlateCarrierSpec_mtp",
    "V_PlateCarrierSpec_wdl",
    "V_PlateCarrierSpec_rgr",
    "V_PlateCarrierSpec_blk",
    "U_I_Protagonist_VR",
    "U_C_Protagonist_VR",
    "U_O_Protagonist_VR",
    "U_B_Protagonist_VR",
    "B_ViperHarness_blk_F",
    "B_ViperHarness_ghex_F",
    "B_ViperHarness_hex_F",
    "B_ViperHarness_khk_F",
    "B_ViperHarness_oli_F",
    "B_ViperLightHarness_blk_F",
    "B_ViperLightHarness_ghex_F",
    "B_ViperLightHarness_hex_F",
    "B_ViperLightHarness_khk_F",
    "B_ViperLightHarness_oli_F",
    "UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A"
];
private _backpacks = [
    "B_Bergen_mcamo_F",
    "B_Bergen_hex_F",
    "B_Bergen_dgtl_F",
    "B_Bergen_tna_F"
];

btc_custom_arsenal = [_weapons, _magazines, _items, _backpacks];

/*
    Here you can specify which equipment is loaded on player connection.
*/

private _radio = ["tf_anprc152", "ACRE_PRC148"] select (isClass(configFile >> "cfgPatches" >> "acre_main"));
//Array of colored item: 0 - Desert, 1 - Tropic, 2 - Black, 3 - forest
private _uniforms = ["U_B_CombatUniform_mcam", "U_B_CTRG_Soldier_F", "U_B_CTRG_1", "U_B_CombatUniform_mcam_wdl_f"];
private _vests = ["V_PlateCarrierH_CTRG", "V_PlateCarrier2_rgr_noflag_F", "V_PlateCarrierH_CTRG", "V_PlateCarrier2_wdl"];
private _helmets = ["H_HelmetSpecB_paint2", "H_HelmetB_Enh_tna_F", "H_HelmetSpecB_blk", "H_HelmetSpecB_wdl"];
private _hoods = ["G_Balaclava_combat", "G_Balaclava_TI_G_tna_F", "G_Balaclava_combat", "G_Balaclava_combat"];
private _laserdesignators = ["Laserdesignator", "Laserdesignator_03", "Laserdesignator_01_khk_F", "Laserdesignator_01_khk_F"];
private _night_visions = ["NVGoggles", "NVGoggles_INDEP", "NVGoggles_OPFOR", "NVGoggles_INDEP"];
private _weapons = ["arifle_MXC_F", "arifle_MXC_khk_F", "arifle_MXC_Black_F", "arifle_MXC_Black_F"];
private _weapons_machineGunner = ["arifle_MX_SW_F", "arifle_MX_SW_khk_F", "arifle_MX_SW_Black_F", "arifle_MX_SW_Black_F"];
private _weapons_sniper = ["arifle_MXM_F", "arifle_MXM_khk_F", "arifle_MXM_Black_F", "arifle_MXM_Black_F"];
private _bipods = ["bipod_01_F_snd", "bipod_01_F_khk", "bipod_01_F_blk", "bipod_01_F_blk"];
private _pistols = ["hgun_P07_F", "hgun_P07_khk_F", "hgun_P07_F", "hgun_P07_khk_F"];
private _launcher_AT = ["launch_B_Titan_short_F", "launch_B_Titan_short_tna_F", "launch_O_Titan_short_F", "launch_B_Titan_short_tna_F"];
private _launcher_AA = ["launch_B_Titan_F", "launch_B_Titan_tna_F", "launch_O_Titan_F", "launch_B_Titan_tna_F"];
private _backpacks = ["B_AssaultPack_Kerry", "B_AssaultPack_eaf_F", "B_AssaultPack_blk", "B_AssaultPack_wdl_F"];
private _backpacks_big = ["B_Kitbag_mcamo", "B_Kitbag_rgr", "B_Kitbag_rgr", "B_Kitbag_rgr"];

btc_arsenal_loadout = [_uniforms, _vests, _helmets, _hoods, _laserdesignators, _night_visions, _weapons, _weapons_sniper, _weapons_machineGunner, _bipods, _pistols, _launcher_AT, _launcher_AA, _backpacks, _backpacks_big, [_radio, _radio, _radio, _radio]];
