Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E12606A324
	for <ath12k@archiver.kernel.org>; Sun,  1 Nov 2026 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jX+TWJaT;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eljYftSV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CdvzC7jyi6EVZj3hz0ypTrm0LGiQW5rjVEzapNaDSYk=; b=jX+TWJaTO70rS3B7FCswlsX5Yc
	Gyu9C7uWI8lGT/vBfWs7USc7yNB09caQIjgPEGZJNBNOmO/YUJMj7gyGGZK/u+yPVakA5BGwpBlQL
	wVLOeAv1sf75iRvIJ5xudcVnbEL5yyAWMchLWFUk1k0gVL37boxu79FAn83611nxuW9RWYU49mGQZ
	cIxzmOPA/SjkHJ8KhFN9GzUwAsxsdsR8XQLJPwOzonVO/HLOi+EGnP75DKh69QJtpcgnw222ed6NP
	SqNWlVOsx2zwY+JjZT9V7aw3z2/6vOz+YzAc8YBh8LTPF7PYQTaovzUXFdvabqZHppq28CDKAUnk/
	NRURQp4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNcJ2-0000000Et1w-1w3u;
	Sun, 01 Nov 2026 20:37:32 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNcIz-0000000Et1b-2J4x
	for ath12k@lists.infradead.org;
	Sun, 01 Nov 2026 20:37:30 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so18661615e9.3
        for <ath12k@lists.infradead.org>; Sun, 01 Nov 2026 12:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793565447; x=1794170247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CdvzC7jyi6EVZj3hz0ypTrm0LGiQW5rjVEzapNaDSYk=;
        b=eljYftSVidnNWyXB//6+MrUnrme9QWrms3RlLk0QdO/Y68s+w/SsV8BPEcFf7f32Bg
         fQbmV5b31Lvrrb0Lbzgq2heaknCbCSORvSgQJWQHj5GycgkINMdtOYIVusi/rqhX6Lnn
         Fw40MOM8S//EOBupsqBvp76Pw0iaRYYPlR5g0SmvSXmxxedQ6EFMjPNcKqdht6RiEAFN
         YmD6YeMiZwbofbX0VvWdxYQqiK2slEJ4V0s1SGSwy4+NxZtmfuemny5UFgYtbC2MwU7a
         zwS11AtJnXB4Gyl6mPRhtbgBSwgJN7Wr7aHf3hAftEbdwU/1J2gou7edQxXdr9AArUdr
         mhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793565447; x=1794170247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CdvzC7jyi6EVZj3hz0ypTrm0LGiQW5rjVEzapNaDSYk=;
        b=2xSoYpZpOgfgsyB5vzrhMtw3dyFprvqCyXrtDbzFbyp3IXTzaduXz87WuPebktN/C6
         0rkbPI2bbHWDA1II+4B1zW0FysbbJkg/0Rs1CFeZzg+j/PecsKLhDpSz5b/64/qqK1+D
         7Ku87p8Q7P+ZTiDLnVuKjKiUojMwp5WRPAoCPuuUMjU9pfvgXUQf8s00mZ+Vht+qS/xV
         n9yx8AUjoEZax2WV6CMfg7fiReEEPpzKTbxlrjHUnRdGvZdlVWP2aHLkQuZBOvoobFzb
         pzcpwWqfoJ/iDocWvTR/YeTziKCKrYqCS75Vc9oTPZkRpnUrYdw0wUVy6eUi8VSM6Qxq
         sFiA==
X-Forwarded-Encrypted: i=1; AKwUvBxkYBqFoVa/4c3XbWT8VZQh91ocalb1BU5JTbizlN26z9SPwW90I+ZziHZ59LJaWfVSWYHBOfU=@lists.infradead.org
X-Gm-Message-State: AFq9FYIb4+AP0jNhg8ypwzAfOt5rteTKxzZ4JyKzJthp1etyUgTck0OD
	ndWEAnnyuGlvjUfzaH0ogppkpbBMSgsLHImlv20lMIuyDbHDvCJy0Iyl
