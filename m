Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D31CCF9EA
	for <ath12k@archiver.kernel.org>; Wed, 29 Oct 2025 02:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F/iu6iGjXVw2O/5Detpz/zaQ4O1XGKDWpUnpe03APtA=; b=flg9uXW7jHjZSQ7iwpCEo/y7Bw
	C6FL9rOYBDzddFFBgimThGzHgix+58E7D8cJvnyd3/fNrRIYEcYQVUQ+ZNKVRVZv7XFSMBoIumdmE
	kbNTdIm+djYXALoH1G6XMBVtl8lz2UHW+ss8RdNwMz0m19LJcJ2t8WYa7U4K9pUrwj1gplrfKyWKq
	ojThSAkJPsiP4WorYRogA3QZQ+U3kh6zO+WHJKpBhgguTmZADfWAiR5qAm1+2VbKrQ0+26LbHDBcN
	Obyr1gfCSYV70audhLkPuyS4fQklYQRmPxAbgcYBlwJ0tho88zvteB6R5QeiWiwyyvoEScX+5cC8f
	YzDyh5ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvbV-0000000GxvB-1jHr;
	Wed, 29 Oct 2025 02:08:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvb5-0000000Gxtm-1d5r
	for ath12k@lists.infradead.org;
	Wed, 29 Oct 2025 02:08:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJm1Rb2553899
	for <ath12k@lists.infradead.org>; Wed, 29 Oct 2025 02:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F/iu6iGjXVw2O/5Detpz/z
	aQ4O1XGKDWpUnpe03APtA=; b=eG+lj6EGkXe/fjjkFi1c+nnHkPMlNiywUvYUEq
	UzXq0PgPYOkKvngQua8se5ts66vyxRrNBPf9DxIlmyZEaFORmQuuiLjJqEkzEJyg
	xMA+RL6yGAmN9DJucpC+aw2nEiRGRY0eO4hC9mMU7mfvn0hpoN79sYHZIvHWK5PS
	hd6US86nn9CNxqo3ovXa2ZjBJQ+hYG6nAf4nrBbsLyo9OUmPq1hXErAlrVJ5Hsyq
	yYcYDeXTO9/5ZdJlUKjMtX76DqMxGzgVAhmpsU76NmBGEPTnlpNcAqLXbx9+Q9/p
	kBla4dUejxgBCLyDPYhZh2ogbikSIW9RLF7ptoxv8P6QTA+A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a2gtub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Oct 2025 02:07:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78117b8e49fso13993475b3a.3
        for <ath12k@lists.infradead.org>; Tue, 28 Oct 2025 19:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761703653; x=1762308453; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F/iu6iGjXVw2O/5Detpz/zaQ4O1XGKDWpUnpe03APtA=;
        b=A9O8RA8xllltFmZPko7KdxVfuBjXtE8azWLssTa6Sec6jYBqx3GVrPlINjpm7Cp60i
         75OI9QfdXFtNeANceDodi9IZkXeZdpXFIMYAfwZMvnzatYSnyEmgFW9RoBzqCILHweCj
         sKA3zecsUzrNP3oPXzVswRndiishG3oBPnKW+mb9zEDaO//PyEfmq77YXg5yw9mJt4bV
         ebE+re/+VOdbaXPR5Ey747MQGfys126Vc2ftn3RE2axU7awJOIMqB6bywLIh3fOvW1eq
         zDEan96kXqOWq9s19kZVXhcCnO27MIuwRN0GMJ4eJX7kafSIcqCVoAH2QdGIUXNudb7y
         e3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761703653; x=1762308453;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/iu6iGjXVw2O/5Detpz/zaQ4O1XGKDWpUnpe03APtA=;
        b=nigfITeSDHZOKaEUOBuxigmTpKgRrgkdriscE+iuKeXLNma879EsNuhKnQ790nb+qj
         I40x1NffLcatUcngRv8D9OpOJDyD6qEf+QFMlu8sq3Z7opv0zmVJ9H6botdHcESgIHv+
         SzYHY2Z8BQdKRjJoT63gvtBTPjIMQSX+vwxxP9lYZdFOQLMV64F8L9XabrcJLr2sEsJ/
         Dg11vgF+aPN4dECuZHOvJC1kAM7mnVvlx5q1d0QXCH3CMrEXSlYVucnk05y2/97wugbH
         TEIUsiSrQ5u8EnGtC7Z5qiKOLZcVQVZ5ZvN7mjAY1Q6m4qwiiVl7MQjbUbjnmsDbhavn
         WhPA==
