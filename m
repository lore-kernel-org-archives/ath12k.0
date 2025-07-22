Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BD9C83F34
	for <ath12k@archiver.kernel.org>; Tue, 22 Jul 2025 10:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgzX3k+2zDLXED9O2BnpgtU3ooZETwOsm6yDUHppipU=; b=1ogcK3Wgb35NCCcPOJ2pbUjTmy
	2nn+/CYNTaMr6agNOIGJwxv3GcVoO4jMk+nef0Q2BoBtVtHtobWiXOVrd2gx/JEeCFmpoJNsCt4zI
	FZdO4m1wVYfRfzHMS+9615X40bVRmYClX1m03JvZBYO/ImcTAUdlpGbVhCOMvtwfrfvCFQVAbJwkc
	rGfGasdP6YmlwDFFCBvj5m+ZjnsixwlaanjVmUVHIzXaN0fO0snIVWYnqWLoNDYBbW0jIi/S7hnxB
	JxHaQzpVXie2kq+7hl+5WhCXr0jTkRAAG7U9UKkqdRR7XJgjF5y8ESA56ssgJQ2DFHnWswVOVVBUw
	FenAEfdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9tl-000000026hi-3fJP;
	Tue, 22 Jul 2025 10:07:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9mn-000000024yi-3Tpi
	for ath12k@lists.infradead.org;
	Tue, 22 Jul 2025 09:59:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7GU77018244
	for <ath12k@lists.infradead.org>; Tue, 22 Jul 2025 09:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VgzX3k+2zDL
	XED9O2BnpgtU3ooZETwOsm6yDUHppipU=; b=ga6MkXEyz+z0xuFC+F1nAXEIKwZ
	D3kvxLp+6wJFsGaK7z8GVUQVGTa7Ze6EcHHvKBNEGXgdxQRnsbpfKpB8etcsrN6A
	oQcgjlA7HagrbY/mEfeH9TcX1kMeWniE6jU59RNRKPh/GOpaJmSjhyVkkiTAcxr7
	vAYaP0Y1LM6ttOKPawVy2RYeHWg7ebUj6aqW21Y2Dkr992BPFnGYBFjs9uxu8n7G
	c5b5U7W2Y0znS951QGEvNbbQOFN10WZfD5qySeYrmNwfMUt1bRydOLy751w8g+Nl
	qUY2wB35qmjcJhHyrGoxyzZ67tvAengOpjYp4jN37/uBq8249qG/nRl7opQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804n9ycgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 22 Jul 2025 09:59:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-756bb07b029so4890085b3a.1
        for <ath12k@lists.infradead.org>; Tue, 22 Jul 2025 02:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753178388; x=1753783188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VgzX3k+2zDLXED9O2BnpgtU3ooZETwOsm6yDUHppipU=;
        b=fIc6liOs+gVi4v+pDk5YpaKkcapmgwVTTq3tw9M++Wu3Zy/xUkl4Lo8mbcTvzeQAn3
         1nugwRX8fOrWmDP0hDcqGGUc1qr1qcTPELeLEbvOnn4fOHuOev56zJESuFhemZtRq+d4
         r7YkPS4bEwEjIXRaACI3tfWsYa6cG/Abu0PVRV24sA2TmF/4d1x2HxhWef42z11oRB6Y
         AEIX8JbEm8dpouD5jiDnhFHqIb49XYs6+p3xQr6FCSo9BqpNavYCujk7cgUUUOLyeauY
         nKEJE+zk3GkEwbAV0tAGa8pmd2EJpasniMIzRiAmOuBqLy/K6TfTYPXVQEaoZG64HDpz
         CpuQ==
X-Gm-Message-State: AOJu0Yyb5Te0meD6JTQ/fUqXQCMAR4KWH+OONOxFFmMHgqdcGtTEK041
	uPrYq+SfD0QrNFi+1ij9bueZSogHExPfFmf220fTzUUDyMuDleN3MW/6R6VaXeay03tA8sb+Ddg
	f+cvGGNSMl7xmPpJphkQVn+GRzPct2AOlFlhPNikNDNZOXUdo0eTqnN5uZZtzK/hZqwDGGldV
