Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351EDC369C2
	for <ath12k@archiver.kernel.org>; Mon, 21 Apr 2025 02:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVtxNw5DxWbz/CXXulYnPYRQliO3LecSwULeLmAboJg=; b=I7EJU54jvcx3dxxMAHqZv+aJGM
	ZQ/ZyA1haOp1De8IXUupP3/7U5UZdpvIXQG8SpCF1eQPb3eVxcFkHf08DrehJOOkj7DRK6BepUZ1+
	EylwHbNmlqBoiuYTNyzNCd12gyxd8WUf+VeDsJ2IJJ2Z/23KWf7W7i84Y/kju+5dHCQX0cFn7vCOk
	+HpIbLuZmqOmeRyv8tpIWcb34M9I04CsRPmXrR9/WjhBjZS7VMrqf2diFux3nDkeTgBuJvJYdpHUk
	WuJPqOtXi8Pis7vH+pCd18W+fc5Th3Hq7lYtZFmZuCOOg/O4afa6PNzXpSbXSZuVJKJGPZdOL4Kug
	UYjQ9whQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0T-00000003S8z-46Rm;
	Mon, 21 Apr 2025 02:35:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0Q-00000003S6E-3uHA
	for ath12k@lists.infradead.org;
	Mon, 21 Apr 2025 02:35:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KM3XNN005669
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wVtxNw5DxWb
	z/CXXulYnPYRQliO3LecSwULeLmAboJg=; b=AlFm21LbYJj3EenBOE+jcFd6oeq
	Cym2uuPu0hlepFFi6cbt1jUnq5iiupnBMrDWRh6f1m1V/HhGwtNNohtMaFSEtrGz
	ILPMsVI/iAgVN0d1qxGEzGUA2eWEI3mAV2rquBWelT3xtWTaCWAJNHztKLk9avlX
	yjbzjTZDigCYvlWGyr+6JnZY0j55GnV2sRsh67GRyhok/F6mcJa7K0Fcqg+JUtBq
	E6456oFXDZfesFVZ4oZPnlEGIdw4zpFD13lDz5qi8+5dv6Id9aGiRmFn2gqCYo1U
	1MPCIU4YMbt8pR0CV2zTKdMZRyTBX3sarL2zty297iifTvuJQ9lS6nVmrzw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642svau2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22403329f9eso27618995ad.3
        for <ath12k@lists.infradead.org>; Sun, 20 Apr 2025 19:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745202924; x=1745807724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVtxNw5DxWbz/CXXulYnPYRQliO3LecSwULeLmAboJg=;
        b=ts3fRG89Vq9Ki0o4xzFFVwGSJktQ97yngCYHB6B7bVyvjHm95oXjvUJKb1nOqeFtVI
         ekeuSS42tJdI+z+W6/kmWRbAqFKZGFHCkk9rR+/L2+dIGv4QyOrK9JMZfoigh0HSyGT+
         9FnI/0DUhIosPb8C8V0Jnqxa5mt5vmJ71rXw1g8cu/H/xoZviQ8gQW/d5wnK8dc0n5Eg
         T5isAYHDaJwTJiTVvZIC1DW8N4ilePE7EkNvqtAyoMhS8nn/w8b76H2xX7Scsmmqyut8
         EkOxQihqEcNHnoLbxngp+tbfbMDN/X+h3PyScwxH+ImbhYEVDm2trJf/R0kJZ+75P4gR
         ud6A==
X-Gm-Message-State: AOJu0Yydle3xkA5gP5GKt11idF1RoueWY+e3Vxfeai8w1LUxfgPauopv
	TWjy+6zFWBGDGnKpbdVCudV0Y26hTrY2dUGeuaRP/l18CVKIehvq+rF6TjSrp79Po5SWmQBn9JT
	l3f/A4Ai3TsMIPD8wy0KwO7IIoVDPRB+iH+tgkwPE8SfZ6Loxd8+jUiwY6jIEC3vgslMjF+o=
