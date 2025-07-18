Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A0CC83F3B
	for <ath12k@archiver.kernel.org>; Fri, 18 Jul 2025 02:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZ4quxnAfEGIRYmWpsGwZnlE5rPMKoZOdNyssF8d8W4=; b=TKgNW7ZbFToJ8BkKHZC8Ugek4s
	5LPIFKvN+8RFDkx1C3UQNmRSDEaOu97mJPV6pa+2YkYp1Tlc8gJ6t+zmPpcAOH70umBsFl98Ye9qd
	mpuDIKqBjCjQnCYAvGHRqvcfHGQoyb4aNMXRGM4vS3nHlQJaHcAXIzq7LKg1O0GzEzXtekG06uKSg
	vcv70yqt0JoouB91qlxMGCyxAJZUU+HLtF96B5YwEMqdRvR8L/8iuiEm99L8Ynq3lVY9BafkAGJb6
	eZPwPtm0Hh0i8lrOtmyoq+a2K/lckPmbXWMsMiCA9sTQyWpiTrqi+qOO4pb4IkPzFYQIBRcii/mSb
	TgaE7U1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucbG3-0000000BZAX-471R;
	Fri, 18 Jul 2025 02:55:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucbG1-0000000BZ9O-323H
	for ath12k@lists.infradead.org;
	Fri, 18 Jul 2025 02:55:34 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HLJsxN000541
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 02:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=xZ4quxnAfEGIRYmWpsGwZnlE5rPMKoZOdNyssF8d8W4=; b=nR
	1eenO7AU4t96hIQwgdtPk/sZSvENJS5m9BRJ7kIAqjUEeNTpLA3fZlN9WT/gnxj4
	KoPZ0qRW3Uc1uXaqkyqbpQTINod8Mi+wnnblazDWn2Dutg39YUMkIDR4pZ1AYt5/
	91ELsIvrlEMSy3ftzaRC+BwX2aI0myl8A2eUK0Yfu4EEzfB8DCi/G/OQwmv3Qrzw
	SZueBL3hTA8cJitVfLBaMVJR7n8tuTspbrSiukxfq1Zd6kuwgQE/poWmebVXSt7D
	gNIG5h8IGArvluy2b7Rt9BDasbUSeDrk5wSEsj5ZmUuo+9BUroB5NQGbNgrwQbME
	/OKV1HWzw948tKJiG2ww==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drvyxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 02:55:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748efefedb5so1495348b3a.2
        for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 19:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752807332; x=1753412132;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZ4quxnAfEGIRYmWpsGwZnlE5rPMKoZOdNyssF8d8W4=;
        b=BmkWieyN/TCLLGHGyCkE4yWsluJ05Ywg0QCUe1fV8kpqt+95A+OYo9idywIsQ2mc/a
         uuJ1NFoGkCsY+u4PScotYHENLjHG7zyodRWk838HwspeI2G/xZXlEWsPJsF+Q90f7agq
         BCAQzfX+tL4AqNyDVuL6nxQsOnSLncrFv1uIB3h+0gVUX4ANleFiSgdPgCB6fjajcjYn
         3nmPI8+P+OXXyQXZMfPrKZUezWLIjGY4WX3czPCiTS7p08nTycj+gJAPvUFEs2j8Ml3Y
         Q6J8Ebm/IchFw8y+tm+1l5F8QDdZYyp2M/6vTfCWT9lbxdVfdddD9Tula674Fdkf0hZk
         JDtQ==
X-Gm-Message-State: AOJu0YwRSAwEhqlawqU0s4HLAJvqqzWcuB152p4v8DovnCw25rfXmMTD
	91JYIHvn9IQquFdWX+7EfwQ4mN70eQ8FLx8TRE+VfpDsoZ8hDAVqTR8iva6CQ9Nl+XUbvjGHlvC
	4O4+OvNqg2nK7jzdkQCsjPhmNHRlCYPeZN81jhqaZClixsq7ykMOmWwNKvU9OeD63HT91WgP6
X-Gm-Gg: ASbGncsgFX5nuz4yajhAnlbpdznQJsiPlWmYwEyu1TtZoQKvMVjyB+P8IIu+vsy/B8c
	7S66zAZ10JtRqmzf/I5KaNRN5xOfcqIIc9Ea14E3B4N9WL8DcCMB2OpZM4ucrb6R+8CJyxkNm4d
	45LNxsAH+ZGERoo9kXd55laucfqL5pGsj8EDiSQtSEWG78FAuyjKGdP0IHkG75F+oFUN+mm2CFy
	DKOdONtDFdiJg1ZK1rAMb7oNv08aJevR9l6F6xgH3JiHMWcCDcph3ryvOb7vxTRAABEn8qRK/F8
	CpGE6+0MD1Sx2B/IscZgLHfU5f1sHlqLN5l/LSObrBDsmPHN/25kl5bA1tQzgNyj0gZ3FZxQBpF
	TAGGsuWjBehnmfXwkhxzEtlDHjVHbgrWk3iCUtTk9RmbdY2qxjY+8gOjpMk6L0n8946WJZg9CbA
	==
