Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F2BCCF9E3
	for <ath12k@archiver.kernel.org>; Fri, 31 Oct 2025 03:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUXjvY7OoRdcYQcgv7P8x8g67gGxIlqbdGmnJsZIYDw=; b=e5bZEVGzDlaAlYM9na42OwDUkL
	pmQ/a8KJGbOcDU45JMWQv52rdTusOqOoq6JdZ/BcM55+pJXrZBRvDToGqNLwmvE2gGCPh61AurkRE
	mUltDeLfIUTsBvVb3QHVDuVqE9qDfnsd40ylSEsMkNWuR1xP3n1yhpLppnCFGE2d/CD1dk4xzTr8J
	TbgR5KhRiYQDDEi9VZ+QahS9LY15F5Ck0jLc9r1RDa3TFMIN44VkU/IfKnG+B5KWODSg2zgb9mJAC
	FrkYaDZRQ1ooLkb/wsuNdB5MNQsFGQJ+XTKdFMqGW4PiySoClknvpbvkxIq9k6y6GOANrVvyjdMqm
	yxNa2fMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfUg-00000005Iwp-1X7F;
	Fri, 31 Oct 2025 03:08:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfUe-00000005Ivr-038n
	for ath12k@lists.infradead.org;
	Fri, 31 Oct 2025 03:08:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UKsS2Y832863
	for <ath12k@lists.infradead.org>; Fri, 31 Oct 2025 03:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUXjvY7OoRdcYQcgv7P8x8g67gGxIlqbdGmnJsZIYDw=; b=A49V15ayV4g66Kl/
	R/iUdVFguJC1JTLWJIVw5O2PTKgiBz4I/8KVE9K7+GON4LGPt1FkiAyyJ3ajntud
	RUReqNop2J3ZQxt187g7zzEOreVbjm7maD4W38xuqFygx8KHbaUZEzSVVopCRnZI
	EnJUcAUdLDCUceBj5fksRKdxDvqdwUezSrWEzi6HCnCPSmTU1rwP8JSYjpNckmz1
	pAL8u14GGI0eJ4IJZ9GfPpetjINpPqssixkSg0Sk0UjS7MSovKh59oIUJffrNqLZ
	rYY57NOxkB8b5qq+sVCku6X4bRES1Ufwuahyfe61zGh3gXf1A5gYltGnMjFHbSL5
	WXZ/qw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ffb0rpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Oct 2025 03:07:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6cd4d3a441so1525336a12.0
        for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 20:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761880078; x=1762484878; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUXjvY7OoRdcYQcgv7P8x8g67gGxIlqbdGmnJsZIYDw=;
        b=URycdLxPT9zpfSRaGogey0ZxJm0sGcOr4XYe8gBG0jXYWdlO+S4mRVPFzMnJr2+YwA
         ayDw5IsCg3RwUU1u+ka+Nc6qh2J7aQJLp4gesSl3uznNBTb+W5FAffbnK6QatTNV44JW
         SeJDpzLMkLIk4btchCIFWKdZ8uNU67Nl7nDGH2g42alxcHgN4SPNDi7MYCjzHgkg7izT
         mdVRzm84iAxFJ7hilJMms/za02fGZogos3gIlGTDIMNUI1hdCsdbvtsUVNIJHG1638pT
         0+HyHbrfzbbSmgao4NPkA3t4j+kqvr+mmSwKEdyw6LvfiY2nMVKVsW4tBti/7+oIk8MV
         nMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761880078; x=1762484878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUXjvY7OoRdcYQcgv7P8x8g67gGxIlqbdGmnJsZIYDw=;
        b=WE3gSL2+dXC0ph/hDbTjE61bq9JT0nffnKlPKJlJ/pEr3uKa9nub7TXtVPlNfesHAs
         8sMO9SV+SjqwkWjoTqJeV77C5Kp/kREzMYvir+DNCb3ZdWjE6Uh84jWRZavU0R1TYh01
         3QaIo+vuKz79c3mPESNc3nvO2hvpLaBZFO5dbp9KfbMzmF5FlnuWCAXAX8UVlS4KlMvf
         jMOX9AnSZASHmSoK233ZFYVb5wW0+T7OVnJBauSYeg3cWAPnoXpie3Z9IjiRA4rOUQMb
         yZgsT7l3awJbHGCh5zLLmSLYM+oeZ3MY2dc1gycR40zAluyBny5fW4YIr0v75XNggHo8
         SorA==
