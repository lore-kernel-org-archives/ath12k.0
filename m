Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15238CD343F
	for <ath12k@archiver.kernel.org>; Tue, 19 May 2026 01:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80wE/aXvl5MYFDgaTLolK83rI9KtsH8kzvD/cz5hbtU=; b=FSS4zNj1OAf1Ne3mslr5/jsPvx
	tlsS618XNaZcNh7lglVLGOidE6gYkAnZmS3yIiKaKY8Zl1ufJdFy58jzU6oZzUPFpX/ux22I+PXSw
	Zoutw+fhsAKo3CFWZPYg6bjcX4cd4Nfl5FR/vID1FkXUhoMWMqb/LxHQ9o9iNHjVk72r3sQkV4IiP
	PauIyjOPngle5V2UEq+Iv3O8ZweyO0+LKvdJbpLzEOmc1yO44lOvbLSD4Y+Ikkc2fA+kWrpZS+oOv
	DytEsKh+AYmpcdQ/VQwvQVz3mJL3eNYwmDvLs7me878pnrHDBg0CklAzGpe+f+1wYkneTJO6hd+9f
	9sH7dOTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8wO-0000000HKJE-3Sd8;
	Tue, 19 May 2026 01:08:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8wM-0000000HKHT-0wHH
	for ath12k@lists.infradead.org;
	Tue, 19 May 2026 01:08:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IMDuae2188791
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 01:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=80wE/aXvl5M
	YFDgaTLolK83rI9KtsH8kzvD/cz5hbtU=; b=IkdTOtGfdHWRWN54iOF3gKeMkql
	bn2SF4JvZER6PAKMmkzjGqVh88clRv3SQk6gy73OD3m2q88qWjInhOEWyZw5/qU7
	NoupC7M4wpJpw0iwYssX5HHyqcJW5mUeKb0bgvqCaETUKkUmD+HXJqa5jLnAPDGm
	boNEcL7HNKd9YZkL3pJcZTPnDLTMv+yvj5uAKl0WTO54r5lvVeGKXrFUxRIUcYX7
	poklcA4KL+iOVpxO4qb1xvkmR45AsInKHshpts4wk3MwO15ASW0m/rjv81Daiv9T
	Fv95/ZvrWmpScA5U5OCBwK27/WQBo5bFqvh+EVdlWv1k66YuTNsz7Txzc2A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xkukprs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 01:08:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f85179263so4600225b3a.3
        for <ath12k@lists.infradead.org>; Mon, 18 May 2026 18:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779152888; x=1779757688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80wE/aXvl5MYFDgaTLolK83rI9KtsH8kzvD/cz5hbtU=;
        b=PwKHckg63IeatBwGEbzOw5jXm5XVdczCnjHZJ9qwIfszrNzhQnGcgjdhzd/8YBTIF/
         BTV+1u101ZuD3KkUS4O7Em3A3jJ28JqNM/i+k8YMb1RuagQbqWnW9tTywcrX0MI8foYZ
         FmZvRl2Er7XnVGW3jG/cFo7aviORFrqrMbXKtXpnuT4HmNwBl0az92sUmGH9Fe7shd6/
         NB+7oeXebYGLMKAL2Ki+hIP+AFfYeJu34A3MeCT9WzGHCaW0Ws5IUvDwYCde+DYAHMgX
         /IFvTuHPxUAWEyn7K4JwZFd49lt3o3+A1u5TzYtaoBUYuUtxZtHvgzO7clegSddTGVDj
         m9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779152888; x=1779757688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=80wE/aXvl5MYFDgaTLolK83rI9KtsH8kzvD/cz5hbtU=;
        b=MPZM+5QKSesxDVz8uNH5pPFAqUaFAXDDnD3e6k6/pOgWt7ua+dbzMKKJ9cVpqdIRqp
         HN4wDBffN83btEyI3hhive0fRkgVe6+Aow8fdWYWeKuVyWw4Hf8y7xDmxKThoU6OI9rZ
         Zo/oxtaTowSNMp7lQUMT9gUZiU+AFEOoNx6ctEKCYf2Cx5Ospn2uulXwx3oMn+N5hMvP
         u6MIPQwHj8bRP9F6hAojkEBEBsIkqPvvQwXFa2pZs7r0D7mfRY8ZXbcs1X7dU8/KlyLy
         tVGNf7p7ifbFwHSLfhKwjkxoH7v5Y+xPHoqZZOjRioiDuMNXyGQl6JlSTtgi6Cav6yAF
         CiKA==
X-Forwarded-Encrypted: i=1; AFNElJ+AEPLgujT2HI3Ru8u4eK9pL0RAxatTex4AV6JVC6jkqJPcr+R0a+wx8o1RyhJreO55VR+KBsE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNKIBLu46Wz5HJZBrPgHr4oL93EzcA7yPveZGGlzHBsUmtXc5V
	j/4tw5407B+CdDZnse6r1mVgi+PTuzNEswoWV3M7bzW6AueDJhS9pLP6KEtlHfWU0QkYe7CJR7C
	wDwFEdWWefdznHAeP5zodE3evkcrHd1aI+H6DxCEjc39goS8ISIbL/uQjYyXJwIa7
