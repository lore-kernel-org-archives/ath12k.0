Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F134AC87FD3
	for <ath12k@archiver.kernel.org>; Wed,  6 Aug 2025 11:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsVxbWsi9yU5onJFXklKXvkbsfDAqBzddlTUDZvYW/w=; b=j83OyTOfsbkgCL92RSID/YqMV2
	Y+/JLj1IxLtakYAlMN4MMBIX2GnkH1APrFF1DcV96NPoH8+DzW/gWFWRusiMa3M1s1BVwYglNvbW6
	k3frvc9thmQMiLA/lAAoKUAi+RKY49rbZSiHW1gPIq0KoZRLM99QC/iDHd+PPbP5aWpeoM7r3r8zt
	9W38DxC/x9a5YqfzmZnX3b19qlVSP/qNnstlTWOrKHyGiI5PW7Mq6e+IFVjIUQd+152uAv7mv/mB+
	umkkvTh2FzZbZfYjTgVea9RIvzrhf1EPxE/sXWQGK8XTQ3i5wvAO/R0NClGydGWFeshSbIT1CsWqN
	YJYYkn/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujc9s-0000000EzlV-39w5;
	Wed, 06 Aug 2025 11:18:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujc9q-0000000Ezjx-2wME
	for ath12k@lists.infradead.org;
	Wed, 06 Aug 2025 11:18:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5769ek3Y032245
	for <ath12k@lists.infradead.org>; Wed, 6 Aug 2025 11:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=tsVxbWsi9yU5onJFXklKXvkbsfDAqBzddlTUDZvYW/w=; b=NK
	WxYMr3rkoqJiGNmJEkdapZDXCk7R8RK8R6oectnTGDTrjinBnYb0/xNl3xNVSvLX
	HWDJmVmcHbXdjbUxRTW2fGAuIex9WsKZHpf2n9T9Tf5WDL8g/OFhZvGq81C3l+vo
	PaqCRxacKhi+9w2qeBIbo6pMaBpvMGDmXFT3F5ILeSGfHbF0MiHKnHvavmmPDswF
	t2CgcjTaUER+QAUZJ2xGTMee6wAM9M12NgX8zofYEq8pYImGh7609FSUna06P2Fa
	hrYyQ9ci+Pj8KbN0fGyFlTBudbrH9i97HE8XhrdRI8gD6KEoLMwguu8MrSWNJz8m
	aXhhCvoAjlGLXvVVDmFA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw2tjxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 11:18:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31f2a98d91eso6446305a91.3
        for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 04:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754479088; x=1755083888;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tsVxbWsi9yU5onJFXklKXvkbsfDAqBzddlTUDZvYW/w=;
        b=YYMN3nFsv/mCv4mQaeIAnJQjzow08E7PXrHzgU6VyshQonijtheu0/W+K2BzCWVYiA
         XSZZYJk51RVgI0iR4MwJai/eHNPlUA0N63JW3HLhyT+IsuHDKRuDLnD67k3kRQ94hIrY
         xF7aFB8T3Bl231rxhUgM/RUjoDjF6WQdZMAiCwTQaRBw0omJRegvDFRS6KQyoMs4Ug+M
         U/CgWcAHKLOm2v8/sSslgRVSxs9MTWjpK2XOIswTtY+nmqrhv21mlnu3SNYU5kU9GhZt
         7REDcQ/D/0BBjNT1o+4dgfc105mr6TNun6xMLaGnPgHanYkNuE1E2uC5UhALcRY78LkN
         9hLQ==
X-Gm-Message-State: AOJu0YwActTWTNPYQnGVsc0A4F0h+cMm0zHeACvW/NtgzU0yWtK7tVPo
	q4o0y2eGoWYzuajSSM+aHJRbDGgQUTMUlScXV64OAXmLjcvar9dOvgDNJXOaDXkmT3UuVfYjzSa
	mzsBe8Kolgh3ji+SOT4f31urVXbmlognGpJ4eABznCxYL/79XG9kHwcatCnLHVPC0OxvC6JSD
