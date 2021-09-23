import React from 'react';
import styles from './styles.module.scss';

function BrowserWindow({children, minHeight}) {
  return (
    <div className={styles.browserWindow} style={{minHeight}}>
      <div className={styles.browserWindowHeader}>
        <div className={styles.buttons}>
          <span className={styles.dot} style={{background: '#f25f58'}} />
          <span className={styles.dot} style={{background: '#fbbe3c'}} />
          <span className={styles.dot} style={{background: '#58cb42'}} />
        </div>
      </div>

      <div className={styles.browserWindowBody}>{children}</div>
    </div>
  );
}

export default BrowserWindow;
