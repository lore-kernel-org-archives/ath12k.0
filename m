Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF44C77B7A
	for <ath12k@archiver.kernel.org>; Fri,  2 Jun 2023 23:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+K/CuSIwit8qAZR33+OEIB1iSPLNbJRHU/klEzwT+yQ=; b=n4yOXWQsJ8BBnv
	TrtIP0a1VJfTTPzrfScUBzqerhKyttIVPEXfxjAURFGR/8s91fajNJ6gWhdiJizjUOZgBF7Bo3UwX
	/HdVAUIhuX5h+WCAMNqjM3iOsuNqNzxwgupaGOwbTfaZDdzPyGqv2RGx+Mp0Uiwz7yIpqJWQwALLl
	Kaikrs6VmhghhE5cWM/tiIV/d7NuKKIAEpBgunGCZAId1f+UON4nib8d+ktorXT14x6+/spMCyBiH
	KXmW5wpXvUjYW+Id2utctYdz9aIVSq5XcGiJwEkuEJnyFcErOlHF7XNFjt2Rhzsb/e07NkKDUjsIl
	5byZDX16kStPDdxirTeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5EfV-008DWw-39
	for ath12k@archiver.kernel.org;
	Fri, 02 Jun 2023 23:58:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5EfT-008DW0-3B
	for ath12k@bombadil.infradead.org;
	Fri, 02 Jun 2023 23:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jfUET1EwVfGBMulk8yCIgzwVr3A8IWCNKr7MkkSVjIQ=; b=PEIC5FQFWTclTVGs12FlxM9wk4
	mt49XqannxAjFITK4kBQ7THexWcNoMV6kYp5CmonMm2mMzVSbHjTzpCdg9ht4Xjjn6Gu1+3ZqGkox
	XnWoOBx4trlaG9c/ACc+np0J0xcNFjUw6usubpXqkATShGGQJrrrDu9ljo5kmK/o8cZVc6hYF3AZQ
	PTBibGSze9jo/mk18Y2dAQM+pDUbzRuYgnDFPMA+loHL310Tx681E7ErRdCe6e9+jTaKjJPzykMiX
	1uVSGPXTVCAJsK7N2sKQeFY6klfePkVxGptJ8z9syaSp2F+5+jU4dW4Y3YlCfP4bimyKSmJ7rNGaj
	MBqxE3lQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5EfO-001Ui5-0A
	for ath12k@lists.infradead.org;
	Fri, 02 Jun 2023 23:58:50 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 352NsBVW009863;
	Fri, 2 Jun 2023 23:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=jfUET1EwVfGBMulk8yCIgzwVr3A8IWCNKr7MkkSVjIQ=;
 b=bO91Wp/daaL+0Pkqh3+erSTiFnBaWUeoTIvvuMMoNwWKolBNVFgb4veZCO36JHjRN1k/
 quiNKeClOMwpINTCCwcLwPqOxc9NPOoDanSwDFwsIy7e+mleKqwhakhIxgAxQtC5FDDk
 Kdk0f14Vmoo/6dxsWU1D1basrN2GBc2yVTEkcehsI/+6i5f+vBZzssC3z6nde7smlQgM
 sPBD0/sLsFgHGAUYyca08jS4Zh/mWnZx7cNxxvySSd1cUjbgypswL4CfIPK8Sa9sxGIK
 JYO8tObzkSOKjnS4vPpEk1/TTQfnN2W9bZwUECS/rN2ywZmHlx9vgkc1nF3Fmd/xedRo ig== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qyhb9177x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jun 2023 23:58:39 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 352Nwdej022994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Jun 2023 23:58:39 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 2 Jun 2023 16:58:38 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Aloka Dixit
	<quic_alokad@quicinc.com>
Subject: [PATCH v4 09/11] wifi: ath12k: add MLO header in peer association
Date: Fri, 2 Jun 2023 16:58:18 -0700
Message-ID: <20230602235820.23912-10-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230602235820.23912-1-quic_alokad@quicinc.com>
References: <20230602235820.23912-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Vqacn5SLPo5dJdLxIZ-_uMn3gI7GpZLE
X-Proofpoint-ORIG-GUID: Vqacn5SLPo5dJdLxIZ-_uMn3gI7GpZLE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_18,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306020189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_005848_197316_5A7DBF83 
X-CRM114-Status: GOOD (  15.25  )
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

Add tags with length 0 for MLO header and partner links which
are required by the firmware for a successful association.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
---
v4: No change from v3.
v3: Moved MLO header tag addition before EHT rates to match firmware order.
v2: Corrected 'witout' to 'without' in the description.

 drivers/net/wireless/ath/ath12k/wmi.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 7debd2461e1a..9e48e1bce549 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1909,7 +1909,8 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 	      TLV_HDR_SIZE + (peer_ht_rates_align * sizeof(u8)) +
 	      sizeof(*mcs) + TLV_HDR_SIZE +
 	      (sizeof(*he_mcs) * arg->peer_he_mcs_count) +
-	      TLV_HDR_SIZE + (sizeof(*eht_mcs) * arg->peer_eht_mcs_count);
+	      TLV_HDR_SIZE + (sizeof(*eht_mcs) * arg->peer_eht_mcs_count) +
+	      TLV_HDR_SIZE + TLV_HDR_SIZE;
 
 	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
 	if (!skb)
@@ -2032,6 +2033,12 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 		ptr += sizeof(*he_mcs);
 	}
 
+	/* MLO header tag with 0 length */
+	len = 0;
+	tlv = ptr;
+	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_STRUCT, len);
+	ptr += TLV_HDR_SIZE;
+
 	/* Loop through the EHT rate set */
 	len = arg->peer_eht_mcs_count * sizeof(*eht_mcs);
 	tlv = ptr;
@@ -2048,6 +2055,12 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 		ptr += sizeof(*eht_mcs);
 	}
 
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
