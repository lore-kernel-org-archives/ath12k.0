Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80459FD9E35
	for <ath12k@archiver.kernel.org>; Fri, 27 Feb 2026 03:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fthulbMmfgEPDlzeBPVe8KBnGhtcRrCDvqBcv6i/VHM=; b=1YKtH46h+zZ3+BKsNycOMAW6xX
	3kU6Bh5cwIEC8iJQGfyG9/Tp+6j2BtPeggww2HIAXs6jL69v8TyyeYj23YwyUsf9rl2qlEVZOrkp7
	dgikV2cAB9zoIfnWTxqOte6+bWpDPJqBBLHDXRUU1GYMhrYHQ+7BYmDSJ9LfOBKSDy03rteOm8sIq
	wibU2yWDoYZTb24vwDrBDidzHErkp6COai3hCkd2T8aIIRwlCO/wzR8sU8y8VrJmlD3KQJXtqDIOn
	7rt3WyIX7kg4dcSFB0fSs7LW3KfABiLud9Hx1nyJlMRSx5nxG739pqv3Kn9aDBwRSI1/38iWMjdbc
	ZW6SoIiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvobp-00000007bmb-13Uu;
	Fri, 27 Feb 2026 03:33:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvobm-00000007bmF-1EDX
	for ath12k@lists.infradead.org;
	Fri, 27 Feb 2026 03:33:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2KKK81601035
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 03:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fthulbMmfgEPDlzeBPVe8KBnGhtcRrCDvqB
	cv6i/VHM=; b=FpBRxcSHM3bTkG8PKTjjDUYZNCBa4lMm54B/3A+aUYfZUF5LmJ7
	bZhggXwGSX25J2XARAuw0MRxMZVQVG2PtqX7KJtJXjurcNLXyrgUiNW4ZdoyvDje
	AE6EP4aXdJKcCP1akxUjQeO9Mc1UY0I6RFueEW5DFuNiGLKMdYNWXAjomb1kyxQz
	mOaoQpDhlVRNi+BgpS5Ugv4psMwv8+3Unvu2zShBysQjt3Qq2Jl+GvDGrC8XONVP
	BYo4uCXV+LKPpEW54nluxqic2v2eQ8JRliH6oL6Ba2RwZNCERura9eri71NzwgH5
	EOcRRAPmlzF56wyWg0PO5eANC216p3HWEaA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt99sxv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 03:33:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aae146bab0so23414555ad.0
        for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 19:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772163220; x=1772768020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fthulbMmfgEPDlzeBPVe8KBnGhtcRrCDvqBcv6i/VHM=;
        b=Nrr8idekwkOGxDmLYUByIluay2Nr4yeYmuYl7rofl1oh4mQAijXzDBlmDU0LWh/5x2
         0B9sSPzHZvq3DX6okoZNvMslnwBk5qqafGxFTBvJ9UEMX0uhDk9AxDewLr3mbWR7imd/
         NEw/skydeh83KdmOnH6V50hAO7liXDFBSHe1yvhINtnSsjGZw3KOiJrZWExsxFyN/kMR
         Shrju/DfAfL+bIpmmuQKBVC/bZzo3t9VsR4OE/5Vrmkg4Y0PEiRXi1zw3F6cTeTNPDYa
         1ZCf6dtzdI1BUvPEIKaDEYN/7QddIwINKgSc5/B1Al1/0C9vg+1W8afUeO+E0SgBF19W
         nRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772163220; x=1772768020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fthulbMmfgEPDlzeBPVe8KBnGhtcRrCDvqBcv6i/VHM=;
        b=NhfzvSdwWlX/66+PAUOKc8ql9cks3vX5y4lN2GMS89jccBYR1BUBMftpPlQ7Lrex5q
         w+Y3NUvAAc2afMkFFxptZlU3zjgT3bU4HCyHQ7zu/BA1wf8bLTPyA21f3o3LwAP+UM98
         /jOVif86oVUodG/yjaBQq77hKfeno3dI8ffIMLamLh5Zl15y5rSPt40JXLD2KFuoOkNo
         nHqQ2M+oLgCznCKRSxum08WCH5yUrpsYpUn2DbkyxuY4f2XOQRAtYn2LKt3BYXELWjM4
         Hl9N2DusHJPDwfk8S42VJpMTCtFadhU9ueHi8G/7xrBJsF+2pgAac8gGGeJO5x5R+mlz
         ll0A==
X-Gm-Message-State: AOJu0YwgqeVYu/7jO454Rj9VVLqPZYVgovVowL2G5FziLpbv41rBdP+G
	uzyB1i9OBW3gV5Y0HnJKPZ9pYkbh0LUcNwSeQRms+I6kX5lq0Z93iJIhpWzgMLZrDAlRghtgAUv
	2IVZqQkAoYnGiAp3J0eMQPJN0SrAlfhr/kTxt704ou8U5iGknLftKXeBCK28QE7O5oWHw0wvx
