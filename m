Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6045F606A333
	for <ath12k@archiver.kernel.org>; Mon,  9 Nov 2026 22:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SBdCrrOr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QGxi/6L0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RIiTR5H2OWjhZVQ9401qUUhteZRrStfHsUs8Xa39Rxs=; b=SBdCrrOrk56Rwz
	ePMe4+x4PPRBoCsEZ65eGJwdwdaXW8XToSwjD9YYdGbEYcOeu0fuJoKCrdbT1t4LUvrvs/2cJoLYH
	91m+qIBaZWgVVI5tmagldybaY4BXi9B23t402GCf6Z0/+9Sz0Zb0H8X4UaHJUR7xk8jzZDuPWUbPK
	PjFsD9jttOn9pUntUaBmuIhs9Ff03qMuJSuXFkrslcEZkYQE3Xf3fWwnpqZBW6veTUU41RD4Cjukx
	YHT4FEGK27XdzgfZQlfW9xNGVVCATHY27d+riAaMgGs10tSYFewBXDZ2a52FCUVAI/JW7WDEZ4P1b
	B/23FHu9n/croJuyHpDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQYFi-00000001umh-0Xiw;
	Mon, 09 Nov 2026 22:54:14 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQYFf-00000001ulF-1Kp1
	for ath12k@lists.infradead.org;
	Mon, 09 Nov 2026 22:54:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4b467581b98so13252265e9.0
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 14:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794264849; x=1794869649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIiTR5H2OWjhZVQ9401qUUhteZRrStfHsUs8Xa39Rxs=;
        b=QGxi/6L0gmLhv+aYtvc8OJfR2993o4uddRLDJSwYKoptIIgzhhB3ISqbYDAEN/vdiG
         abJZsO85Bv2bH78YCkMNibkUbRsWWbO9DAllxA37cEDtX238wKAIL7Q6lAw65NLZlu/m
         MeVMPwMRoYG3Oj9lSvNV/cZblq2RrfGYg0zq4dl8sYayEQPLOaSihyKm4rm4D5yp/KCD
         h1R0hg+m+7zGpMglE3n5bv1uRrZWuetqBmfUp4NCTWX3dPsfjPZej354OxetByik5L5T
         3tsfsVUWO9H7SiRkubacivf2HP7wYnxknyhxQV9geR9IMsj9TpcPOTsrG88hluuDkE+W
         2epQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794264849; x=1794869649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RIiTR5H2OWjhZVQ9401qUUhteZRrStfHsUs8Xa39Rxs=;
        b=YIjgOE/oL+Zcfmo9f+xrBTJdQO6LzLtKfODBhojPqCHASL0auEg9cs0Rf4U+cKhctM
         lefKch26HlCCgNZUwrgEbNFpM3W7l63PtJDjhEVu2G2tOSoqCUqVfssA8Jk2nMh4Dyk+
         e8/Skb4matqL5YH3H7w9vDlFGH2Z1qXxKCUWNVqj9vmQyNXDvIrWorfvVIAHs3ril696
         HE4O45jzDhESscDWzUdaf6W5TrzVawpr67rmNDUCggyKdILeyjWYT88BLQdU+wsdgQH7
         J79atIJVfo+rQDMiEXIKtWbF+kDUAAY9U46/bv/wkYI2z5c/5o4vbPqaW0XNz0/Kp4oO
         R7QA==
X-Forwarded-Encrypted: i=1; AL+hErEYhjOCzQQYzDca9rSY8bmn2BjAWt2sHTc68O4uiV1qyyM1mHRboaWJcVajFOe3Y/OT8ZSydgQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z/3cGz7T06zcDHKp6DlKrtWyk1jYHeBd+luYMST1sp7dob9nDgc
	rH24TYBYGxvlnFjcCqn/U8ALPLQLuT8eybA7gHjd1utCsdtQXTSy75tc
X-Gm-Gg: AYBFou2htpypmDjTPGoeigVTAZxTSkv+57zPpSIv9YY24tc0Ow0+uZK9b15X6C9Ijvy
	9L6HLdNQ76QFGfZbH18rTkTZ3F/A9tbxov03IX8puLRFTYoiy/fMOqZVEN8EqO2gmVEg5++ZaQX
	6AshWT00z+orG2p6SSBiEIldk8Vdnnqf1/ea9WdfzIjKw/b/UgsD2p0x1vAgA5UWtRHp9dw/HLM
	WSDn1z6oT2avQWNp9qPaf+0Lpi7KbeT1lk1XWd3BxrwFCx+P+YKKFM/D+nUX2uUO0lXgPo+MT0p
	y+pXk0Yp5b4DiOIhWDFCor12EkS0VpJIO6ciHh+Cx55aH0D5EyfM+r8tl4wQtmjPTVeqidXLNCD
	hV1kCoANHWdEwTi1Rs7d7XGAr//l4o6O+vnakq8jGHY29Kt8l6dy/pMKogrPvfczX58EfwX/Jr7
	yWKXFtQeW9TJgGewEOFSJvK3Pp6oOvuDsAF8UoID9roAnPl7oyGulwuhBCSuKAYuiFlQF0UDQWW
	if4I74c3wmXHp3YskRkYEthbdnJ+5wDaQ4VgTbl3i6wt7/pI5QEo52cDY3jUPjCxQ027TXy+g13
	b9VvXsGBtpWowT6uuBLndEtze1Cwz+TJUy3bjsY4Vn6rBw7gH/ImfvdUh+9gMQqKheTipeP88ka
	xZITG9EPiLhX6ERvnT+ow717xHZjG2VblWybIGJcKzYkIBU2hnXG2LWLJBdZJcC+XwSZ+isFWB/
	17FtPLu0xG9T0UFiHj78jFmus=
X-Received: by 2002:a05:600c:1d18:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4ba02305439mr10274975e9.3.1794264849405;
        Mon, 09 Nov 2026 14:54:09 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204342asm21435365e9.6.2026.11.09.14.54.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 14:54:08 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: use all HTT_PPDU_STATS_MAX_USERS slots for PPDU users
Date: Mon,  9 Nov 2026 23:53:55 +0100
Message-ID: <20261109225355.23161-3-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109225355.23161-1-gsustek@gmail.com>
References: <20261109225355.23161-1-gsustek@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_145411_378000_6C944286 
X-CRM114-Status: GOOD (  16.15  )
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