X-Forwarded-Encrypted: i=1; AJvYcCVWeeE+C3/c6C51cVPtWHDi6QmLERgGmR7M53BBHyMdEWudNChrVTQ4iX/7xR1GQTEetbXUpvU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5Ul7BwCNMlTUIcBo/bBVbiPmjvxKgEti86st5BW/2TrR9ZWBh
	35adSmJEnR1W66ZL8Ob3cfX5xC03auFetXbrNP3cNRMnfRaAyf/NQgivYH/M1m83E4ExtuFeI+J
	5sbtORiCHi0oZA0nM/CnS7u/eCK+4d5WshqstYkZ3Xf4Yi7DAX7gJ/vJjqthKqFw/
X-Gm-Gg: ASbGncur7I+94RSH8U1zSYJV9Jd9m0lptSAkMmBZARS58Il+854r7XBybYC++ANFKlO
	gPmGUv3M88mPL4zGgcNEuOP6sb4SdXw/uFEdxbMabf2Ufugc3A/hRDEF/x52SW4U4sUf5yHfsbU
	OvoA4/HZyPrFigCq4iZCGRIpY0+MHO1cOKBNKvdZFLRcJNZgUyAN6rNfZ6FOrCrKB2Fj4zpnIrd
	jLSkqzZBa1V6H+NCtF7mzuc9wOw00/SNM5RbS7kt3La6wWPaLl5hZxeqoxkTguFiUdV3QtWhBsL
	YnwESbrE176gMlo9hWuUJvOjPQQbD5ACJlhpQuNBwVPn53W94/QPiImtGNxO/SVqQd3mwSf4pFK
	5fQCVnranADE+/JdNizLAlDMEHjMM4aCafarN81GV8WfFGCfArNdJ
X-Received: by 2002:a05:6a00:1786:b0:7a2:8649:5ab7 with SMTP id d2e1a72fcca58-7a4e2fe7764mr1698652b3a.14.1761703653150;
        Tue, 28 Oct 2025 19:07:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUvjVwtp3NwrQWxnAVxZgwMjhqYYTsjLFFZpyhtM+DKRTN/RtILgRk2ESDH14aq7koiopgfg==
X-Received: by 2002:a05:6a00:1786:b0:7a2:8649:5ab7 with SMTP id d2e1a72fcca58-7a4e2fe7764mr1698625b3a.14.1761703652606;
        Tue, 28 Oct 2025 19:07:32 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414069164sm13369697b3a.45.2025.10.28.19.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 19:07:32 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 10:07:14 +0800
Subject: [PATCH ath-next] wifi: ath12k: fix reusing m3 memory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-ath12k-fix-m3-reuse-v1-1-69225bacfc5d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANF2AWkC/32NQQ6CMBBFr0Jm7ZBOSRFdeQ/DAuhUGoVqBwiGc
 HcbDuDmJz8v7/8NhKNngWu2QeTFiw9jKnTKoOub8cHobeqglTakdIXN1JN+ovMrDgVGnoWRjLO
 2UmWrLg6S+Y6c+LF6hyTgyOsEdSK9lynE73G30MH/Li+EhOWFrDGtLuzZ3YJI/pmbVxeGIU8B9
 b7vP3MetW3HAAAA
