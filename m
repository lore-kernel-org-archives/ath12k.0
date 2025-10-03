Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A0FCAC5B0
	for <ath12k@archiver.kernel.org>; Fri,  3 Oct 2025 08:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VzysZr6w/xIjpP4+Ic7Xq2b1Ypk0eDMeYx2zloqFxuA=; b=fFsr21n8tSBJJ3dVgh0iPjk6IW
	sgMg5p2WEmtMDkO5Gzm9flLUbDbFLUKIBIEtmB1HuHXJUw4JL0bF9uVB5SaswjZ8GrJU8ohGjPZ8/
	Y+lFoChXba0ww9Ba+AeJGcGRXN6cYWB+MMWoCsDAdKQuua2CuPyvwx8JNbqCuoJv7+RxORewF5cWR
	Pf3zrAB5NXtVJCHYECUHHYJ/5YOCscG2eBhS4bcz2hEmKPUoTpFvv4JvnOU8Uz3lyULxEikZiqZxe
	tkE2loIp04umUStg5PYlT6i96VyJwpVhONgVrQlGMJoMYceT+LGZa10CndA4M9aQj3mH8B+t0FWMd
	aNSSaj9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4bBE-0000000BsMi-3B3F;
	Fri, 03 Oct 2025 08:30:20 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4bBC-0000000BsMQ-22wV
	for ath12k@lists.infradead.org;
	Fri, 03 Oct 2025 08:30:19 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DFD023389B;
	Fri,  3 Oct 2025 08:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759480215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VzysZr6w/xIjpP4+Ic7Xq2b1Ypk0eDMeYx2zloqFxuA=;
	b=14xecNcpxAHy1bHacuWxvZOidgRf+l0ExjYSoGFNPFkJYtaLs0jG8/N+jVF5CRtwnW5gWo
	rgA1lhHXJsK0vSgNExsg5pNTmuWKlqZZ/eu4i+fXnf9l6SSAoDzkg8cqmm+qUwYINy1ldL
	BeTmoAzKJx8cVm9vTjyIy6pGjq7kxmo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759480215;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VzysZr6w/xIjpP4+Ic7Xq2b1Ypk0eDMeYx2zloqFxuA=;
	b=Vw88Fs9BNbrWN9dmzdxAhgd1VOZKPWeqGcBzjSONxDwE2OG8bdek+8AFmzFBYSZ123/X+C
	5zqR68OLH3WaGJCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759480214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VzysZr6w/xIjpP4+Ic7Xq2b1Ypk0eDMeYx2zloqFxuA=;
	b=nyCstLD6KCcAe8PN4AuYuGG+QjTOOEz4UrkLpeyquQRUAcpPXcWCLmfJAXJMWHnwLqmeit
	3Xm0nkBbU58vbBFT3kadNFMlPe9NYKtdTLMGDgFLodPWMZa3xMG64lD6mOQNZjRIbc05Qf
	yqN56mW3qKUcpLPcqhYlEREaUsxTzt8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759480214;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VzysZr6w/xIjpP4+Ic7Xq2b1Ypk0eDMeYx2zloqFxuA=;
	b=cnAYs2BfR8eMuAar7/1K3hq+wNngrn9I4yLveHbPC0odcMgA28mlLiifAQS489PW/BPehs
	3c/gP+ToFcKORQBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD3C813AAD;
	Fri,  3 Oct 2025 08:30:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rzwkLJaJ32iTcAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 03 Oct 2025 08:30:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH] wifi: ath12k: Add MODULE_FIRMWARE() entries
Date: Fri,  3 Oct 2025 10:29:19 +0200
Message-ID: <20251003082955.11436-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_013018_677035_74BFF2A1 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

Some systems such as live-image or installer require the firmware
information for each module declared by MODULE_FIRMWARE(), which is
currently missing in ath12k driver.

For addressing it, this patch adds the MODULE_FIRMWARE() entries.
Like ath11k driver, we can just put the currently used firmware
entries for QCN9274 and WCN7850 with wildcards.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/net/wireless/ath/ath12k/pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index c729d5526c75..48161db6af57 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1871,3 +1871,7 @@ void ath12k_pci_exit(void)
 {
 	pci_unregister_driver(&ath12k_pci_driver);
 }
+
+/* firmware files */
+MODULE_FIRMWARE(ATH12K_FW_DIR "/QCN9274/hw2.0/*");
+MODULE_FIRMWARE(ATH12K_FW_DIR "/WCN7850/hw2.0/*");
-- 
2.50.1


