Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB499CDB46B
	for <ath12k@archiver.kernel.org>; Mon, 22 Jun 2026 06:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/C/8iYmL+lfKAPj1dd+sn/SjkpTMe1a5ENGah+3sxuc=; b=l3cFHcqvS98kkCiasRB4Pt7H1W
	xo1t3bDZoKX5IQEcn++Pgp4h30EA6yjTktl7+BbhqQVVokMruINETbtp6XH6zX2mNVpvTbbaCBFll
	Qz9mUKjJKMiZ/QoogufxXbXOBcmEQX5tvNY6gxMVNU++lFhk9fuxTIVYt9bpRyqNS2VQVHRrHf1g+
	mV01sV1X7/KIzqlNLw/mOMu4RZNQa5qkP7CWRMdWFsksLUbbTFXItLtdxEPgbAZK5uqP4keTzeAy3
	EN4qAfzjZFUsrHWWW7gZHaXJf0P70qOpeRq8lep2Qju73XFKckbD3izoLV+a+IY4hE3xq2969l+2N
	e5Eya26A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbY4K-00000004TjK-1qPV;
	Mon, 22 Jun 2026 06:23:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbY4H-00000004Tin-2Wyq
	for ath12k@lists.infradead.org;
	Mon, 22 Jun 2026 06:23:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5AMZg227649
	for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 06:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/C/8iYmL+lfKAPj1dd+sn/SjkpTMe1a5ENG
	ah+3sxuc=; b=e33sqghey/tokvjUfikxh2nrLF+Sn4d2C2CxZdX5EoY8gEdpd5g
	nFjve8gq1rA6QYVr6d61LqmLOwcy+zzmT0Kqf6I1WPnWPhVESwmw7UZDISAJ69k2
	4chHMs89zR6UhiAfFtJXqyMy544pw5DjcbN1jrEkq4By3QbioOGyfvrd26x+JADz
	CLS+6SDhnILARuw/f2IEvfb9/q2WoaJkQBukQMvI10Hw5qPuLg0Dyo3c6+cOULBO
	uokW6Yf43CNivQj5cbBXkmyRPHQRfn+bkohfmYBCgce2q+mzOZcV8OVLCXFE0DrJ
	Hy7JZVauk2d3GnRwgCfH+JR/AWFvwnOn2Iw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewjxucy3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 06:23:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6a9bbcc53so42344075ad.2
        for <ath12k@lists.infradead.org>; Sun, 21 Jun 2026 23:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782109414; x=1782714214; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/C/8iYmL+lfKAPj1dd+sn/SjkpTMe1a5ENGah+3sxuc=;
        b=jFGh/RhFb+P2doN5B6b+vkwJ4z/Z6pJDDL2Ks48qPWaceQbgcmzkSDK6DkD7as1Dm9
         2wQC1/4iK2f8pQiupNnPcng2paMwxb2WkyBPpba1pGwLYMO4n7VG1pGF78bqn5/ys3+V
         JA9Mr17ClCoHkhpuPYB6xHQ82uaS6/KCnNJkinDc10sGM8I6fStZd5HdKYzF9Ufxd7f7
         +n0pUU+z8YGfDLMdM+MCB+AskLUs6N3YGQPCRXvJ6Ytyf3fVI3sqEBY2rBb5pO7HHx0Z
         GZbYeNK8ox9dHqrpl/7udd8fDzIDouqzqpRqU2mFCKla0FtuLQDv/V1U+XtlqzUqtYD0
         UP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782109414; x=1782714214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/C/8iYmL+lfKAPj1dd+sn/SjkpTMe1a5ENGah+3sxuc=;
        b=d+FeB6eGBVXVrCbT+EF8/IN03C8JasfEy6ss4AsZ7bXEF9xC3gEaE7e0Kr6ro3Ixsg
         Mp5hc3mJScDND77xoCuQh0Df7Hym5+IYWVTneiU9TAtttak79Q0j1qAujQiPGwpx+LRv
         rvEHkByQyym+GSXEy8FM8NCIJSQMBs4/UuQlUZBVJ5/Z6bHDTbPD8JWbNZgC0LnKRyWQ
         V3RznG8MRu/z5W+/HY1FQsCr1n1gBvzvZ+IhjbfpLL49QtF3cjDmwYcEU0pjQg6i7oJs
         S3uxy2wiNEwNCewRNp9ZpJay03FcplP8e0/1Uf5JoUoU+cudFQ5XAEJh3dk+nt7FyfJo
         8UGA==
X-Gm-Message-State: AOJu0YwOYsYYGEWMIp2kKZdKIpX7K9ntETKYTDEtCZfUPhEPu4co78Jf
	dQlCnmwbKmujze/ohCzpb7sMlUtOeKMo7BX/OLPKpVJJMD5o2Ln1ya7VKb9fJnMvsyOtMcjkJQj
	YoyqYXEUXaJ5dVyFwZE+fl65hit9/bS6nkNpKEA7OKVdkMrK6x6TSP3HXv4DtnZ0sBrVUCDYH
