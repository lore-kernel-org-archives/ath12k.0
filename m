Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EFBD6CFDC
	for <ath12k@archiver.kernel.org>; Fri, 23 Jan 2026 07:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdFTB34kDELJOG7CYs3yfL3PagXXN+YLTcDqFHFn19k=; b=jmcc7jPGkMXmCR+KOk+nWsg98Z
	7t2w5RA6fGfCAnYjyVNlCl0JkOO9jNVRvnweJFTePApIxKZ8+qEZVrqA+shVwOgXThuGJGDr3t1JW
	CG6hOdDW8CoYDPZumgNo16OdG/oSWxyTxn+H1FekCdeYkz+3edMfISJHvYIy5g6KflRR+0y3ka4uz
	3YpbE6NB5t9mRuejy54LjSZbnkfSfTA2LptYGnFjRnnthdeb4lkHXII0GuPhPnQquzDmtYDpZALPr
	4nIsKQzfFfhGu6fdQk/nQsMDAVxLtnoZmgg2MIKVySkJMYnCTN7i6DF9Xn69n6LXTExUDJ/kJn1sh
	YFwVLH4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBM3-00000008LzV-09Hz;
	Fri, 23 Jan 2026 07:13:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBM0-00000008LyL-0E1L
	for ath12k@lists.infradead.org;
	Fri, 23 Jan 2026 07:13:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N566ZL3656269
	for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 07:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bdFTB34kDEL
	JOG7CYs3yfL3PagXXN+YLTcDqFHFn19k=; b=SfV1o5d4+QawkuiugNh8mrpR4Qy
	iq2oohBT7GmGHACWPVCo/ncOlYN10lg2kLGbWfh89m8trNvlh57XrLlLz+dy/SYq
	du5oCDF+L2k4mALaCC5nWLzfjv5QmNsH3EQnkHp7/zSIGDbd+MGFbXIM81eaLDOc
	BNHARSkd7zYWqbqa1o3/3t2Wl243jTX98j1sRUF87D2Re4jQiHubcBAvf3F7LZAD
	Ih/bcwi0S+XNpoW8C7GDP6wiKYTRDWZPuQF7Yy67c1MgYwpM6wuud4mN3CuOINTF
	iKNfYyO7dq5AfCGACIEXkwSYR+dbaqxvusFMbZVvl3cF4PWjAFf+M3s6Ltg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv2hw8cy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 07:13:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34cc88eca7eso1844394a91.2
        for <ath12k@lists.infradead.org>; Thu, 22 Jan 2026 23:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769152390; x=1769757190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdFTB34kDELJOG7CYs3yfL3PagXXN+YLTcDqFHFn19k=;
        b=Gq2AI7mBD9ch9UOYkgTpYZsdIWNBY+6fK++wcIzqfmhHL4S7RJcL43UkXPDVX9Jyfq
         RD/b1EIsKRiJVwXwvWIjymEx85d2rDMNUKFOL9iRx9lADlwue53qNJwbBB15xQo0e1LJ
         xtSXD+3SNHqxPzWnPwGSzpWgDVvIXfRLtPbs8uIfC143p4RdhdJahHULrh7HGsdIuYss
         7yyIkSbRmUB0erGWJEeAPfj8o/76cYuYE+s+n8OGrPYgyqWpFNO2QTCrD7PM9+6kTbEN
         k7rme40SRFCrSmFNPqC5etCZahHlml384TmSk1I8K2yWdUknaigPpY/F9SbjTciG9ewO
         hyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152390; x=1769757190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bdFTB34kDELJOG7CYs3yfL3PagXXN+YLTcDqFHFn19k=;
        b=CRA+fSJngrPGhMoice/eOEJ+6Pz5qUl2kryXsEnT0I5Q0CmMBpDItcLBThPHe6eLxZ
         1TbFgTQqzWKpmtuUkOpvnGcsg8ZCmL9cjYA9EP6RbVr5VoK32PC4x67VkRSpYnrpWuET
         SMkSy4qS3ro4k6zF/Q6YHyV3m3j4fXW8Ll64NGNE9D4RcBqjMf5uc4hfX5yS8Uc0NELS
         P4xEvmYw2MAyk6UG+1HzBul3+JQ/QLv1qHMcqrMWkOFwRzXmnptUoNjXyYAFkqMyRoxd
         oRLKZeHp0jveHLh44u01fbvJ0z9NfmBeFaH3U1QnLOggdPSjSzjcNe6gilRK7C15Nr1T
         0xDw==
X-Gm-Message-State: AOJu0YzdqkEBOO6SBu8HCqeVu2NPjld7UPgdHrWSnQm06hZLl5KAYny0
	g8ak03q67FBiogSkJit30SDxdT/2wLjEBXMuex5lL/ySktag4x74WLfPsXinSdTvZ2cJpYFFRyv
	6qhoyebdSXcJ9Ubz91UFoeyjylQlq9/0mO0cYrIdUsfefNLiHYvHAXfEsRQ7+43eO6KgX7/yc
