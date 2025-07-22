Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFE4C87FC5
	for <ath12k@archiver.kernel.org>; Tue, 22 Jul 2025 10:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aj79PieGARiZfwhDrQgy2cSZLlx8dhj+pl1ql5MnxsQ=; b=FSJsujN65dOxqel1/cchc1YQsa
	3wvZtLUDcoyfy0k2XDLZL6Cwfpgr+5eMssJ8GTfgYeOkrSbcgMTuEuw+IpNzre3esed876Jc40OyE
	B0xn6h+w/fP/qTMAnTsrAbrjAm60beTC2Hwb5/0jdyMcX5ivP8ZxctLz7Tib3/waKqdBDU1dB3JTE
	bOivbBhorZiNuBCaovqjhVtgog7BqnpQdiQFjLByGDP4FwKoMWQoW8WfHBU1NPDUCfxhfYreqrdHw
	lsyJQR0zEAb70nbffN7L1R/beg5mmKDbOZ9W/0HwzgroOFC0GbOsXcUljk5QcaYtK+EigrO8uKs3Z
	nLI0rZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9tm-000000026id-1aaA;
	Tue, 22 Jul 2025 10:07:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9mq-000000024zZ-286D
	for ath12k@lists.infradead.org;
	Tue, 22 Jul 2025 09:59:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M40l2u001178
	for <ath12k@lists.infradead.org>; Tue, 22 Jul 2025 09:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aj79PieGARi
	ZfwhDrQgy2cSZLlx8dhj+pl1ql5MnxsQ=; b=W8pVUBhfAL5Sgj+csK+dtMiLABD
	R0ydHDak8gOpB6JHzTM7irkxaa6UA80wYUhSenpHZZW/ltuPFiQSVEIhG/BgA4kJ
	0iwWiy1mQH+K9Jk0gSHNPRxKN+wz9pW6AJjD6umBl2ChLWOEYaWJvOERP/O3QF2N
	kFhWOsuueT7QUxBmLsfRfVgeX+kGUA6NgsrL0RMELTov24K3w7HnEeXq3yqVvUqe
	AXnLs2ielviFeNFeWGCPt81Rb8uP9Uuzl4uGft3S7wy68luC5O0zdE8shtZcflSS
	g09WHO5xk2SNqhhDI4aGA7/n9oaN92+5AyyR1S7bUOdUvBgZRZL2drd4GKg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dgvyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 22 Jul 2025 09:59:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748f3613e6aso2658797b3a.0
        for <ath12k@lists.infradead.org>; Tue, 22 Jul 2025 02:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753178390; x=1753783190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aj79PieGARiZfwhDrQgy2cSZLlx8dhj+pl1ql5MnxsQ=;
        b=HR+8i3Tu6OOTRdTdTxmikkpQNaXcQ/VdJYO5dMSbbe+DNSTk/FV11zJGMZKJTBsU33
         b2zla+rZLRbSU8L1MrUlbw+IO2Ooc3/ATMLldmTv1kb53aqHCtHGbe3oNXYSgoHo5Ds5
         H1ODuEftClj0ddtDijOm473V0DAvMDMReOdJy5UULQjXW/Cm5Zo2CuHQcotxT56VqB5d
         A4G234C3NE8ut6/C5j6deoB06mz7hLHjmPooB1xSn2Ybnd5Nt7kUHX9wEeqwz1pg06U1
         0rubN1qtTLJbw/IvS1+kvovqnDNPiHApqsID4K8Uxv0Av3tawqLmvlAVExyDgz+QXa0V
         msOQ==
X-Gm-Message-State: AOJu0YwO4MOU66OrA667SY23IOGlWhr6B5FgRfkh7dnexId1FvwhBFq9
	VAdruw/H4YHO9TWD+slqcZLxRO8nwLtBpxySerLe0tZZmusSy3WBKiS/FyzAeCKzMSAjwgcei9P
	V/wmJg1kgOEaVlcdb2pgXvthk9ds3rOLU+mn6pkZbVIWv1THATGGLjFg8d6OaZ0RdlJs2NvyB
X-Gm-Gg: ASbGnct2LHdYrVBUXydvDXB02dBvjyKuBWmlTbJM7xN29y3z4p1MRAdtHu0ZeJJYUgi
	/twUSNkcBJznu4vBDQpvcIAbewjPFE+cWvzuvfXvx1R96ef0s2eRJxUaySyNow5cVtplQSdZEZk
	9OkEDjTXaTMoKQBmxnyB+28h7UVHvpMr8f/3sJRImByUVeZN5Q1ppkT4uv4JQJQVqyyiSFqL/P1
	cwHAKEd2Cg+vhNR8d7KjXLaPY27p0QaeQeKNFy3ui6Lv0qGgzQvNPEkbsetHmhWEcIwQCI1qJZo
	gTUM+pX6Um4X9GPxW9+VtoqyZI1VRj8n+2q925yLloeUDL6ZbYpYS8L38L4o56AHsJEdeyMEFdq
	vhsYZotXrGIrPpe/ltwzCP6gpE96acM3OwwBNRsQAUKZuuzBNit7ghw==
X-Received: by 2002:a05:6a00:1795:b0:74e:aba0:6dfd with SMTP id d2e1a72fcca58-75723165609mr27571457b3a.10.1753178389696;
        Tue, 22 Jul 2025 02:59:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyVQQrmdrLoL+4w72T4NauTszr8oWNCq1bc3lzC6QKz/ngrBTTIWf3c3XIh4tU5z3hGY5GEA==
