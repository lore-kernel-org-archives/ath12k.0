Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF50E77184
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 08:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLFm4EKI153gNxPPxYIKULynAsOXMim9XdvopsY0Ujg=; b=SdedKAYKBjtUYamtnD3AqXSIzU
	8i6Fm8apO+calCGlgDYpC/JSpzR2ZWAGBWsgF+32GIq6D8yQvxQpwCATd6bnVh62Sf/QD2NO10C6a
	MK+zZIhAuJrrw/M9j7EyBGMe6mozSsPYHfa1xY5jSxRD3GDuLtoKwkwtKlP1QBqPbLhCh1ppv5wle
	s1pYyBKhOd94ug+pOtCzDM7S6CVqwan7uyri+trpSEg3kCDv2ePpwlhDkBh6PqbQWZJ17YBPGbViW
	MWoFhR6f4Eyerb6NWsjJbKnt6R7c3yTGwLCS8wpLZmmqRXlM3jDtpl7iu36QpHSxSrEbMwp6LMXdf
	QcO7cZ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTJ6-0000000CmHZ-2nfa
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 08:51:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTCr-0000000Ckhf-0gCA
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 08:45:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH2wjrA015558;
	Tue, 17 Dec 2024 08:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PLFm4EKI153gNxPPxYIKULynAsOXMim9XdvopsY0Ujg=; b=MEGho84bPebLJBC4
	9ns4pEpK5bDnNMFG4Me/3u1VcBXZA4HoCaaU4cSpYLZDh0fvUif8ymgmR/IIFQ6H
	aFX9QghgXSkYFqIKV0+gzm/IxqHD7la3UpGO6qqkbu3hR0GASbO2LsZNy13ot1xy
	gBNOwB7QJxSWOct6Jkc/nLdkX+rmpqo3F4qmMO24C6IEpL0fE88h6+dhFzttwMWp
	CRv/0HM6+ZXIGgWPF/vpMjKUo4dO2boM8h/40B5ttVanfzxvaZF76YkFtKPANxRD
	xKDSPp11sprcPHlmfaObhkhz/7tz3aub22cQAlIfVPG7zKAO4pzyMx+q0IA77hHq
	n3v/HA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k1060ru2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 08:45:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH8jSOh024885
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 08:45:28 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 00:45:26 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v3 1/8] wifi: ath12k: Add documentation HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG
Date: Tue, 17 Dec 2024 14:15:04 +0530
Message-ID: <20241217084511.2981515-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217084511.2981515-1-quic_periyasa@quicinc.com>
References: <20241217084511.2981515-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: w-82t_OAEDvVshn4NGrWgXqAgBBreC3m
X-Proofpoint-ORIG-GUID: w-82t_OAEDvVshn4NGrWgXqAgBBreC3m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412170071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_004529_211896_68FD1874 
X-CRM114-Status: GOOD (  10.14  )
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

Add missing field documentation for HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG
command with indentation alignment.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 7700828375e3..b178921aaf1d 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -696,9 +696,9 @@ enum htt_stats_internal_ppdu_frametype {
  *
  *    The message would appear as follows:
  *
- *    |31       26|25|24|23            16|15             8|7             0|
- *    |-----------------+----------------+----------------+---------------|
- *    |   rsvd1   |PS|SS|     ring_id    |     pdev_id    |    msg_type   |
+ *    |31   29|28|27|26|25|24|23       16|15             8|7             0|
+ *    |-------+--+--+--+--+--+-----------+----------------+---------------|
+ *    | rsvd1 |ED|DT|OV|PS|SS|  ring_id  |     pdev_id    |    msg_type   |
  *    |-------------------------------------------------------------------|
  *    |              rsvd2               |           ring_buffer_size     |
  *    |-------------------------------------------------------------------|
@@ -725,7 +725,13 @@ enum htt_stats_internal_ppdu_frametype {
  *                    More details can be got from enum htt_srng_ring_id
  *          b'24    - status_swap: 1 is to swap status TLV
  *          b'25    - pkt_swap:  1 is to swap packet TLV
- *          b'26:31 - rsvd1:  reserved for future use
+ *          b'26    - rx_offset_valid (OV): flag to indicate rx offsets
+ *		      configuration fields are valid
+ *          b'27    - drop_thresh_valid (DT): flag to indicate if the
+ *		      rx_drop_threshold field is valid
+ *          b'28    - rx_mon_global_en: Enable/Disable global register
+ *		      configuration in Rx monitor module.
+ *          b'29:31 - rsvd1:  reserved for future use
  * dword1 - b'0:16  - ring_buffer_size: size of buffers referenced by rx ring,
  *                    in byte units.
  *                    Valid only for HW_TO_SW_RING and SW_TO_HW_RING
-- 
2.34.1


