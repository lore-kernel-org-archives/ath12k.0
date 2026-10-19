Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DA0CCF2D6
	for <ath12k@archiver.kernel.org>; Mon, 19 Oct 2026 10:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7z1IH8d9WiJE9iAQ9sbSsv6NiWzZ4op7yrNpw6Ajsxg=; b=eIXYkHuA+YT46PSs4xzqqC7MYf
	DhN9pPhHPyMuUqeV/Xx2rdaCiuGYQjQ1gJTtH5aEO1L8XnUdZft7IrkWxZ1HKAutsF+QcqFgUOpuS
	tN8CCt3vmX/qs4G8sDE6GtiFNCWg5jP9UHVVABmZG5sXuQToYoUwozdCkRGosWgKMrhC7LgOGUr4H
	C6BrHBeBYUr/YZlQYk8m/NFP7yPkMwHlPj9xyRpSnwpdKWY1GVMwi0Brr3hDuWdyyfoGpxvWI6cy1
	yGnf6X58P4h6TRuKUjrQC/WXoH6YrB+T0JKPON/TuzqdgcllldTzW7L8p/2ec/8M5npIL2Mxg5XEw
	EiHml4Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkAi-0000000759l-44Vl;
	Mon, 19 Oct 2026 10:00:48 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkAf-0000000756m-3zqe
	for ath12k@lists.infradead.org;
	Mon, 19 Oct 2026 10:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=7z
	1IH8d9WiJE9iAQ9sbSsv6NiWzZ4op7yrNpw6Ajsxg=; b=RK+gUZ/kLNZc+Z1Ury
	0cBdWzAdkV8jnX+8qRBoYpZW0UK3WsmWvfo6S1GWkYn61n5Jy3DAk2yq8NeRWMbS
	vQZA4Fd5kElH/pmSQksUxNQRWeXAqWDOdsAo06UF/wyPukhIZLiutIrzeL0/wMS1
	267lL7bQHas1DNcSyDkc12Glk=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgC3E3g+6tVqofy8Ag--.62619S6;
	Mon, 19 Oct 2026 18:00:36 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	P Praneesh <quic_ppranees@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <jiale.yao@example.com>
Subject: [PATCH 4/4] wifi: ath12k: validate ready event MAC address array length
Date: Mon, 19 Oct 2026 18:00:29 +0800
Message-Id: <20261019100029.1908660-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019100029.1908660-1-yaojiale02@163.com>
References: <20261019100029.1908660-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgC3E3g+6tVqofy8Ag--.62619S6
X-Coremail-Antispam: 1Uf129KBjvJXoWrKFy7XryktF4xJFW3ur15urg_yoW8JrW7pr
	WfWF1jkrykJrsrZws8Ja1xCa4rKanrJF17KrWF9a4F9rsavr1Y9F98WFy5Xry5tr4rJF17
	ur4Utrs7CF90qaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UQ0edUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQXbFmrV6kU77AAA3C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_030046_392164_69B94629 
X-CRM114-Status: GOOD (  10.98  )
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

From: Jiale Yao <jiale.yao@example.com>

The ready event reports the number of extra MAC addresses separately
from the fixed-structure address array. ath12k checks the reported
count before assigning addresses to radios, but does not check the
length of the array TLV. A truncated array therefore causes reads past
the supplied event data.

Validate the array capacity before copying any addresses.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Jiale Yao <jiale.yao@example.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 66e39672dcda..0ae366e8a944 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -7082,6 +7082,9 @@ static int ath12k_wmi_rdy_parse(struct ath12k_base *ab, u16 tag, u16 len,
 		if (!(ab->num_radios > 1 && num_mac_addr >= ab->num_radios))
 			break;
 
+		if (len / sizeof(*addr_list) < ab->num_radios)
+			return -EINVAL;
+
 		for (i = 0; i < ab->num_radios; i++) {
 			pdev = &ab->pdevs[i];
 			ether_addr_copy(pdev->mac_addr, addr_list[i].addr);
-- 
2.34.1


