Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2033FCCFA10
	for <ath12k@archiver.kernel.org>; Thu, 26 Sep 2024 02:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kvmiGTvk2TzvPFDP2IZoSjU7EAMdUc9SlRIatcWzWLA=; b=4ds4UQEsiju4IuIQ0ehoXUiU2g
	Yjz3/ocReJ2BS34xhce21qthX67q9QPzSlLOWcA1+Z8Og/0NYo7anenccgHPFyg5zI1GmG+ResmJW
	KFF7+uccQxWea+SvTIckyST2kMWZ8oIARL2+qAwrtGOEs+KbYJ+r/w3EQ83wWzwdr6spg8xoBSVKh
	F+DgJdNTHnLWZ9W14hS75NEMF1Ugcgf6k/UXvBsJLLIJCnFTrFksLDPj5GYP4ffH2bRKPO57a322D
	QegGC3+nPll9Ve7vVZIwtlCM4bhYp4yDISODUZcHXM93b+vR7OaDBr+zKyF4qVROC7dUiexLrcQzn
	j7sA/l2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stdxU-00000006yQa-30bD
	for ath12k@archiver.kernel.org;
	Thu, 26 Sep 2024 02:10:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stdxA-00000006yP3-3mgM
	for ath12k@lists.infradead.org;
	Thu, 26 Sep 2024 02:10:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5LAf032281;
	Thu, 26 Sep 2024 02:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kvmiGTvk2TzvPFDP2IZoSj
	U7EAMdUc9SlRIatcWzWLA=; b=paSHIjROiwQlRrWa2w2zBA6b3qwRqP86fzyind
	RBhuEyvF9edXCpuCYNceYD2x1v/D36AYTATkgrjWVzjTa0OIMtraVnFIcy+Rc3xB
	k2lpMpmGHfY2hiInJ3QF0y7r/+kRmAGvGCj1MW1tIw13l5hPLCZWZ0+EXUgdZxdf
	eQYrDaA1x9s9OhZ8WbwzfdguImh4IsCjvVTETkCAwR7fJYhKu5c7MLhjg4KZ/E9P
	QojMKBKZqO1/efF6qYT+R+rg2Nq1+uF38nQHmGHdZrQ5JmzyHXhXNaUrrTvX29xm
	toFHD/s9BZYqyA1u4l1Qh8YB/JV9N13kESfGIuGVDFTYcBSg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sp7up518-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 02:09:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48Q29r0T016636
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 02:09:54 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 19:09:52 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix use-after-free in ath12k_dp_cc_cleanup()
Date: Thu, 26 Sep 2024 07:39:31 +0530
Message-ID: <20240926020931.3424376-1-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zsd8OrUrOWwIFE8CKJZHte7e_JiaX70Z
X-Proofpoint-ORIG-GUID: zsd8OrUrOWwIFE8CKJZHte7e_JiaX70Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 mlxlogscore=872 mlxscore=0 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409260012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_191001_090600_E3E761E2 
X-CRM114-Status: GOOD (  16.58  )
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

During ath12k module removal, in ath12k_core_deinit(),
ath12k_mac_destroy() un-registers ah->hw from mac80211 and frees
the ah->hw as well as all the ar's in it. After this
ath12k_core_soc_destroy()-> ath12k_dp_free()-> ath12k_dp_cc_cleanup()
tries to access one of the freed ar's from pending skb.

This is because during mac destroy, driver failed to flush few
data packets, which were accessed later in ath12k_dp_cc_cleanup()
and freed, but using ar from the packet led to this use-after-free.

BUG: KASAN: use-after-free in ath12k_dp_cc_cleanup.part.0+0x5e2/0xd40 [ath12k]
Write of size 4 at addr ffff888150bd3514 by task modprobe/8926
CPU: 0 UID: 0 PID: 8926 Comm: modprobe Not tainted
6.11.0-rc2-wt-ath+ #1746
Hardware name: Intel(R) Client Systems NUC8i7HVK/NUC8i7HVB, BIOS 
HNKBLi70.86A.0067.2021.0528.1339 05/28/2021

Call Trace:
  <TASK>
  dump_stack_lvl+0x7d/0xe0
  print_address_description.constprop.0+0x33/0x3a0
  print_report+0xb5/0x260
  ? kasan_addr_to_slab+0x24/0x80
  kasan_report+0xd8/0x110
  ? ath12k_dp_cc_cleanup.part.0+0x5e2/0xd40 [ath12k]
  ? ath12k_dp_cc_cleanup.part.0+0x5e2/0xd40 [ath12k]
  kasan_check_range+0xf3/0x1a0
  __kasan_check_write+0x14/0x20
  ath12k_dp_cc_cleanup.part.0+0x5e2/0xd40 [ath12k]
  ath12k_dp_free+0x178/0x420 [ath12k]
  ath12k_core_stop+0x176/0x200 [ath12k]
  ath12k_core_deinit+0x13f/0x210 [ath12k]
  ath12k_pci_remove+0xad/0x1c0 [ath12k]
  pci_device_remove+0x9b/0x1b0
  device_remove+0xbf/0x150
  device_release_driver_internal+0x3c3/0x580
  ? __kasan_check_read+0x11/0x20
  driver_detach+0xc4/0x190
  bus_remove_driver+0x130/0x2a0
  driver_unregister+0x68/0x90
  pci_unregister_driver+0x24/0x240
  ? find_module_all+0x13e/0x1e0
  ath12k_pci_exit+0x10/0x20 [ath12k]
  __do_sys_delete_module+0x32c/0x580
  ? module_flags+0x2f0/0x2f0
  ? kmem_cache_free+0xf0/0x410
  ? __fput+0x56f/0xab0
  ? __fput+0x56f/0xab0
  ? debug_smp_processor_id+0x17/0x20
  __x64_sys_delete_module+0x4f/0x70
  x64_sys_call+0x522/0x9f0
  do_syscall_64+0x64/0x130
  entry_SYSCALL_64_after_hwframe+0x4b/0x53
RIP: 0033:0x7f8182c6ac8b

Commit 24de1b7b231c ("wifi: ath12k: fix flush failure in recovery
scenarios") added the change to decrement the pending packets count
in case of recovery which make sense as ah->hw as well all
ar's in it are intact during recovery, but during core deinit there
is no use in decrementing packets count or waking up the empty waitq
as the module is going to be removed also ar from pending skbs
can't be used and the packets should just be released back.

To fix this, add additional vif check before trying to use the
ar from skb->cb, because during core_deinit mac80211 will delete
all the vifs and ath12k will remove these vif's reference
(ath12k_mac_vif_unref()) from pending packets.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: 24de1b7b231c ("wifi: ath12k: fix flush failure in recovery scenarios")
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 61aa78d8bd8c..09363ca15701 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1203,9 +1203,14 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 				continue;
 
 			skb_cb = ATH12K_SKB_CB(skb);
-			ar = skb_cb->ar;
-			if (atomic_dec_and_test(&ar->dp.num_tx_pending))
-				wake_up(&ar->dp.tx_empty_waitq);
+			/* skb_cb's ar is valid only if the skb is associated with
+			 * a valid vif.
+			 */
+			if (skb_cb->vif) {
+				ar = skb_cb->ar;
+				if (atomic_dec_and_test(&ar->dp.num_tx_pending))
+					wake_up(&ar->dp.tx_empty_waitq);
+			}
 
 			dma_unmap_single(ab->dev, ATH12K_SKB_CB(skb)->paddr,
 					 skb->len, DMA_TO_DEVICE);

base-commit: d35bb26e150d7fb7434959fad9fcaeaac99906e6
-- 
2.34.1


