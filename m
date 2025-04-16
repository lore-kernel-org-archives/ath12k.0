Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F83EC369AB
	for <ath12k@archiver.kernel.org>; Wed, 16 Apr 2025 02:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AfXajbpydkkqn6KmroTCxtpMxSUpK9CjRJOH4jhWQSg=; b=Qgo9OGVVQrk9PJfuN5nK1CF6+R
	5RMPwtaWVPrbM6wF/wvlnMQwEhPobPRMfjKVc72FIPde/C85FExDerSME+g8e+82uDMy7lN3MZbjw
	dJWQG087AL0fNwi2+OLLayB34sX6GfAYlKMnD6D/j+Iw0pIgbSFFkgNG4W0Eurympbh/eZrS3HUrA
	nuhzOlQfNkE9URiNp9/FRlOu8+LLlsFQVNzYlVNCjHakH9KUF0t9BbdMm0156NG0CquwjRJM/YkN1
	+PFrLIxvVxZ4IKN7f08tKie2fSVDaAJeLAUHkdSn7WzpJEDDUN3AUnlTdpJOmAJZV2GprwxK0oiFg
	G4KnHE7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4sOI-00000007vqJ-0G5m;
	Wed, 16 Apr 2025 02:20:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4sOF-00000007vpH-0UhP
	for ath12k@lists.infradead.org;
	Wed, 16 Apr 2025 02:20:40 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FJ9HEj031959
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 02:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AfXajbpydkkqn6KmroTCxtpMxSUpK9CjRJO
	H4jhWQSg=; b=hLFWih3Oizc4muDeQHgxQUqm7C41jIM2WW6Vk01roQpcYYLJPC4
	7W+UMtqNoJwfnytYRShs7WBt8Myjo/H6JO1H0Mg+Go0g7e2vLcrs9G86Een3dOh0
	GRmQO/I/uvAn3jkDfR39w5lWtFnhD3zL2PmmJb3aazdqBqEf6pnLMbtOkVli1DLd
	opPeUcUw4Ex+Rsnb96lMVUpM1v7/JvuNgiBEr/3ix1sVXbu7m9o6yJydceZLxhpS
	I1uudNR+rPoNrqY85xfEMvx1WLO5bTjAZ3F7JP6GnUFMV9cgETqseAqjmR/rj3k2
	LLkAEaXJhKRAsi9/CXCv77KbR5kpGUi1F0Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1a0kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 02:20:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22651aca434so51173755ad.1
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 19:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744770020; x=1745374820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfXajbpydkkqn6KmroTCxtpMxSUpK9CjRJOH4jhWQSg=;
        b=JlJOH7/D/F0gpNs5P5ZaIfo7uNADjfMwTr/hxpFZrd2oSrGNSBJ1r4ZahTAGSlk50y
         6oOPWwINgJbd6tgAmnKoIhtB0ubRQOw+fgDfMn9kaHvaEZYaC6RnuTm5HgUpojRnifDV
         efOWG78AvS3DkgPzYfigBThlFYxdQVmAlqlszMA+iHRvIeT/EtTuTyBZAYPGDwk30/g/
         q6pwLNhYFWBJhAzXK7yCxS1nHfmHxZX8LB7uk59Qaw3wxqlI9vNfDOXguGtRHy8p6qW2
         1bAxohfUoE/PcdKEh242BDWqHex+e7Jg1WGuhCa/QguP82xRv45j3eiSHq9ZiNbaWSNG
         fJdw==
X-Gm-Message-State: AOJu0YxnAGpfCBq470/bFsDK49/41kDl46Uy4K0+w1fSrJhM7pwBrwrk
	rzmWp3zYbkRf9UzM1N1PVK3vedUZgmUIgBm2HkUFE4CgotB4UNtXyG783ybD+fgL5N9MRX8Fw6/
	xd3HwNQQ/1UKrXzOa4hm8Q1bx0JAoiGiJf9+TE4n5gJJTntwo0Qg3PCAB+P+zSWxQ+820
X-Gm-Gg: ASbGncu2p8Z0bGqhpOShRpltUg9kpHCG7ABvfPrQYEz55V0jYDhjKx4/RMpnRNTkS+8
	w2k++YqMstjozyCcJmIk7YY4EMtdg+WCQBRFTYQhAAI+lz2H6DGjj73Ot5Rl+vSdYc14Rqe8FUa
	wNzOxuZU1EuKyeyuWQ/mpjwWZ5B/tZ9b+cTY6Wru5BJFrQVWa0cU3iIYZOdghDhS+eI1KEOrrOo
	Yb+o4LI6I8UkKM5EYVMdvvvYak9A1YhqMZmZuN5fwIDU6dxMztsBHfYvPszjCWhbnq6hcGTn6IC
	WlAN5ta1aOmMyDVKr2EqqZ5w5fRgx3gBVInc+0T30eN4UlhqJ1dtnhWBYXMbDFfs/lfcSlzONWU
	Ua7NTCc3euZQ=
