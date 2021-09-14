import React from 'react';
import clsx from 'clsx';
import Layout from '@theme/Layout';
import Link from '@docusaurus/Link';
import useBaseUrl from '@docusaurus/useBaseUrl';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import ReactCompareImage from 'react-compare-image';
import styles from './index.module.scss';
import HomepageFeatures from '../components/HomepageFeatures';

function HomepageHeader() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <header className={clsx('hero', styles.heroBanner)}>
      <div className="container">
        <div className="row">
          <div className="col col--7 margin-bottom--lg">
            <h1 className="hero__title">
              Build <b>functional</b> web apps <b>quickly</b>, focus on your <b>core needs</b>
            </h1>
            <p className="hero__subtitle">{siteConfig.tagline}</p>
            <div className={styles.buttons}>
              <Link
                className={`button button--primary button--lg ${styles.buttonsButton}`}
                to="/pricing">
                Get Started
              </Link>
              <Link
                className={`button button--secondary button--lg ${styles.buttonsButton}`}
                to="https://demo.adminterface.io/">
                Try Demo
              </Link>
            </div>
          </div>
          <div className={clsx('col col--5 margin-bottom--lg', styles.imageCompare)}>
            <ReactCompareImage
              leftImage={useBaseUrl('/img/demo/after.png')}
              rightImage={useBaseUrl('/img/demo/before.png')}
              sliderLineColor="#614092"
              sliderLineWidth={5}
            />
          </div>
        </div>
      </div>
    </header>
  );
}

export default function Home() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <Layout
      title={`Hello from ${siteConfig.title}`}
      description={`${siteConfig.tagline}`}>
      <HomepageHeader />
      <main>
        <HomepageFeatures />
      </main>
    </Layout>
  );
}