X-Gm-Gg: AfdE7ckDpHXWp9MKrCY452BKEowzAEfJxmaeAUlLnJIIcPlej7Im+Ets/OdA0hjkjv9
	tHgqi5UFtnGpNFO9XA0Keyb6JMJNuKT8EubJPv7Eomss6XJINqKG2r6JWhUuWy2oDoy7MTdD+JT
	t1jHyVH6ET62ng6JP0MYkZQ56LV1uSFi+RU2sQ/BG/GQX3t2Pchhy1ZV7DzrofYz2MsdPfVP9Fd
	did2jx43GvVElZ1s6dyVsQfCr5R4BnrT6V6w4lPN7F1Hnqp8qqe1uNw+BGTRILDP/IBCnx5Izhy
	3EDyBoCiTs49T+pOtmSTP1j6yTc4ezb+gAfobViVIjkjykmgFh8dyC7M5TNcXomaawXyDAGUJDW
	XB3YQp5GwdOzfuMnDBA1Hlx3X1T4v54eR4kohqf42+5MaSTJRrxvPI+JguDncBPkIXb4/CYIjMX
	NMhjoKX7MV4FABrV/i+kz7cTwUQfXnRw3YihpDoinAQo4=
X-Received: by 2002:a17:903:2309:b0:2c6:a99a:52b5 with SMTP id d9443c01a7336-2c718cb1273mr141350395ad.12.1782109414072;
        Sun, 21 Jun 2026 23:23:34 -0700 (PDT)
X-Received: by 2002:a17:903:2309:b0:2c6:a99a:52b5 with SMTP id d9443c01a7336-2c718cb1273mr141350045ad.12.1782109413565;
        Sun, 21 Jun 2026 23:23:33 -0700 (PDT)
Received: from hu-tmariyap-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfe4fasm65772875ad.59.2026.06.21.23.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:23:33 -0700 (PDT)
From: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Reduce RX SRNG interrupt timer threshold to 200us
Date: Mon, 22 Jun 2026 11:53:24 +0530
Message-Id: <20260622062324.758533-1-thiraviyam.mariyappan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA2MSBTYWx0ZWRfX7yccQmQW7OSY
 FjRodGTBEsJLBp3PGyXPRvGENsWMTxN+UG6VEFlrfNMoWjqSKmGMf0OY5Wdh65GUUqGyoqJ/o1t
 rVq4/46cN6kLmIHuJsnJCKVAluACpQ4=
X-Authority-Analysis: v=2.4 cv=G/ws1dk5 c=1 sm=1 tr=0 ts=6a38d4e7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=rWk4lG9R-Onagg9xqEIA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: bnSlx3LJbw5l3ga0-yGO5f2lkdOSQS3B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA2MSBTYWx0ZWRfX5emj2jbwVDOl
 rd2/PrjEjh3XLUqagIdee6DoPl3Wzq7yjGSdBqA7jdZHyB6XcuYpvrJuD2Qg0pK3fPbjrrRAyjf
 sCKgqAkbWsOZMVrxkFlzEb5pVuzAe4LP7aFHyVnx4GwhQHvd5ARU5MYSUkGC5MO2c0XYfT7yBZj
 pqWrA1z6Y5BsQD0DXgKdkXJDmW9FTh0w8Zl4FGITW9hYlZd6mYE7m6Yih6wh/p7gUOLrLmJPuQE
 1vRH/8OCiFNDXoUYYQT9CTXUrK2FbDKoOuNJeQGH7K+z++SzWJCKz7rafNNkLtBSyW4GEJaGJC0
 xxVnEZdR4dwBT53LeAf2l+QwN2hq13zds2U3E0yqir/DsLzEKnIek7jGl3omT/04B0NBeornW/9
 2us1IJyDfd8NKZJVcZKU6MjdLnftMPxQMFxJeFS4JjrMKPjdl0wK/NImf9n34QnTIxocinahwur
 D423OZYW5V84pYSqvuQ==
X-Proofpoint-GUID: bnSlx3LJbw5l3ga0-yGO5f2lkdOSQS3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_232337_773417_107A4584 
X-CRM114-Status: GOOD (  12.86  )
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

Currently when RX traffic is low or intermittent, the RX SRNG interrupt
mitigation logic defers packet processing for up to 500us via
HAL_SRNG_INT_TIMER_THRESHOLD_RX.

This causes excessive RX servicing delay, leading to increased end-to-end
latency and degraded TCP performance in low-concurrency scenarios.

In single-client single-stream TCP tests using 5G EHT160 (NSS 2x2) mode,
throughput drops to ~400 Mbps DL and UL instead of the expected ~600 Mbps.

In addition, UDP UL end-to-end latency measured in 5G VHT80 (NSS 4x4) mode
increases by up to ~48% (~570us versus ~270us) across frame sizes from
76 to 1518 bytes in uplink and bidirectional traffic, indicating delayed
RX servicing under sparse traffic conditions.

To address this issue, reduce the RX SRNG interrupt timer threshold from
500us to 200us so that received packets are serviced more promptly under
low-rate and intermittent RX traffic.

With this change, single-client single-stream TCP throughput in EHT160 is
restored to expected levels ~600 Mbps TCP DL/UL and UDP UL end-to-end
latency in VHT80 returns to baseline values ~270us across all tested frame
sizes. Under high RX load, no throughput regression is observed, as RX
rings are already serviced frequently. The primary implication is a modest
increase in RX interrupt frequency under low traffic, with no observed
functional, stability, or performance regressions on tested platforms.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1

Signed-off-by: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 21c551d8b248..2a5bdf6d7653 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1024,7 +1024,7 @@ enum hal_wbm_rel_desc_type {
 
 /* Interrupt mitigation - timer threshold in us */
 #define HAL_SRNG_INT_TIMER_THRESHOLD_TX 1000
-#define HAL_SRNG_INT_TIMER_THRESHOLD_RX 500
+#define HAL_SRNG_INT_TIMER_THRESHOLD_RX 200
 #define HAL_SRNG_INT_TIMER_THRESHOLD_OTHER 256
 
 enum hal_srng_mac_type {

base-commit: 972c4dd19cb92e03d75b66c426cfade07582a1ba
-- 
2.34.1