X-Gm-Gg: AZuq6aJ2NJj+C5utmPSdfiUE7W+K+PHSeEQgrdcVNJwsCbSveA2DCKzaWmqDfrpZXKb
	I+IagOg12/ffciXcak2qA95byC0SAOebylMO0SwwiTjHcuvgyOmfBTj5HZW6zlKl+WokgDCP8Ve
	QZPDRwLiiR7kBsvX00mLZS4VX2dUi2rOfq+EzyxCmrq/LRluriO1j8iolvrZKti2aPkhItumqCm
	chZ35Y01WmqIZMRwySldBaouXtUGWEtAO2hxrtrjJF/tb8Dx+3zYzruaagWkr1bNwtdY18f+UbR
	NIcOjIyBuV/hjk+ZrZFUf34r8bKJ9QHFuibTeFS/ErvUw4M7nABvwwRYWHCTLpOo5F8dgiT5CkN
	7aBs/JADpebgcYx+5omMywDWZOw60wsBB9zDp3+s3xKV5esIGbDwRw+a9lIR4MbmUwFDqTfNh5i
	cDJiX4JRt+PnpCQK5Kx6624a/cF0GTSR9X
X-Received: by 2002:a17:903:2acc:b0:29e:5623:7fc3 with SMTP id d9443c01a7336-2a7fe457d45mr17339885ad.12.1769152389883;
        Thu, 22 Jan 2026 23:13:09 -0800 (PST)
X-Received: by 2002:a17:903:2acc:b0:29e:5623:7fc3 with SMTP id d9443c01a7336-2a7fe457d45mr17339735ad.12.1769152389371;
        Thu, 22 Jan 2026 23:13:09 -0800 (PST)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa654sm11319165ad.11.2026.01.22.23.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:13:09 -0800 (PST)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 1/3] wifi: ath12k: Fix index decrement when array_len is zero
Date: Fri, 23 Jan 2026 12:42:51 +0530
Message-Id: <20260123071253.2202644-2-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123071253.2202644-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260123071253.2202644-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4idV9aVh0eIpc6GgpTN77l118lKsgw3L
X-Proofpoint-ORIG-GUID: 4idV9aVh0eIpc6GgpTN77l118lKsgw3L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NCBTYWx0ZWRfXyWy27xfW3+wc
 KrOjocsbw+5nLgYfkPslTgYLMqB06h24Yh15Y/JEboYdQnmbadKVLbptnbZ2+S++efxLS4sGf90
 IbDDOpjDHksaQGSWrHkHVyABKYcRV2tzY6ZJE+DKfjNYHesoL6l9m8V3NB3xWVGt4npWbWfb1/2
 XGAU9pXGlJoUItZwTvw4HMl1ACKNLG+ziugdHNjPqXqE+vlHvGecZwJXpEdHgtNYPOK2Rw7MNUE
 WxBPpBsjhG6czSF2IBNGGvSVzCIZgJ4sNa2fntE/AGLGE0UqKSBbpCWCB/mQyOdvDoIS2hx4SZJ
 r9sogF0/aoGMrk1Ers2MJT3SCX+DpLU9+bk8tdnKrfeWALGExyZyipBHgWHVC3AomASrpiKc7P6
 bcCw+vGjLaPuFU1qeyFai/PL6p9pWwnonhig26BtV7lFn50ovLuZoV60+hXWeNco4AxYGQL4B2k
 UxkdUn8IuaBydsvIguA==
X-Authority-Analysis: v=2.4 cv=A4Rh/qWG c=1 sm=1 tr=0 ts=69731f87 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pJ2hT3CBv0cagPr_DSUA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_231312_215066_BC1875FF 
X-CRM114-Status: GOOD (  13.75  )
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

Currently, print_array_to_buf_index() decrements index unconditionally.
This may lead to invalid buffer access when array_len is zero.

Fix this by decrementing index only when array_len is non-zero.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: adf6df963c03 ("wifi: ath12k: Add support to parse requested stats_type")
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index 48b010a1b756..4f749d473d0e 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/vmalloc.h>
@@ -29,8 +29,10 @@ print_array_to_buf_index(u8 *buf, u32 offset, const char *header, u32 stats_inde
 				   " %u:%u,", stats_index++, le32_to_cpu(array[i]));
 	}
 	/* To overwrite the last trailing comma */
-	index--;
-	*(buf + offset + index) = '\0';
+	if (array_len > 0) {
+		index--;
+		*(buf + offset + index) = '\0';
+	}
 
 	if (footer) {
 		index += scnprintf(buf + offset + index,
-- 
2.34.1