X-Received: by 2002:a05:6a21:b94:b0:224:654a:4461 with SMTP id adf61e73a8af0-237d896b51dmr13655166637.41.1752807332057;
        Thu, 17 Jul 2025 19:55:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgG+AmfAZAOqo/kKS3DXtkNwhlm/lCb6RkZu+uE3HLcz6TXmGm9U3TyzO4AbtWaLjggjMjBQ==
X-Received: by 2002:a05:6a21:b94:b0:224:654a:4461 with SMTP id adf61e73a8af0-237d896b51dmr13655129637.41.1752807331518;
        Thu, 17 Jul 2025 19:55:31 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc68095sm255334b3a.139.2025.07.17.19.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 19:55:31 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-next v2 3/3] wifi: ath12k: Advertise encapsulation/decapsulation offload support to mac80211
Date: Fri, 18 Jul 2025 08:25:13 +0530
Message-Id: <20250718025513.32982-4-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250718025513.32982-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250718025513.32982-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _eJwuFp_UMAeFU3asgrAPVt94q-X3ksu
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=6879b7a5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=xNSR-wY7Tz068C_b7HkA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: _eJwuFp_UMAeFU3asgrAPVt94q-X3ksu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDAyMiBTYWx0ZWRfX13ftPQllY70P
 EuJs55ATJJnh3yfuS6XrKuOK6rLl97y4/DlRZFcPVvG3x50KQiGCenrkAs9s50zJkrRUS3Ki/4w
 2x+Z7rG6o3v4oWFzUaMP1rKvq0z6oXE6T3BxUEOnZBazKW2Uea/FLEjEC4NUzRN7T0TAApCVu+Q
 OfUJyIGBC4XA4/kJRqyTyJVL0yZ3YgVj33AwtEYXsF5dOKkWwzOIrc5K5luQ+Y3j0T3K7HL7dFL
 LzOjh8e+lTk55yXT0zlq8cS3Qurq9mKh6RM8Iyj2mHCsJJq1EG8W0gT/UpINtqqCVY8DVKRWAeg
 AuPYhKFVCHhJY/KiRKIQzZuuohfOxvf3PsWWGvJHfJcsbSZIjuNQvc9E0NTxBNgCBSyKvtwQT6r
 vhWGhfd+0GfoJVe3ZX7f89ZIhMOxxpRAy0D7rhG8n3nCUb67+NJks3fjVgOogkinmfbMcmmg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_195533_767715_B146746F 
X-CRM114-Status: GOOD (  12.08  )
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

Currently, the mac80211 layer handles construction and parsing
of 802.11 headers during packet transmission and reception.
Offloading encapsulation and decapsulation to hardware can
significantly enhance performance. Check the service bit to determine
if the firmware supports Ethernet offload. If supported, advertise the
capability to mac80211 to bypass software-based 802.11 header
processing.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00217-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 5 +++++
 drivers/net/wireless/ath/ath12k/wmi.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 3a33eccc0d1d..93ae76daa549 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -13726,6 +13726,11 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	ieee80211_hw_set(hw, REPORTS_LOW_ACK);
 	ieee80211_hw_set(hw, NO_VIRTUAL_MONITOR);
 
+	if (test_bit(WMI_TLV_SERVICE_ETH_OFFLOAD, ar->wmi->wmi_ab->svc_map)) {
+		ieee80211_hw_set(hw, SUPPORTS_TX_ENCAP_OFFLOAD);
+		ieee80211_hw_set(hw, SUPPORTS_RX_DECAP_OFFLOAD);
+	}
+
 	if (cap->nss_ratio_enabled)
 		ieee80211_hw_set(hw, SUPPORTS_VHT_EXT_NSS_BW);
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index ed9b4324a7b8..f1283b8444f9 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2254,6 +2254,7 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_WMSK_COMPACTION_RX_TLVS = 361,
 
 	WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT = 365,
+	WMI_TLV_SERVICE_ETH_OFFLOAD = 461,
 
 	WMI_MAX_EXT2_SERVICE,
 };
-- 
2.17.1


