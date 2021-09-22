import React from 'react';
import BrowserWindow from './BrowserWindow';
import { Input } from '@site/../app/javascript/adminterface/base.js';

export default function InputPreview(name, options) {
  const html = new Input('accept', {as: 'boolean'}).render()
  return (
    <BrowserWindow>
      <div className="adminterface-scope" dangerouslySetInnerHTML={{ __html: html }} />
    </BrowserWindow>
  );
}