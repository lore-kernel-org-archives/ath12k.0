Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32835C02187
	for <ath12k@archiver.kernel.org>; Tue, 14 Jan 2025 00:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouGlQEbhsQNs0UFUFLi2gF6gczK+6auE8D0OYYfB/gw=; b=Alxpzi1sPQPHD9KMQMNQMcdAxS
	AOhkBNUwI//Gjkbp8rpNLsFfYdRzwos4VGZIva6I9baaIxXrqFmdefKiC8a6Wu+fj2RjAMd6ZH7mL
	5v/eKEwuIC2BJDokbayj7xvdnKhwyXIY7ZPB5MZdLgRg69YNolNdl0Tac36RPCmbuqoLaROwdub0L
	IrmmZkupGqvGUt0ORYYW8NHdZaFPrRHB6oyKclwPjDqthFdimKyKSpy8M9Y4EaStztGwiQTEvZ9hW
	e4KFAm0L+NW4JMwda3XHFJbnslwvX8OZj4pd+K5Y6EwfaxvNEf1B8DEP4xlw6E1eMt2zICVp+WxP3
	JPocNg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXUwy-000000074AZ-3z9h
	for ath12k@archiver.kernel.org;
	Tue, 14 Jan 2025 00:38:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXUws-0000000744b-3Vfx
	for ath12k@lists.infradead.org;
	Tue, 14 Jan 2025 00:38:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DH3nsh020388;
	Tue, 14 Jan 2025 00:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ouGlQEbhsQNs0UFUFLi2gF6gczK+6auE8D0OYYfB/gw=; b=SBwzNDNltctaVMpo
	MJ3ZYH/qAV5F/WA0RiIX7wwg76bUaL7FihThz4zEuPSbPUEzb6kBEIbEnQexzjh5
	xk+SJ30LJ1OSF4kYT4NzC75zGqdX0MQRJq4p5lqmBFdL6D7uEqcaBBWw6VWqTroJ
	+VDyakD7SoxaKeGxQ77HClGqwj1wRV29bBNZOE5ILptNHsN9s8t53k3wldCYzOrY
	ZSvJ15g17BESevfYospK/idF9hrPvh6gtjm/P2dU7lOlCAtBml2RPg31S5/KjUPC
	KUYjc3ECDlf6igPa1hLAp2tP6nAxBguxMABPh3Q39fKCZ3JOPB8wlnmU7vUnDoC+
	EF/f6Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4456wa8wp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 00:38:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E0cPAx005938
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 00:38:25 GMT
Received: from ath12k-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 16:38:24 -0800
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v9 5/9] wifi: ath12k: fix TX and RX MCS rate configurations in HE mode
Date: Mon, 13 Jan 2025 16:38:09 -0800
Message-ID: <20250114003813.2783550-6-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250114003813.2783550-1-quic_pradeepc@quicinc.com>
References: <20250114003813.2783550-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 84LWyqgGhNOSBxMXHLaFd11frZG1fktP
X-Proofpoint-ORIG-GUID: 84LWyqgGhNOSBxMXHLaFd11frZG1fktP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_163826_994738_D0682192 
X-CRM114-Status: GOOD (  12.43  )
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

Currently, the TX and RX MCS rate configurations per peer are
reversed when sent to the firmware. As a result, RX MCS rates
are configured for TX, and vice versa. This commit rectifies
the configuration to match what the firmware expects.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 4 ++--
 drivers/net/wireless/ath/ath12k/wmi.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 4dd6cdf84571..8e95b000e339 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2246,8 +2246,8 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 		he_mcs->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_HE_RATE_SET,
 							    sizeof(*he_mcs));
 
-		he_mcs->rx_mcs_set = cpu_to_le32(arg->peer_he_rx_mcs_set[i]);
-		he_mcs->tx_mcs_set = cpu_to_le32(arg->peer_he_tx_mcs_set[i]);
+		he_mcs->rx_mcs_set = cpu_to_le32(arg->peer_he_tx_mcs_set[i]);
+		he_mcs->tx_mcs_set = cpu_to_le32(arg->peer_he_rx_mcs_set[i]);
 		ptr += sizeof(*he_mcs);
 	}
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 1c2c99f765a2..eeef4613bc9f 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -4059,7 +4059,9 @@ struct ath12k_wmi_vht_rate_set_params {
 
 struct ath12k_wmi_he_rate_set_params {
 	__le32 tlv_header;
+	/* MCS at which the peer can receive */
 	__le32 rx_mcs_set;
+	/* MCS at which the peer can transmit */
 	__le32 tx_mcs_set;
 } __packed;
 
-- 
2.34.1


