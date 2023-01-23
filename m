Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27B9C25B50
	for <ath12k@archiver.kernel.org>; Mon, 23 Jan 2023 09:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RH5IlbkkKipNnBNpEcHOEDSVvgUisNZ48i3WqP4vw/E=; b=knykziOMvt9puh
	fTz4JujDy9C95QD9ErMlnkClhTXqvVLHIvL2s13NXo4/nUYpxsrr8ZA4ZKbFsEZfPKGVCp0GoAVZ1
	uxf5Ir7rgE4fsf0dc4bKpOxhvPV+KfV/r3nghtfisEp6y0lol1yeDC8HKpdiHkLHivetK+m3oKc3j
	pkhqo1puOEe0c8IrHnRSzAAQeF55wktkp+59W866JkiI1fjTDqdbE6JnwqrlovQ2r244qcUc4F1ml
	fevtnEWXGQI7zZLgAxANb9W+CeJExlt/ChOGnREjzR6prv5vBWJfigsFOpLUifWjlmNnncIFLz38i
	0x1gsg6b9VQbEaw/oH3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtUZ-00GapO-2l
	for ath12k@archiver.kernel.org; Mon, 23 Jan 2023 09:51:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtUW-00GanH-68
	for ath12k@lists.infradead.org; Mon, 23 Jan 2023 09:51:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30N8YLpj025709;
	Mon, 23 Jan 2023 09:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=tkQhIqiqZnzbSTdUPNH2N3otreAXvXheqvISCGVkiXc=;
 b=IEG4oLmfNuVOV8OBxtBASnMwi9/WbddpJuTvMhNYWX6SsVZ9qAhsIYw/cGIh6pnV69z3
 I8l9Cp5tXZACRbDxTEY/a4xaxrtqO8/SW4A5ldkwdQCH5e5q36+ko6TJ5Ds2DNMWTw0c
 Dy+goaHrZSKKZAo+khYsQd7IgiytNwLOKz02VvWucfd8bXT3mq9DK/xONdzqOR+ZRD1M
 Sj2p4xadAiEOhsmQym6RZmQD+RxS3VrMG2oVmF8cuesiei3+ur+meQq0rEX19AwPGKzm
 eJAh5vGajhsQvAB5VPOuwG6/Z0eHPkmfrelNj3A1yHOgJ6wcF8vjKt1WuXJe8xuTeaq9 0w== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89k9anh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jan 2023 09:51:48 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30N9pinu008753;
	Mon, 23 Jan 2023 09:51:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3n894khusw-1;
	Mon, 23 Jan 2023 09:51:44 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30N9pi8X008747;
	Mon, 23 Jan 2023 09:51:44 GMT
Received: from rgnanase-linux.qualcomm.com (rgnanase-linux.qualcomm.com [10.201.162.135])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 30N9piXT008746;
	Mon, 23 Jan 2023 09:51:44 +0000
