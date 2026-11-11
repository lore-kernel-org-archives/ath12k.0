Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E024606A8AE
	for <ath12k@archiver.kernel.org>; Wed, 11 Nov 2026 20:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0K2ROEah;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QOUh5vk2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IZYnbqYkHqkELVkKDLojhWjQ3BIxvmQ0PHO33MEnp+4=; b=0K2ROEahCRCWCITcutiN9sFJLk
	uHTKV+gvofuJMvS0NF8hia1SZWtcG+PDpeIHxN4IjWNjBEfmVbmrKJJsFQVKXGo9t1V4UlUziT9YS
	CcAHgRHr1Zt6fkixI35wlPVe0TTdl97inBdopei26AUKOgakW8FG3Q2WjskeW2Zhea1MU0ywnzhBT
	IAkq3dTuzXbcFkQbo2HHb50mA1kTKnlAyXOIkD9yQu+1giQ6SLmUA/hj3z7l7MDNli9N3gpriMlJ9
	k2AQiBBta8S0I2x79NbCEBVMAG8f4H5dEnz0P1NdVFfy5/Cl8U8qjMEIVFCjnA2MRMf/HdY8G+3EH
	fNLgI6IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRFFJ-00000007gLC-42gp;
	Wed, 11 Nov 2026 20:48:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRFFG-00000007gKD-2ddx
	for ath12k@lists.infradead.org;
	Wed, 11 Nov 2026 20:48:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a214af2076so27129435e9.0
        for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 12:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430116; x=1795034916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IZYnbqYkHqkELVkKDLojhWjQ3BIxvmQ0PHO33MEnp+4=;
        b=QOUh5vk2XALK8UUhtxU3VVmmIzj9bSOJFw+oTjQIE4oMmhxUXlxp5j7O39QzMIbvrx
         N4iHMkaHcVphiusNAT7RodkKwZFppEOhCu0VvG4CNb13wMDcfoOFp3bmFPdxwbqook/E
         XEDd9vkS49pSjbG1l+ICIklDPWRExzS91B2PahlA8o9b4QLeTVyFTyCk5C+1pRbaeh/R
         axetcRxTQIuQv3hXu3bEX50ozOud3lU9nZzCZ7cD+LyZ8HDzZ1v7IvkuhMHH5La8q53N
         acXHOhDo49Igm1db/rsb1AGyLicvlgsV8vLmMeg00nE/uG0UAAoVJhcRyiMp8NUFQUIm
         Nelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430116; x=1795034916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZYnbqYkHqkELVkKDLojhWjQ3BIxvmQ0PHO33MEnp+4=;
        b=z4ZlygbY/NW8HJtEkDxGcRWGFypPFGjBM5KebFoKzW+hbJG6VRV94h+z5rVXjOyf8V
         n97gCRQdxaXdU0ew00P1kXo/krkLfxZQaVmCQ7saDfhdxNSIow4I6TQVI17N06Mdh43P
         g1xdx2aAGiszHAibCi4ugXpHG/vXZCy9c19ovBUoshJ+4/U/dxk0j9ae5Us/mbcze5de
         JM5KHd1LDegcBnTxhjfbL/w3U8d9a8vVsgUI/F17WeJhuDaRRuDdfdPtfg1W9SwCl4G6
         jBSLfXWq+lTbCEKMgw5iMZiX0XEkwl046aZM53tmJDKa7NXaVdm7uJVYRK5gdpZ0lgtK
         j8zg==
X-Forwarded-Encrypted: i=1; AL+hErEvIoa1jyBmEawbHjm8vMR68au1uE6xWpooZu4JsE4n5gSz3NukdpCfwxmeO/QSw7Y184tKk8I=@lists.infradead.org
X-Gm-Message-State: APuU4Z+2W11AIumG1cen5HRyTCQalZKsuaJ4I5insrU+cJ3GsaPZxoMa
	L9dfaY7lr72TOtsJ9OHQO5/5BrmKaniTa56O/qActaaDoFm00YcD3gkO9xkqxO/D3sU=