X-Gm-Gg: ATEYQzyTchi0H+znKdn9HMk6v/CLFcOhs22jCEVSMe2RnmUS/7xUUUrrN7Wx1UQ6fW8
	f8WD61dfzImZPkdcqC4kq3V135uXVn0SsusPa+Bf8hB+JkZjyuvDoj5dwLeWgGeWSvujNmKrhTa
	nsVQcplIN3MYYZr/ksbDS5DeG1CZvGh70us2LiwXQjwHtXHJTU6jZcKGgRMy7i+o0WaPdaHX44J
	Y2aZBe/sHbi+23fUDDvN4RHNgZHpwrFHLV7PbhWgebONrd4YyIw4vHGh0qNSe+N/g+Iguabku5F
	CzT0fnMfoZUABDmPBbHHVSYRMg2amRnYgJtsbqHmfkAShHs8d5YVekJ+sUOQLeiuiv7hnJF3U5f
	6FKnUmiXVzX+FLOuu9jlKVnTGYf0F1zkdhiUxfYlCZcEVCAGlecHVe2OH2K1ojHw8Q0RMb1dMV6
	uQ3G+aAAtJRzeT5TfhhjK8AFmZel+jben7H2lblNj1+veF
X-Received: by 2002:a17:903:4b07:b0:2ad:ad0f:bbbe with SMTP id d9443c01a7336-2ae2e4b0a5dmr14331545ad.29.1772163219690;
        Thu, 26 Feb 2026 19:33:39 -0800 (PST)
X-Received: by 2002:a17:903:4b07:b0:2ad:ad0f:bbbe with SMTP id d9443c01a7336-2ae2e4b0a5dmr14331285ad.29.1772163219221;
        Thu, 26 Feb 2026 19:33:39 -0800 (PST)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b03ffsm51839355ad.1.2026.02.26.19.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 19:33:38 -0800 (PST)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Enable monitor mode support on IPQ5332
Date: Fri, 27 Feb 2026 09:03:32 +0530
Message-Id: <20260227033332.687805-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69a11094 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=hQIrOB1egfdVivMeMI8A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: bdhSQryolXjagAl4JtPibxtfsmEdtp6r
X-Proofpoint-ORIG-GUID: bdhSQryolXjagAl4JtPibxtfsmEdtp6r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAyNCBTYWx0ZWRfX+j0vPOX27JNy
 rZuv1pMskZCZk6CgT8uM1KpcO0OXRJzDfFpSQxRepH7KI4ut0Gi7q/cWmFmQ6v6F1TWDibSZSIy
 yDfNVxACyO2G453kIDwanv0UtTmC358Ymyp6yv2P0ePJUwOpbWTvnWWdJlFZ4nP2lGfEO549ReI
 jXzfnioXoQaOS/nSW0+vTlNa2lkskyAeWrGbIPAaTmtX/V4W2lScm1GrxHttanMOHq26iS1JpUl
 ZZn+XWv7gc+4CD8+OFPhoxfee118YPdHJYGXFgju11XHLSQF+1BkXvLrcC65/iqHQBGDH8DxW0R
 8iW264WQuOu3lJnGhro7bTZe23D6x06HVQ9HoRjpO6PmogZtbgulMILMcKdC/eG/vl08iTsUN7r
 iltj3U2wbaNy3YtBZmkoiyYnXgKmHEZVPQAEBfEmR5w6NQVhRnowuZq8M5usubfbCLX5quvwqj3
 sjIYux/qM3S2tqzWdeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_193342_356004_F49B2834 
X-CRM114-Status: GOOD (  13.64  )
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

Currently, rxdma1_enable and supports_monitor are set to false in
IPQ5332 hardware parameters, which skips monitor ring configuration
and removes NL80211_IFTYPE_MONITOR from the supported interface modes.

Set rxdma1_enable and supports_monitor to true so that monitor rings are
configured and monitor mode is enabled on IPQ5332.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.7-00587-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index df045ddf42da..27acdfc35459 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -617,7 +617,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			ath12k_wifi7_target_service_to_ce_map_wlan_ipq5332,
 		.svc_to_ce_map_len = 18,
 
-		.rxdma1_enable = false,
+		.rxdma1_enable = true,
 		.num_rxdma_per_pdev = 1,
 		.num_rxdma_dst_ring = 0,
 		.rx_mac_buf_ring = false,
@@ -626,7 +626,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
 				   BIT(NL80211_IFTYPE_AP) |
 				   BIT(NL80211_IFTYPE_MESH_POINT),
-		.supports_monitor = false,
+		.supports_monitor = true,
 
 		.idle_ps = false,
 		.download_calib = true,

base-commit: 20ad0d58517073b3b683ff786c65dd3142321707
-- 
2.34.1


