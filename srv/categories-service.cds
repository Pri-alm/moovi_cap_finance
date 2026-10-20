using cap.schema from '../db/schema';

service categories {
    @UI: {
        SelectionFields : [name],
        LineItem : [
            {
                Value: icon,
                Label: 'Ícone'
            },
            {
                Value: name,
                Label: 'Nome'
            }
        ],
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

    entity Categories @(Capabilities: {
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
    }) as projection on schema.Categories;

    annotate Categories with @odata.draft.enabled;
}