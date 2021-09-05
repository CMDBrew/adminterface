import React from 'react';
import clsx from 'clsx';
import Link from '@docusaurus/Link';
import styles from './HomepageFeatures.module.css';

const FeatureList = [
  {
    title: 'ActiveAdmin with Bootstrap',
    Svg: require('../../static/img/features/bootstrap.svg').default,
    description: (
      <>
        Quickly build apps, not just admin panels, that match your branding and spend more time on the core functionalities with Bootstrap integrated into ActiveAdmin.
      </>
    ),
  },
  {
    title: 'Mobile Responsive',
    Svg: require('../../static/img/features/mobile.svg').default,
    description: (
      <>
        Use your apps on mobile and tablet devices. You can now use ActiveAdmin to build mobile responsive apps for any project.
      </>
    ),
  },
  {
    title: 'Granular Customization',
    Svg: require('../../static/img/features/customization.svg').default,
    description: (
      <>
        Customizing how components behave and display for the entire app, a namespace, or a specific resource has never been this easy and flexible with ActiveAdmin.
      </>
    ),
  },
  {
    title: 'Extended Functionalities',
    Svg: require('../../static/img/features/extended.svg').default,
    description: (
      <>
        ActiveAdmin is now even more powerful with extended functionalities and features from Adminterface. <Link to="docs/intro">Check the docs</Link> to see what's new.
      </>
    ),
  },
  {
    title: 'Familiar DSL',
    Svg: require('../../static/img/features/familiar.svg').default,
    description: (
      <>
        Use the approaches you are already familiar with inside ActiveAdmin to extend your projects with all the features of Adminterface.
      </>
    ),
  },
  {
    title: 'Actively Maintained',
    Svg: require('../../static/img/features/maintain.svg').default,
    description: (
      <>
        Adminterface is actively maintained and updated to bring you all the goodies from Rails and ActiveAdmin.
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