X-Gm-Gg: Acq92OHJWGaiRUBXQDUg+oxGL+S2ehjIm9QN6UxCIJ5XS0E56t9eEBPo4shLSRdIW9B
	E3ZbmIWIwGvCCk0nEelvMKYb8eUVDPXKTACau8pHG/6kduR3lK3h3nL4asY4gMXoK2A6wc0M28m
	udgAtNjBwMXbCe9n3PTHm4q1N71XTsu2vzTApT9+fXtaSUdwo1fJQuuDAIkMr7AXLRAXwCz0Gmd
	UqbWfugzS3HEwjmtyzgbhrzLRMgAgw02LJTpqiAwoM0Xi+OeLHVuy2Tla5GOR1fl4AOLZAtQy9L
	JmPiZy5pUVW/+pBkjQWzyG1w9risyGuU9d5qtCN/Y+4txULyGZCPklM3R0PRdncF+eal5Y/lTDD
	9DaVvTjau+YzfJq/9rQrHWJeCkZP8WuQaX5Q/an6owbAHgQP/vVUO1klXbxxKiaFCvAwUkNOjrw
	WR7iuM
X-Received: by 2002:a05:6a00:4c0e:b0:83e:d52c:e6bd with SMTP id d2e1a72fcca58-83f33c9bc80mr17854608b3a.38.1779152888308;
        Mon, 18 May 2026 18:08:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c0e:b0:83e:d52c:e6bd with SMTP id d2e1a72fcca58-83f33c9bc80mr17854572b3a.38.1779152887710;
        Mon, 18 May 2026 18:08:07 -0700 (PDT)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1942a83fsm16196793b3a.0.2026.05.18.18.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:08:07 -0700 (PDT)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
X-Google-Original-From: Hangtian Zhu <hangtian@qti.qualcomm.com>
To: tglx@kernel.org, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] wifi: ath12k: enable threaded NAPI when DP IRQ affinity is unavailable
Date: Tue, 19 May 2026 09:07:58 +0800
Message-Id: <20260519010758.712297-3-hangtian@qti.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519010758.712297-1-hangtian@qti.qualcomm.com>
References: <20260519010758.712297-1-hangtian@qti.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAwOCBTYWx0ZWRfX527iOqe4Qab2
 7tm7maUkAbj2zTYWmzDhsEfqdHheD9o0bNeEPeP3u6VcFWgQA/QzKByVsTzcDes1gc7Qnpm6ubA
 zmTJNxj4eLfcnGHM7Gp6g3sC+1Q2pY2M+cuMw6OgFxI0ELYTU94LYg+g6i0kKYs4VJOXVJEosi1
 n1Ek8nYqtWAOEwHwUanrjBCB8vOy7JeYVrBrBCveTYA46tqOALrJ4K8FjnRdJY3ZVorvPH5PME7
 5p6PQqQdhqwY4XneQ/aIsKe4uUBUlxFwSTOpJNVAssAGtlolM+8GRlsqth8UigG0DnXKfz28o1E
 6sW2BUXDvPr3QTAN5eSO8euJ9FIqs5UUHIYNeqNMQqYvJCY75tBByQ66IzVlu+Mjv0WwMKz8cn2
 4nj6aI+ZIHNdjXm5vcqLvtJ5XlrzqHnIlKY+wpLbh8Q693Pf+G4KGo6gjXBr1PFjVZUjRfInb4/
 v64/nZqGkThzoPP2DRA==
X-Proofpoint-GUID: TfadID2pT2HMYi5ENIn_SWU6nr8LXb65
X-Proofpoint-ORIG-GUID: TfadID2pT2HMYi5ENIn_SWU6nr8LXb65
X-Authority-Analysis: v=2.4 cv=FsY1OWrq c=1 sm=1 tr=0 ts=6a0bb7f9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=--8x25ClVUTr5G9MgJQA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_180810_379316_1D9F7054 
X-CRM114-Status: GOOD (  16.09  )
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

From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>

Determine threaded NAPI policy from runtime IRQ capability of the DP MSI
IRQ.

If irq_can_set_affinity() reports that affinity cannot be set, enable
threaded NAPI for DP interrupt groups so datapath processing is not
constrained by a single-CPU softirq context.

On RB3Gen2, where IRQ affinity is unavailable in the effective IRQ path,
EHT160 UDP downlink throughput improved from 802 Mbps to 2.58 Gbps after
enabling threaded NAPI.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 375277ca2b89..065449806ea9 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/interrupt.h>
 #include <linux/msi.h>
 #include <linux/pci.h>
 #include <linux/time.h>
@@ -537,6 +538,8 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 	int i, j, n, ret, num_vectors = 0;
 	u32 user_base_data = 0, base_vector = 0, base_idx;
 	struct ath12k_ext_irq_grp *irq_grp;
+	bool threaded_napi = false;
+	int irq;
 
 	base_idx = ATH12K_PCI_IRQ_CE0_OFFSET + CE_COUNT_MAX;
 	ret = ath12k_pci_get_user_msi_assignment(ab, "DP",
@@ -546,6 +549,10 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 	if (ret < 0)
 		return ret;
 
+	irq = ath12k_pci_get_msi_irq(ab->dev, base_vector);
+	if (irq >= 0)
+		threaded_napi = !irq_can_set_affinity(irq);
+
 	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		irq_grp = &ab->ext_irq_grp[i];
 		u32 num_irq = 0;
@@ -560,6 +567,8 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 
 		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
 			       ath12k_pci_ext_grp_napi_poll);
+		if (threaded_napi)
+			netif_threaded_enable(irq_grp->napi_ndev);
 
 		if (ab->hw_params->ring_mask->tx[i] ||
 		    ab->hw_params->ring_mask->rx[i] ||
@@ -578,7 +587,7 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 		for (j = 0; j < irq_grp->num_irq; j++) {
 			int irq_idx = irq_grp->irqs[j];
 			int vector = (i % num_vectors) + base_vector;
-			int irq = ath12k_pci_get_msi_irq(ab->dev, vector);
+			irq = ath12k_pci_get_msi_irq(ab->dev, vector);
 
 			ab->irq_num[irq_idx] = irq;
 
-- 
2.25.1


