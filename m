Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86846C02182
	for <ath12k@archiver.kernel.org>; Thu, 23 Jan 2025 08:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KfbLzW1sBTrDM9E3WNbC0jHN9Q3VCIa2rdPmOaiLqkc=; b=i/flbLcjscyz88ebleaECeeLfg
	MCW7tvjtyZxvQ26KAxx9B9BLuE6ovdpiQ7LKOhCgKD4/BOMwki4X0tTon8bvDinU8F/37gKkT13ob
	js7JspmyGbbPWzsoQqH2iE81Yg2XP0SL42Vf7qNjekS2LvLoe3h7zQlzqcL3Vlko6ggFlZ3+mRWBp
	RSdwvIIQiFCwhbM97Hy7EBK0hodWdQn5FaPLB69dFPlCgAVWLIP5zkj0ZLk3DftK1ouNA1VXCQ0ZN
	eIt9ry+TzY1DkzOUtnTaMjtA7Mr71M3/7ygWiIDLK4LXwYcuc4sw7f3yhLm/7UgH9WRCFUonsBbY+
	x9Gdo4XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tasAs-0000000Bw26-1J1t
	for ath12k@archiver.kernel.org;
	Thu, 23 Jan 2025 08:02:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tasAp-0000000Bw1h-2sUZ
	for ath12k@lists.infradead.org;
	Thu, 23 Jan 2025 08:02:48 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N5DAMG021581;
	Thu, 23 Jan 2025 08:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KfbLzW1sBTrDM9E3WNbC0j
	HN9Q3VCIa2rdPmOaiLqkc=; b=BQIgiNi04GUAq//MLc5HAs/8bIWvT1o8nZ26YS
	QctIxBXgk01+AfBtm89FKb14oPCtl58HgXE47AztIzt7w0RKNEryn/J30G//5EDa
	jfplAZX9anCQXPFRL62EpY15yd9aDNXg5rGZ96EDEquWIXHC2ob2zo+2jHbQXOiA
	bt9YFOV/F8W/zq19KHEIIlGY7oqTi51h6QLTP4FL2/Kb7U+2YNG2V3At0wslTPIK
	b7m6sT8VgjvDfOxWBdsX9/ChoQ9r0NN/8vz5qd6+m1Psgp1+WTi7Bdds2nhEFwEv
	t1/iZlz/s0gj1sEU/OCk30tS1FltZUYd1eJoojgylvhy+I3A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bfe4rbea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 08:02:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50N82hR6025728
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 08:02:43 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 Jan 2025 00:02:41 -0800
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <kvalo@kernel.org>, <quic_jjohnson@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        "Miaoqing
 Pan" <quic_miaoqing@quicinc.com>
Subject: [PATCH v3] wifi: ath12k: fix memory leak in ath12k_pci_remove()
Date: Thu, 23 Jan 2025 16:02:26 +0800
Message-ID: <20250123080226.1116479-1-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ElpB7MWjZUytxyWunx3cQjLZTdFXnjmE
X-Proofpoint-ORIG-GUID: ElpB7MWjZUytxyWunx3cQjLZTdFXnjmE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_000247_849548_AB9C4AC7 
X-CRM114-Status: GOOD (  10.66  )
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

Kmemleak reported this error:

  unreferenced object 0xffff1c165cec3060 (size 32):
    comm "insmod", pid 560, jiffies 4296964570 (age 235.596s)
    backtrace:
      [<000000005434db68>] __kmem_cache_alloc_node+0x1f4/0x2c0
      [<000000001203b155>] kmalloc_trace+0x40/0x88
      [<0000000028adc9c8>] _request_firmware+0xb8/0x608
      [<00000000cad1aef7>] firmware_request_nowarn+0x50/0x80
      [<000000005011a682>] local_pci_probe+0x48/0xd0
      [<00000000077cd295>] pci_device_probe+0xb4/0x200
      [<0000000087184c94>] really_probe+0x150/0x2c0

The firmware memory was allocated in ath12k_pci_probe(), but not
freed in ath12k_pci_remove() in case ATH12K_FLAG_QMI_FAIL bit is
set. So call ath12k_fw_unmap() to free the memory.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.2.0-02280-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---
v2: rebased as Jeff required
v3: move the qmi_fail label above ath12k_fw_unmap()
---
 drivers/net/wireless/ath/ath12k/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 06cff3849ab8..ee61afe564b9 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1734,9 +1734,9 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
 	cancel_work_sync(&ab->reset_work);
 	cancel_work_sync(&ab->dump_work);
 	ath12k_core_deinit(ab);
-	ath12k_fw_unmap(ab);
 
 qmi_fail:
+	ath12k_fw_unmap(ab);
 	ath12k_mhi_unregister(ab_pci);
 
 	ath12k_pci_free_irq(ab);
-- 
2.25.1