Received: by rgnanase-linux.qualcomm.com (Postfix, from userid 2378837)
	id 6EA67110200D; Mon, 23 Jan 2023 15:21:43 +0530 (IST)
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [PATCH] wifi: ath12k: PCI ops for wakeup/release MHI
Date: Mon, 23 Jan 2023 15:21:41 +0530
Message-Id: <20230123095141.5310-1-quic_rgnanase@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: B5uT3QMADWRm7vl1WgAi9r2Tnwv30A8I
X-Proofpoint-GUID: B5uT3QMADWRm7vl1WgAi9r2Tnwv30A8I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_05,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=875 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_015152_398954_7B4D5985 
X-CRM114-Status: GOOD (  16.28  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Wakeup/release MHI is not needed before pci_read/write for QCN9274.
Since wakeup & release MHI is enabled for all QCN9274 and
WCN7850, below MHI assert is seen in QCN9274

[  784.906613] BUG: sleeping function called from invalid context at drivers/bus/mhi/host/pm.c:989
[  784.906633] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 0, name: swapper/3
[  784.906637] preempt_count: 503, expected: 0
[  784.906641] RCU nest depth: 0, expected: 0
[  784.906644] 2 locks held by swapper/3/0:
[  784.906646]  #0: ffff8ed348e429e0 (&ab->ce.ce_lock){+.-.}-{2:2}, at: ath12k_ce_recv_process_cb+0xb3/0x2f0 [ath12k]
[  784.906664]  #1: ffff8ed348e491f0 (&srng->lock_key#3){+.-.}-{2:2}, at: ath12k_ce_recv_process_cb+0xfb/0x2f0 [ath12k]
[  784.906678] Preemption disabled at:
[  784.906680] [<0000000000000000>] 0x0
[  784.906686] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G        W  O       6.1.0-rc2+ #3
[  784.906688] Hardware name: Intel(R) Client Systems NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0056.2019.0506.1527 05/06/2019
[  784.906690] Call Trace:
[  784.906691]  <IRQ>
[  784.906693]  dump_stack_lvl+0x56/0x7b
[  784.906698]  __might_resched+0x21c/0x270
[  784.906704]  __mhi_device_get_sync+0x7d/0x1c0 [mhi]
[  784.906714]  mhi_device_get_sync+0xd/0x20 [mhi]
[  784.906719]  ath12k_pci_write32+0x75/0x170 [ath12k]
[  784.906729]  ath12k_hal_srng_access_end+0x55/0xc0 [ath12k]
[  784.906737]  ath12k_ce_recv_process_cb+0x1f3/0x2f0 [ath12k]
[  784.906776]  ? ath12k_pci_ce_tasklet+0x11/0x30 [ath12k]
[  784.906788]  ath12k_pci_ce_tasklet+0x11/0x30 [ath12k]
[  784.906813]  tasklet_action_common.isra.18+0xb7/0xe0
[  784.906820]  __do_softirq+0xd0/0x4c9
[  784.906826]  irq_exit_rcu+0x88/0xe0
[  784.906828]  common_interrupt+0xa5/0xc0
[  784.906831]  </IRQ>
[  784.906832]  <TASK>

Adding function callbacks for MHI wakeup and release operations.
QCN9274 does not need wakeup/release, function callbacks are initialized
to NULL. In case of WCN7850, shadow registers are used to access rings.
Since, shadow register's offset is less than ACCESS_ALWAYS_OFF,
mhi_device_get_sync() or mhi_device_put() to wakeup
and release mhi will not be called during service ring accesses.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-03171-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index ae7f6083c9fc..d32637b0113d 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -119,6 +119,30 @@ static const char *irq_name[ATH12K_IRQ_NUM_MAX] = {
 	"tcl2host-status-ring",
 };
 
+static int ath12k_pci_bus_wake_up(struct ath12k_base *ab)
+{
+	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
+
+	return mhi_device_get_sync(ab_pci->mhi_ctrl->mhi_dev);
+}
+
+static void ath12k_pci_bus_release(struct ath12k_base *ab)
+{
+	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
+
+	mhi_device_put(ab_pci->mhi_ctrl->mhi_dev);
+}
+
+static const struct ath12k_pci_ops ath12k_pci_ops_qcn9274 = {
+	.wakeup = NULL,
+	.release = NULL,
+};
+
+static const struct ath12k_pci_ops ath12k_pci_ops_wcn7850 = {
+	.wakeup = ath12k_pci_bus_wake_up,
+	.release = ath12k_pci_bus_release,
+};
+
 static void ath12k_pci_select_window(struct ath12k_pci *ab_pci, u32 offset)
 {
 	struct ath12k_base *ab = ab_pci->ab;
@@ -989,13 +1013,14 @@ u32 ath12k_pci_read32(struct ath12k_base *ab, u32 offset)
 {
 	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
 	u32 val, window_start;
+	int ret = 0;
 
 	/* for offset beyond BAR + 4K - 32, may
 	 * need to wakeup MHI to access.
 	 */
 	if (test_bit(ATH12K_PCI_FLAG_INIT_DONE, &ab_pci->flags) &&
-	    offset >= ACCESS_ALWAYS_OFF)
-		mhi_device_get_sync(ab_pci->mhi_ctrl->mhi_dev);
+	    offset >= ACCESS_ALWAYS_OFF && ab_pci->pci_ops->wakeup)
+		ret = ab_pci->pci_ops->wakeup(ab);
 
 	if (offset < WINDOW_START) {
 		val = ioread32(ab->mem + offset);
@@ -1023,9 +1048,9 @@ u32 ath12k_pci_read32(struct ath12k_base *ab, u32 offset)
 	}
 
 	if (test_bit(ATH12K_PCI_FLAG_INIT_DONE, &ab_pci->flags) &&
-	    offset >= ACCESS_ALWAYS_OFF)
-		mhi_device_put(ab_pci->mhi_ctrl->mhi_dev);
-
+	    offset >= ACCESS_ALWAYS_OFF && ab_pci->pci_ops->release &&
+	    !ret)
+		ab_pci->pci_ops->release(ab);
 	return val;
 }
 
