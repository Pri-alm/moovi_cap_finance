using cap.schema from '../db/schema';

service movementsTypes {
    @UI: {
        SelectionFields : [name],
        LineItem : [
            {
                Value: description,
                Label: 'Descrição'
            }],
        Facets: [{
            $Type : 'UI.ReferenceFacet',
            Label : 'Detalhes da Carteira',
            Target: '@UI.FieldGroup#Main'
        }],
        FieldGroup #Main: {Data: [{
            Value: name,
            Label: 'Nome'
        }]},
    }

    entity MovementsTypes @(Capabilities: {
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
    }) as projection on schema.MovementType;

    annotate MovementsTypes with @odata.draft.enabled;
}