X-Gm-Gg: ASbGncsC6mP0jZ0P3VVIfX6RHdCT+XQnJhn/HshufO4pSeFBIVqx/rECCIyTRhyOsC4
	LXVKgYgEImjmthUqRNpL0VatUK+bqNqb8VTHe22lxVSgQNQat+C2gJ5ZjpAQ9fXT2qPDbyLjB6M
	yDZKCNMV8ikA1d+m2UFQGT4F2QnZKjgQC26YxsG5ELUh+4su+5ayeuFLAbuE+WlD7zbKvvfctBO
	gG18+7RNj50Z7FbSRmv74GRhfRvQYWFcvDf4j153g8t9wmmJAYiEXxhk/YPzUAZDP+gRJomM9lU
	aC422G7XDvfwBTaXfo8PV4fj2J5gdnAajQVcfpQeMDYs2GNQmF8rSJr+mpMCQdNi6osEeVES4/z
	xOteu37ABryZ9HoN6ksLpYOGDoXDe5zsdjW88HOKndAvDFjunwglY6g==
X-Received: by 2002:a05:6a00:3e1a:b0:73f:f623:55f8 with SMTP id d2e1a72fcca58-7572267ae68mr25018149b3a.5.1753178388149;
        Tue, 22 Jul 2025 02:59:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOL5bsLv/gTYJEiPUeramDIE0f81nOocoZlU4Xhv+jaI0Ua8x6+aULj9I4EdexAzl/8nip2A==
X-Received: by 2002:a05:6a00:3e1a:b0:73f:f623:55f8 with SMTP id d2e1a72fcca58-7572267ae68mr25018118b3a.5.1753178387681;
        Tue, 22 Jul 2025 02:59:47 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89d6bf2sm6851065b3a.53.2025.07.22.02.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 02:59:47 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 2/3] wifi: ath12k: fix HAL_PHYRX_COMMON_USER_INFO handling in monitor mode
Date: Tue, 22 Jul 2025 17:59:33 +0800
Message-ID: <20250722095934.67-3-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722095934.67-1-kang.yang@oss.qualcomm.com>
References: <20250722095934.67-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: p7DDvdQT2lLc9atl13YKlsZ9nbAnk1cB
X-Proofpoint-ORIG-GUID: p7DDvdQT2lLc9atl13YKlsZ9nbAnk1cB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA4MiBTYWx0ZWRfXxOwSILWTrt9P
 03643R9A7IHhFNb6qMMlsSbAkimtCOmqkMI8AFH0MJMXDAXfcFq5bjzeeCQgF3M158FrlYjxFrY
 8IjWPXAm3zd7NroJwjPSOPPHpQ1qPbXg5FC6KkaJ+PJM/7odftqETiVc8s2k/VwJlpOqJF9gRiy
 hll2WIUAL3VSQ+PPCrJYJiQWww5zHqlxCdv+PTs6Qo7ISuRjjSqK1/BGSFgfihwy+4RcW8n7DHB
 oOj5CJfudlml3H2o2Gj1rXEz4eQ7FUlSN797pWoY8jyR28k2ShM2pMqvFROmSU8RkvClPxbZZDN
 XwzYbDiG/dy28yq4ct273ywtT/TkU94JcRVijbtYt5B5ubhs5wBDwylkKUJsUk/KCg/Sj6Dui1j
 pqSTUFyGRHBEeQ+nYI6uJwUwbz/hyW0ggbJPWA67mBxhV3Uk3ClCpQYfdla/L76VwKy3AFxg
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687f6115 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=zMJAYs59dPwnCMFDeCQA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_025949_873576_5B05F4BD 
X-CRM114-Status: GOOD (  15.49  )
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