X-Received: by 2002:a17:903:298d:b0:215:acb3:3786 with SMTP id d9443c01a7336-22c358ddbd0mr1584785ad.19.1744770019870;
        Tue, 15 Apr 2025 19:20:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgC4lUWKu9DYRUYOZwzpEjtP9K+vh0OoS3CitKmD+eOkOO4yUg3rgp8efhJFURKvXNate7/A==
X-Received: by 2002:a17:903:298d:b0:215:acb3:3786 with SMTP id d9443c01a7336-22c358ddbd0mr1584455ad.19.1744770019463;
        Tue, 15 Apr 2025 19:20:19 -0700 (PDT)
Received: from kangyang.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33faac7asm2501935ad.137.2025.04.15.19.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 19:20:19 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next v7] wifi: ath12k: delete mon reap timer
Date: Wed, 16 Apr 2025 10:20:11 +0800
Message-Id: <20250416022011.1935-1-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67ff13e5 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=al3BB8Ul8SHi2Q__pVwA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: OBrzigzaJ7VVVj_UyYQLjWxaq81-5dgp
X-Proofpoint-ORIG-GUID: OBrzigzaJ7VVVj_UyYQLjWxaq81-5dgp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=776 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_192039_343903_12F50C14 
X-CRM114-Status: GOOD (  13.10  )
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

Currently mon reap timer is not used, and it is not needed anymore for
WCN7850.

So remove related code.

This change does not affect QCN9274, as the mon reap timer is not used
for QCN9274.

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---

v7:
1. remove patch#1 and #2. 
2. mention QCN9274 in commit message.
3. rebase on tag: ath-202504141512.
4. change quic email to oss email.
v6: update copyright for each patch.
v5: rebase on tag: ath/main(ath-202412191756).
v4: rebase on tag: ath/main(ath-202410161539).
v3: rebase on tag: ath/main(ath-202410111606).
v2: rebase on tag: ath-202410072115.

---
 drivers/net/wireless/ath/ath12k/core.h |  2 --
 drivers/net/wireless/ath/ath12k/dp.c   | 28 --------------------------
 2 files changed, 30 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 44e02ebb1071..2d7d8610a058 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1056,8 +1056,6 @@ struct ath12k_base {
 	struct ath12k_dbring_cap *db_caps;
 	u32 num_db_cap;
 
-	struct timer_list mon_reap_timer;
-
 	struct completion htc_suspend;
 
 	u64 fw_soc_drop_count;
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index b8e63f489e7d..7d820349e7b6 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -982,11 +982,6 @@ void ath12k_dp_pdev_free(struct ath12k_base *ab)
 {
 	int i;
 
-	if (!ab->mon_reap_timer.function)
-		return;
-
-	timer_delete_sync(&ab->mon_reap_timer);
-
 	for (i = 0; i < ab->num_radios; i++)
 		ath12k_dp_rx_pdev_free(ab, i);
 }
@@ -1024,27 +1019,6 @@ void ath12k_dp_hal_rx_desc_init(struct ath12k_base *ab)
 		ab->hal_rx_ops->rx_desc_get_desc_size();
 }
 
-static void ath12k_dp_service_mon_ring(struct timer_list *t)
-{
-	struct ath12k_base *ab = from_timer(ab, t, mon_reap_timer);
-	int i;
-
-	for (i = 0; i < ab->hw_params->num_rxdma_per_pdev; i++)
-		ath12k_dp_mon_process_ring(ab, i, NULL, DP_MON_SERVICE_BUDGET,
-					   ATH12K_DP_RX_MONITOR_MODE);
-
-	mod_timer(&ab->mon_reap_timer, jiffies +
-		  msecs_to_jiffies(ATH12K_MON_TIMER_INTERVAL));
-}
-
-static void ath12k_dp_mon_reap_timer_init(struct ath12k_base *ab)
-{
-	if (ab->hw_params->rxdma1_enable)
-		return;
-
-	timer_setup(&ab->mon_reap_timer, ath12k_dp_service_mon_ring, 0);
-}
-
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab)
 {
 	struct ath12k *ar;
@@ -1055,8 +1029,6 @@ int ath12k_dp_pdev_alloc(struct ath12k_base *ab)
 	if (ret)
 		goto out;
 
-	ath12k_dp_mon_reap_timer_init(ab);
-
 	/* TODO: Per-pdev rx ring unlike tx ring which is mapped to different AC's */
 	for (i = 0; i < ab->num_radios; i++) {
 		ar = ab->pdevs[i].ar;

base-commit: b80c52642c1159c2596776b39b06eb1c2e36baff
-- 
2.34.1


