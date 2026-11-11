Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392BE606A8AA
	for <ath12k@archiver.kernel.org>; Wed, 11 Nov 2026 20:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GoUhkdMA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kG6xBFgf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RIiTR5H2OWjhZVQ9401qUUhteZRrStfHsUs8Xa39Rxs=; b=GoUhkdMAY0pBWN
	rQ7GPXNmfTOaRhUoJaciqRejyC8t8AbnwvBVSOMTI5E0MIZ3dsr7uBO0eT8Vus8U+g/CnkdHBDl8j
	MwhXvtomIIe/mO0TOV41NOF5ref8SPbczoB0RsPL/AP+t3OAfn3CRmV3dWYhXYAGO2M9zQTV5sjDM
	wd49jKkZFY2R2/UXtUQNQm7AZ0iD8vfDMpbGbmmHhqhsumkYVmKfYBBRmeKH7vtSbR0DajhcNW4zT
	BB4Kh+Ha/MF7LLXvIlGMVFitWGbACB2bMQffWU7vy9fRcE9rifIsnv3Qzhs4QnAvtaQszHOdVdzMW
	iN02Ccc/V207hXIlz0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRFFL-00000007gLV-0Yng;
	Wed, 11 Nov 2026 20:48:43 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRFFJ-00000007gKk-1OvH
	for ath12k@lists.infradead.org;
	Wed, 11 Nov 2026 20:48:42 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso25034135e9.2
        for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 12:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430119; x=1795034919; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIiTR5H2OWjhZVQ9401qUUhteZRrStfHsUs8Xa39Rxs=;
        b=kG6xBFgf8QjNhwXLyU5DsXpnpvBSSstFihZA8/afShh8RLkaFcM04CcILmSwQb+MV8
         44h3EUOHJiviCa11C/7YBVcS8MtjAlhu6y2B3KGwYrXGKPwyZnY/pE46mJDQ9KQeoaC8
         mtIWrm5CQ9cm5DNVulq0OgrGEljFpyav+zVZw1TbiSDKz/1wGhJ0oRd2slp/6K9QsALO
         KQmZfY4G50SaPsA1s4vFiBnvXyD3kZa6oMCkvTMrWt37+KmI5ZHE3OsA/gowTsDpmO7s
         AfsOpM6U+BlaWVCdkkEBY2721hShj8NThFVMAYHYu4UwJyR7BU/isiE3qHX/0XiLLOPK
         Wp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430119; x=1795034919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RIiTR5H2OWjhZVQ9401qUUhteZRrStfHsUs8Xa39Rxs=;
        b=dT9jopciVumxxS5hDbMhtp+CbG5hbu24lbxhiN21LrmR0ycREyBEKyM/xeNpox+HDe
         QQpNX/8m0E6r3zx81UH+EYeE7wHCf7lKtrdyS0rVzdPltYH06CdzN9LCU3ET0cuN2k4z
         h+chXCGKUUNLXDhwGsGPkDpUwNUzviChq9q0EfUuukKwGhbpLbhJrysrIypGh0SDTiNy
         wVJ3DgqFB6Zm0phBvvteOHL3tiuGZlMtpSwb5J0cySkkfN7WT4DGYahQM0ntgDbWSZF6
         iuFamk9KvLE3WtUQOmIUpgfUx7xFkwoHk8/0zvnknnv4VrWsJROtlmoZKcG2vlROPnVm
         hkLA==
X-Forwarded-Encrypted: i=1; AL+hErGajMWHHhtrmpIQDOtTkI2bbUnNUSUO4PRfKmmuP1t9LYHzwnQwYvpxo6QU5WWkihqdYEV828Q=@lists.infradead.org
X-Gm-Message-State: APuU4Z9qb3tChofjeEWpKba6fAU8yRobgOM8uynODe5wkY+sq/kj82LU
	X06meqhbGRWEqrbW1ToQvVAqjlpvm2KE+Y/2wtEGPANgC1SJLTSwrNOy
