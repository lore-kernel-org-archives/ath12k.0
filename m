Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6B9C77B6F
	for <ath12k@archiver.kernel.org>; Wed, 29 Mar 2023 23:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aju8Np1z50tLxA9voM8Difih/M5UJT2HTZ4RcOF2lwM=; b=uU/O7Jjd7VuOQF
	OUQT0mXxt/icbVN1FFheJ5dJH7vZ4rMelvvJUSw6TU/VTily+1ophutofaZ6UaPyhWdLfhCAdFqFz
	cjdDFLdjVDAYIMNiXn3SlpBuHLlx7Y0X2AsWtnAOPECuFlO8/jg43i7aWFAVlF31LomRZTyiCH7eL
	VTuCGYzKW0Z+XXUjgxTINpruYVoyP1tANGlRlpLzjCDNUU0Sjtdjtwl1jjf/G77lUL2T/TvK8R70N
	HP/w2Q++AHdHcBAqlZJcUWmvOhxma4xlxOjsgV0XJoLr9Bzng2087C4LQtMTpK5MgQsn5jRiZKp7l
	Fbxo5NFo38jffTSKabqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phexe-002227-1z
	for ath12k@archiver.kernel.org;
	Wed, 29 Mar 2023 23:12:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phexb-0021yo-0B
	for ath12k@lists.infradead.org;
	Wed, 29 Mar 2023 23:12:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32TMHZjP023568;
	Wed, 29 Mar 2023 23:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=g2CfjHZDMFcBVGzeGytEVLaiLOV2hc7DuOgF+v6OgXk=;
 b=imJmGG62zKu0GA1sE+qNa3/JeRAZXzNJ5jfphWpd1KpQlYRVz6WQpQjLFQHYAepKGj/b
 UkPVwCYllpjh1giRUee7MsyozxLBtDcVuEFj/YZYOG/7GUD3D47NMj6ZTOJ/0682sNQj
 Q8MJpJUZeieD4/zpUrjVjm5CK2IOOWaSgsrFrAsuciIDfIn219KKKjlazAO6tb1moopF
 TlQcPls+/yU3CpEGCnEzRrRJ8TNbSJxrhALFRY2cVQXI4R2+H8VSbJcLWMiUFCPpUCIk
 8tsgWfNMp8IA/6P2WUu7aEhWEh8Zf1MorQnO/98imQ8G2mHUxoBS5eCsuU4WvwcESLCO IA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmbs8ax3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 23:12:06 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32TNC3x4028077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 23:12:03 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 29 Mar 2023 16:12:01 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Aloka Dixit
	<quic_alokad@quicinc.com>
Subject: [PATCH 09/11] wifi: ath12k: add MLO header in peer association
Date: Wed, 29 Mar 2023 16:11:43 -0700
Message-ID: <20230329231145.20171-10-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230329231145.20171-1-quic_alokad@quicinc.com>
References: <20230329231145.20171-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g7VF3WB-IFkuvE_3If6KwkT487hP49rq
X-Proofpoint-GUID: g7VF3WB-IFkuvE_3If6KwkT487hP49rq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_14,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303290173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_161207_212481_187E5107 
X-CRM114-Status: GOOD (  14.72  )
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

From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>

Add tags with length 0 for MLO header and partner links,
witout these the peer association fails.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index e5513e979d78..319a2def5529 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1901,7 +1901,8 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 	      TLV_HDR_SIZE + (peer_ht_rates_align * sizeof(u8)) +
 	      sizeof(*mcs) + TLV_HDR_SIZE +
 	      (sizeof(*he_mcs) * arg->peer_he_mcs_count) +
-	      TLV_HDR_SIZE + (sizeof(*eht_mcs) * arg->peer_eht_mcs_count);
+	      TLV_HDR_SIZE + (sizeof(*eht_mcs) * arg->peer_eht_mcs_count) +
+	      TLV_HDR_SIZE + TLV_HDR_SIZE;
 
 	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
 	if (!skb)
@@ -2040,6 +2041,18 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 		ptr += sizeof(*eht_mcs);
 	}
 
+	/* MLO header tag with 0 length */
+	len = 0;
+	tlv = ptr;
+	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_STRUCT, len);
+	ptr += TLV_HDR_SIZE;
+
+	/* ML partner links tag with 0 length */
+	len = 0;
+	tlv = ptr;
+	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_STRUCT, len);
+	ptr += TLV_HDR_SIZE;
+
 	ath12k_dbg(ar->ab, ATH12K_DBG_WMI,
 		   "wmi peer assoc vdev id %d assoc id %d peer mac %pM peer_flags %x rate_caps %x peer_caps %x listen_intval %d ht_caps %x max_mpdu %d nss %d phymode %d peer_mpdu_density %d vht_caps %x he cap_info %x he ops %x he cap_info_ext %x he phy %x %x %x peer_bw_rxnss_override %x peer_flags_ext %x eht mac_cap %x %x eht phy_cap %x %x %x\n",
 		   cmd->vdev_id, cmd->peer_associd, arg->peer_mac,
-- 
2.39.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