X-Gm-Message-State: AOJu0Yw2XL52q/HjA990WmaoVcwuVADqyjlIFMxJfzGSHU4TbmLGCllE
	titnbKNdbkEp3LPsEGixY+45GtVgWXzqsNMyeYruxjfvxhWPZEW2zGjg3Nl9cq8wP+yfTCPzQli
	6P3kY64TPrXxEShWXAiRebnkAHentu1SCfLjcEQVf4MRJEF3i9B3eyvGPWUW68WA0
X-Gm-Gg: ASbGnctRRdYttVAYBI4wsbpJtcFJQUKbLJOtYOK3ZOsufkPw3Zygo+ujzh7kQNx+xeJ
	EHa0O1KluNV0aGp+fNjkqqy4mIu4euhdNzmOs6lOnFm5GdAV4tIX0KayK2PLq6k0kCLSLzdD7RE
	jhhxG9eLzjeWGpp50xyVAEXSFepz8TAfqwZODFSSXWFrXMBi2j8fATlLkyLzatdNkdGS20gw2zX
	u8+bUh3nMQ2wFuBj1wWlkIMTRE+3OPdW6H79Szxn/Di2WD66sMz2MSxVLnM181MuWvcbMQ9TXgz
	1IUPHTIG/xgFasAdMqnAdqCaw+BTd9kkVuUSnJZSRNzc79DWNgBhNEQm+W3CWMYnpoyRWjAWFCa
	DpgLUcJQRXS4T6DQTAM2CSQ3vpNcclDZB/10j3uP0l2TzrNBYQXkjowDA3+yM/DxfzIMLKWaUnI
	lBSLUnVkEYlBuBs6WVF5HzzaKaOwp5zzw=
X-Received: by 2002:a05:6a20:158a:b0:343:6c90:77aa with SMTP id adf61e73a8af0-348bcf39118mr2868782637.29.1761880078489;
        Thu, 30 Oct 2025 20:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnCeW+sXqFa++BIza19zHKtf9ItARuqpC7NRlsI0vHs1Q8l174lemlpy6YJLzFFfjp6C1fRA==
X-Received: by 2002:a05:6a20:158a:b0:343:6c90:77aa with SMTP id adf61e73a8af0-348bcf39118mr2868749637.29.1761880077922;
        Thu, 30 Oct 2025 20:07:57 -0700 (PDT)
Received: from hu-mdharane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db0a2663sm372130b3a.48.2025.10.30.20.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 20:07:57 -0700 (PDT)
From: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 08:37:46 +0530
Subject: [PATCH ath-next 2/2] wifi: ath12k: Fix timeout error during beacon
 stats retrieval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-beacon_stats-v1-2-f52fce7b03ac@qti.qualcomm.com>
