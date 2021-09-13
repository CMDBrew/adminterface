import React from 'react';
import Layout from '@theme/Layout';
import clsx from 'clsx';
import styles from './styles.module.scss';
import Link from '@docusaurus/Link';
import {
  PricingRow,
} from '@site/src/components/PricingCards';

function FAQs() {
  return (
    <div className={styles.section}>
      <div className="container">
        <div className="row">
          <div className="col col--4">
            <h1 className={styles.sectionTitle}>Frequently asked questions</h1>
            <p>Can’t find the answer you’re looking for? Reach out to <Link to="/community/support">our support team</Link>.</p>
          </div>
          <div className="col col--8">
            <details className={styles.faq}>
              <summary>
                <h3 className={styles.question}>What are the requirements to use Adminterface?</h3>
              </summary>
              <div>
                We keep the gem up-to-date with ActiveAdmin. See the <Link to="/docs/start/installation#requirements">complete list of requirements</Link> for more information.
              </div>
            </details>
            <details className={styles.faq}>
              <summary>
                <h3 className={styles.question}>What are the dependencies and their licenses?</h3>
              </summary>
              <div>
                All our dependencies are open-source and commercial-friendly. See the <Link to="/docs/start/dependencies">complete list of dependencies</Link> for more information.
              </div>
            </details>
            <details className={styles.faq}>
              <summary>
                <h3 className={styles.question}>Do you have a sample app I could look at to see the features?</h3>
              </summary>
              <div>
                Check our <Link to="https://demo.adminterface.io/">demo app</Link> to preview the features. However, we encourage you to <Link to="https://github.com/CMDBrew/demo.adminterface.io">download our demo app</Link> and experience the customizability yourself.
              </div>
            </details>
            <details className={styles.faq}>
              <summary>
                <h3 className={styles.question}>Can I make changes to code as I see fit?</h3>
              </summary>
              <div>
                Yes, the source code is downloadable. You can change it or extend it to your needs. However, we encourage you to <Link to="/community/support">submit issues or feature requests</Link> if it is something you think others can benefit from as well.
              </div>
            </details>
            <details className={styles.faq}>
              <summary>
                <h3 className={styles.question}>Can Adminterface be integrated into existing applications?</h3>
              </summary>
              <div>
                Yes, you can add this gem to your existing application as long as your app meets the <Link to="/docs/start/installation#requirements">requirements</Link>.
              </div>
            </details>
            <details className={styles.faq}>
              <summary>
                <h3 className={styles.question}>Why is it a subscription?</h3>
              </summary>
              <div>
                Subscriptions allow us to continue providing updates and maintenance for new versions of our dependencies (i.e., Rails, ActiveAdmin, Bootstrap), bug fixes, new features, and enhancements.
              </div>
            </details>
            <details className={styles.faq}>
              <summary>
                <h3 className={styles.question}>What license is the product under?</h3>
              </summary>
              <div>
                Please read our <Link to="/docs/terms">Terms of Service</Link>.
              </div>
            </details>
            <details className={styles.faq}>
              <summary>
                <h3 className={styles.question}>What kind of support do you offer?</h3>
              </summary>
              <div>
                We offer support via email or our discussion forum for implementation and integration questions. See our <Link to="/community/support">support page</Link> for more information.
              </div>
            </details>
            <details className={styles.faq}>
              <summary>
                <h3 className={styles.question}>What is your update policy?</h3>
              </summary>
              <div>
                We are currently offering free updates that you can apply using git.
              </div>
            </details>
            <details className={styles.faq}>
              <summary>
                <h3 className={styles.question}>What is your return policy?</h3>
              </summary>
              <div>
                If you find Adminterface doesn’t work for you, we’ll give you a full refund within 15 days of purchase. In return, we ask that you delete all copies of Adminterface, for which you got a refund.
              </div>
            </details>
            <details className={styles.faq}>
              <summary>
                <h3 className={styles.question}>How does Adminterface's license enforcement work?</h3>
              </summary>
              <div>
                {/* @TODO: need to verify the process later */}
                When the app boots, it makes a request to our server that verifies the license.
              </div>
            </details>
            <details className={styles.faq}>
              <summary>
                <h3 className={styles.question}>Can I build a site for a client and transfer the commercial license to them later?</h3>
              </summary>
              <div>
                Absolutely! <Link to="/community/support">Reach out to us</Link>, and we will take care of it.
              </div>
            </details>
            <details className={styles.faq}>
              <summary>
                <h3 className={styles.question}>Can I upgrade to the unlimited license later?</h3>
              </summary>
              <div>
                Of course! You can purchase a single-use license now and upgrade it anytime later on. <Link to="/community/support">Reach out to us</Link>, and we will take care of it.
              </div>
            </details>
            <details className={styles.faq}>
              <summary>
                <h3 className={styles.question}>Do I need a different license for each environment?</h3>
              </summary>
              <div>
                No, one license covers all environments (i.e., development, testing, QA) for that app.
              </div>
            </details>
          </div>
        </div>
      </div>
    </div>
  )
}

function Pricing() {
  return (
    <Layout title="Pricing">
      <header className={clsx('hero', styles.heroBanner)}>
        <div className="container">
          <h1 className="hero__title hero__title--lg">Pricing that fits your needs</h1>
          <p className="hero__subtitle">Simple, straightforward pricing to get your project up and running</p>
          <br/>
          <PricingRow />
        </div>
      </header>

      <main>
        <div className={clsx(styles.section, styles.sectionAlt)}>
          <div className="container">
            <h1 className={styles.sectionTitle}>Everything's included, always</h1>
            <p className="hero__subtitle mb-0">Every pricing plan will always include all features. There are absolutely no functionality differences with Adminterface's pricing plan.</p>
          </div>
        </div>
        <FAQs />
      </main>
    </Layout>
  );
}

export default Pricing;