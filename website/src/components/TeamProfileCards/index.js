import React from 'react';
import Translate from '@docusaurus/Translate';
import Link from '@docusaurus/Link';

function WebsiteLink({to, children}) {
  return (
    <Link to={to}>
      {children || (
        <Translate id="team.profile.websiteLinkLabel">website</Translate>
      )}
    </Link>
  );
}

function TeamProfileCard({
  className,
  name,
  children,
  githubUrl,
  twitterUrl,
}) {
  return (
    <div className={className}>
      <div className="card card--full-height">
        <div className="card__header">
          <div className="avatar avatar--vertical">
            <img
              className="avatar__photo avatar__photo--xl"
              src={githubUrl + '.png'}
              alt={`${name}'s avatar`}
            />
            <div className="avatar__intro">
              <h3 className="avatar__name">{name}</h3>
            </div>
          </div>
        </div>
        <div className="card__body">{children}</div>
        <div className="card__footer">
          <div className="button-group button-group--block">
            {githubUrl && (
              <a className="button button--secondary" href={githubUrl}>
                GitHub
              </a>
            )}
            {twitterUrl && (
              <a className="button button--secondary" href={twitterUrl}>
                Twitter
              </a>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}

function TeamProfileCardCol(props) {
  return (
    <TeamProfileCard {...props} className={'col col--6 margin-bottom--lg'} />
  );
}

export function ActiveTeamRow() {
  return (
    <div className="row">
      <TeamProfileCardCol
        name="I-Lung Lee"
        githubUrl="https://github.com/ilunglee">
        <Translate id="team.profile.I-Lung Lee.body">
          Creator of ActiveAdminBootstrap and its predecessors, passionate about anything software-related, loves Ruby and RoR.
        </Translate>
      </TeamProfileCardCol>
      <TeamProfileCardCol
        name="Richard Wang"
        githubUrl="https://github.com/richchw">
        <Translate id="team.profile.Richard Wang.body">
          Project Manager and Developer. Writes docs and experiment things here and there.
        </Translate>
      </TeamProfileCardCol>
    </div>
  );
}