X-Received: by 2002:a05:6a00:1795:b0:74e:aba0:6dfd with SMTP id d2e1a72fcca58-75723165609mr27571428b3a.10.1753178389147;
        Tue, 22 Jul 2025 02:59:49 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89d6bf2sm6851065b3a.53.2025.07.22.02.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 02:59:48 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 3/3] wifi: ath12k: fix the fetching of combined rssi
Date: Tue, 22 Jul 2025 17:59:34 +0800
Message-ID: <20250722095934.67-4-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722095934.67-1-kang.yang@oss.qualcomm.com>
References: <20250722095934.67-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687f6117 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=srnJkZWzPy4--ikV3L8A:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: mn4kOSRA2-z8Q2Q0hm0HOk6sb83A_6eu
X-Proofpoint-ORIG-GUID: mn4kOSRA2-z8Q2Q0hm0HOk6sb83A_6eu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA4MiBTYWx0ZWRfX0xW16nBIaoKE
 H8lnZ1Guu/PbJ4+7Z5W2cLO7k8UptAowYuhLwzt+px+z2GCy80Zh/Dib3hnXfP2uUQ1p28HQu4e
 56ISDqvmvxU2f+cQoeHRD3CNDkJj6f2teIFyHx6mkweuwXfoVmYeAqs6ihkpVEZdyVDHoVy2by2
 BoZcgixkVBv5SS124Ds2vVlrQg2YrD16JGUEAqJyDx/ciGvKIX9e8TLI1fDHy3TVnKXAjbRap/g
 s8UNP48bPBPukodrzGXc1q+5/+dVMitx6thOaeFpeqHQw3bjVyrULTA5F049s8HSRA086essvsx
 43LmtXcHMvMB16qVJwgq6QxXTRVdcbOvIhPfuYhTTEJsfi4wNOdvhwl47+AnvwusV6+bnQmPfe5
 OfhLWfi4M3XBDoqRq46v1GXX94DCEv2thveniKTRHN2HGMGkCdBeplv/8pYNWc5/rY6WIDLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_025952_671046_D9713AB0 
X-CRM114-Status: GOOD (  14.95  )
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

Currently, host fetches combined rssi from rssi_comb in struct
hal_rx_phyrx_rssi_legacy_info.

rssi_comb is 8th to 15th bits of the second to last variable.
rssi_comb_ppdu is the 0th to 7th of the last variable.

When bandwidth = 20MHz, rssi_comb = rssi_comb_ppdu. But when bandwidth >
20MHz, rssi_comb < rssi_comb_ppdu because rssi_comb only includes power
of primary 20 MHz while rssi_comb_ppdu includes power of active
RUs/subchannels. So should fetch combined rssi from rssi_comb_ppdu.

Also related macro definitions are too long, rename them.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 8 ++++----
 drivers/net/wireless/ath/ath12k/hal_rx.h | 9 +++++----
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index e93ede5e6197..abd611ac37f0 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1655,18 +1655,18 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k *ar,
 		const struct hal_rx_phyrx_rssi_legacy_info *rssi = tlv_data;
 
 		info[0] = __le32_to_cpu(rssi->info0);
-		info[1] = __le32_to_cpu(rssi->info1);
+		info[2] = __le32_to_cpu(rssi->info2);
 
 		/* TODO: Please note that the combined rssi will not be accurate
 		 * in MU case. Rssi in MU needs to be retrieved from
 		 * PHYRX_OTHER_RECEIVE_INFO TLV.
 		 */
 		ppdu_info->rssi_comb =
-			u32_get_bits(info[1],
-				     HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO1_RSSI_COMB);
+			u32_get_bits(info[2],
+				     HAL_RX_RSSI_LEGACY_INFO_INFO2_RSSI_COMB_PPDU);
 
 		ppdu_info->bw = u32_get_bits(info[0],
-					     HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO0_RX_BW);
+					     HAL_RX_RSSI_LEGACY_INFO_INFO0_RX_BW);
 		break;
 	}
 	case HAL_PHYRX_COMMON_USER_INFO: {
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
index 801a5f6d3458..d1ad7747b82c 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
@@ -483,15 +483,16 @@ enum hal_rx_ul_reception_type {
 	HAL_RECEPTION_TYPE_FRAMELESS
 };
 
-#define HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO0_RECEPTION	GENMASK(3, 0)
-#define HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO0_RX_BW	GENMASK(7, 5)
-#define HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO1_RSSI_COMB	GENMASK(15, 8)
+#define HAL_RX_RSSI_LEGACY_INFO_INFO0_RECEPTION		GENMASK(3, 0)
+#define HAL_RX_RSSI_LEGACY_INFO_INFO0_RX_BW		GENMASK(7, 5)
+#define HAL_RX_RSSI_LEGACY_INFO_INFO1_RSSI_COMB		GENMASK(15, 8)
+#define HAL_RX_RSSI_LEGACY_INFO_INFO2_RSSI_COMB_PPDU	GENMASK(7, 0)
 
 struct hal_rx_phyrx_rssi_legacy_info {
 	__le32 info0;
 	__le32 rsvd0[39];
 	__le32 info1;
-	__le32 rsvd1;
+	__le32 info2;
 } __packed;
 
 #define HAL_RX_MPDU_START_INFO0_PPDU_ID			GENMASK(31, 16)
-- 
2.34.1