X-Gm-Gg: AYBFou241Fzy8n5cY5yG93amV35Ib6v/LCiGn4uK4ikoBvWIPW9OC0TRt4Dgis2OMWQ
	KJ2lJlxzeupIfPeKEXBJetMBae6BO/tQge1r/e4bKtK90yiZ8uC2RFu5UV5jOmjgkdXV+klQnag
	IpaT23M+D22TG9EvCTxM97MZrXuxBcwdc3WwSeVCs0FHEJuJ+pWUOpFuuonaNOcntrfPAxquaxH
	szIKI9d+lNZ67MkE+CWKM69p8H7t4msERORnisFYVl/KY7ysUfMl8xh7xZ6/Lfyjr7a6ZyT1P87
	fUL+CADzbgIOwJ3aTNkToP3TlG5H31WxQHUTBjwiIi3FO/1+xR2Q828lqi5dDnzCuD72y2EMOqQ
	ZjnYUx3zglalsR3FiT4xTwIyw5Q6JFmk9DujXio9c12V6m/wzsG01F2+TvsTH5CUlaQtFEuB8Yj
	T8cBdE8mY5J1RM6FdHDgQUmDpyxqKhEwJMcyQkkx5hAYEk6cFWu+XvEBB8/gb8R4qKSyn1npMUN
	TliKTUEgR9NV9j3DTpmL4JI7v2NbUgM5ol0Giy32PRVvfqLL3fh0JN47nc7BD+4iY4o7yiDCk2C
	1EGXhTgV8QN5uA7ZiXFAbBasjGuqwqNIAr8JJjG0GJZbWdXi5+zlT7OIMx5rNgIzeY+L2dDs+Zw
	KI17qHGPWyZGgqutmBOTlcD01D6MSPIHwFn8mne2IF4n5PPT+XEf/3p5bmyBeHHJxV0PacQZ4YS
	m4Md7pJhe+Dd9xC30iJaR9NDQf
X-Received: by 2002:a05:600c:3551:b0:4a6:b49f:9ae5 with SMTP id 5b1f17b1804b1-4ba0938b879mr61055775e9.34.1794430115719;
        Wed, 11 Nov 2026 12:48:35 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (58-119.dsl.iskon.hr. [89.164.58.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm15063795e9.4.2026.11.11.12.48.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 12:48:34 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 RESEND 0/2] wifi: ath12k: PPDU stats user count fixes
Date: Wed, 11 Nov 2026 21:48:21 +0100
Message-ID: <20261111204823.88785-1-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_124838_724999_0B79D54E 
X-CRM114-Status: GOOD (  11.07  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is a resend of v2 without changes. The first posting [1] reached the
lists on 2026-11-09 but never showed up in patchwork.

[1] https://lore.kernel.org/r/20261109225355.23161-1-gsustek@gmail.com

ath12k_htt_pull_ppdu_stats() rejects PPDU stats messages whose common
TLV reports num_users == HTT_PPDU_STATS_MAX_USERS, although that value
is in bounds for the loop the check protects. QCN9274 firmware
WLAN.WBE.1.6-01243 sends it in BE MU BSRP trigger messages addressed to
two Wi-Fi 7 clients, which makes the warning fire on every such trigger
and fill the log on a two-client AP.

Patch 1 corrects the bound and keeps the warning for larger values.
Patch 2 fixes a related off-by-one: the per-user slot finder and the
per-user statistics update skip the last user_stats[] slot.

What the data shows (diagnostic build on an AP MLD, 5 and 6 GHz, two
Wi-Fi 7 clients, 2026-11-02 to 2026-11-09):

- Every message with num_users 7 or 8 was frame type 25
  (HTT_STATS_FTYPE_SGEN_BE_MU_BSRP) and carried user TLVs for exactly
  two stations, with up to four user records per station. num_users
  equals the number of user records, not the number of stations.

- The same firmware advertises max_user_per_ppdu_ofdma of 8 in
  WMI_SERVICE_READY_EXT2, so 8 is the largest value it produces.

- Rejecting a message has no functional effect beyond the warning: the
  user TLVs are already stored when the check runs, and the per-peer
  statistics are applied when the entry leaves the list.

Changes in v2:
- Keep ath12k_warn() (Jeff Johnson); only the bound and the text change.
- Add patch 2 for the slot finder and update loop.
- Base on current ath-next.

v1: https://lore.kernel.org/r/20261101203718.60679-1-gsustek@gmail.com

Goran Sustek (2):
  wifi: ath12k: accept num_users equal to HTT_PPDU_STATS_MAX_USERS
  wifi: ath12k: use all HTT_PPDU_STATS_MAX_USERS slots for PPDU users

 drivers/net/wireless/ath/ath12k/dp_htt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
-- 
2.56.0