X-Gm-Gg: AYBFou32jQJoPSrxU+/5vo83EX89G3gECaZfIGP0w0luIZH/nh5fu09vS33HexX3Tt7
	97kqwwwTr9onxzQJsnEzcpCb3T4/mnnvYVfDvcGQpQO+l+5Jm8yMVfaUJ5Uw4A/l+v3byffdPPD
	ubjIyTfzhXWUi7Z+Osqe6LzoGFxYokRJey3xsU+ScnOx4mq1yt3t6IbwBgDl5UWyqU4qT3e2DIa
	sGvPbem6oj1w9FE7YXyeWt3X4aa0L+sTugbaikh/cYfULwCcACoTSk3NRfITgm9+J21BeJexCEa
	2vAhIcvYqOErnSdT8zzzl2BalL7J7x4UXJcRQ1fG3yleFttvjLggV/bP21m2f7hg9zdvdL+VtIp
	Wlwn1+6CvmbsvHoM2tlPIcJ9eOenc5bqZnHETl892zSpU/2vks1buD3GhhMAoJKImSb3nUxTVMG
	LSjmMOmmxjluBgoCRPwT36WsWGKkEFcvvEZPUW41OmqZKdTW/qJ+tgcTbQ5y2KvNyRN26m1Gdxi
	328Hc/f1ix5qGSSSel+8drN1vD1ZC8eOAMPOD1cexKsZOU/evuvitQMXSdSdFKLNs4Cd5IoKxc/
	L/Rh+FRlkRk3xHP7lTKTIFuTaUDheiVSZod2TpgVH9VUIChbn2HOPEthIx+2uyzQC4ysCFARm+A
	Tq2bMnueOjtOvkX46A5itr3vMXJ42vdEdL2GRylUYfaojB93/3KU5KeALCYmw78DjHhgBS1+2UW
	eMufg=
X-Received: by 2002:a05:600c:8b2a:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4ba093921f6mr66956865e9.27.1794430119321;
        Wed, 11 Nov 2026 12:48:39 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (58-119.dsl.iskon.hr. [89.164.58.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm15063795e9.4.2026.11.11.12.48.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 12:48:38 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 RESEND 2/2] wifi: ath12k: use all HTT_PPDU_STATS_MAX_USERS slots for PPDU users
Date: Wed, 11 Nov 2026 21:48:23 +0100
Message-ID: <20261111204823.88785-3-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111204823.88785-1-gsustek@gmail.com>
References: <20261111204823.88785-1-gsustek@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_124841_384123_143454F2 
X-CRM114-Status: GOOD (  15.52  )
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

user_stats[] in struct htt_ppdu_stats has HTT_PPDU_STATS_MAX_USERS
entries, but ath12k_get_ppdu_user_index() searches only the first
HTT_PPDU_STATS_MAX_USERS - 1 of them for a peer's slot, and
ath12k_htt_update_ppdu_stats() applies only the first
HTT_PPDU_STATS_MAX_USERS - 1 slots to the per-peer TX statistics. The
last slot is never used: a message with HTT_PPDU_STATS_MAX_USERS
distinct peers has the statistics of one of them dropped, and the
remaining slot is dead memory. Both loops have had the "- 1" since the
initial driver.

Iterate over all HTT_PPDU_STATS_MAX_USERS slots in both functions.

The messages with num_users 8 seen on a QCN9274 AP carry user TLVs for
two peers, so this case has not been observed in the field; the fix
follows from the array size.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
 drivers/net/wireless/ath/ath12k/dp_htt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
index f5c526bf82d8..a0f98259ee64 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.c
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
@@ -46,7 +46,7 @@ static int ath12k_get_ppdu_user_index(struct htt_ppdu_stats *ppdu_stats,
 {
 	int i;
 
-	for (i = 0; i < HTT_PPDU_STATS_MAX_USERS - 1; i++) {
+	for (i = 0; i < HTT_PPDU_STATS_MAX_USERS; i++) {
 		if (ppdu_stats->user_stats[i].is_valid_peer_id) {
 			if (peer_id == ppdu_stats->user_stats[i].peer_id)
 				return i;
@@ -362,7 +362,7 @@ static void ath12k_htt_update_ppdu_stats(struct ath12k_pdev_dp *dp_pdev,
 {
 	u8 user;
 
-	for (user = 0; user < HTT_PPDU_STATS_MAX_USERS - 1; user++)
+	for (user = 0; user < HTT_PPDU_STATS_MAX_USERS; user++)
 		ath12k_update_per_peer_tx_stats(dp_pdev, ppdu_stats, user);
 }
 
-- 
2.56.0


