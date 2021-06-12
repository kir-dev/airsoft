import React from "react"
import PropTypes from "prop-types"
import {FormBuilder} from "@ginkgo-bioworks/react-json-schema-form-builder";
class JsonFormBuilder extends React.Component {
  constructor(props) {
      super(props);
      this.state ={
          schema: this.props.schema,
          uischema:this.props.uischema
      }
  }

    render () {
    return (
        <FormBuilder
            schema={this.state.schema}
            uischema={this.state.schema}
            onChange={(newSchema,newUiSchema) =>{
                this.setState({
                    schema:newSchema,
                    uischema:newUiSchema
                })
            }}
        />
    );
  }
}

JsonFormBuilder.propTypes = {
  schema: PropTypes.string,
  uischema: PropTypes.string
};
export default JsonFormBuilder
