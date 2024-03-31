Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78B0CD1284
	for <ath12k@archiver.kernel.org>; Sun, 31 Mar 2024 18:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FdAXN0KaOMKyvNofZTXZ41x5FbCZl59gN0vOHN0BO9s=; b=DsLd6B9h35vWNNyAHHp5xEc6wq
	7n1q+eHdeKpPx7Mzlsd9R1HnWw/GRtCRoZWI2h6gK2XaY1GcYVCa6G5DlPyu3bCWVSE4r5hp5I2OY
	qc7CzUbt+v0n0iahmynPpxwtACXcL92Jfk7e4MXjHWuwhNphRL7jBNNrxJKffea+S00MxJcn3sPLz
	KwF/KY0BACrP7HFkZDe1Mmh+apm74S/GT/PwNoIXw3xuqGq4x6C9qbWc/Ra85J3FBnXUHj+jAfUEA
	uBU9/78tjFCOrtxSpLyxucnkqi3VG8CK3e7Sh6hFEicqPjmAV9jmO7FbLfZ1dTeKFL6AvRERXHvxz
	w3AJqjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqzzH-0000000661K-1I7h
	for ath12k@archiver.kernel.org;
	Sun, 31 Mar 2024 18:32:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqzzC-000000065zw-2XAE
	for ath12k@lists.infradead.org;
	Sun, 31 Mar 2024 18:32:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42VIWqik020772;
	Sun, 31 Mar 2024 18:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=FdAXN0KaOMKyvNofZTXZ41x5FbCZl59gN0vOHN0BO9s=; b=kN
	/jUCXBVWhN5Ng9RjAka7jnslAJwjlSZJMvB9vZyRriTUb/jjvSRbd+PXYElK7hDi
	nv1x0v6bOLP1bVnG3jZURRdg2tf5xDsyua3HVD1xESiOlakSpy6/I8SHi6rOv6Yo
	0RBar1NsGwcy3PVE4PmaYRHaYRIew8JzjofY0xEFgymSnl2eUE1+jp5P3CUm1fjz
	yvG6vV63gp0zUr0nKLYmyvkSh5CPfqbifh6Y22f4w5Ho04KB18oOoDQqNcIzHkOX
	SmzJYhIblBqMvFzDS0m3EkRDqUaOFtQNPxxdTG8fUcHcbS/7kp00fSapmvfHr5On
	pFnOl5OSCUmwaWzNC8/A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x6atwjer6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 31 Mar 2024 18:32:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42VIWpRo022061
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 31 Mar 2024 18:32:51 GMT
Received: from hu-kathirve-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 31 Mar 2024 11:32:49 -0700
From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>,
        Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Subject: [PATCH 1/2] wifi: ath12k: fix BSS chan info request WMI command
Date: Mon, 1 Apr 2024 00:02:31 +0530
Message-ID: <20240331183232.2158756-2-quic_kathirve@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331183232.2158756-1-quic_kathirve@quicinc.com>
References: <20240331183232.2158756-1-quic_kathirve@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XdrO4e6bIs-x5w98anK24tVAyTH1Tdvp
X-Proofpoint-ORIG-GUID: XdrO4e6bIs-x5w98anK24tVAyTH1Tdvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-31_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403310142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_113254_792354_438B9B43 
X-CRM114-Status: GOOD (  10.71  )
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

From: P Praneesh <quic_ppranees@quicinc.com>

Currently, the firmware returns incorrect pdev_id information in
WMI_PDEV_BSS_CHAN_INFO_EVENTID, leading to incorrect filling of
the pdev's survey information.

To prevent this issue, when requesting BSS channel information
through WMI_PDEV_BSS_CHAN_INFO_REQUEST_CMDID, firmware expects
pdev_id as one of the arguments in this WMI command.

Add pdev_id to the struct wmi_pdev_bss_chan_info_req_cmd and fill it
during ath12k_wmi_pdev_bss_chan_info_request(). This resolves the
issue of sending the correct pdev_id in WMI_PDEV_BSS_CHAN_INFO_EVENTID.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Fixes: d889913205 ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 1 +
 drivers/net/wireless/ath/ath12k/wmi.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 34de3d16efc0..72f3bfb904f2 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1525,6 +1525,7 @@ int ath12k_wmi_pdev_bss_chan_info_request(struct ath12k *ar,
 	cmd->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_PDEV_BSS_CHAN_INFO_REQUEST,
 						 sizeof(*cmd));
 	cmd->req_type = cpu_to_le32(type);
+	cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_WMI,
 		   "WMI bss chan info req type %d\n", type);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 6a2da0739ac8..f67e355ee202 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3071,6 +3071,7 @@ struct wmi_pdev_bss_chan_info_req_cmd {
 	__le32 tlv_header;
 	/* ref wmi_bss_chan_info_req_type */
 	__le32 req_type;
+	__le32 pdev_id;
 } __packed;
 
 struct wmi_ap_ps_peer_cmd {
-- 
2.34.1


