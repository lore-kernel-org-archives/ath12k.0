Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B00CCF2DB
	for <ath12k@archiver.kernel.org>; Mon, 19 Oct 2026 10:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnlkJFAVcMP2fmlDBCKbYyby2RpC8jzhOLmx2fC3lOs=; b=bS1j4L6ulmdaoo6a4Nw/KOud5y
	c20l/Pp4X4hapPugk7//WvZ6eXYhCEu/QEJZE7AoVxgap86o2MqNjQcYQNf0dD9kQdnzSVa+hrUiC
	WqZJK2vFcc0YewrCZQKUrNwO/dlxw+xVwg+7xIxhv5QoBIUkEN/WIyrJq0XN3s8uygE4uBS1HaNXf
	lRbKFdWxpQM1HGw0KdFyf+F+oPd7fxHVGlpjAb3hZjn5QXgHoqmfLlwVkmDtn2XQnkzMKSiIsBYcp
	3ayGgdbmk6SEuD2b78idjhJSlJ+8FWa4cw7+dwoWAFr7jxmSPuvk1V6QyuBhihf5lLKbVFvcbEMLh
	+Yji6Xow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkFA-000000075ya-3h0S;
	Mon, 19 Oct 2026 10:05:24 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkF7-000000075xX-3lOk
	for ath12k@lists.infradead.org;
	Mon, 19 Oct 2026 10:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Rn
	lkJFAVcMP2fmlDBCKbYyby2RpC8jzhOLmx2fC3lOs=; b=j0Slfccc+di3F+2YEx
	1uFCvaFVTg+EtWipMBFdDP8XD7voYDvD4amdTgxcRCYak/QF4MdYT9okRPBIpAGy
	5HOKlQo7btCIaW9KM/m+xuwULMl71GY2xAtC8ppLKABSibrPB85AO8IoN/lVN5j6
	GIr+Uaupf0FlcdPFLfE6Dmsnk=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnLyhT69VqOE_ABA--.43992S6;
	Mon, 19 Oct 2026 18:05:13 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	P Praneesh <quic_ppranees@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 4/4] wifi: ath12k: validate ready event MAC address array length
Date: Mon, 19 Oct 2026 18:05:06 +0800
Message-Id: <20261019100506.1915181-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019100506.1915181-1-yaojiale02@163.com>
References: <20261019100506.1915181-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnLyhT69VqOE_ABA--.43992S6
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrWDtr4rKr18KF15trWfuFg_yoWkKFc_WF
	WFywn7X39rC3W3K3yjkF4SvrZ2k3WUAF4kWr9avrZ3Ga9xJF97Z34rZry5XryDGrWDAFn3
	Crn8Ga1xZ3s0gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiCzuDUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xkhW2rV61kDQQAA3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_030522_292687_BE0F6872 
X-CRM114-Status: GOOD (  10.88  )
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

The ready event reports the number of extra MAC addresses separately
from the fixed-structure address array. ath12k checks the reported
count before assigning addresses to radios, but does not check the
length of the array TLV. A truncated array therefore causes reads past
the supplied event data.

Validate the array capacity before copying any addresses.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
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


