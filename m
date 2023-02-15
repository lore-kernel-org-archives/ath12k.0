Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB67C61DA4
	for <ath12k@archiver.kernel.org>; Wed, 15 Feb 2023 01:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kQtQ+VUFiK0mIwcr14WBrmW711sjxLdjxMw2fOa2LxQ=; b=iRZ4MvAVh3jZZl
	ZJyq0FeziFPFFIVGmc6uYqItYdtNlrVTy2pqkXLbb7ndo5OIJ0hc6Ufd35nHwIptfF+SrSU9nNj2c
	hYKu39euYb1onzUqbbGdyZefouN9cSTb6Webo9Bl7p86bpDr1FR0jRisSC20sLoVN2DqQyMNlaEt1
	dM7VHJD5H+PF6fGEPFa+hL1Ybpr8Ri1sEtB2YoIPoa6m9sGqs0FQaWGsO5YsmjYzynGQbtK6om/us
	siXZ/4vYwcq5NbsuBbwSSUly1mhk0NCLZLcN0qnZHsGwwVKva2KqgLWjS7DSs38sZMGrSwRlis+Ou
	f2wvFmWfV4rxCjh0f4gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS6YX-004GL5-VV
	for ath12k@archiver.kernel.org; Wed, 15 Feb 2023 01:25:57 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS6YU-004GK5-Oc
	for ath12k@lists.infradead.org; Wed, 15 Feb 2023 01:25:56 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0VbhaWsD_1676424348;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VbhaWsD_1676424348)
          by smtp.aliyun-inc.com;
          Wed, 15 Feb 2023 09:25:49 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: kuba@kernel.org
Cc: davem@davemloft.net,
	kvalo@kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] wifi: ath12k: dp_mon: clean up some inconsistent indentings
Date: Wed, 15 Feb 2023 09:25:48 +0800
Message-Id: <20230215012548.90989-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_172554_983395_6863A6E9 
X-CRM114-Status: UNSURE (   6.39  )
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

drivers/net/wireless/ath/ath12k/dp_mon.c:532 ath12k_dp_mon_parse_he_sig_su() warn: inconsistent indenting

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4062
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 8b3f0769dd58..b30f50ee88dd 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -529,12 +529,12 @@ static void ath12k_dp_mon_parse_he_sig_su(u8 *tlv_data,
 	case 3:
 		if (he_dcm && he_stbc) {
 			he_gi = HE_GI_0_8;
-					he_ltf = HE_LTF_4_X;
+			he_ltf = HE_LTF_4_X;
 		} else {
 			he_gi = HE_GI_3_2;
 			he_ltf = HE_LTF_4_X;
-			}
-			break;
+		}
+		break;
 	}
 	ppdu_info->gi = he_gi;
 	value = he_gi << HE_GI_SHIFT;
-- 
2.20.1.7.g153144c


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
