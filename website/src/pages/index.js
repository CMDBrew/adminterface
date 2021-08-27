import React from 'react';
import clsx from 'clsx';
import Layout from '@theme/Layout';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import styles from './index.module.css';
import HomepageFeatures from '../components/HomepageFeatures';

function HomepageHeader() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <header className={clsx('hero hero--primary', styles.heroBanner)}>
      <div className="container">
        {/* <h1 className="hero__title">{siteConfig.title}</h1>
        <p className="hero__subtitle">{siteConfig.tagline}</p> */}
        <h1 className="hero__title">Build mobile responsive, extendable, and customizable apps</h1>
        <p className="hero__subtitle">ActiveAdmin Bootstrap at your service</p>
        <div className={styles.buttons}>
          <Link
            className={`button button--secondary button--lg ${styles.buttonsButton}`}
            to="/docs/intro">
            Learn More
          </Link>
          <Link
            className={`button button--secondary button--lg ${styles.buttonsButton}`}
            to="/community/support">
            Contact Us
          </Link>
        </div>
      </div>
    </header>
  );
}

export default function Home() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <Layout
      // title={`Hello from ${siteConfig.title}`}
      // description="Description will go into a meta tag in <head />">
      title={`Welcome to ${siteConfig.title}`}
      description="Welcome to ActiveAdmin Bootstrap. Build mobile responsive, extendable, and customizable app.">
      <HomepageHeader />
      <main>
        <HomepageFeatures />
      </main>
    </Layout>
  );
}
