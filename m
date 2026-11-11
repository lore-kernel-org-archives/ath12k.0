Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C90606A8AF
	for <ath12k@archiver.kernel.org>; Wed, 11 Nov 2026 20:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gbi+BlwS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ovh6a7gZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JnkXez8y7K75jEjF1rYTf0IDzIs0hIqe0bwfyGr8AZ4=; b=gbi+BlwS6KykwM
	a/t57G9TtvuloGq5UtJfjg9IAnsWCPlycipM98jsX9ExkYKT8wcN07r1cvB1aqPvJ880SgxRwpNGJ
	VprqbmjYTqXoW/wRFh77ngxzCVPeaa+ImjQwa5tMsFuT6Tf/Oj4UMcQjV0WVatC8if59bwvLzw5fx
	5k19KAYYd26hll6EGnSyjdmVP51GF8SwNh5FVcfuwizgvgy74f8fSvA/Oh4cRHtuKZXV3R3PwPVN2
	KgM2b7ckw7hE8lM5tKz00Q99CgHxv6LLiyqBYUL9A4GydP4uI2/hEi7Tea3PCJTe4Z4x6hpjvD7rO
	3YtHtPxPI9agis2jAsiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRFFK-00000007gLI-0ChF;
	Wed, 11 Nov 2026 20:48:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRFFH-00000007gKF-1VsQ
	for ath12k@lists.infradead.org;
	Wed, 11 Nov 2026 20:48:40 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so28387445e9.3
        for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 12:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430117; x=1795034917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JnkXez8y7K75jEjF1rYTf0IDzIs0hIqe0bwfyGr8AZ4=;
        b=Ovh6a7gZIhrRvc/nblp67fHJ6r+LVDQyu2OOmg9wJ7fy4938/ROtlpPymIA19+q4ry
         bCseHKWLde3sXCphIDCgnRiAVsYs9iMk2xfrCMKilVsR3bnVg4w0o+rfGEcpppd41grJ
         yfEBwJBxhG9rubl4uaaZqH8D27h5fSnF9hk/n2PxnQO1t/+0aQjpAMuJ5+pI1PClh0Ly
         Nk0oNjnwdVmqtR9h4oCtheNRQfLykbUGsn1PnzItVpINyt+mkh7QmczUDUJnmnfz1Bn0
         maUT4mnpkb96tmTalLuw1Wb5D0tCFqZpyHU2xSV+rzTLc7AXRcPlnEHWdUi8s4oa7Qz/
         AT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430117; x=1795034917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JnkXez8y7K75jEjF1rYTf0IDzIs0hIqe0bwfyGr8AZ4=;
        b=LXf0UEgCUn49meyBcLnR9/1VjkI8IfeoRLabtepWG9pOd3TLlg78cGm4vlp4ZjuMSw
         iP3K4vifReKi8sa7aB14SVuq77d2L1qqml2hYZR30cWFcd/j9JpQuE2gKXWz0O0YURrY
         hPB8j6kNZPog3vX6KChViWEyw98M8ejn5XGMTCvZQ4XLnUX7af9/OT8nyE+ALnmOwuHV
         40juPFvIyZWxUnXYPM8Tw/ME6eft1paBYtDXaBASV79QEMaW3QHTPfRusUShP1Hm+DaR
         a7SFINWJdmB1D7WIyacf//fub/QE2HhlGLv9fbUyY/ujSVxyxeNBGsCU3Ub1RMJvYAPl
         tCqg==
X-Forwarded-Encrypted: i=1; AL+hErGX/4RtVrGrRxrOJHNOTBODlSDiqXLOWcT7FSARtJnLVYBIAZBF8qS0W2muI0hjgw66k9+xqik=@lists.infradead.org
X-Gm-Message-State: APuU4Z+NT5R/5Jxy51yPZ1MLaBSUYtyhImltDn6oeaN7CKMF0exyb5LG
	EBGlq9LHpSWIC0wN1yhfEZDnUIlaykF7h3biaqiGbqH6YJVq/cVQRRNm
