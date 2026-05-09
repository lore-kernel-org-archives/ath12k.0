Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA2ECD37AF
	for <ath12k@archiver.kernel.org>; Sat,  9 May 2026 02:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rV/ieMDnbXjj5KK/swB/oQaY+V1P3A2uOWUDsQmGtmU=; b=M9n4+DGk/A6B+YTV4gujDOAyEL
	U4bld3cZlBf/IrSTtaVtO8V2HCeDgvovgzdZQPjdlQFhmBBM5erOqzhtSYX0PM5V3bEX5w20CUKsW
	bznWCRhtixUxNJXfKDNwrMlu+zRX6XQbvG2QbrPYSPtOG4h+GtXb+V0TaMLg5jg7qTbrEb7jmk39m
	vTG3FsVNU3H6ZPDdbUv3g/U6U5kJlhMTg97q0uho2NugMZZvQ0OUGsg5i2k6Z6khLkaeVl0p/uZZ+
	hVQxfEI9wTHMFiaGf3gQm2khqUfP8NEMxg3wy7TwIc6IbPxdKVemw3B6Auy3CbgAhlH7hGsbdZZS+
	oYlyxyIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXua-000000084Kd-2BAA;
	Sat, 09 May 2026 02:59:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXuX-000000084Ie-3GJy
	for ath12k@lists.infradead.org;
	Sat, 09 May 2026 02:59:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6490KTOF1769260
	for <ath12k@lists.infradead.org>; Sat, 9 May 2026 02:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rV/ieMDnbXj
	j5KK/swB/oQaY+V1P3A2uOWUDsQmGtmU=; b=jeFLZMvoY5L+SN5melJ7Pofcw7l
	PDFns0BRSpMkAMKm55YT6lv5R9PbjoYUW0CSIaaoz0WMuC92cRNfj2D1fhfzmKDy
	qS0l/4TKpzYpUc+G3CKBDvej51jKTFamVAib7J9ITNvuNJfkSC3kccbbjoQ1s33I
	3VhgnQVVuLnnk+3onnc06cbRPFKD2zdiotyVD8yhwWSPBdWem25sT+Nsvn6l4wNo
	97vjaKjqeq5vv3n3EYk2XCrTRafGf8LD1v7HvCnyYilpch9jDUQo0jcXgAax9RlB
	MrriXWXrlK5X3el4p/FokOGnmDNMFOZVbVPe9F1nphQv5esFQgCSVYv8tqA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1t9q096b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 09 May 2026 02:59:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3662eec51e0so1181855a91.3
        for <ath12k@lists.infradead.org>; Fri, 08 May 2026 19:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778295564; x=1778900364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rV/ieMDnbXjj5KK/swB/oQaY+V1P3A2uOWUDsQmGtmU=;
        b=dpyKFHbHn3IU5f9fcSCama4jV+Gkwb3nXocGqgxWI2StVklKXEG3y3XmOjr1Xbe/sV
         ozHrVLokA3UnCa3/qqkfDHOkqDYGmDf/sgkiqIzzfpVTGUV06JbOBdbcOc6dprHpVRDy
         0QbimfynarLCQV8UM7CZV8XfC5Dj91xUrMJiiUaH8VzDi6rJ8bF3Vz5kbpgp3JgKdyRv
         c2AN6rbrMg6ZZUSIMFaHtHX9HiuBdIOGiAUK8C6SCqsO/hEoiTly8FoImbrwkprJFWBa
         SyNQSHB7uQc64fkz8DGA31TzJzhZb2KrSZPr4yElLQf/C1hM8HVvTXA3TpAVSr7Qj3b9
         WSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778295564; x=1778900364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rV/ieMDnbXjj5KK/swB/oQaY+V1P3A2uOWUDsQmGtmU=;
        b=dzCaa8FWwTpPpjFEuFS3yD8QM7ESA/jDMnYzuY7gFAuV74lgWjKSiWUAg3a3iCDYuC
         Cr86LTKQH3LgMznLvHy287Czm9iD7uaMa0yPxa3wAfvD8ZnsCd74CDptyyq20HLhQv8J
         +BEiU//2+wUa3XFo4I2mTNmUvvDFF7+gytx5xiUUb5mEN3Gno9ey4RylTUVdDp21Uy6K
         ezhDu/CEPgoa0S8MpaRGyGPKmTfTf3ajEsxW/GZ1/EZQKPH1sKPxndYvG4vj3Aelqwt6
         7aZObp07nq6tmkEdqWZps2IoxSiPCeZkHfQNBop8Pr8ZRVRp5tdSJjUNnE5sq8TobCpv
         juuQ==
X-Gm-Message-State: AOJu0YxeKAG/BCtq9Ch3hDT78WC5kqd7ZnQtAYCIAkIkf6nbczKZQflT
	j/qQX8vKevpuiukE17vE+2QIP/DU+ooSoUZTsp6ruLXgn5zx0D9E71Gprn9oihssiyggM3ne/Ak
	eR2KX29fmY3ipjd5jJoLEmu+Uun4qo2k1oAMWCiomAhb2a5X2V7HolMdwRII6rt5X
