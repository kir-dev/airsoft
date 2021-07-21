import React from "react"
import PropTypes from "prop-types"

class ParticipationList extends React.Component {

    getKeys = (schema_string) => {
        const schema = JSON.parse(schema_string)
        return Object.entries(schema.properties)?.map(prop => {
            return {
                id: prop[0],
                name: prop[1].title || prop[0]
            }
        })
    }

    constructor(props) {
        super(props);
        this.getHeader = this.getHeader.bind(this);
        this.getRows = this.getRows.bind(this);

        this.keys = this.getKeys(this.props.schema);
        this.data = JSON.parse(this.props.data)
    }

    getHeader = function () {
        return this.keys.map(key => {
            return <th key={key.id}>{key.name}</th>
        })
    }


    getRows = function () {
        return this.data.map((row,idx) =>{
            return <tr key={idx}>
                <td> {row.user} </td>
                {this.keys.map(key =>{
                    return <td key={key.id}>
                        { String(row.form_data[key.id] ) }
                    </td>
                })}
            </tr>
        })
    }


    render() {
        return (
            <table className="table">
                <thead>
                <tr>
                    <th>Felhasználó</th>
                    {this.getHeader()}
                </tr>
                </thead>
                <tbody>
                {this.getRows()}
                </tbody>
            </table>
        );
    }
}

ParticipationList.propTypes = {
    schema: PropTypes.string,
    data: PropTypes.string
}
;
export default ParticipationList
