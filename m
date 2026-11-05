Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A90606A32E
	for <ath12k@archiver.kernel.org>; Thu,  5 Nov 2026 18:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OJ3uQcVu;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XkRxK8TS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zuDBG2J86Bfrzi1zRqTx4H/EMGzTj9dsgHnGFtwMspw=; b=OJ3uQcVuHgmM3RhCOKz/TM9fcK
	46EW/YZ1LF2N/rq0HD4leo/msorK5T6Atg7kuqJ9vex66ZMJ7qeFdvKWc1r0e7+DqutjftY30EwjO
	KbcJkrxhuJ3oNS5IHt6bYgqEqcMZKqu1J0L8wc4bYhSgVFjUqMhSPqlwFM4oXbCt9yw4FR1d1ctM2
	CB4Ix1TV5bo0uFwM+ncVEJrsSP/J/ETGJYglwVk6lsWj5TuhQyXAvRxIVTmV6eZPUL0WodDg1ugQa
	eiRvb6yJNqslqnZ4PDTC5F1NW8H4vpg3FM04svJgMmGZs3nyKLAuY/2zMeoFC8ssZqBnBf5Pv4ZfA
	Hu8aIh6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1x2-0000000A5WU-1tLr;
	Thu, 05 Nov 2026 18:12:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1wo-0000000A5NB-0DPR;
	Thu, 05 Nov 2026 18:12:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CAF6C403C0;
	Thu,  5 Nov 2026 18:12:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793902345;
	b=z9Mfb7vH8KWXPb05RaOdSRfmPMFzYe3EJqahohS3D4ujsZhq/gyROXvVBb/oYQIB7pMu
	 0/3Daw3+q/XWINxARzTUWiM78B0KTVG8+sFKSdRalDEje/M+ctOt2ie2swuJCa4HMB1Sx
	 DLfx0VxlfYlmNc0+9a2rG9or/bTaHXiYQ68EFFZBIiH+GKiA6W8eBoeW/XD0PHJG+WfgX
	 7uPDij+ckporsSU+yr904RJHqi3f8bnaFBC44ASzN6Ah4z4hgmCYKX7TxNZufvY9F5hxh
	 kbLQI56y9r6Wnbwr83roQkNcDgCQfONMONAQMQQQEUFDHZZUWve8tUUnzgN047a43Pg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793902345;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=zuDBG2J86Bfrzi1zRqTx4H/EMGzTj9dsgHnGFtwMspw=;
	b=SURN7wU2+lSqVB2XhHXfsmvOxLCmnM+Txt++8bfzFNjoog1QayHwJRsj7+kaOsA7BgQg
	 NPn4atMC1cp3DYJeq0UKq1t7gQAqZq7OUdY3T5f59NrnY4ICrVPeZK5F+jO88BrSaqReS
	 26qXokE6w9Z8ubi2qgMeThBOPQDJSqMaSVmWR7xNkUdUlVr0ZyO/tXLKe1qgi/CS5/dd8
	 GL6XqMu8htmw1+HiCcIzGT8REMU5ZxhmWVdoI8vKZTYKWOaxu2jPujoPAnaLIrSRL9gYr
	 wiDZw2gTFD+FDLQxW453n/AIOq7TXWFPhBbtxueF+w/GGf4/D6SS488V23e9GE5fXvA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 36DAE1F000C1;
	Thu,  5 Nov 2026 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793902345;
	bh=zuDBG2J86Bfrzi1zRqTx4H/EMGzTj9dsgHnGFtwMspw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=XkRxK8TSIwNqDCLpuvXi44sXt1ZzBZz5arGGs6EkIznkAkKUKftH5FVcxWMs+8gSi
	 Ahf3347znqPZ6Z9/lXHWyeLsUwvnkuJkJFmxuF/BBO+FflHrXKinCeedOJvpOYNyoP
	 9zsjaCJLqpjH7hE3mejy7/nxkOXpQKxh/i3+22RWNo4zEpf0RbX7D4EnJF67lD7CMN
	 525ldwBF9fcijJIvEU5xEXW4d38ld/A0g8a4XMEaBXT5Q6tegZx6005Mavgh7jS3Vr
	 LCs7G3b05h/B3j3w3xRyZr8bim3oEjBdqj0WT/AQ/2Q5VGcl7yxlipLGEYkrfx+7yC
	 M0QIe14tl2GWQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BDF6D473C1;
	Thu,  5 Nov 2026 18:12:24 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Subject: [PATCH 0/2] wifi: ath11k/ath12k: don't leave a monitor started
 when its stop fails
Date: Thu, 05 Nov 2026 12:12:21 -0600
Message-Id: <20261105-ath-monitor-unassign-v1-0-277f0fbadb91@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAbH7GoC/yXM0QqCQBBG4VeRuW7ANRLpVaKL0f50gmZjZ5VAf
 He3vPwuzlnJkRRO12qlhEVdoxWEU0XDJDaC9VFMTd20IdQXljzxO5rmmHg2cdfRuAXk3PVAkI5
 K+kl46ve/vd0P+9y/MOTfi7ZtB7y3T654AAAA
X-Change-ID: 20261105-ath-monitor-unassign-6eea38bee1a8
To: Jeff Johnson <jjohnson@kernel.org>, 
 Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>, 
 Jouni Malinen <quic_jouni@quicinc.com>, Kalle Valo <kvalo@kernel.org>, 
 P Praneesh <quic_ppranees@quicinc.com>, 
 Ramya Gnanasekar <quic_rgnanase@quicinc.com>, 
 Wen Gong <quic_wgong@quicinc.com>, 
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
 ath12k@lists.infradead.org, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793902344; l=1139;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=WeRf9b45ChxpBsM73VYTLNwPQgkMOLOEYToX9qAV0xk=;
 b=hnoBS4p00Pof2V4tXGckfxiEGJHvqOtZd66HQTJSo5geyMHYnenMRX4tGqdAvAmcM1y8UDW4a
 4+0m/a3PaDNAlMwjJa6OUBU8qaHxusjCF6xCj5hwHRuJcDvdg/tkqZt
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Reply-To: christophergriffin05@gmail.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If the monitor vdev stop fails in unassign_vif_chanctx(), ath11k and
ath12k return with the vif (link) still marked started, although
mac80211 has released the channel context. The next assignment then
warns and fails with -EBUSY.

A firmware crash during a monitor channel change hits it reliably:
three of three simulated asserts on a QCN9074 with a monitor interface
changing channel every few hundred milliseconds took this path. With
patch 1, none warned and every recovery completed (before: a WARNING
each time). Patch 2 makes the same change in ath12k, compile-tested
only (W=1).

---
Christopher Griffin (2):
      wifi: ath11k: don't leave a monitor vif started when its stop fails
      wifi: ath12k: don't leave a monitor link started when its stop fails

 drivers/net/wireless/ath/ath11k/mac.c |  6 ++----
 drivers/net/wireless/ath/ath12k/mac.c | 12 +++++-------
 2 files changed, 7 insertions(+), 11 deletions(-)
---
base-commit: 5c8eab13e391aaabd5a1ad58f3ee4bb10ce7573e
change-id: 20261105-ath-monitor-unassign-6eea38bee1a8

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>



