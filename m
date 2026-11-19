Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF63F606A326
	for <ath12k@archiver.kernel.org>; Thu, 19 Nov 2026 07:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wndsBmBp;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cpPZKSek
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xEoymSwj1gcF4QUAT7oBs9Zbj8EvbnCEDrEiMBfoV2Q=; b=wndsBmBpKCDkBN/PCIDrW/8OS0
	ojAF9mL/rmboxZjI7/YIE/xFMaIYmu0rGSLwsJM8NzSue6hOQ9CpDo4UmYD+KuJWYdFNQ93DK4uVF
	2dvtpJoOCnOiFBSXSrgmUpOhYuR2R9Mw1u1ty3V5ga7JQz2JUSLAxewFzNLPjMYyy1moMogm+R8gW
	kdDHF2jQMjSvVdGpXYxrMDB0GdmXP3MbHd75S1H8IuRXOcuX5HGtX9yRwNNCE+0vI/0pfWz0RRm/U
	UAOAv8TY9uaG4CaMeUHUGq+Ext2rqx66/sBq6JwI5zBAjRw3fPjkuT4qie+QXDgy/Wriir2QDnetZ
	KlQPMHZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTx0s-0000000B7Q2-2Y3q;
	Thu, 19 Nov 2026 07:56:58 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTx0n-0000000B7OM-0WEr
	for ath12k@lists.infradead.org;
	Thu, 19 Nov 2026 07:56:54 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1b3acec6677so2877410c88.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 23:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795075012; x=1795679812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xEoymSwj1gcF4QUAT7oBs9Zbj8EvbnCEDrEiMBfoV2Q=;
        b=cpPZKSek8+gRwAjs2/5SaGE9A9zaT5pOii1CalAza1OpXvHUcayQcOVR3NFsY83DpC
         Lc13J5sWMg9+OvcjJLVABEbcmBHMSGUPhIv3+mfJ0CFYuiAwIkoYG37g+Oxn/LDyZfun
         BvLEi9KlKFPPaNLcYRaxIHCSUPWaEGlfTerQ47i9T16YBEpzb65NtSu1MPTwJRfDdcuZ
         Q+BSAnq8ogn0B6+kmI07P6jFh4GqxP7n+Gtdf2LlNyj5biy2OnOZ6e4/FHsN6Kg6a+KN
         6boV+gQZutYaYmvyFI82mJpgG0c5naZ+imrhnzXWwvWI3ojX1RsLYAvLbZChVwzNT4Kl
         NvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795075012; x=1795679812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xEoymSwj1gcF4QUAT7oBs9Zbj8EvbnCEDrEiMBfoV2Q=;
        b=i8+a62QSRCWtMzqxfZVbIeVZj/el2ycuCUhqfaPhyTXL3jz5HDpm69w/XtiSOlEfz4
         O4PEye8Qfrihr1SrKn4lv05BhHUngJcQXaCGwqtSjMSNA3Y6Lj09hysUdVpJ76DAfykP
         0V67n54nqgiHGkYvc4qvxoQ6OTJ0ON6XBDySaMkYA6gsrcqUpvHkDdhjiaYETVoa346A
         HiiN1FSvFotbXgXz02H+lUcDA5nheRPu25TXMtdQFS0+I0J2oqLl6uzm0ZEbfFVaReLm
         Jr4qU46pCyUK0jUzKiEzMb/fo3x8shXeg72PjmjoBVF44lLcWauBCLaEfsjDefVAG96T
         nl7Q==
X-Forwarded-Encrypted: i=1; AL+hErGBCcIZypQXjgH6xhuEmEbLCdCZObPSA1dwaZqHvQSTesWZMaCf0P+earqtnsx8HvEr1zgDzZQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z93w11FLJpMlFXMuGH7OvM758del/E17WA0shPXFpFBhe9zJyUc
	utwk4gl3TJWzIe9/AZQKpCGml1oz0ZovqU1EMKAoLwYqyZOQA+Jq1Yol
