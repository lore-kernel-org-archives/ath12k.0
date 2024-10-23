Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A2ECF5386
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 13:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z13kAPZm9HohYoHcqGRDmZrvFVk3+3i2nWlFD2pLqlE=; b=UCY6gW8CkHgX/N2kVpSbUSqSWd
	M79exNImU9rV1VbPXqUlsLIL0gDSTEppkflF81KTWm/X3TmTfS4sTHdXD7LJRoXT9UWLrMp0kMI3K
	o2NLOTdrZ1xitBfqqMbomhsKzKybcUAINZ18Vif+SqohtyQ9omDHoepcrOjIKOmml99uZdJgG4md1
	sYCYrKyhJCeXFN6AxM7CfFWRap4uT+HqnsPYaofIdyAweRxWjy/mX1pE6ATQQtNusK+i7R2XAz2xR
	BHIvxic8mWLGovcA7YDcxoxuBBBEvlqrVV+RbVCXsb9liAVi8oQFnbsE3yVGSo6OgU8sHk+cy+efg
	Pn4lrSNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bRE-0000000EY5A-208j
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 13:30:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bRA-0000000EY2i-3TwV
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 13:30:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B5E85C5EF7
	for <ath12k@lists.infradead.org>; Wed, 23 Oct 2024 13:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7EFC4CEE7;
	Wed, 23 Oct 2024 13:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729690207;
	bh=V1wdaqhPHxLWgr646r9fLNDlKSG64mnsfzDYxdjDIoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T8hbYr0mRApoaczw2ICmxzG5f2AxjkeRHTXXvKpobEOtMvtzyYC/oe87VA2veW7o4
	 nAcPUSdGia9HTKx/tWVWW6XGLkgUaCdSWkv2KytEE0TAONAdo9N9P71J7z/qJNnGVs
	 YWR/WBuUbdGN9+UOrzzAPwv7aAdP9tWRGJDbOqlFl3j9uqTCUYdsUMo7rXv7xwjCi/
	 kDLTNyG2tNhwMyGdXZ5+7wU9nzwFagA0k7tChGqAS+6JPpgVtE1/qMIohpYMr2d6UQ
	 afCngvzQJYwefLS1Y1CxrAcK/rxdbBI+lRmO9isxhNULxVgNuN9zm0ANgf25xvDXcq
	 9SZLHNS6pTprA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 1/8] wifi: ath12k: ath12k_mac_vdev_create(): use goto for error handling
Date: Wed, 23 Oct 2024 16:29:57 +0300
Message-Id: <20241023133004.2253830-2-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241023133004.2253830-1-kvalo@kernel.org>
References: <20241023133004.2253830-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_063009_156370_1E06FF52 
X-CRM114-Status: UNSURE (   8.94  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

In commit 477cabfdb776 ("wifi: ath12k: modify link arvif creation and removal
for MLO") I had accidentally left one personal TODO comment about using goto
instead of ret. Switch to use goto to be consistent with the error handling in
the function.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f5f96a8b1d61..f45f32f3b5f6 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7047,8 +7047,7 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 		ret = ath12k_wait_for_peer_delete_done(ar, arvif->vdev_id,
 						       arvif->bssid);
 		if (ret)
-			/* KVALO: why not goto err? */
-			return ret;
+			goto err;
 
 		ar->num_peers--;
 	}
-- 
2.39.5


