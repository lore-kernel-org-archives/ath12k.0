Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A9ECA0EE0
	for <ath12k@archiver.kernel.org>; Tue, 12 Aug 2025 16:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNky3PyY6gPSYVfZ5yCYQfZ5N5iM84SyiETWS9rhvLU=; b=ewGnvi3eLQlw+LuocHWafgPWPm
	rvaGEjzWHXweIANZSQ0jHG3AG7cnayhKvk5WL6uWeOdn5PxfyqtCbl6VzIk5PZPsxK2DNB58w7j2X
	/dj0uMb2Wo1U6OyeyfSl3sNA7gW/wTWuxXWzSc+V4P3sfRX5zTHmUg01bqmrqT5hR8OxpMoRQ1HZa
	VoR44Guto5lhG/vBoiwus/GqxzgdAEflwD+1DZWYiy4fsCOve/QKakZqufwWgjDIuYujWVTxs0CP3
	lqIyM4R7kkgs/7h3QA7+zgd8KUQ9oZUXaKx7FoOU4hAT2ZXQSt1/9coi1GzT6B9lfEix0nT1DTRu9
	Bq2VQk9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrjm-0000000BK5b-2HEC;
	Tue, 12 Aug 2025 16:20:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uln0L-0000000Aanj-3mwB
	for ath12k@lists.infradead.org;
	Tue, 12 Aug 2025 11:17:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAveAh005897
	for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 11:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=xNky3PyY6gPSYVfZ5yCYQfZ5N5iM84SyiETWS9rhvLU=; b=D0
	URd982dIl1ef4McPk8EGjvrOtEQrqlYQcqXPysjrKI3O3WAsQUzC+rQvh8CZh8Uz
	FYzZC1I5jN+eVZSc47qK91TOAplOAmWpuH5e4IYcPiKvWStu3LjKYcAiQ4ZVMx8H
	yczgi2G+ToHthOQMsLZSHJKDIDEHjF4UXDBw+vHuft+T0MFjwNPoWfHbHY7qRLT8
	5IgotpBErEaCQZ+LyLNpi4PwaJjW/aW5fkTwbOVwugeRIoh8SZEros8Ly9z+VI1k
	fkWCqnq7KBfjxKNFZ1C66wJpOiTuwicIShYB9ayd7YG08hN4kHOvbdk3Wak4dqKB
	sjfMc+cdlkdIu68fDRNA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjkqkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 11:17:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2403e4c82dbso43443215ad.0
        for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 04:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754997439; x=1755602239;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNky3PyY6gPSYVfZ5yCYQfZ5N5iM84SyiETWS9rhvLU=;
        b=YyM0FSB1tx9SS+J1Ivy4A8pxEPeWrWfxz1La9teWPjB2ws45LbxhcAG+vMwKumQsa6
         hJXVTtbxLs/vGvdZK3IKm9KcHtto3hsycLO011pS3ud37q/xCOhPvZzt75Fvh3y3JeTF
         eVumIV2CqG9kIWfoey06qUqtMO1dFQZuCAsTuVFWOvp4yGu6mN2JEdkdt+y0AM12ZijF
         byl++YHA5ZMUuhTkRNXc8uqduW5SADq2exxMPLuri0jqU/dWLLPfkAagBRXK3SZ+fCyw
         3GSrBGD2BtRzBh8D3z9TbDZz/PYr+F5AXdeBI2v92X8M+G2ce8DHE/fTkZ5CiTWNqoMl
         K+1w==
X-Gm-Message-State: AOJu0YzEzf4nWGH/enZMwkRHaDv/losQiSy6ITncU3ms9kEUCP/CDmtN
	3vEWehP4mQFy2ZM6nTgrnhS+h5ZMSvBhxBaRu/pJFg/pKVrf81/84549/PHz0i8P+FNC9lQ59DY
	dU3UwHHMXzUPEyL5ZzQE7e7DnPHOiFwrW5uwY2K6eKYuc1e9HCRe5QlRRKlQdFOYmqX2o5o4C
X-Gm-Gg: ASbGncu0u1MFM2vuOdQ6sdXp+ro2kFc2fRPS1UBEYes04rGXoGlPNHVdVudRBdbLX+Q
	92Mn9k7YSafWQfFrb33CL3+u4tIcbl4Fa39Sp/NqIGK4i73qX+BNBSDQFj+RninyH5rTVN8yi77
	D9824P3Hlro4UBcl1NUp2FQcktrCjIEAMtXEcn4sRGewYkUkVYbVmBXPbbs2EKqLBRwG7v0Mtb5
	gsvnS+jOMzRbhKtgggkLPoolJJH3FAJ1TvR0NPZMZuX+jwedoZbvEprIk0DLxtiwrsEyUw2SQbI
	ogghem5pY0ZitA2ndTGamUf9wYgCMrZhTT7vP8wxZ+R8fcJwVWbAw94pnSClab2E3ov97S5gBnj
	DYLIUVNs=
