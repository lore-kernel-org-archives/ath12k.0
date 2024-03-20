Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEB3C54E58
	for <ath12k@archiver.kernel.org>; Wed, 20 Mar 2024 17:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTXBCtfXCxYc611xL35TE8CazjY9B/HsC2l12V8lW5Y=; b=yuzbefJn61ZmCTGVdhoH+Tn2qG
	48HaUrf3vv8iXQl0/OnbcOv1ywwUwk3FDQWlsmiY9OT5vAMMFMfSE/6H7bSAXb3IW0U0M/4ucqNTz
	xEDYc6J495MECRJoyTE4o/wyOPeL9wnN74k1qmCW/WINewMcnJnka8tfXyKoO4ir32jSzYNP6fPve
	zAwBmI3OaS/x2Y+JLTi4E3/qpnM9zHEChss6dKPx0ZhL/AucfofhmBh3uECQSXdkJpyCNymFEbgWH
	bGhJLahIkrMxRSJeW1QiOl3oFp9rWi8omgeielwFeURo2C7Q9TSuakqhPQYjYULnpvKU/iox6R5zd
	0qgEIKHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmzVI-00000000RgB-01N1
	for ath12k@archiver.kernel.org;
	Wed, 20 Mar 2024 17:13:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmzVF-00000000Rf3-0I1e
	for ath12k@lists.infradead.org;
	Wed, 20 Mar 2024 17:13:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42KEllxN026329;
	Wed, 20 Mar 2024 17:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=qcppdkim1; bh=CTXBCtf
	XCxYc611xL35TE8CazjY9B/HsC2l12V8lW5Y=; b=pnjKGp8h47f0UDYa8RyM+Z0
	knB+qzTSYB/IIrD1NOemqUp3HuLVK2TDL0Rtw57usbq0PTswMf83/4G2Gqo9YZ90
	wtd1UAZY751QeYiJmqsF4PcmVDNDAbdTzJLn5ow8w0297A8+E0r98E/V6DGK82QP
	wvJzuPJXG8/wuGErnMCbawSv31/dpM5fHp7W2+6gLqf7ZWNJSM9EzNBhz1Xv95T1
	OLJ5b5CSnoM1O7z3kQI1TxL9HAZkfUTy5SjXDkZBvLrru+ybWvKvac2hhbOze0Zl
	IHOQp2nxNHSpQpxET+VmPQHQC/FHN0rzGHvXKTEfiZ2R4VyrEr/expUqmK0Eo5Q=
	=
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wyy76gsv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 17:13:23 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 42KHDLNs028208;
	Wed, 20 Mar 2024 17:13:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3ww4gm7num-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 17:13:21 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42KHDKfj028195;
	Wed, 20 Mar 2024 17:13:20 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-rgnanase-blr.qualcomm.com [10.190.106.79])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42KHDKJ0028193
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 17:13:20 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 2378837)
	id 12ACF41138; Wed, 20 Mar 2024 22:43:20 +0530 (+0530)
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [PATCH 2/2] wifi: ath12k: Add radar simulation debugfs support
Date: Wed, 20 Mar 2024 22:43:05 +0530
Message-Id: <20240320171305.655288-3-quic_rgnanase@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240320171305.655288-1-quic_rgnanase@quicinc.com>
References: <20240320171305.655288-1-quic_rgnanase@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ge9-l4I6LyKxUxwtrhjn0g1Vs7f6n81I
X-Proofpoint-ORIG-GUID: Ge9-l4I6LyKxUxwtrhjn0g1Vs7f6n81I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_10,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403200138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_101325_247663_808B671E 
X-CRM114-Status: GOOD (  11.82  )
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

Create dfs_simulate_radar debugfs in ath12k debugfs directory.

Usage:
echo 1 > /sys/kernel/debug/ath12k/pci-0000:06:00.0/mac0/dfs_simulate_radar

This debugfs helps user to simulate RADAR interference in run time.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 65f3c8bf3f10..8d8ba951093b 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -7,6 +7,29 @@
 #include "core.h"
 #include "debugfs.h"
 
+static ssize_t ath12k_write_simulate_radar(struct file *file,
+					   const char __user *user_buf,
+					   size_t count, loff_t *ppos)
+{
+	struct ath12k *ar = file->private_data;
+	int ret;
+
+	mutex_lock(&ar->conf_mutex);
+	ret = ath12k_wmi_simulate_radar(ar);
+	if (ret)
+		goto exit;
+
+	ret = count;
+exit:
+	mutex_unlock(&ar->conf_mutex);
+	return ret;
+}
+
+static const struct file_operations fops_simulate_radar = {
+	.write = ath12k_write_simulate_radar,
+	.open = simple_open
+};
+
 void ath12k_debugfs_soc_create(struct ath12k_base *ab)
 {
 	bool dput_needed;
@@ -58,4 +81,10 @@ void ath12k_debugfs_register(struct ath12k *ar)
 	/* Create a symlink under ieee80211/phy* */
 	scnprintf(buf, sizeof(buf), "../../ath12k/%pd2", ar->debug.debugfs_pdev);
 	debugfs_create_symlink("ath12k", hw->wiphy->debugfsdir, buf);
+
+	if (ar->mac.sbands[NL80211_BAND_5GHZ].channels) {
+		debugfs_create_file("dfs_simulate_radar", 0200,
+				    ar->debug.debugfs_pdev, ar,
+				    &fops_simulate_radar);
+	}
 }
-- 
2.34.1