@@ -1033,13 +1058,14 @@ void ath12k_pci_write32(struct ath12k_base *ab, u32 offset, u32 value)
 {
 	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
 	u32 window_start;
+	int ret = 0;
 
 	/* for offset beyond BAR + 4K - 32, may
 	 * need to wakeup MHI to access.
 	 */
 	if (test_bit(ATH12K_PCI_FLAG_INIT_DONE, &ab_pci->flags) &&
-	    offset >= ACCESS_ALWAYS_OFF)
-		mhi_device_get_sync(ab_pci->mhi_ctrl->mhi_dev);
+	    offset >= ACCESS_ALWAYS_OFF && ab_pci->pci_ops->wakeup)
+		ret = ab_pci->pci_ops->wakeup(ab);
 
 	if (offset < WINDOW_START) {
 		iowrite32(value, ab->mem + offset);
@@ -1067,8 +1093,9 @@ void ath12k_pci_write32(struct ath12k_base *ab, u32 offset, u32 value)
 	}
 
 	if (test_bit(ATH12K_PCI_FLAG_INIT_DONE, &ab_pci->flags) &&
-	    offset >= ACCESS_ALWAYS_OFF)
-		mhi_device_put(ab_pci->mhi_ctrl->mhi_dev);
+	    offset >= ACCESS_ALWAYS_OFF && ab_pci->pci_ops->release &&
+	    !ret)
+		ab_pci->pci_ops->release(ab);
 }
 
 int ath12k_pci_power_up(struct ath12k_base *ab)
@@ -1182,6 +1209,7 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
 	case QCN9274_DEVICE_ID:
 		ab_pci->msi_config = &ath12k_msi_config[0];
 		ab->static_window_map = true;
+		ab_pci->pci_ops = &ath12k_pci_ops_qcn9274;
 		ath12k_pci_read_hw_version(ab, &soc_hw_version_major,
 					   &soc_hw_version_minor);
 		switch (soc_hw_version_major) {
@@ -1202,6 +1230,7 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
 		ab_pci->msi_config = &ath12k_msi_config[0];
 		ab->static_window_map = false;
 		ab->hw_rev = ATH12K_HW_WCN7850_HW20;
+		ab_pci->pci_ops = &ath12k_pci_ops_wcn7850;
 		break;
 
 	default:
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 0d9e40ab31f2..6547bd9ae475 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -86,6 +86,11 @@ enum ath12k_pci_flags {
 	ATH12K_PCI_ASPM_RESTORE,
 };
 
+struct ath12k_pci_ops {
+        int (*wakeup)(struct ath12k_base *ab);
+        void (*release)(struct ath12k_base *ab);
+};
+
 struct ath12k_pci {
 	struct pci_dev *pdev;
 	struct ath12k_base *ab;
@@ -103,6 +108,7 @@ struct ath12k_pci {
 	/* enum ath12k_pci_flags */
 	unsigned long flags;
 	u16 link_ctl;
+	const struct ath12k_pci_ops *pci_ops;
 };
 
 static inline struct ath12k_pci *ath12k_pci_priv(struct ath12k_base *ab)
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