Current monitor mode will parse TLV HAL_PHYRX_OTHER_RECEIVE_INFO with
struct hal_phyrx_common_user_info.

Obviously, they do not match. The original intention here was to parse
HAL_PHYRX_COMMON_USER_INFO. So fix it by correctly parsing
HAL_PHYRX_COMMON_USER_INFO instead.

Also add LTF parsing and report to radiotap along with GI.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: d939919a36f4 ("wifi: ath12k: Add HAL_PHYRX_OTHER_RECEIVE_INFO TLV parsing support")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 35 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/hal_rx.h |  3 +-
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index ec1587d0b917..e93ede5e6197 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1440,6 +1440,34 @@ static void ath12k_dp_mon_parse_rx_msdu_end_err(u32 info, u32 *errmap)
 		*errmap |= HAL_RX_MPDU_ERR_MPDU_LEN;
 }
 
+static void
+ath12k_parse_cmn_usr_info(const struct hal_phyrx_common_user_info *cmn_usr_info,
+			  struct hal_rx_mon_ppdu_info *ppdu_info)
+{
+	struct hal_rx_radiotap_eht *eht = &ppdu_info->eht_info.eht;
+	u32 known, data, cp_setting, ltf_size;
+
+	known = __le32_to_cpu(eht->known);
+	known |= IEEE80211_RADIOTAP_EHT_KNOWN_GI |
+		IEEE80211_RADIOTAP_EHT_KNOWN_EHT_LTF;
+	eht->known = cpu_to_le32(known);
+
+	cp_setting = le32_get_bits(cmn_usr_info->info0,
+				   HAL_RX_CMN_USR_INFO0_CP_SETTING);
+	ltf_size = le32_get_bits(cmn_usr_info->info0,
+				 HAL_RX_CMN_USR_INFO0_LTF_SIZE);
+
+	data = __le32_to_cpu(eht->data[0]);
+	data |= u32_encode_bits(cp_setting, IEEE80211_RADIOTAP_EHT_DATA0_GI);
+	data |= u32_encode_bits(ltf_size, IEEE80211_RADIOTAP_EHT_DATA0_LTF);
+	eht->data[0] = cpu_to_le32(data);
+
+	if (!ppdu_info->ltf_size)
+		ppdu_info->ltf_size = ltf_size;
+	if (!ppdu_info->gi)
+		ppdu_info->gi = cp_setting;
+}
+
 static void
 ath12k_dp_mon_parse_status_msdu_end(struct ath12k_mon_data *pmon,
 				    const struct hal_rx_msdu_end *msdu_end)
@@ -1641,11 +1669,8 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k *ar,
 					     HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO0_RX_BW);
 		break;
 	}
-	case HAL_PHYRX_OTHER_RECEIVE_INFO: {
-		const struct hal_phyrx_common_user_info *cmn_usr_info = tlv_data;
-
-		ppdu_info->gi = le32_get_bits(cmn_usr_info->info0,
-					      HAL_RX_PHY_CMN_USER_INFO0_GI);
+	case HAL_PHYRX_COMMON_USER_INFO: {
+		ath12k_parse_cmn_usr_info(tlv_data, ppdu_info);
 		break;
 	}
 	case HAL_RX_PPDU_START_USER_INFO:
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
index a3ab588aae19..801a5f6d3458 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
@@ -695,7 +695,8 @@ struct hal_rx_resp_req_info {
 #define HAL_RX_MPDU_ERR_MPDU_LEN		BIT(6)
 #define HAL_RX_MPDU_ERR_UNENCRYPTED_FRAME	BIT(7)
 
-#define HAL_RX_PHY_CMN_USER_INFO0_GI		GENMASK(17, 16)
+#define HAL_RX_CMN_USR_INFO0_CP_SETTING			GENMASK(17, 16)
+#define HAL_RX_CMN_USR_INFO0_LTF_SIZE			GENMASK(19, 18)
 
 struct hal_phyrx_common_user_info {
 	__le32 rsvd[2];
-- 
2.34.1


