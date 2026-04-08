import React, { useRef, useState, useEffect, useCallback } from 'react';
import styles from './WebBankEmbed.module.css';

interface WebBankEmbedProps {
  route?: string;
  height?: number;
  accessible?: boolean;
}

const APP_ORIGIN = 'http://localhost:8080';

export default function WebBankEmbed({
  route = '/',
  height: initialHeight = 500,
  accessible,
}: WebBankEmbedProps) {
  const iframeRef = useRef<HTMLIFrameElement>(null);
  const [height, setHeight] = useState(initialHeight);

  const sendMessage = useCallback(
    (type: string, payload: Record<string, unknown> = {}) => {
      iframeRef.current?.contentWindow?.postMessage(
        { source: 'webbank-tutorial', type, ...payload },
        APP_ORIGIN,
      );
    },
    [],
  );

  useEffect(() => {
    if (route) {
      sendMessage('navigate', { route });
    }
  }, [route, sendMessage]);

  useEffect(() => {
    if (accessible !== undefined) {
      sendMessage('setAccessible', { accessible });
    }
  }, [accessible, sendMessage]);

  const handleReload = () => {
    iframeRef.current?.contentWindow?.location.reload();
  };

  const handleToggleAccessible = () => {
    sendMessage('toggleAccessible');
  };

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <span>WebBank Preview</span>
        <div className={styles.controls}>
          <button
            className={styles.controlButton}
            onClick={handleToggleAccessible}
            title="Toggle accessible mode"
          >
            Toggle A11y
          </button>
          <button
            className={styles.controlButton}
            onClick={handleReload}
            title="Reload app"
          >
            Reload
          </button>
        </div>
      </div>
      <iframe
        ref={iframeRef}
        className={styles.iframe}
        src={APP_ORIGIN}
        style={{ height }}
        title="WebBank Flutter web app"
        allow="clipboard-write"
      />
      <div
        className={styles.resizeHandle}
        onMouseDown={(e) => {
          e.preventDefault();
          const startY = e.clientY;
          const startHeight = height;
          const onMove = (ev: MouseEvent) => {
            setHeight(Math.max(200, startHeight + ev.clientY - startY));
          };
          const onUp = () => {
            document.removeEventListener('mousemove', onMove);
            document.removeEventListener('mouseup', onUp);
          };
          document.addEventListener('mousemove', onMove);
          document.addEventListener('mouseup', onUp);
        }}
      >
        drag to resize
      </div>
    </div>
  );
}
