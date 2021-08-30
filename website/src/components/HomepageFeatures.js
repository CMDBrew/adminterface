import React from 'react';
import clsx from 'clsx';
import styles from './HomepageFeatures.module.css';

const FeatureList = [
  {
    title: 'ActiveAdmin + Bootstrap',
    Svg: require('../../static/img/undraw_docusaurus_tree.svg').default,
    description: (
      <>
        Combining popular Ruby on Rails plugin and CSS framework together to build apps with styles and extendable features seamlessly.  Allows you to customize your apps to match the branding, styling, and theming with ease so you can focus on building a great app.
      </>
    ),
  },
  {
    title: 'Mobile Responsive',
    Svg: require('../../static/img/undraw_docusaurus_mountain.svg').default,
    description: (
      <>
        Navigate and manage your application on the go with your mobile and tablet devices. Saves you the trouble of constant zooming in and out or scrolling around while viewing your app.
      </>
    ),
  },
  {
    title: 'Granular Customization',
    Svg: require('../../static/img/undraw_docusaurus_react.svg').default,
    description: (
      <>
        Customize the application for the namespace, the resource, or the whole app to any way you want for any type of project.
      </>
    ),
  },
  {
    title: 'Compatible with Popular Plugins',
    Svg: require('../../static/img/undraw_docusaurus_react.svg').default,
    description: (
      <>
        We have integrated with a couple of popular plugins. You can view a list of our dependencies and their licenses <a href="/active_admin_bootstrap/docs/start/dependencies">here</a>.
      </>
    ),
  },
  {
    title: 'Build Intuitively',
    Svg: require('../../static/img/undraw_docusaurus_react.svg').default,
    description: (
      <>
        We've inherited all the features from ActiveAdmin so you can add this gem on top of your existing project easily.
      </>
    ),
  },
  {
    title: 'Actively Maintained',
    Svg: require('../../static/img/undraw_docusaurus_react.svg').default,
    description: (
      <>
        The gem will be actively maintained by our team to ensure it is up-to-date. We also welcome feedbacks from the <a href="/active_admin_bootstrap/community/support">community</a> to keep improving the gem for everyone.
      </>
    ),
  },
];

function Feature({Svg, title, description}) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <Svg className={styles.featureSvg} alt={title} />
      </div>
      <div className="text--center padding-horiz--md">
        <h3>{title}</h3>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures() {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