X-Gm-Gg: Acq92OE0ygwc1Ks54+cUymWzsRyGDTaK/5xcT8sewevSQNM/mS7Fa3rDS6YS4RYEb9L
	xiTtRU3mJT3GH1Ql2mxH24C6ulJvM6KBUMFOkXaH+RbrHThY3eusURBOj8wSHvPqeamcs1/SO3K
	5/zGyMwmh7x4Y0PBH4v24TdBavBMe6rjChZfcDrBPkP3OTb72vPdCWxAGDRA+sBc2SzRunTKNYL
	bvS4+2hsOvyGbFtU/tSpqf1ac5zu7QUBBU7LjIizL0PaXqVOT4H3F9wG0iMOpGB/vbALrc7z0uX
	TImkTdRczjYOSpc85LQzS6zGHeAqs00WNq1+aDI4P+Z4MAU6dHpptulYBCzHLBB0xKfYNuPGjMG
	8hH68nbjS7tS9zJyvdLi6E8nnn7MZS6SNeyF9MZVQAkWdo1i4sRLeyJxf9m8pw7EmKNREQ57eGY
	YAea7C
X-Received: by 2002:a17:90b:224f:b0:35f:b714:e516 with SMTP id 98e67ed59e1d1-365abe8a2d4mr15400038a91.16.1778295563724;
        Fri, 08 May 2026 19:59:23 -0700 (PDT)
X-Received: by 2002:a17:90b:224f:b0:35f:b714:e516 with SMTP id 98e67ed59e1d1-365abe8a2d4mr15400005a91.16.1778295563184;
        Fri, 08 May 2026 19:59:23 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be8be938sm750899a91.4.2026.05.08.19.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 19:59:22 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 5/5] wifi: ath12k: tighten RX monitor TLV bounds check
Date: Sat,  9 May 2026 10:58:19 +0800
Message-Id: <20260509025819.1641630-6-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
References: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 53D7gM5hGC-Toe32vQL_4K0Q2-IacYSS
X-Proofpoint-ORIG-GUID: 53D7gM5hGC-Toe32vQL_4K0Q2-IacYSS
X-Authority-Analysis: v=2.4 cv=J7yaKgnS c=1 sm=1 tr=0 ts=69fea30c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=OJgDPCsnPsfhouAcpvQA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDAyNyBTYWx0ZWRfX8URN6in+80IQ
 vmR00yGJZ+csHKogdodoNm/+g/ZPhDOIYz/GObPA7DqpMb4sMFMvat/qsMiSMQOe26K69lHYgPf
 jynqm8oqDeL6/Z19jgE4vT2uQTp9cR22OtOg9tr6xryTkS0vhk5WBBD7KYm3W3S+h+/wA8NXpgN
 t8BNmHWoQI1JEYBqLP3tgUje41lUsiEPLyQgOfYPuv+8VCVBNo5oYsuRgXyA6SnsS/mllgAbMRA
 rllocaQwaoL2FOOwphlsj6F6axYow0D0/ZliU2POpaPY5TBp2y/HkMHyddTM+gSIAdfvJwSB7+u
 JQiZ8Tu6Lf8GxbAtd0ClbEbaMlbEDksBUXCrNiXuz8VzCug0kBgWIJOhs6lzwf2IJq3p9ZUV6Ow
 2S21WzFsalWh0zfqgeAWUz2veWaYN5JYstc/bEaAfi9WZzSWd/LTnHuIJSM1KBHZovD1BxU3VQ6
 W3waOVx8YjHk6JAAtyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1011 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_195925_936666_4817F57F 
X-CRM114-Status: GOOD (  12.34  )
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

Validate the pointer to the next RX monitor TLV more strictly by
ensuring that at least a full TLV header is available within the
status buffer before continuing TLV parsing.

Prevent potential out-of-bounds access when handling malformed
or truncated RX monitor status data.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index 4266bd1d0d3d..23ba0cc824a7 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -3006,9 +3006,9 @@ ath12k_wifi7_dp_mon_parse_rx_dest(struct ath12k_pdev_dp *dp_pdev,
 
 		tlv = PTR_ALIGN(tlv + tlv_len + tlv_hdr_len, tlv_hdr_len);
 
-		if ((tlv - skb->data) > skb->len)
+		if (unlikely(tlv - skb->data > skb->len ||
+			     skb->len - (tlv - skb->data) < tlv_hdr_len))
 			break;
-
 	} while ((hal_status == HAL_RX_MON_STATUS_PPDU_NOT_DONE) ||
 		 (hal_status == HAL_RX_MON_STATUS_BUF_ADDR) ||
 		 (hal_status == HAL_RX_MON_STATUS_MPDU_START) ||
-- 
2.34.1


