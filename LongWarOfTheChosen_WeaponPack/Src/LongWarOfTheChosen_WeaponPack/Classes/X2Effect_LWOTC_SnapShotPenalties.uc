class X2Effect_LWOTC_SnapshotPenalties extends X2Effect_Persistent config (LongWar_SniperRifle);

var config array<int> SquadsightPenalties;
var config int BaseAimPenalty;

function GetToHitModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{
    local int Tiles;
    local XComGameState_Item SourceWeapon;
    local ShotModifierInfo ShotInfo;

    if (AbilityState.GetMyTemplateName() == 'LWotC_SniperRifleSnapShot')
    {
        SourceWeapon = AbilityState.GetSourceWeapon();    
        if(SourceWeapon != none && SourceWeapon.ObjectID == EffectState.ApplyEffectParameters.ItemStateObjectRef.ObjectID)
        {
            Tiles = Attacker.TileDistanceBetween(Target);       
            if(SquadsightPenalties.Length > 0)
            {
                if(Tiles < SquadsightPenalties.Length)
                {
                    ShotInfo.Value = SquadsightPenalties[Tiles] + default.BaseAimPenalty;
                }            
                else //Use last value
                {
                    ShotInfo.Value = SquadsightPenalties[SquadsightPenalties.Length - 1] + default.BaseAimPenalty;
                }
                ShotInfo.ModType = eHit_Success;
                ShotInfo.Reason = FriendlyName;
                ShotModifiers.AddItem(ShotInfo);
            }
        }    
    }
}

defaultproperties
{
    DuplicateResponse=eDupe_Ignore
    EffectName="LW2WotC_SnapShotAimModifier"
}