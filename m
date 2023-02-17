Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6318C05027
	for <ath12k@archiver.kernel.org>; Fri, 17 Feb 2023 07:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lBgDfXpxzI6H6AnrdvHCgh5Ro+dl7s/NovXrTkF3XAc=; b=LVEe7bsJ8cPB+J
	3cvuLsVcCiR3tp+y5Jj5aJ65Hjy/xFK4W0/QLeqkobaznLE+t+wBYn+ko0HUojt9OJTadpJQCipun
	5jcOKwHdUqsToL/aEBNRrqRRSdibLvW8UufDxcgnFohAnY8QpPEAHzYrzSmrWXyHOw602COm7PGY4
	zDJCtxHUsq1yylQiTrlqTSl4fnKSPJLg3mrQhvVVoaUftZwtR6xF+sS8Iwm3jO6vW4kkJ1UFcEbti
	GzOWLBGXJwJrzhsWDIHkEM+3FOR7ef2ZJnSe0a/XDIHuCtNpnu+a0Sruoep859NLm4Dx4uGPhQfnY
	Dck/jklTcb08uB4yiUGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvAi-00D5nW-5e
	for ath12k@archiver.kernel.org; Fri, 17 Feb 2023 07:28:44 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvAf-00D5lF-69
	for ath12k@lists.infradead.org; Fri, 17 Feb 2023 07:28:43 +0000
Received: from dggpemm100007.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PJ3JQ4pfqzRsCN;
	Fri, 17 Feb 2023 15:25:58 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm100007.china.huawei.com
 (7.185.36.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 17 Feb
 2023 15:28:34 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: <kvalo@kernel.org>, <quic_kvalo@quicinc.com>, <quic_jjohnson@quicinc.com>,
	<quic_bselvara@quicinc.com>, <quic_srirrama@quicinc.com>,
	<quic_pradeepc@quicinc.com>, <quic_bqiang@quicinc.com>,
	<yangyingliang@huawei.com>, <liwei391@huawei.com>
Subject: [PATCH -next] wifi: ath12k: use kfree_skb() instead of kfree()
Date: Fri, 17 Feb 2023 15:27:39 +0800
Message-ID: <20230217072739.181304-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100007.china.huawei.com (7.185.36.116)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_232841_425214_2FEEC636 
X-CRM114-Status: UNSURE (   7.62  )
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

The sk_buff should be freed with kfree_skb(), replace
the kfree() with kfree_skb().

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 95294f35155c..fd8d850f9818 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -270,7 +270,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_vif *arvif,
 					  skb_ext_desc->len, DMA_TO_DEVICE);
 		ret = dma_mapping_error(ab->dev, ti.paddr);
 		if (ret) {
-			kfree(skb_ext_desc);
+			kfree_skb(skb_ext_desc);
 			goto fail_unmap_dma;
 		}
 
-- 
2.25.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
