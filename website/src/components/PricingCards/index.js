import React from 'react';
import Link from '@docusaurus/Link';
import styles from './styles.module.scss';
import clsx from 'clsx';

function PricingCard({
  className,
  name,
  price,
  discountFrom,
  highlight,
  children,
  purchaseUrl,
}) {
  return (
    <div className={className}>
      <div className={clsx('card card--full-height', highlight ? styles.cardHighlight : null)}>
        {highlight && (<div className={styles.highlight}>{highlight}</div>)}
        <div className="card__header">
          <h3>{name}</h3>
          {discountFrom && (<small className={styles.discountFrom}>{discountFrom}</small>)}
          {price === "0"
            ? <h1 className={styles.price}>
                <span>Free</span>
              </h1>
            : (
              <h1 className={styles.price}>
                <span>${price}</span>
                <sub className={styles.priceSuffix}>/year</sub>
              </h1>
            )
          }
        </div>
        <div className="card__body">{children}</div>
        <div className="card__footer">
          <div className="button-group button-group--block">
            {purchaseUrl
              ? <a className="button button--lg button--primary" href={purchaseUrl}>Get Started</a>
              : <Link className="button button--lg button--secondary" to="/docs/start/installation">Get Started</Link>
            }
          </div>
        </div>
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
    <div className="row">
      <PricingCardCol
        name="Personal"
        price="0">
        Free to use for non-commercial projects
      </PricingCardCol>
      <PricingCardCol
        name="Commerical Signle"
        price="149"
        discountFrom={["$", <s>249</s>, ", 40% off for early adopters"]}
        purchaseUrl="https://github.com/richchw">
        License for one commercial project
      </PricingCardCol>
      <PricingCardCol
        name="Commerical Unlimited"
        discountFrom={["$", <s>749</s>, ", 40% off for early adopters"]}
        highlight="Best Value"
        price="449"
        purchaseUrl="https://github.com/richchw">
        License for unlimited commercial projects
      </PricingCardCol>
    </div>
  );
}