X-Gm-Gg: ASbGncv7QVheRvuegmpH8WBxEogLWraXUg75kPdY06j5SRB89oIXpcjOSRKV956Fmw1
	sNXtvN3UUTjz5uCbzoiaHeltW/dhO6IKKwncxaCmMvteMD7dwFVjQ3iWpXrCJBR7o5tr+pDF7zF
	KhDfm1boreUWgjJ3c0ofOJVLnPlok2PSw0Ht66IOoS1RJKohuBzENC5m8fYJo8Iowc+SQORZ01x
	skyweleSMQFPMqKvQe6Qv1Hp/5R3+wx9tg/mtI+muiXb9Fjr4J1NBaksiEkGSQb1hEGIGe67sVb
	02SdUd8NTTRymwz4XUswikb5VJCAF5ZlZd1DJJvfk1/2U05WWqealedpC9gHtzclZGvcQpY4Qv1
	mFOivE0O6ED8=
X-Received: by 2002:a17:903:fad:b0:211:e812:3948 with SMTP id d9443c01a7336-22c530b58acmr153912325ad.0.1745202924318;
        Sun, 20 Apr 2025 19:35:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFqGK/inIa5ejxkMdbcFeJZ8pLIYi7teaTtugkmA1mPFJuqCIhvkKKJQaD5g3jdWNigIP40w==
X-Received: by 2002:a17:903:fad:b0:211:e812:3948 with SMTP id d9443c01a7336-22c530b58acmr153912115ad.0.1745202923904;
        Sun, 20 Apr 2025 19:35:23 -0700 (PDT)
Received: from kangyang.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4287sm54631685ad.130.2025.04.20.19.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 19:35:23 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 03/13] wifi: ath12k: add srng config template for mon status ring
Date: Mon, 21 Apr 2025 10:34:34 +0800
Message-Id: <20250421023444.1778-4-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
References: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Yj9u7aZRZjE3Wi59I87GNcRf94FTTg4_
X-Proofpoint-ORIG-GUID: Yj9u7aZRZjE3Wi59I87GNcRf94FTTg4_
X-Authority-Analysis: v=2.4 cv=QLJoRhLL c=1 sm=1 tr=0 ts=6805aef6 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=bJUolzXMejWutlsJL5MA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_193534_973919_EB1597DA 
X-CRM114-Status: GOOD (  13.40  )
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

Currently, the hw_srng_config_template does not have a template for mon
status ring.

But srng config template is necessary during ring initialization. So add
a template for mon status ring.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.c | 9 ++++++++-
 drivers/net/wireless/ath/ath12k/hal.h | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index 12d0f991a47f..ed268089f9b6 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -154,7 +154,14 @@ static const struct hal_srng_config hw_srng_config_template[] = {
 		.ring_dir = HAL_SRNG_DIR_SRC,
 		.max_size = HAL_RXDMA_RING_MAX_SIZE_BE,
 	},
-	[HAL_RXDMA_MONITOR_STATUS] = { 0, },
+	[HAL_RXDMA_MONITOR_STATUS] = {
+		.start_ring_id = HAL_SRNG_RING_ID_WMAC1_SW2RXDMA1_STATBUF,
+		.max_rings = 1,
+		.entry_size = sizeof(struct hal_wbm_buffer_ring) >> 2,
+		.mac_type = ATH12K_HAL_SRNG_PMAC,
+		.ring_dir = HAL_SRNG_DIR_SRC,
+		.max_size = HAL_RXDMA_RING_MAX_SIZE_BE,
+	},
 	[HAL_RXDMA_MONITOR_DESC] = { 0, },
 	[HAL_RXDMA_DIR_BUF] = {
 		.start_ring_id = HAL_SRNG_RING_ID_RXDMA_DIR_BUF,
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 4adef9240409..f627cd01f60c 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -498,6 +498,7 @@ enum hal_srng_ring_id {
 
 	HAL_SRNG_RING_ID_WMAC1_SW2RXMON_BUF0 = HAL_SRNG_RING_ID_PMAC1_ID_START,
 
+	HAL_SRNG_RING_ID_WMAC1_SW2RXDMA1_STATBUF,
 	HAL_SRNG_RING_ID_WMAC1_RXDMA2SW0,
 	HAL_SRNG_RING_ID_WMAC1_RXDMA2SW1,
 	HAL_SRNG_RING_ID_WMAC1_RXMON2SW0 = HAL_SRNG_RING_ID_WMAC1_RXDMA2SW1,
-- 
2.34.1


