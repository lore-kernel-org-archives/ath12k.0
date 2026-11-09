Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BC8606A326
	for <ath12k@archiver.kernel.org>; Mon,  9 Nov 2026 22:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b1V9JBr9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WjCudBmz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JnkXez8y7K75jEjF1rYTf0IDzIs0hIqe0bwfyGr8AZ4=; b=b1V9JBr95ux2p/
	5Vjejn/eWJxb0+mG+6kdh3iUlTNtude8WiELYXk+5dkn+iZbmMCmXENqI93Fy2QJsSmpM+NpB/RpG
	oDEzEu6nkFX+XJchwhNQQt8PURGcvjYoFF8kVw7r4CiSlUUBOAIoISmiiNfG9bemYslmZaIiJSdyy
	vtVqly3B7/gOkqtETUubOHiQsDIPXZ2RvnRRx1EC9AiCRctfi4nFPz4ecTMujRI1hLr39XBjgUsQ0
	F5GnALiDAUOGIUvDS3zFA/E67pk+wKC1MeHrSDc7ZOn18fRzt/w5untX2vDkFWbHFmvRHIko2ILpw
	86T70OUXMYWTxhtoKDHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQYFh-00000001um4-0D3Y;
	Mon, 09 Nov 2026 22:54:13 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQYFe-00000001ukz-1dw1
	for ath12k@lists.infradead.org;
	Mon, 09 Nov 2026 22:54:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a208d93758so14873705e9.3
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 14:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794264848; x=1794869648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JnkXez8y7K75jEjF1rYTf0IDzIs0hIqe0bwfyGr8AZ4=;
        b=WjCudBmzNBG5FEVcNTxfPS9Um13aNvAVHr6Xz9SK2UxTtyGIen/rrWjDSzSap3T31Y
         H7w27YklsbZRWD00ZwkohobjNF/gZiMxEYrwGIbh4sJAVoPSPc34QwqYVyNjxUHqwZrQ
         1eRF91OwJYroc2j/7nkMgKmyW186qYjHlR2OVcJi1CMsPagLNjuGFrx095teBSL2nZTV
         mxt+H6PvWDkDF3lXchxFQLmwYnBJzqVc9rLZ9M47ZOuvZu5qC2X7ynu41wRy0ycSIbrB
         enJTZcOECI9QeN476rS9Ugt8flhOFdPE/laZvWk6ADwWqKoDnJIuE/UJsUo7e+beMNc0
         Jz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794264848; x=1794869648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JnkXez8y7K75jEjF1rYTf0IDzIs0hIqe0bwfyGr8AZ4=;
        b=S6M3frUpF6zFfAkdZshyZDATfMj2aGpd9sMV0pWvYQiXjUlwIQl17elb5arc8c90L6
         MsCKxTEXCbWxYQQwzV1CmkPxi9P+js5cVNeF3D0kj3ZZvUnoAsiMysMW6Eo9j5rfT8ao
         rjuAmZmuhqvm6xS4P/UsLE1TigGYVPwMWqVxs6rFrKjUZnh9r94yRgg5VdqShC+D2dKP
         VLrfxwcuDtQXFQGQ/WZCNj2GwKG2oSoO/B97a9s3yV0CUPDZ1QbG0hnqQHzZI6HfD7nN
         Sze5IlLk9ku/edQKogIT3QauU7StPakdFR6LPg87csqjoMnAyqeDIPYlRQ0nXxAS69Y4
         pVuw==
X-Forwarded-Encrypted: i=1; AL+hErHYemmjqdx5tZS2djK3Vg5taxjlDR8mHDmBPUZQX0IotOzC4yTr4AkIXLZ3hQ0sjHWKYcMCJl8=@lists.infradead.org
X-Gm-Message-State: APuU4Z8r/yAZ8CaOUuljVlaZjP+Ee1u19ttV96HuGFa8Em0upuySbgBn
	l34AxYVo5cj+BqvPRtVaesQeKXvqCjBpPYDp44H3w3i5MmGlB9KOpwRW
X-Gm-Gg: AYBFou0MAh+0W1l/m/DX75e6dkEof4YhrYyvv3yhVG/MDMcm9l6d0q/Nk+R12FAOpnc
	9clKFHwOhhDX4qbhoxXPQAvtqyYBHIEyloCHV2nZgZLVuOjQk94glpiogj6LzOrqGBYDiFrbYhV
	Vi0wgixsy62bjmwDmw1cF1ahL6RrD7yXu9v53RYZzkh8RBVTJ3JBv0oM/W+MN0R64jMAc2lYoBc
	8FFXYPxoqvoPRa5SK44NpMNa2fgMNBbMZnX3CqSkA+YfiGmsJHEiSOSs/6p73mxNSgEJFk614S9
	mjUO0aJ7DODh84ofLp1Wmn3VF6JNYo1dNzhtMbfLoE//odXjm/XH7hgBz+EF3mBfMqHUCN8b7/a
	lTXQQGQcKu7Bq+nS7CVei/ePJDS0nRwOkXgCBmH92DRhZ26RIgRd/mjVTu78XN19f5WcawnGgbE
	btgssc046RlXPuD0Z8/UKZIoKxbrf9trwb+URxUp5fIhxcwaQo3LxLG1sutXHQIWVWq7Bz4tHPL
	ALbxO9S0ZhGzCo1BxTZyATXnz8s9373TF0ELXqoXb1dCmLVzwkv1X81JDOfQkbyg9McRLbu8opb
	AaFUXAgWXxYrCwO771xOVXRiwyHOhcRC0TrEUkjZiHGEk2NmvNJjf2oMjy66qnWMbev+GufhZXF
	Nle6RmdaRSFSpv/6he0SqOhMOUE83RIZaA+VLb7WTfm0G7Zq8u2fwTAWse8S1Lo7w0TYbCVegb2
	Pn5J2//AvQ2tVggPdC/b5Pqjc=
X-Received: by 2002:a05:600c:350c:b0:4aa:15b1:d4fa with SMTP id 5b1f17b1804b1-4ba0233bda6mr10446175e9.5.1794264848501;
        Mon, 09 Nov 2026 14:54:08 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204342asm21435365e9.6.2026.11.09.14.54.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 14:54:07 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 1/2] wifi: ath12k: accept num_users equal to HTT_PPDU_STATS_MAX_USERS
Date: Mon,  9 Nov 2026 23:53:54 +0100
Message-ID: <20261109225355.23161-2-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109225355.23161-1-gsustek@gmail.com>
References: <20261109225355.23161-1-gsustek@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_145410_444475_1AC87997 
X-CRM114-Status: GOOD (  12.94  )
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


