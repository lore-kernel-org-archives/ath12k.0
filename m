Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B881E77179
	for <ath12k@archiver.kernel.org>; Sat,  7 Dec 2024 07:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iDh4so1yjrmnXRNWBoE4vaLN6p43zggddIolQiXyMls=; b=dAeWPJwFNoTJdMZfGvbQL07MEE
	Cs8eNObjG0SLzqPavZL35qJGvoSrlQJCdTomIKSCYY92fur1Ajh2CNE7SrHPqwPU+uVWCgN7rwx3Z
	hZXcpr5tZu0BrvmI+WfAdjBUY6npdCl6RpJTgMQ86JK75NI6845s8gfAI/q6FeX38n8nTy+6w3O2E
	63DM2zm+mykseM5oa4rFJywZzQo7WKTBMw44MeXLQm9vA2eK6GywtWvjYEv7QATGwbP5YEdVQNd4E
	3mBfap5Vjp95GBkS/U+7WKKt62DQzcNSYLfr6t+QgW+zNyEMvfIXA5EMt61t9MJz+Qsjbj7xyhYuE
	8SRrMSBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJp0U-00000003Xu6-1GoI
	for ath12k@archiver.kernel.org;
	Sat, 07 Dec 2024 07:13:38 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJp0R-00000003Xtf-14mh
	for ath12k@lists.infradead.org;
	Sat, 07 Dec 2024 07:13:36 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-725dac69699so20695b3a.0
        for <ath12k@lists.infradead.org>; Fri, 06 Dec 2024 23:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733555614; x=1734160414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iDh4so1yjrmnXRNWBoE4vaLN6p43zggddIolQiXyMls=;
        b=Gmgu9z9d03U4NSIq1JgpxaBnEBzsd4nF1zoMHcey9Jn1kOSPU1xzcyrOvVkyQJvsYa
         9S8j0rDHgHMj3CxiAAHpSqvD4WnY459yict5m9TrNU9ZTEgt3ENInJ5iLtDOgSCvg1Yb
         LhXSiJFvNTR3kaCVXQBblELod3naW2XLPkuApUDufZkwxI/82HM/uC0pZK07WEDG/PmJ
         IlkYyVyQsdwaFacvNqyNKA7j7MY/o24xphq3SZY3FuWF4jFTm2IU8d8jArvFRajyhGoL
         lgOn90hSvetmHXaUMi9GcK6n0dDUn1Hy0RZvlsv247/cisZM2Tu8To5lwL8F5fx/oCJT
         6jMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733555614; x=1734160414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDh4so1yjrmnXRNWBoE4vaLN6p43zggddIolQiXyMls=;
        b=ktnYqnm1VrBL+OK4Ft7Xx9PA3YKvpoJqWvzgbBT4DAFLD0CkagD5/un3neOsUmuWEt
         lkuKuC0LP0lGLki4Il+NqNmN9qljbLC2p3aXRCaPqluXFY++G5rgL5c7JF+LUd/mAUr0
         044QzGyfg48Q+4S1NAo/h5aeEzoIxTM7Z5cH3FTjD1mYWTYyiHFS2rwHH4mRjFUn/+f8
         H+ur5AFhzwr6Fhbtg6IgNrBVd8WyPCyNgB69y5zUNQidKY5LpvJcH73LulWzzXq+U2na
         u4dX+2FW/HMHAEEyWwfZn1nvLkdT1dU3BjBWA4oGvrMa7oYPljLXlr9QjThpDbMdmCEX
         hszw==
X-Forwarded-Encrypted: i=1; AJvYcCWhJY7JIZPlbJvLcZuA2OBxYjkoh99VMDv1yxYYVJcSPxpyrltW9LnSKK61KdDiwPZJ2ki9OQs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfAoypn8L5GgT+RGjWjThd5urlv8Va+K/MajMne5frpGg2Epu/
	LlBvLEVQNfPElS4C1lVono6bpLV3N+m/9XbNErCO9DEJ6mPV6ZK0
X-Gm-Gg: ASbGnctkyyA86i7EQnn/I8l2pMZWDsNjZLq6RoccfC5eG323uKcAgvJTQBcJ+7gHIEn
	wSMrIeFC1NKMKgZSHzwR0YDcdG1p4ClUnx/pLGaY9lwCTq5WAVFcoMcpFJCG8q7meZmbjk1nFvd
	hd8fhyb6y6PIjgMYir8YzJu87Gc9x2jx+6Jk8ar/sYp5Nft8PD6s9k8+TdJ6D7PEy1YLGz9mhFp
	XfhYXigs5ZfqnIMFNvfJ480MODklDvEyAo0XeZY0vu9MhbkW89WB2U=
X-Google-Smtp-Source: AGHT+IHcxeD+MG11WHWR1knOlXO90l6SOht2f808Qj7jDLPyZTb4RWMfYlbEdp8v9XhDP/cfmP8X3A==
X-Received: by 2002:a05:6a00:b52:b0:71d:f2e3:a878 with SMTP id d2e1a72fcca58-725b80e1828mr9388605b3a.5.1733555614125;
        Fri, 06 Dec 2024 23:13:34 -0800 (PST)
Received: from HOME-PC ([223.185.130.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a29c5abdsm3952436b3a.35.2024.12.06.23.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 23:13:33 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: kvalo@kernel.org,
	ath12k@lists.infradead.org
Cc: jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Subject: [PATCH v2 wireless-next] wifi: ath12k: Fix out-of-bounds read in ath12k_mac_vdev_create
Date: Sat,  7 Dec 2024 12:43:06 +0530
Message-Id: <20241207071306.325641-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_231335_329429_9B29A1DC 
X-CRM114-Status: GOOD (  12.71  )
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

Add a bounds check to ath12k_mac_vdev_create() to prevent an out-of-bounds
read in the vif->link_conf array. The function uses link_id, derived from
arvif->link_id, to index the array. When link_id equals 15, the index
exceeds the bounds of the array, which contains only 15 elements.

This issue occurs in the following code branch:

    if (arvif->link_id == ATH12K_DEFAULT_SCAN_LINK && vif->valid_links)
        link_id = ffs(vif->valid_links) - 1;
    else
        link_id = arvif->link_id;

When the first condition in the if statement is true and the second
condition is false, it implies that arvif->link_id equals 15 and
the else branch is taken, where link_id is set to 15, causing an
out-of-bounds access when vif->link_conf array is read using link_id
as index.

Add a check to ensure that link_id does not exceed the valid range of the
vif->link_conf array. Log a warning and return -EINVAL if the check fails
to prevent undefined behavior.

Changelog:

v2:
	- Updated the commit message as per the reviewer's suggestions
	- Clarified the description of the bug in the commit message
	- Added Fixes and Closes tags with relevant information

Fixes: 90570ba4610 ("wifi: ath12k: do not return invalid link id for scan link")
Closes: https://scan7.scan.coverity.com/#/project-view/52337/11354?selectedIssue=1602214

Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 129607ac6c1a..c19b10e66f4a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7725,6 +7725,12 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 	else
 		link_id = arvif->link_id;
 
+	if (link_id >= ARRAY_SIZE(vif->link_conf)) {
+		ath12k_warn(ar->ab, "link_id %u exceeds max valid links for vif %pM\n",
+			    link_id, vif->addr);
+		return -EINVAL;
+	}
+
 	link_conf = wiphy_dereference(hw->wiphy, vif->link_conf[link_id]);
 	if (!link_conf) {
 		ath12k_warn(ar->ab, "unable to access bss link conf in vdev create for vif %pM link %u\n",
-- 
2.34.1


