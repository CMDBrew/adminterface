import BaseInput from './base_input'
import { toHTMLAttrString } from '../utils'

class TextInput extends BaseInput {
  _inputHTML () {
    return `
      <textarea ${toHTMLAttrString(this._inputHTMLOptions())}></textarea>
    `
  }
}

export default TextInput
