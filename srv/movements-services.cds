using cap.schema from '../db/schema';

service movements {

    entity Movements @(Capabilities: {
        InsertRestrictions: {
            $Type: 'Capabilities.InsertRestrictionsType',
            Insertable: true
        },
        UpdateRestrictions: {
            $Type: 'Capabilities.UpdateRestrictionsType',
            Updatable: true
        },
        DeleteRestrictions: {
            $Type: 'Capabilities.DeleteRestrictionsType',
            Deletable: true
        }
    }) as projection on schema.Movements {
        ID,
        title,
        amount,
        type,
        type.description as type_name,
        wallet,
        wallet.name as wallet_name,
        category,
        category.icon || ' ' || category.name as category_name : String(50)
    };

    annotate Movements with @odata.draft.enabled;
}