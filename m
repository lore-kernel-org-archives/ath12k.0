Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56BDC531CB
	for <ath12k@archiver.kernel.org>; Thu, 23 Jul 2026 12:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6EZd+9FomLkt0GnaYzNx2Z6mRDMuGpXFZ3Y6/gAR5k=; b=xXE1beVIxmP6uevWfund//AWDY
	HJthIKtOkB/qVXHgR318MYpFb5FpJCE8DIEk05w99m5swaXJvx4I6ZY+BYgCIaHO35qaLgUbf2jC8
	cSIDIK23OFit86DuTRfZ/irNCxWfW+NyDcEy5OYkPFS/dOQSURhcCPptO5Pi8fxUBalLgFXcR4D9W
	18IWDKAqP1oUBCpPAC2fLl5gQQg4Z4Q4ypCOlbAl3Q3HnvHNfg6Y2pz7TTu6/NH6xwqWIeKS+klAT
	V3f5d2uysZyvZ5RO8OG8QVSe1xG0F6kMsHcL/Zmf7UYh+yboZDqJHc5RXrOIm6nTP4SH/t9RfJXTV
	Gx4AIiZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsxC-0000000EHbE-2UqH;
	Thu, 23 Jul 2026 12:55:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsx9-0000000EHaE-0A84
	for ath12k@lists.infradead.org;
	Thu, 23 Jul 2026 12:55:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qk2b3489612
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 12:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/6EZd+9FomL
	kt0GnaYzNx2Z6mRDMuGpXFZ3Y6/gAR5k=; b=RxWwKJXcVh7JuANUTTFqX0SbWhB
	C866yt0Lv6qG2HPHJfy62LD4B42mMfS+w+NyyARmWsX0Cf9aD/rApbjzZqBSxkVI
	Y+6uqK3eSIJZAHlawgrqBi6Aqb1HJOUnlDQTUVgHUeyl6XNFeZPuQBH/zP3z35mw
	2vkZk70cnUBT1XB62tR2I+4mpQMud0/a5ANtLBkfWwJzC51iOI3xSzppak1kUZeG
	ZLqarj0Zj2cHGgNbFVsvR8QZlN7FNHoDc7CBPWPNbSh0hSEoIUJ1u3SfWT3ezz6j
	RECyIJUiEKPyQXQjTXanRk/II4fvOfmYAIsH+6IOM+LJatwkk0X887nPxIQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28vm65c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 12:55:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa55c9430so7394865ad.0
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 05:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784811305; x=1785416105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/6EZd+9FomLkt0GnaYzNx2Z6mRDMuGpXFZ3Y6/gAR5k=;
        b=aso5X5D/ltI/H8v3BlyHlVGDzsBjZwIVeLojf8UsjuRyNsJf3ikBtu8/w57xVX6Mam
         5FVRKCDxIcrQfDVARPKmZvz76M/mZWKezcgRisp2RuMlMR8qroomK40TcKnZ8ZCoxZ4u
         7vYYllBGtAGYOL6cj0scg/9sRFoc5+RNGx0jvappQgSwcH8u0VjJALeyaxH49Ue2n0nk
         b6Vl/4ThK9F7a1tXjiaWVc4okkgwRFl/3ZAkz9zgawmyeBbOw6QKko/3dynudTI3G/PW
         43Y2fQ/ALqbcZixpdhKy+QkFVN2JGB79ybYInBgvANQ9JsNyMcdRla+B1bX30wfSFePq
         tlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784811305; x=1785416105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/6EZd+9FomLkt0GnaYzNx2Z6mRDMuGpXFZ3Y6/gAR5k=;
        b=UyxEIe5/HYIc6/IpQapt1K9UUmVfnDci/3Hq9MMumrUJ31YvAI/w/7+coAVfSo07c9
         mnF5TEDj8KokKtTs00fHe+A0K9t1VDRzD52HPGTz1/dDHq91xMscstcgpMJYJXtOM+2Z
         VGzBtNoDwHrKe6n5/h7M5ASd/bJx29Th3g6wZCwxnZEwGg2BU4FaTq7vYM2XIdEZZlTd
         qQywH8uwOPgQ0m6pysnubGWYLiMMUdIS1fTHdpZTwLBLkU6mQH2DtI+6E+NQGFMrSn+4
         IkeESdQapI7gFvTB/nFx4/+RVvvKCPkq8kEL08jI0yTu56y21EYcD1z+R9PjjDVWYc5B
         8SvA==
X-Gm-Message-State: AOJu0YxoqEKiPrNpOnq/14dF+S5lwPUgbtnSS9vrCiuHKVdKhzRhx2X0
	WqhNUq9r7+UcBXb3Z3XhY8t2hAqjNzh+B71JWtnhbDF4Omb/ISkNohXSEaCtja0cYflzsWbB7An
	IpYifk6HezE33/9xXc/u/CD9P2hl+O0UN8Z8kylIFzAUIrIf5PlhQBYPX7pe+bEEv6gkQCyo2
X-Gm-Gg: AR+sD10s0vL5cBPpsyFc1s1NJTsdXpdjAOQQsRbnqdGQ24oBvOR6NaQGAhwVckjJjcp
	mvJjac5E/iC8Z1E5HpheBtN9GozHg0ueeHuWlAP/gKmcUgNDQ1U3VrNUbCvtlsFlz6edbHQUvQ/
	54fBp0iRyiy6376X7GoRj8bMuxISKChFvXG5V0naDXzwWQQ5swjcRIwgtVJ+IaNtq2lGCzpYbvT
	QZd+R+9Qd13A0U9OjUZKlbZkdUAdi2mAjklrNqcJ/wjTxNDcKVaw5OE8po3rx715GB3AOr2kD+T
	zDjvnmYsqdNuoHW0OqZyqKTcFhLufcyyHc/HDeGm/KTX2GQd2QB007IJc/w0S+SVDnQkONCL1ul
	NFyMzH545p9a4HDSV8Bx1MxD1MxPk7C9wTQxDZb+E4t9ZAlWyo62w