X-Gm-Gg: AYBFou3vCW7HyCcreyB7dVWZkKHu58sa9DpSv1GUK59J24P2Gu2qw5boTwq4hHmJ66p
	5ymEZG+hFvIjz3/4T8CDl1Tn4ZH0poRp9zSsNaf7QTBafJZe1ZBKBuulbwMP9QIxg5/cMC/9CYm
	xx55zZjJm0IxDzcV+p3P+XI1AXo0Iw8YN/2gYtDDkED937g/dFgzNe5lgW1Dmm0PTJJU3qzPpC5
	vGc2TWuO1TlxexRYbsRtDHlWLkFXXEx79YbmSGXzdEMPTNTl0cqIEaloA/UItcFktGANpQMweGR
	Fsh7Nlpx0FmiV8UbJYFO1IKhe3W0YiRxMvuR02fsg5ApftTcufooog3+gknkdUjk7+Fa3MC1Zq1
	Ft2zdeIPMVLENWGwHrNjy5zu7ACenpsldumIPWFznN8gmZZcp8dHoPx7XqB7fxfFB09ZjZi4399
	awwGoULNK2kRLM3d9VyhL2v8CjfRbtIBA6a+Xn6xK9RzxrNL87fnVU7V7Xvnd/4smmtTKQJCcXw
	lqIT0Nce04VSidTaME0afc6zJLWQ4D11B/lVU8bchypPq3PR0bNeEke1F/Dp8x5BicARktdgeNg
	8aILd9tjBudLxvCI04/luTK1ba2rgKPVXPpHadBOHYbqjCVWYQ==
X-Received: by 2002:a05:701b:2202:b0:188:e51:e86a with SMTP id a92af1059eb24-1b543c14aaamr3714450c88.2.1795075011818;
        Wed, 18 Nov 2026 23:56:51 -0800 (PST)