References: <20251031-beacon_stats-v1-0-f52fce7b03ac@qti.qualcomm.com>
In-Reply-To: <20251031-beacon_stats-v1-0-f52fce7b03ac@qti.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Proofpoint-GUID: h_4gfezffcjjt6uv7AkX0YKOtDP-ozc7
X-Authority-Analysis: v=2.4 cv=fpjRpV4f c=1 sm=1 tr=0 ts=6904280f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5huyMihl6BJtPKl8yXUA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: h_4gfezffcjjt6uv7AkX0YKOtDP-ozc7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyNiBTYWx0ZWRfX0WMOwVRQW1G1
 7/Gej+LFx7tYAMu4LNi9jAfzayelvAjf0SQiDeMwzeyTWpux31caf6CvARfnJ3CXh2CwyTAjvhs
 oZJBzcelO8GmtYC3x7xHUwL3YeC5KfHHqkqhFZY0ZWU7l2BIs/BeJKbIJIDfYJz6h3548P1fLyg
 D2mG3oj3tJSi+Vj2hLwMNKiBcJ02xwL8nSufj4b7FWJYYpvWMUKzTANRTlgDxbiyYfkMS2U6Y22
 re0STUofDZRJAYc0jaPoPTdoCM43rODIKHi2pDW0sOuvtj9aJUa//rTrB2aZnadkeaw3L2rDvxD
 hzeB8Ok7r3xuaueVLhn92P9ACGbV8G4rYeRvLWml7CS24tvAEQlkn4rTMta4MUDwUNaWd1BoQml
 A0lPgBDaHY5V9z4C0uXzcNn174ZGDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_200800_064332_4EC2E80B 
X-CRM114-Status: GOOD (  18.13  )
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

Currently, for beacon_stats, ath12k_mac_get_fw_stats() is called
for each started BSS on the specified hardware.
ath12k_mac_get_fw_stats() will wait for the fw_stats_done completion
after fetching the requested data from firmware. For the beacon_stats,
fw_stats_done completion will be set only when stats are received for
all BSSes. However, for other stats like vdev_stats or pdev_stats, there
is one request to the firmware for all enabled BSSes. Since beacon_stats
is fetched individually for all BSSes enabled in that pdev, waiting for
the completion event results in a timeout error when multiple BSSes are
enabled.

Avoid this by completing the fw_stats_done immediately after
updating the requested BSS's beacon stats in the list. Subsequently,
this list will be used to display the beacon stats for all enabled
BSSes in the requested pdev.

Additionally, remove 'num_bcn_recvd' from the ath12k_fw_stats struct
as it is no longer needed.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: 9fe4669ae919 ("wifi: ath12k: Request beacon stats from firmware")
Signed-off-by: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  2 --
 drivers/net/wireless/ath/ath12k/core.h |  1 -
 drivers/net/wireless/ath/ath12k/wmi.c  | 10 +---------
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 5d494c5cdc0da3189640751b8d191fa939ac3ff5..f0994f3918f5c36380b3409f9a7889f06c8e0f34 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
@@ -1250,7 +1249,6 @@ void ath12k_fw_stats_reset(struct ath12k *ar)
 	spin_lock_bh(&ar->data_lock);
 	ath12k_fw_stats_free(&ar->fw_stats);
 	ar->fw_stats.num_vdev_recvd = 0;
-	ar->fw_stats.num_bcn_recvd = 0;
 	spin_unlock_bh(&ar->data_lock);
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 41da0efaa85478fbe294f958cbcf458b5ca07204..3c1e0069be1e77007245cec2cb289212c12baf4a 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -646,7 +646,6 @@ struct ath12k_fw_stats {
 	struct list_head vdevs;
 	struct list_head bcn;
 	u32 num_vdev_recvd;
-	u32 num_bcn_recvd;
 };
 
 struct ath12k_dbg_htt_stats {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f812da24b21e68893327d61fe0ff9deb222bd54b..be8b2943094f8f4a12d625189c11315f1397e42d 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -8485,18 +8485,10 @@ static void ath12k_wmi_fw_stats_process(struct ath12k *ar,
 			ath12k_warn(ab, "empty beacon stats");
 			return;
 		}
-		/* Mark end until we reached the count of all started VDEVs
-		 * within the PDEV
-		 */
-		if (ar->num_started_vdevs)
-			is_end = ((++ar->fw_stats.num_bcn_recvd) ==
-				  ar->num_started_vdevs);
 
 		list_splice_tail_init(&stats->bcn,
 				      &ar->fw_stats.bcn);
-
-		if (is_end)
-			complete(&ar->fw_stats_done);
+		complete(&ar->fw_stats_done);
 	}
 }
 

-- 
2.34.1