X-Received: by 2002:a17:903:1b07:b0:2cf:4505:6bcf with SMTP id d9443c01a7336-2cfa6c54aefmr36683165ad.29.1784811304804;
        Thu, 23 Jul 2026 05:55:04 -0700 (PDT)
X-Received: by 2002:a17:903:1b07:b0:2cf:4505:6bcf with SMTP id d9443c01a7336-2cfa6c54aefmr36682895ad.29.1784811304328;
        Thu, 23 Jul 2026 05:55:04 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f350475sm32998385ad.70.2026.07.23.05.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:55:03 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next 1/8] wifi: ath12k: fix out-of-bounds access on TX stats arrays
Date: Thu, 23 Jul 2026 18:24:41 +0530
Message-Id: <20260723125448.922361-2-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
References: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNyBTYWx0ZWRfX6JZB7BL16zqh
 UNiy4nSlfi7lk7UWLnizgzD/IL1QqFl/pf5op/hKLY1wfbkfzdH3Oe+jwiiKwPO0eQ9AMlcsgUG
 /VVMxoy/D//yNZDqIrDolv1nzc5dG5w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNyBTYWx0ZWRfX+wi9trG7VwK/
 EWcubo2T1ltP8b5B8bk4YjYXuwqAyAQijyz5gfLV5PYOkXpqVN2yH2JpsDFJoNy8ed+REDMCF/3
 uuIpUph0czUDwezJNrooOOUZfIGvXf1nLQvwgXt2UjSjP7iXy9SVhebBReI8crE/YYsX1PR6b7p
 WJI6WCqW/yy8pbNb1bK/nj0pkrShaeS73lwkj0OwdOfY1xJyZIU81BRPgGv4yQtmpeD6h1dgEKJ
 SsxjQ3mCqj5B3+rvCCAabuwquqIZMkO7ildG4JU0tI1h1MZ+7HoY3+7TZdR+3MXWVqTJFMIOfwv
 5j9lBsT6B5BVNhhFbhvw8hw3LbMGVYMn2TYOsORm6pzkhaZFSG84G9HtmWMrb2HPZmEZII+Gi+L
 6V5Q2aE9sOd4q5Gr06LZchvxu2SAY+Mf80lTalGx3FjaCUwwiSJU2IvZ0wt/5uMvpYrZRZALCM4
 P+M/E9fWEXnpxSH55mQ==
X-Proofpoint-ORIG-GUID: MFtR3HgxPxBr4MgxtJgmxVLFfUODJJDv
X-Proofpoint-GUID: MFtR3HgxPxBr4MgxtJgmxVLFfUODJJDv
X-Authority-Analysis: v=2.4 cv=D4V37PRj c=1 sm=1 tr=0 ts=6a620f29 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=QbJcohpuGl3nbjs-xDYA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_055507_330712_B294D08D 
X-CRM114-Status: GOOD (  12.53  )
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

From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>

The fw_tx_status[], tx_wbm_rel_source[], and tqm_rel_reason[] arrays
are indexed directly by values read from hardware without bounds checks.
Values at or beyond MAX_FW_TX_STATUS, HAL_WBM_REL_SRC_MODULE_MAX, or
MAX_TQM_RELEASE_REASON respectively would write past the end of the
arrays causing memory corruption.

Add bounds checks using likely() and WARN_ON_ONCE() before incrementing
each counter, consistent with the existing pattern used elsewhere in
the ath12k codebase.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Fixes: c5c62287e690 ("wifi: ath12k: Add device dp stats support")
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index d2749de44553..1d55ccacbff4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -520,7 +520,10 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_dp *dp, void *desc,
 
 	wbm_status = le32_get_bits(status_desc->info0,
 				   HTT_TX_WBM_COMP_INFO0_STATUS);
-	dp->device_stats.fw_tx_status[wbm_status]++;
+	if (likely(wbm_status < MAX_FW_TX_STATUS))
+		dp->device_stats.fw_tx_status[wbm_status]++;
+	else
+		WARN_ON_ONCE(1);
 
 	switch (wbm_status) {
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_OK:
@@ -922,11 +925,17 @@ void ath12k_wifi7_dp_tx_completion_handler(struct ath12k_dp *dp, int ring_id)
 		/* Find the HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE value */
 		buf_rel_source = le32_get_bits(tx_status->info0,
 					       HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE);
-		dp->device_stats.tx_wbm_rel_source[buf_rel_source]++;
+		if (likely(buf_rel_source < HAL_WBM_REL_SRC_MODULE_MAX))
+			dp->device_stats.tx_wbm_rel_source[buf_rel_source]++;
+		else
+			WARN_ON_ONCE(1);
 
 		rel_status = le32_get_bits(tx_status->info0,
 					   HAL_WBM_COMPL_TX_INFO0_TQM_RELEASE_REASON);
-		dp->device_stats.tqm_rel_reason[rel_status]++;
+		if (likely(rel_status < MAX_TQM_RELEASE_REASON))
+			dp->device_stats.tqm_rel_reason[rel_status]++;
+		else
+			WARN_ON_ONCE(1);
 
 		/* Release descriptor as soon as extracting necessary info
 		 * to reduce contention
base-commit: 32f39e331f889a0424f7a0a82893f628e2705727
--
2.34.1