X-Gm-Gg: AYBFou16cCC/uFp/fYuMDgW4gmUlR+vWB07Gtljt6rMRqvbo2+TVjpkpxtZ41nKsF9D
	pA+8nty9J/DlRvWepSP5s8AR1hiL8fn5aJnsoPNxUPZORSyyuG06+oOTrTJIgYxgCT77XBgTQ6m
	e7sNgJCA2dkbh3sXjKTkyRpkQJbb2rkgsAtoC80+DvZSJwbr52q321Ox2GVOSt7b2w3e8eFZp3q
	LimiENu0mCAwafp5BJvVF+yETb8W1KKyi3j+zv9FNWMl1DSrWDx0aj2T1Hj40x22Q0Vjq/5tVkV
	h1y5vSzNqWEqjW6l2aqH4Ndi1z66QXq7WsCdq8FBNuSLFXxaHQKyC7b4LgCINWUZ5fr92eGfXJd
	ArciWT7ndtATb5hLJkf2WWpzBIwGWuGB+wfpjoHnCp+fqr8c8AeTNFiJaf1BuBsWDA1jGOAbg6b
	isXUCRbI80bNvjMzceApX79dp8puBCCIAxnBdrqgm2bp0K3UdeXGNeF8EkvVX9utQsp8pKV20om
	nAxgVCYZyzsP3bCE45BWlSogL1yZ7Ej1ORt7o4Oj7dRHR1hCf5D/eOHbYzt97PuxxKfBsfStb8Q
	Ue+9arRxUnAdQxS5aTJzmdJBNTm0P7iz6hDhBSh5FrFLiBlp7jNp6P+TWyOAXsx40nZ5Ro8DXpb
	YMQ/+SBd+Eu2bwqNXQjPi8GOhgMHupXTADWAQU8EaE5dDdqIijekYJxl5d1BQ8BanFAB2BS4QbY
	KtJEa6
X-Received: by 2002:a05:600c:4e41:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4ba0939db52mr62096635e9.22.1794430117343;
        Wed, 11 Nov 2026 12:48:37 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (58-119.dsl.iskon.hr. [89.164.58.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm15063795e9.4.2026.11.11.12.48.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 12:48:36 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 RESEND 1/2] wifi: ath12k: accept num_users equal to HTT_PPDU_STATS_MAX_USERS
Date: Wed, 11 Nov 2026 21:48:22 +0100
Message-ID: <20261111204823.88785-2-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111204823.88785-1-gsustek@gmail.com>
References: <20261111204823.88785-1-gsustek@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_124839_418660_7C4320C7 
X-CRM114-Status: GOOD (  12.66  )
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

ath12k_htt_pull_ppdu_stats() rejects a PPDU stats message when the
common TLV reports num_users >= HTT_PPDU_STATS_MAX_USERS. The check
guards a loop that iterates i < num_users over user_stats[], which has
HTT_PPDU_STATS_MAX_USERS entries, so num_users equal to
HTT_PPDU_STATS_MAX_USERS stays in bounds. Commit 1bc44a505a22 ("wifi:
ath12k: fix possible out-of-bound read in ath12k_htt_pull_ppdu_stats()")
rejects that value, which is off by one.

QCN9274 firmware WLAN.WBE.1.6-01243 sends num_users 8 in messages that
otherwise parse cleanly. One AP with two Wi-Fi 7 clients logged the
resulting warning 468 times between 2026-08-17 and 2026-11-01, always
with the value 8, and never logged "Failed to parse tlv":

  HTT PPDU STATS event has unexpected num_users 8, should be smaller than 8

A diagnostic build that logs the TLVs of these messages shows that all
of them are BE MU BSRP trigger PPDUs (frame type 25) carrying user TLVs
for the two clients, up to four records per client, and that num_users
matches the number of user records in the message. The same firmware
reports max_user_per_ppdu_ofdma of 8 in WMI_SERVICE_READY_EXT2, so 8 is
the largest value it produces.

Accept num_users == HTT_PPDU_STATS_MAX_USERS. Keep the warning for
larger values, which indicate a firmware that supports more users than
the driver stores, and adjust its text accordingly.

Fixes: 1bc44a505a22 ("wifi: ath12k: fix possible out-of-bound read in ath12k_htt_pull_ppdu_stats()")
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
 drivers/net/wireless/ath/ath12k/dp_htt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
index 72069640bd38..f5c526bf82d8 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.c
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
@@ -487,10 +487,10 @@ static int ath12k_htt_pull_ppdu_stats(struct ath12k_base *ab,
 		goto exit;
 	}
 
-	if (ppdu_info->ppdu_stats.common.num_users >= HTT_PPDU_STATS_MAX_USERS) {
+	if (ppdu_info->ppdu_stats.common.num_users > HTT_PPDU_STATS_MAX_USERS) {
 		spin_unlock_bh(&dp_pdev->ppdu_list_lock);
 		ath12k_warn(ab,
-			    "HTT PPDU STATS event has unexpected num_users %u, should be smaller than %u\n",
+			    "HTT PPDU STATS event has unexpected num_users %u, should not exceed %u\n",
 			    ppdu_info->ppdu_stats.common.num_users,
 			    HTT_PPDU_STATS_MAX_USERS);
 		ret = -EINVAL;
-- 
2.56.0


