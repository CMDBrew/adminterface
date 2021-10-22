import React from 'react';
import Link from '@docusaurus/Link';
import styles from './styles.module.scss';
import clsx from 'clsx';

function PricingCard({
  className,
  cardClassName,
  name,
  price,
  priceSuffix,
  discountFrom,
  highlight,
  children,
  purchaseUrl,
  purchaseBtnText,
  purchaseBtnClassName
}) {
  return (
    <div className={className}>
      <div className={clsx('card card--full-height', highlight ? styles.cardHighlight : null, cardClassName ? styles[cardClassName] : null)}>
        {highlight && (<div className={styles.highlight}>{highlight}</div>)}
        <div className="card__header">
          <h3>{name}</h3>
          {discountFrom && (<small className={styles.discountFrom}>{discountFrom}</small>)}
          {price && (
            <h1 className={styles.price}>
              <span>{typeof(price) === 'number' ? `$${price}` : price}</span>
              {priceSuffix && <small className={styles.priceSuffix}>{priceSuffix}</small>}
            </h1>
          )}
        </div>
        <div className="card__body">{children}</div>
        {purchaseUrl && (
          <div className="card__footer">
            <div className="button-group button-group--block">
              <Link className={clsx('button button--lg', (purchaseBtnClassName ? purchaseBtnClassName : 'button--primary'))} to={purchaseUrl}>
                {purchaseBtnText ? purchaseBtnText : "Get Started"}
              </Link>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

function PricingCardCol(props) {
  return (
    <PricingCard {...props} className={'col col--4 margin-bottom--lg'} />
  );
}

export function PricingRow() {
  return (
    /* @TODO: add purchase urls */
    <div className="row">
      <PricingCardCol
        name="Personal"
        price="Free forever"
        purchaseUrl="/docs/intro"
        purchaseBtnText="Get Started"
        purchaseBtnClassName="button--secondary">
        <p>For personal or non-commercial projects. <Link to="/docs/terms#fees-and-license">Check eligibility</Link>.</p>
      </PricingCardCol>
      <PricingCardCol
        name="Commercial"
        price={149}
        priceSuffix={["USD", <br/>, "/year"]}
        discountFrom={["$", <s>249 USD / year</s>, ", 40% off for early adopters"]}
        purchaseUrl="https://buy.stripe.com/bIYbJy2ul0btf3G7sw"
        purchaseBtnText="Get a License">
        <p>Build one project with Adminterface.</p>
      </PricingCardCol>
      <PricingCardCol
        name="Enterprise"
        cardClassName="cardNotice"
        purchaseUrl="https://form.typeform.com/to/XEpIALQv"
        purchaseBtnText="Contact Us"
        purchaseBtnClassName="button--success">
        <p className={styles.subHeading}>
          Don't see a plan that fits your needs? Looking for a volume commercial license plan?&nbsp;
        </p>
      </PricingCardCol>
    </div>
  );
}