X-Gm-Gg: ASbGncvBz2635XQ041MAA0mb9Rv18hFn5qW4OsVgvKTgB9wRTMvNzlGcjy4BGLlk5O+
	fQYnuK3HjD1Tuv1JUZFXFxaTaMMMc5ScLGt9/qpUiIYYu/u5oVSctCvK7MUHXR83tPfY3z2zpr9
	RWaUzrwzTE1nQRp1fkWNItC1ff3jP0t0NPeddIs1VG75N2cMhxyfulKgYxuedlTZLnPq4Ty7jz0
	sflBxmNcgf6Fdl7FVRYyoxr6uZ7IyDZ0LNtJlAI9PNoYTLGPvTnom09IYKNfW10jZOcme0SkUXp
	Q1SBQlqSDLYXrIYhJcYNSLDAieNF0lkmBzH2p4CxoGIWF/hxa/EDD+fmpwUtUQGuOr6yq04IU+B
	zrufENi8bld6cRZEf5PCpxRV4vvCtj/JTfygXLDHW6RTgJkf1xDJmGq12qMvVCk+NUHTJ2WCNOg
	==
X-Received: by 2002:a17:90b:4c92:b0:31e:beae:2934 with SMTP id 98e67ed59e1d1-32166cb7261mr3490739a91.18.1754479088288;
        Wed, 06 Aug 2025 04:18:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGw6Eec6QRCfhfi3aEeaCBICThkBWIxtHVaW7RSdSxCqBa3CbMIuxk0q1NVn0GASHQLX9jSSA==
X-Received: by 2002:a17:90b:4c92:b0:31e:beae:2934 with SMTP id 98e67ed59e1d1-32166cb7261mr3490708a91.18.1754479087874;
        Wed, 06 Aug 2025 04:18:07 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7d9dafsm12984111a12.23.2025.08.06.04.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 04:18:07 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-current 6/7] wifi: ath12k: Fix flush cache failure during RX queue update
Date: Wed,  6 Aug 2025 16:47:49 +0530
Message-Id: <20250806111750.3214584-7-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Vbz3PEp9 c=1 sm=1 tr=0 ts=689339f1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=iJxYE32BEC57r-YmU5AA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: aV5wWUN8DRtXDMU0F_xiVqrbzBdH4tV4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX5oxXXwkKmrPz
 tXJyhF+fNAlPRav1Uqphxn3rrjqcB01IjTK+3Ng8sVOrhQxGbOiU0I9mg6ML5nIdP0FOKNl+DU9
 diMRITN4woNKvAUrF69ob0P/ogTA01jvwuAHEUb/oijFfoIpODtVxHks4RQmDSRvBpJ6kG15rlV
 2rp+zu33Qk8y496njmUb+AZU4psw6BUuPXkV2givFuv19VLshHiOcWvYbRle6ggOh26SVWNqHLE
 5xny+lYhjlb83AhVB8dzhf51zZeqeJfG4gPTcagXVBPWK8RobrJDZK0zOvj3TGY+gPP70BkKgvP
 g4cYMl9iTxMdzrRHc+hcG+opv6tezxKik1d64uCCfbwAM6rVyhZIP6Xqd9kYYkB+KYpJWhj7RBc
 5dqEOL6r
X-Proofpoint-GUID: aV5wWUN8DRtXDMU0F_xiVqrbzBdH4tV4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_041810_857705_F1FA6C31 
X-CRM114-Status: GOOD (  11.49  )
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

Flush cache failures were observed after RX queue update for TID
delete. This occurred because the queue was invalid during flush.
Set the VLD bit in the RX queue update command for TID delete.
This ensures the queue remains valid during the flush cache process.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 9a62ef52cd6d..9cdb7cb03e23 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -850,6 +850,8 @@ static int ath12k_dp_rx_tid_delete_handler(struct ath12k_base *ab,
 	cmd.addr_lo = lower_32_bits(rx_tid->qbuf.paddr_aligned);
 	cmd.addr_hi = upper_32_bits(rx_tid->qbuf.paddr_aligned);
 	cmd.upd0 |= HAL_REO_CMD_UPD0_VLD;
+	/* Observed flush cache failure, to avoid that set vld bit during delete */
+	cmd.upd1 |= HAL_REO_CMD_UPD1_VLD;
 
 	return ath12k_dp_reo_cmd_send(ab, rx_tid,
 				      HAL_REO_CMD_UPDATE_RX_QUEUE, &cmd,
-- 
2.17.1


