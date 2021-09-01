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
        With Bootstrap integrated into ActiveAdmin, you can quickly apps— not just admin panels— that match your branding and spend more time on the core functionalities.
      </>
    ),
  },
  {
    title: 'Mobile Responsive',
    Svg: require('../../static/img/features/mobile.svg').default,
    description: (
      <>
        With mobile responsiveness, you can now build apps using ActiveAdmin for any purpose and not just internal apps for admin users.
      </>
    ),
  },
  {
    title: 'Granular Customization',
    Svg: require('../../static/img/features/customization.svg').default,
    description: (
      <>
        Customizing your app has never been easier with the flexibility to specify
        how components behave and display for your app globally, in a namespace, or for a specific resource.
      </>
    ),
  },
  {
    title: 'Extended Functionalities',
    Svg: require('../../static/img/features/extended.svg').default,
    description: (
      <>
        We've extended ActiveAdmin's functionalities and addresses some of its main limitations. <Link to="docs/intro">Check the docs</Link> to see what's new.
        In addition, we've removed jQuery from the dependency.
      </>
    ),
  },
  {
    title: 'Familiar DSL',
    Svg: require('../../static/img/features/familiar.svg').default,
    description: (
      <>
        We've inherited the DSL from ActiveAdmin, so you can easily add this gem to your existing project using familiar approaches.
      </>
    ),
  },
  {
    title: 'Actively Maintained',
    Svg: require('../../static/img/features/maintain.svg').default,
    description: (
      <>
        We keep this gem updated regularly to bring you all the goodies from Rails and ActiveAdmin.
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
