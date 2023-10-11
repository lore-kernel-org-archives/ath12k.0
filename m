Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EDBE95A97
	for <ath12k@archiver.kernel.org>; Wed, 11 Oct 2023 08:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=31swoKktvkiIxv1KKNOQColmObAem96q8lSKKdrDJro=; b=r3+yTF3mx22Ugn
	TlPD6FGBrl50YUW+j8Z/+cCtMt53RD1e5zCcEU8PJZZFBB8ELeprAc10S/9iwBMuFPttmj0pb/LaL
	mCO4fGylt4AWyzEE91peHT95h20eEtqhFn0vpQpzHbsAttpjv0Ga4ciYKbhNthblXkqXHwq+Wt8T1
	j036qWznlIoXZeHf1sb1BMwLIK3nYRCAX7G4j3jYDNbdaApA80rVHaH1sslTY5jbDzbBBoCoteZiy
	gCUCOa0ZFnqVO1Ov57pMKD804eQ0197mRJ68IHF9FFIb/F33nvf949cqVtj1DONtnkINOG/AvU2W5
	UJTUlb+qKONlScw4rPgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqUqV-00FFrB-2f
	for ath12k@archiver.kernel.org;
	Wed, 11 Oct 2023 08:45:35 +0000
Received: from m12.mail.163.com ([220.181.12.198])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqTg6-00F6dZ-1L
	for ath12k@lists.infradead.org;
	Wed, 11 Oct 2023 07:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=oKT7F
	qr44z78BErwG1vOizQzA/RhFHh09oOs0OyNp08=; b=aXnQVSsaw93utufBkzr1M
	Hyn0NnwefoZ3+8T9guNbobt5Kgddq1o08BJnN/I2EuqUqzR/uIc7QEsodz6I5rtU
	eMyhhMiH0kpOg922+BHNb1DUEbiNeh08t/XPaxp8k1yDLG9mhLwtes1njY3x+WBw
	lVLgSaSh1IPm6RVKO+A0JI=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by zwqz-smtp-mta-g5-4 (Coremail) with SMTP id _____wDnbyTwTiZlYUr8AA--.36070S4;
	Wed, 11 Oct 2023 15:30:00 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: kvalo@kernel.org,
	quic_jjohnson@quicinc.com
Cc: ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ma Ke <make_ruc2021@163.com>
Subject: [PATCH] wifi: ath12k: call ath12k_mac_fils_discovery() without condition
Date: Wed, 11 Oct 2023 15:29:50 +0800
Message-Id: <20231011072950.4097927-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CM-TRANSID: _____wDnbyTwTiZlYUr8AA--.36070S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Xr17tFykGFyUWrW5ur4UArb_yoW8JrW3pF
	47uF1DtF18CFn3JayUtF4xJF4rJ3Z8JrWxKF17Ja4rXFZ0yF1fKFy5Kay2kry8JFnFyF1Y
	9w48tr43uFn8uFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_MKZDUUUUU=
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/xtbBFQIGC2B9od1edgAAsT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_003046_874982_58637C5C 
X-CRM114-Status: UNSURE (   8.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Mac80211 does not set flags BSS_CHANGED_FILS_DISCOVERY and
BSS_CHANGED_UNSOL_BCAST_PROBE_RESP if there are no updates to
FILS discovery and unsolicited broadcast probe response transmission
configurations respectively. This results in the transmissions getting
stopped during BSS change operations which do not include these
attributes. Remove the checks for the flags and always send the existing
configuration to firmware.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 88346e66bb75..94967f810093 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2761,9 +2761,7 @@ static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 		}
 	}
 
-	if (changed & BSS_CHANGED_FILS_DISCOVERY ||
-	    changed & BSS_CHANGED_UNSOL_BCAST_PROBE_RESP)
-		ath12k_mac_fils_discovery(arvif, info);
+	ath12k_mac_fils_discovery(arvif, info);
 
 	if (changed & BSS_CHANGED_EHT_PUNCTURING)
 		arvif->punct_bitmap = info->eht_puncturing;
-- 
2.37.2


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