X-Received: by 2002:a17:902:ec91:b0:235:f143:9b07 with SMTP id d9443c01a7336-242c1ffd1f7mr214081325ad.5.1754997439170;
        Tue, 12 Aug 2025 04:17:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/MDLYmbx6MFyQb7CqcqL1isEOtvZ0dhyMqfrCAKiaeL95So9uEa5UEAe9Pe527mrC8YljJA==
X-Received: by 2002:a17:902:ec91:b0:235:f143:9b07 with SMTP id d9443c01a7336-242c1ffd1f7mr214081055ad.5.1754997438702;
        Tue, 12 Aug 2025 04:17:18 -0700 (PDT)
Received: from che-ventolnx02.qualcomm.com ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f1ebc1sm296048935ad.67.2025.08.12.04.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 04:17:18 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next 1/3] wifi: ath12k: enhance the WMI_PEER_STA_KICKOUT event with reasons and RSSI reporting
Date: Tue, 12 Aug 2025 16:47:06 +0530
Message-Id: <20250812111708.3686-2-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250812111708.3686-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20250812111708.3686-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX+TdSeNmJS78L
 8Bft5KPMQM2slKRs725iaKK5+RXPmrcbxO0oWbqwYaoH8PiGvvBU2ZjSvZoJONJuDLl+nGOZj55
 0JVF7Im6gSNegNtuhe9ibS2Z2Lulkhn7T5aY5OCZuD41JRq0Fb9LC4wAXEBvRmAgchL32nU+8nv
 ID/ompmFkk0SRoWjKI/E8BqR07/HnyL+mntLOmJ3ZfGhWzwBdQwAZ0NsR4JKNmAbQYGgWQBcIm8
 YCkd4l/0ydlkniTDaPHEqDNxJj9eahzvcYcxV8sF6IFRNZ+4FsGrLDIhqPQXp1293ddkqsRPkya
 /BDErKy3Hrl9/SQicaYw1SUfWDpSyl1fOcEskgSwp1dYMpgt2V4R/zqL8L1PwfaLIsrcQ3WawB6
 rCaLex9p
X-Proofpoint-GUID: Y9VxkrEUMvK-BWAvhYmFx0ARKYVV7Fm9
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689b22c0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=R84Khl0NGm2auFzJyeIA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Y9VxkrEUMvK-BWAvhYmFx0ARKYVV7Fm9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1011 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_041722_059531_7E395C15 
X-CRM114-Status: GOOD (  15.30  )
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

Enhance the WMI_PEER_STA_KICKOUT event by adding support for reporting the
kickout reason and RSSI value. The reason code will be used in the
following patches when the beacon miss handling is added.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c |  7 +++++--
 drivers/net/wireless/ath/ath12k/wmi.h | 15 +++++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index da85c28ec355..cb686c68987a 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6461,6 +6461,8 @@ static int ath12k_pull_peer_sta_kickout_ev(struct ath12k_base *ab, struct sk_buf
 	}
 
 	arg->mac_addr = ev->peer_macaddr.addr;
+	arg->reason = le32_to_cpu(ev->reason);
+	arg->rssi = le32_to_cpu(ev->rssi);
 
 	kfree(tb);
 	return 0;
@@ -7333,8 +7335,9 @@ static void ath12k_peer_sta_kickout_event(struct ath12k_base *ab, struct sk_buff
 		goto exit;
 	}
 
-	ath12k_dbg(ab, ATH12K_DBG_WMI, "peer sta kickout event %pM",
-		   arg.mac_addr);
+	ath12k_dbg(ab, ATH12K_DBG_WMI,
+		   "peer sta kickout event %pM reason: %d rssi: %d\n",
+		   arg.mac_addr, arg.reason, arg.rssi);
 
 	ieee80211_report_low_ack(sta, 10);
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index f3b0a6f57ec2..211812c62f91 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -4548,12 +4548,27 @@ struct wmi_scan_event {
 	__le32 tsf_timestamp;
 } __packed;
 
+enum wmi_peer_sta_kickout_reason {
+	WMI_PEER_STA_KICKOUT_REASON_UNSPECIFIED = 0,
+	WMI_PEER_STA_KICKOUT_REASON_XRETRY = 1,
+	WMI_PEER_STA_KICKOUT_REASON_INACTIVITY = 2,
+	WMI_PEER_STA_KICKOUT_REASON_IBSS_DISCONNECT = 3,
+	WMI_PEER_STA_KICKOUT_REASON_TDLS_DISCONNECT = 4,
+	WMI_PEER_STA_KICKOUT_REASON_SA_QUERY_TIMEOUT = 5,
+	WMI_PEER_STA_KICKOUT_REASON_ROAMING_EVENT = 6,
+	WMI_PEER_STA_KICKOUT_REASON_PMF_ERROR = 7,
+};
+
 struct wmi_peer_sta_kickout_arg {
 	const u8 *mac_addr;
+	enum wmi_peer_sta_kickout_reason reason;
+	u32 rssi;
 };
 
 struct wmi_peer_sta_kickout_event {
 	struct ath12k_wmi_mac_addr_params peer_macaddr;
+	__le32 reason;
+	__le32 rssi;
 } __packed;
 
 #define WMI_ROAM_REASON_MASK		GENMASK(3, 0)
-- 
2.17.1


