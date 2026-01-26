Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB79DD19502
	for <ath12k@archiver.kernel.org>; Mon, 26 Jan 2026 17:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UXET+yKR11nAsd6NXzgFkGpzSC8xPOk/Tq9mMH8TKLY=; b=hakr9Rr2PKsYPkbfKE2kwi/M84
	qI2l/+1hzLoEPX5glzTH3z9LguP9tFeiC14DlJl+lvUys5AWBat99TCcjuvWbBIXj4QO2ua2lxLrr
	Bs8WChgMSjmeXOfi9gQRzJfsYQLtu2h/jxSFZnC4nAqkHn1ueUAsouOMwymXzSngjcGdHggh0DuzD
	65pEoAWKz7zm+yUuo+qZkEQ0dmPW1lPFjICwoczNHIBxisAK9GNwoS1NFBIXwnGVnjVoxOSIZriva
	o76g9SjcKOfwVibbjoDkdwWG34il38bGiZxUgy2o2Ia1H1c2amW05YA1e5r1Exf4Y75gKIIkQMlzl
	G9+NfB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQWm-0000000CzIA-1Noj;
	Mon, 26 Jan 2026 17:37:28 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQWg-0000000CzHl-2HeB
	for ath12k@lists.infradead.org;
	Mon, 26 Jan 2026 17:37:24 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so4460284f8f.1
        for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 09:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1769449040; x=1770053840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UXET+yKR11nAsd6NXzgFkGpzSC8xPOk/Tq9mMH8TKLY=;
        b=ihfaJcSxAgwGgWgHMfrwjNbQDnMQRHuSRMG6RUSATJpjfdsPv3+x+jMSFQQcNQEJD4
         BcJ0ApUVdGaaWb37titqF7rql0aqA+fUh4+frtg31iQ4R1WgaEZitMfUnCa8iPLJqW6r
         yZ338teYOVTiWMC5LoukLwS5PhpaCfI9qUDTmyic+VoJfgO2WoPuxMWMhA+hy8tIYu2v
         oLogFsVVzCAC1CNeKyyseMWzEBkpgFCnruB8JBSmmJZJTxjnjP6xApD3oQirHNOITiA2
         Q0PxZN6tK3Ve9UKmqHhOcBcYtS3sVTWaOq1hiR2Izrg+RvfE3C1YXZd9uItlREcydWre
         CHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769449040; x=1770053840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXET+yKR11nAsd6NXzgFkGpzSC8xPOk/Tq9mMH8TKLY=;
        b=Ntr+INDq4rV0/HgC3eHsa4C+Lj8kBvUOL2OCE8+uO97eQ9D5D6bJxfGtuMaHFdJ2H+
         hzqa0KoyHA8Z3AQjtNDMVP2407EAK3eTQEyftTmoE804jZcT3FuWfd6U9umcZw/6D3CM
         eele6F4PZVtf6ccV9QfOVe4g5b/LYzrA9lkmQMX08fg/aAT4mBlTM5QZXbq0pqqb3Y7f
         vAP+4gNECAj+EOpqndgmieSV06s+6Rzt6lsbqmIP8snprNSDZpmWOjpAhFUzmMYh4ED5
         2NancsJ6cjL68QVFMzZH7oUVjX0k/GGzDhfiYH+4aINUdKjil8BNvq640wKgZYABMcte
         sHMA==
X-Gm-Message-State: AOJu0YxNBSs9RfXEudeuM/FDiLiWKi94HKLbUSBawPeQdT27ENL/Y74I
	WdK4+A6ftxlUSMGQCz/+BGmJlKsDAG4GP4/eDncCzYMf1ELjN7BNXTnitDVC/uA0j04EXAhDPb3
	JubSTRlE=
X-Gm-Gg: AZuq6aKfMaXvWY5wUNhPOMjRLkKW689j4JDaIlB1eyvahpu+Ydmg3+cHdArm23F2/oP
	imKNxt609VUYPiyGEVyFsYodpH/4eU/d5sZB2fk4yjD7P5qor47Vq4aHsQ0xzmYuA9DOSDTyh0O
	AM3TQeRM1oYHJUNOCx5026iCeG4ahx/CWJtkA+TKYquolcqzJCkKtsa0YmC/OrAuBB2jZX8Hhz3
	jUjBV8SBBZKVDBWI8qHlRaXHtRRYdfybNx2Mi+0CLs84Gu0BF4J0nWlKlY/zDCM4IL9zo1zF8SY
	pD9ukbTmY+LDRRqNaD+18eGRFXq9+9ej8syrCw1rCihJc3dqd6BQaZQqgYdGxm8C0PichN59Irf
	Ieplpcgrt9f98FDblH8enlIweR1l4psH7r0V5BIb7dy484T9kZTfphVyb6B2R1EbUBBp8PepiEr
	xqozMKcIhU7HyOJ8HP+lHERsv0Lp3sQU7N713U7q5sHVouEBTabKlE5taKAKfe9ovDRami
X-Received: by 2002:a05:6000:26c1:b0:431:35a:4a8f with SMTP id ffacd0b85a97d-435ca1aa92dmr8226709f8f.47.1769449039905;
        Mon, 26 Jan 2026 09:37:19 -0800 (PST)
Received: from pablomg-ThinkStation-P620.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a8asm31558460f8f.12.2026.01.26.09.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 09:37:19 -0800 (PST)
From: Pablo Martin-Gomez <pmartin-gomez@freebox.fr>
To: ath12k@lists.infradead.org,
	jeff.johnson@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org,
	Pablo Martin-Gomez <pmartin-gomez@freebox.fr>
Subject: [PATCH ath-current v2] wifi: ath12k: fix wrong TID passed when stopping AMPDU session
Date: Mon, 26 Jan 2026 18:36:54 +0100
Message-ID: <20260126173655.1369715-1-pmartin-gomez@freebox.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_093722_835050_E9EABDFF 
X-CRM114-Status: GOOD (  11.92  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

When handling a DELBA request, ath12k_dp_rx_ampdu_stop() calls
ath12k_peer_rx_tid_reo_update() to tear down the BA session for the
specified TID. However, it currently passes peer->rx_tid instead of the
entry corresponding to params->tid.

Since peer->rx_tid is an array, this decays to a pointer to the first
element, effectively operating on TID 0 regardless of the TID in the
DELBA request. As a result, the BA session for TID 0 is stopped while
the intended TID remains active.

This leads to incorrect BA session state and may significantly reduce
RX throughput, as traffic that should use aggregation falls back to a
BA window size of 1 on TID 0.

Fix this by passing the correct TID entry:
  &peer->rx_tid[params->tid]

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Pablo Martin-Gomez <pmartin-gomez@freebox.fr>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index d28d8ffec0f8..f2327c82953b 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1289,7 +1289,7 @@ int ath12k_dp_rx_ampdu_stop(struct ath12k *ar,
 		return 0;
 	}
 
-	ret = ath12k_peer_rx_tid_reo_update(ar, peer, peer->rx_tid, 1, 0, false);
+	ret = ath12k_peer_rx_tid_reo_update(ar, peer, &peer->rx_tid[params->tid], 1, 0, false);
 	spin_unlock_bh(&ab->base_lock);
 	if (ret) {
 		ath12k_warn(ab, "failed to update reo for rx tid %d: %d\n",
-- 
2.43.0