Received: from G7XWH7K1F3 ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm12778151c88.0.2026.11.18.23.56.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 23:56:51 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH ath-current] wifi: ath12k: fail the start when a service ready event fails
Date: Thu, 19 Nov 2026 15:56:28 +0800
Message-ID: <20261119075628.11096-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_235653_165554_75EC9B24 
X-CRM114-Status: GOOD (  15.32  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_core_start() waits for the service ready handshake, in which the
firmware sends SERVICE_READY, SERVICE_READY_EXT and, if it supports it,
SERVICE_READY_EXT2. Only the last of these events completes the wait,
whenever its own TLVs parse, so the start goes on after an earlier event
failed (for example, on -ENOMEM or a malformed TLV), with capabilities
that were only partly extracted. An event that arrives again, even after
the start, is handled again and rewrites the capabilities under a
running driver.

Track the next service ready event that this start accepts. Each handler
takes only its own event in turn, closes the handshake before parsing
and opens it for the next event only on success. A failed event then
makes ath12k_wmi_wait_for_service_ready() time out, and any event out of
turn, including one after the handshake completed, is ignored.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: stable@vger.kernel.org # needs adjustments for <= 6.12
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Found by code review. Tested in a QEMU guest with KASAN and a test hook
that feeds service ready events to a synthetic device: without this
change the start completed after a failed SERVICE_READY or
SERVICE_READY_EXT, and duplicate or out-of-turn events were parsed again
after the handshake; with it the failed start timed out and those events
were dropped before parsing.

No new W=1, sparse or smatch warnings.

AI assistance was used.

 drivers/net/wireless/ath/ath12k/wmi.c | 22 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h |  9 +++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 75b259990c79..89e4dec07534 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -732,6 +732,11 @@ static int ath12k_service_ready_event(struct ath12k_base *ab, struct sk_buff *sk
 	struct ath12k_wmi_svc_ready_parse svc_ready = { };
 	int ret;
 
+	if (ab->wmi_ab.svc_rdy_next != ATH12K_WMI_SVC_RDY)
+		return -EPROTO;
+
+	ab->wmi_ab.svc_rdy_next = ATH12K_WMI_SVC_RDY_NONE;
+
 	ret = ath12k_wmi_tlv_iter(ab, skb->data, skb->len,
 				  ath12k_wmi_svc_rdy_parse,
 				  &svc_ready);
@@ -740,6 +745,8 @@ static int ath12k_service_ready_event(struct ath12k_base *ab, struct sk_buff *sk
 		return ret;
 	}
 
+	ab->wmi_ab.svc_rdy_next = ATH12K_WMI_SVC_RDY_EXT;
+
 	return 0;
 }
 
@@ -5148,6 +5155,11 @@ static int ath12k_service_ready_ext_event(struct ath12k_base *ab,
 	struct ath12k_wmi_svc_rdy_ext_parse svc_rdy_ext = { };
 	int ret;
 
+	if (ab->wmi_ab.svc_rdy_next != ATH12K_WMI_SVC_RDY_EXT)
+		return -EPROTO;
+
+	ab->wmi_ab.svc_rdy_next = ATH12K_WMI_SVC_RDY_NONE;
+
 	ret = ath12k_wmi_tlv_iter(ab, skb->data, skb->len,
 				  ath12k_wmi_svc_rdy_ext_parse,
 				  &svc_rdy_ext);
@@ -5156,7 +5168,9 @@ static int ath12k_service_ready_ext_event(struct ath12k_base *ab,
 		goto err;
 	}
 
-	if (!test_bit(WMI_TLV_SERVICE_EXT2_MSG, ab->wmi_ab.svc_map))
+	if (test_bit(WMI_TLV_SERVICE_EXT2_MSG, ab->wmi_ab.svc_map))
+		ab->wmi_ab.svc_rdy_next = ATH12K_WMI_SVC_RDY_EXT2;
+	else
 		complete(&ab->wmi_ab.service_ready);
 
 	kfree(svc_rdy_ext.mac_phy_caps);
@@ -5871,6 +5885,11 @@ static int ath12k_service_ready_ext2_event(struct ath12k_base *ab,
 	struct ath12k_wmi_svc_rdy_ext2_parse svc_rdy_ext2 = { };
 	int ret;
 
+	if (ab->wmi_ab.svc_rdy_next != ATH12K_WMI_SVC_RDY_EXT2)
+		return -EPROTO;
+
+	ab->wmi_ab.svc_rdy_next = ATH12K_WMI_SVC_RDY_NONE;
+
 	ret = ath12k_wmi_tlv_iter(ab, skb->data, skb->len,
 				  ath12k_wmi_svc_rdy_ext2_parse,
 				  &svc_rdy_ext2);
@@ -10788,6 +10807,7 @@ int ath12k_wmi_attach(struct ath12k_base *ab)
 	/* TODO: Init remaining wmi soc resources required */
 	init_completion(&ab->wmi_ab.service_ready);
 	init_completion(&ab->wmi_ab.unified_ready);
+	ab->wmi_ab.svc_rdy_next = ATH12K_WMI_SVC_RDY;
 
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index b508aa759bd8..59bf691352bd 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -5397,6 +5397,13 @@ struct ath12k_hw_mode_info {
 							    [MAX_RADIOS];
 };
 
+enum ath12k_wmi_svc_rdy {
+	ATH12K_WMI_SVC_RDY_NONE,
+	ATH12K_WMI_SVC_RDY,
+	ATH12K_WMI_SVC_RDY_EXT,
+	ATH12K_WMI_SVC_RDY_EXT2,
+};
+
 struct ath12k_wmi_base {
 	struct ath12k_base *ab;
 	struct ath12k_wmi_pdev wmi[MAX_RADIOS];
@@ -5405,6 +5412,8 @@ struct ath12k_wmi_base {
 
 	struct completion service_ready;
 	struct completion unified_ready;
+	/* Next service ready event this start accepts */
+	enum ath12k_wmi_svc_rdy svc_rdy_next;
 	DECLARE_BITMAP(svc_map, WMI_MAX_EXT2_SERVICE);
 	wait_queue_head_t tx_credits_wq;
 	u32 num_mem_chunks;

base-commit: b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a
-- 
2.56.1