X-Change-ID: 20251028-ath12k-fix-m3-reuse-15fdd806b09f
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: WTnbI6Mmkfdys7coZ9SSoI6s1nNV2tx7
X-Proofpoint-ORIG-GUID: WTnbI6Mmkfdys7coZ9SSoI6s1nNV2tx7
X-Authority-Analysis: v=2.4 cv=PcvyRyhd c=1 sm=1 tr=0 ts=690176e6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1qHGFEiZaCHBQHMGWPoA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAxNSBTYWx0ZWRfX9pwVsoMHzzv3
 COJHZXSOtFuGCIitzEdbIB/BstRzcF9bCerSRTVWcRhV9pw1iM8Qvdj6srfU0R6cbkSIHkpnCpA
 BvPVKyzzwUoK31ue7VLoho5EIo3OhI3jrOPJ00bdspsl7LSLZ0u0HucdtcqiPRMp9+7DtUWZx6e
 +PO9UjN+043wuQfcev4JW/JTdb4S5qQDWRtiqbGgp8F7GNlz7fAP3BFUEhoateEVFUz1zMT5GXA
 wyfUNi4yHy24bmDpWYdXHnBfRP/ayZwvsir3lcPE/q7Q1SaLH9Y8NarnJPL/vslkTA4SC24hm2k
 IwLN7LxWF0O2XUohfuWOVoaobcc77GNflb1KV6GZ5zM3UTcBX7WLfAOVcRlM7qVMuQmEvoz9fF8
 1qlzNgtcYnNo6Zv+oQmCWfKULWZkuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_190735_574740_5BE74F4C 
X-CRM114-Status: GOOD (  19.68  )
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

During firmware recovery or suspend/resume, m3 memory could be reused if
the size of the new m3 binary is equal to or less than that of the
existing memory. There will be issues for the latter case, since
m3_mem->size will be updated with a smaller value and this value is
eventually used in the free path, where the original total size should be
used instead.

To fix it, add a new member in m3_mem_region structure to track the original
memory size and use it in free path.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: 05090ae82f44 ("wifi: ath12k: check M3 buffer size as well whey trying to reuse it")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 11 +++++++----
 drivers/net/wireless/ath/ath12k/qmi.h |  5 ++++-
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 36325e62aa2423fcc091d6d447700d6598a16317..8de9aee2498ec55e2065f655993d929ddf696e82 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/elf.h>
@@ -3114,9 +3114,10 @@ static void ath12k_qmi_m3_free(struct ath12k_base *ab)
 	if (!m3_mem->vaddr)
 		return;
 
-	dma_free_coherent(ab->dev, m3_mem->size,
+	dma_free_coherent(ab->dev, m3_mem->total_size,
 			  m3_mem->vaddr, m3_mem->paddr);
 	m3_mem->vaddr = NULL;
+	m3_mem->total_size = 0;
 	m3_mem->size = 0;
 }
 
@@ -3152,7 +3153,7 @@ static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 
 	/* In recovery/resume cases, M3 buffer is not freed, try to reuse that */
 	if (m3_mem->vaddr) {
-		if (m3_mem->size >= m3_len)
+		if (m3_mem->total_size >= m3_len)
 			goto skip_m3_alloc;
 
 		/* Old buffer is too small, free and reallocate */
@@ -3164,11 +3165,13 @@ static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 					   GFP_KERNEL);
 	if (!m3_mem->vaddr) {
 		ath12k_err(ab, "failed to allocate memory for M3 with size %zu\n",
-			   fw->size);
+			   m3_len);
 		ret = -ENOMEM;
 		goto out;
 	}
 
+	m3_mem->total_size = m3_len;
+
 skip_m3_alloc:
 	memcpy(m3_mem->vaddr, m3_data, m3_len);
 	m3_mem->size = m3_len;
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 4767d9a2e309e48e4a9939296ec99513536af953..7a88268aa1e9e99a13034003cf2ca7d21ccb7573 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH12K_QMI_H
@@ -120,6 +120,9 @@ struct target_info {
 };
 
 struct m3_mem_region {
+	/* total memory allocated */
+	u32 total_size;
+	/* actual memory being used */
 	u32 size;
 	dma_addr_t paddr;
 	void *vaddr;

---
base-commit: a6199e69fc9ce2da461aad389a875cfdf99fc283
change-id: 20251028-ath12k-fix-m3-reuse-15fdd806b09f

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


