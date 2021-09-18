/* global adminterface */

const config = {
  debug: false,
  observer: {},
  meta: {},
  clear: () => {
    adminterface.observer = {}
    console.log('observer cleared')
    return true
  }
}

const onDOMReady = () => {
  const metaForComponents = (document.querySelector('#meta-tags-for-js meta[name="components"]') || {})
  const metaForTranslations = (document.querySelector('#meta-tags-for-js meta[name="translations"]') || {})
  const metaForCssClasses = (document.querySelector('#meta-tags-for-js meta[name="css_classes"]') || {})
  const metaForCountries = (document.querySelector('#meta-tags-for-js meta[name="countries"]') || {})
  const metaForTimeZones = (document.querySelector('#meta-tags-for-js meta[name="time_zones"]') || {})
  const components = JSON.parse(metaForComponents.content)
  const translations = JSON.parse(metaForTranslations.content)
  const cssClasses = JSON.parse(metaForCssClasses.content)
  const countries = JSON.parse(metaForCountries.content)
  const timeZones = JSON.parse(metaForTimeZones.content)

  adminterface.meta = { ...adminterface.meta, components, countries, translations, cssClasses, timeZones }
}

document.addEventListener('DOMContentLoaded', onDOMReady)

export default config