X-Gm-Gg: AYBFou3xd7AmU9S35gehumHZVgKVQYxOjuFu/PJoP4tbcqjCYvjNLVlHRFuQ2iBOmYs
	+huXo2+xNthda0I+NQtqOx2vqHmHqCrA/qmA547mYHZubW3NLqGCn7RjQ5/TpwPaQCbWs31Quny
	KUmndmBgp/11o5dZe6xLGuJOviYmPJ7KLTtP/RE3HEFWFRdJky+Lf+CxXNbwcn4pk9ZpTbaQRgW
	wxg4PtAi0SezPx0gbEF6FgZDSfzpuAaj4ODGWY57Qs7zJceXQPZ8GBadbZP4wkFLvIWwnu9CsC2
	sz7N3/RyUNRsEHLC05aQrFyxcZ1zBOUbPGlz/bxTttq2MH3Odwkv77yzkMJom1C5HVvoJGGoshD
	3OYhMpteBGv19mFdjyadfStb2+ovZmqqcGbgybutGHynIdtLE+PUEdN97+zWyZwhLtnETuDJ5zm
	W0ZZuz9L9ejg6HcgjY0/l8QNhBGWLgtPOMprT6wkLjmjVp/NlzlRMQiPV6IP2La2pjpm/SXMCdz
	BEaYovcyJ2u/F3WbQqsFbKsXXHWoAzwGjZf8QsSJuLccNpGZqBQ8hXZK1UOnkQprqN+K4ZvBsIK
	sfkpJDgtDmVFvs4EaR0n8NRm5xNXtVf+qXQu2Z0iwSfhAdVsdzlCpoP/+UpKH0NJpoflq4Mmf0h
	RYQa2Y7mphE+T6puyYVneZzlzlPcGD5nuvIKmRCOPwEhcxTaNwq4gTaCz1LbvLTKhSuYl73Wjm4
	lJqwAcY0Y5N74=
X-Received: by 2002:a05:600c:4e90:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4ac17565fafmr196316085e9.13.1793565446973;
        Sun, 01 Nov 2026 12:37:26 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (158-199.dsl.iskon.hr. [89.164.158.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba53d7sm20369990f8f.53.2026.11.01.12.37.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 12:37:25 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: accept num_users equal to HTT_PPDU_STATS_MAX_USERS
Date: Sun,  1 Nov 2026 21:37:18 +0100
Message-ID: <20261101203718.60679-1-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_123729_605090_7E6A3C21 
X-CRM114-Status: GOOD (  14.27  )
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
otherwise parse cleanly. One AP logged the resulting warning 468 times
between 2026-08-17 and 2026-11-01, always with the value 8, and never
logged "Failed to parse tlv":

  HTT PPDU STATS event has unexpected num_users 8, should be smaller than 8

Accept num_users == HTT_PPDU_STATS_MAX_USERS.

Rejecting a message has no functional effect: the PPDU entry stays on
the list, its per-user statistics are applied when it is evicted, and
the only caller ignores the return value. A larger value is therefore
not worth a warning either, so report it at debug level, as done in
"wifi: ath12k: downgrade log level for CE buffer enqueue failure".

Fixes: 1bc44a505a22 ("wifi: ath12k: fix possible out-of-bound read in ath12k_htt_pull_ppdu_stats()")
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
Notes for reviewers:

The check guards two loops that can never run. Both are gated on
ppdu_info->tlv_bitmap, frame_type, delay_ba and bar_num_users, and the
first also on the per-user delay_ba; none of these is written anywhere
in ath12k, not since the initial driver (2022). The parser that would
fill them (per-user common TLV, MU-BAR user count) was never ported, so
ath12k_copy_to_delay_stats(), ath12k_copy_to_bar() and the peer's
ppdu_stats_delayba/delayba_flag are unreachable as well.

If you prefer, I have a patch ready that removes the loops, the helpers,
the fields and this check instead (about 90 lines, no functional
change). Keeping them only makes sense if delayed block ack accounting
is going to be implemented. In that case the BAR restore loop also
needs a bound (it iterates bar_num_users over user_stats[] unchecked),
and note that the per-user slot finder only uses
HTT_PPDU_STATS_MAX_USERS - 1 slots.

Compile tested only (W=1).

 drivers/net/wireless/ath/ath12k/dp_htt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
index 72069640bd38..9a409dd44d98 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.c
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
@@ -487,12 +487,12 @@ static int ath12k_htt_pull_ppdu_stats(struct ath12k_base *ab,
 		goto exit;
 	}
 
-	if (ppdu_info->ppdu_stats.common.num_users >= HTT_PPDU_STATS_MAX_USERS) {
+	if (ppdu_info->ppdu_stats.common.num_users > HTT_PPDU_STATS_MAX_USERS) {
 		spin_unlock_bh(&dp_pdev->ppdu_list_lock);
-		ath12k_warn(ab,
-			    "HTT PPDU STATS event has unexpected num_users %u, should be smaller than %u\n",
-			    ppdu_info->ppdu_stats.common.num_users,
-			    HTT_PPDU_STATS_MAX_USERS);
+		ath12k_dbg(ab, ATH12K_DBG_DP_HTT,
+			   "HTT PPDU STATS event has unexpected num_users %u, should not exceed %u\n",
+			   ppdu_info->ppdu_stats.common.num_users,
+			   HTT_PPDU_STATS_MAX_USERS);
 		ret = -EINVAL;
 		goto exit;
 	}

base-commit: a3ddbb45768717b5c9f923489387cf55c838d1ad
-- 
2.56.0


