Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A90ECA0EDC
	for <ath12k@archiver.kernel.org>; Fri, 15 Aug 2025 01:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlsOJK5oVN3gW0ovDjkscdY5GxIZWuWXxKFxu34qXhg=; b=sWub7ymBQwWDLRGc+BZZWLfiYr
	fnkNWSf/FyqtYONvacmOFPJJPZgMA+KCiuQF5hdvaRHRr8JEowLUCJOGAgpGeMHmUgTDh0eskrHmW
	39jtD4tuKth++xcR6hqfVsGSz8kEaRzJk8XEMXYmjEkkDlWwfSoaj8DVh0jGOr26tg4expBGHsiWK
	iAjWJhBS4X8sw+o3QhRH/UXki25W3nssUZYwqWho6ndhcY3EPQhTUY2vmC9Q71yOSOaTeYYmG0b9T
	MQ4BleFxk2AyUGtNPW8oGL2mVBk5EWE0K+pXDKpb4QwGoSzUToq9Bo3qQ8g4waqUq3hKt9qt9Tvc8
	+hQyNiTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjVZ-000000013Y6-0LNw;
	Fri, 15 Aug 2025 01:45:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjVX-000000013Vd-1Fby
	for ath12k@lists.infradead.org;
	Fri, 15 Aug 2025 01:45:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EI5gEd012272
	for <ath12k@lists.infradead.org>; Fri, 15 Aug 2025 01:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zlsOJK5oVN3gW0ovDjkscdY5GxIZWuWXxKFxu34qXhg=; b=fd03oLg3y6Izcc+W
	BLyxaO7osrOdVreAQhjHOBb6GhsBuVA4cWyhIk5ocH0aY9b38jRJlIFJkxTuJG6P
	Ee2MKkKfvg2GA0t4Iqkl9/vqJ2K5YvwAOoBzs8WQl7Gl4+i6VPrljH8BXk12iEL5
	xdjBO/ymfts83GSNuHuPILo2TRkSfAzq5+/2s4QjJmxNZ+vIe4qkVhkkgxIE13IA
	KXdh4WxKoHoijmCOME0VmuVRQBhCB2789HTEXBxFZR3X5p8jzSLxJwDlLjXHt5M+
	DSO78aXZBxlYv2pUyuek9y38NV0C2iPJsaKAuOBY4LFbT3QobQruNIJWf8EF+JhL
	bMK+KA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxftye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 15 Aug 2025 01:45:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2e62284dso2582414b3a.0
        for <ath12k@lists.infradead.org>; Thu, 14 Aug 2025 18:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755222325; x=1755827125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlsOJK5oVN3gW0ovDjkscdY5GxIZWuWXxKFxu34qXhg=;
        b=XkPeBjYb7yZCDIRqdiN0MMqtXWCW2W3gHL/7OE3NWIo+05gs64sOJ/7R+WNYUs8a+z
         7Fi8hWV6lUnlxlU89mPFKLwGfj/+7rk8dlMCUYXtHwKj1HkSy/GR1FJ7oLPu/Cg6tmKV
         UqlznCV1LOy3J8wQAuYazu2Mbz11vhmsxPibE+DaAFG6/mpo1Rgp64wXCKbFC/S85R8x
         6o5nwyBBKvXaDwBv8H4kq1GoUHmHNeNnA10IHq5a3UoKO27JF04j5qcqnUEwO4UN12Er
         JDaX8SlBovf6IGNj2MsRzMSkosoJVDxev1wjIKYWskGbmD1+XloXSPGC9hWe75nvQGQv
         aLYg==
X-Forwarded-Encrypted: i=1; AJvYcCWC3IqwYwlFDDAZAbybCnYnDYvo9ba8xXe1/Nul7ccP5UbPDIImuSEOAcD4GKsnZivvoDXxdY0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyjTuTGNd1v+ccaGMaw5KaV5G4d0O9HTdbVNMi2iIffQKv8c0He
	zbEkpv0Rvvj10ahEbxJkBXLMjeebu6KqRjBAqD6ngvFEX2p8ESZ+niQCw/s7LIOy1ds+muwP2JF
	fCInJhcJZZJwlleA657cyVby0VQL5fqZYGDO5+dAfElL3a3vhsOPkBa5DjC2Jt0Sf
X-Gm-Gg: ASbGncvo+uLJIqhdCL0subrIQYnPOAbqoYkKUjuU/uFaelFssxnFQdCZZFYPQkVLJIX
	xC1psWCY41b0+0ivCvhCESzVU8uAllxh+5cNKgKI4VUMCUesYnv1OJAn3J3JALLIYbePYjb0vbb
	nEvKqt66JD6TXCwEjw8mMBYOf8OiwVdlwdbfYaHmVgDHXQvIbeyRum48D+zmDKMRByvfc9SVhZ9
	snSgahFDLyk3cU5AwQ8Y9p70lDP6qVwcO8JLR4tPTM2d2su0uUXhNcsgbSV63yBxvGwZfykcgkl
	hIQqq891iB+0MqMsJXXttvQy4YN9JhCkEj/HCxJVy3fnNRG6Bn4K/Sj/0MaeHyqAeWW6xlZTcR8
	YAkWxj9n4YF8np8/D
X-Received: by 2002:a05:6a20:430d:b0:238:351a:6437 with SMTP id adf61e73a8af0-240d2f3f71bmr628332637.43.1755222325004;
        Thu, 14 Aug 2025 18:45:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcAx/TsRQqAm4kbPDgVI2KzEGpjPVvzLo1WQbeY5Z9fq04iIy5aj3QYJ7X0o5DKPHyKP5YAQ==
X-Received: by 2002:a05:6a20:430d:b0:238:351a:6437 with SMTP id adf61e73a8af0-240d2f3f71bmr628291637.43.1755222324516;
        Thu, 14 Aug 2025 18:45:24 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d7735f4sm20273a12.48.2025.08.14.18.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 18:45:24 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 09:44:58 +0800
Subject: [PATCH ath-next 3/3] wifi: ath12k: downgrade log level for CE
 buffer enqueue failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-3-f955ddc3ba7a@oss.qualcomm.com>
References: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-0-f955ddc3ba7a@oss.qualcomm.com>
In-Reply-To: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-0-f955ddc3ba7a@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfXzW/iblxWA4AF
 VCAMlBCKsQBgK3PiT9P7Tmew7Q3Q14zGpuf19tb1DZ56p9IDLvSDnBz8b74Q6Zqz2NMEWFZkBZA
 URdj+uw+jkfz519lFiwZy7hs6CqzRTJWPQIEFAlaaLd32Or35gGeYLg9nR2+kuO4W0vgzLuzsaJ
 NNYFJOrZ4wpEQtTMf22UVqMg4sBYY9Lj30+Z8ylFLCKzBuZjn9fQzsJR5Mx4vmE2TBjWK6H4Rhr
 gUKmRJN/rTQmzUIRmy1K5BF6ILZm8G6XDcmUxSusfC+h8ggB1eS1f7XySp7HYHoicvNSY2oX4D7
 X6EF9zuVTcQlqwskHg9kUNREyWsYlyhznFqlxRq2rKcKtVSUBvKgaKGOSj/yriDPKd5iZfsxbDH
 RXnEDGfi
X-Proofpoint-GUID: lOAjv12psyMPdb9LGEiWWwsJ88laWEjb
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689e9136 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=4avV6w9vhD41MOPHW_EA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: lOAjv12psyMPdb9LGEiWWwsJ88laWEjb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_184527_455051_1A8D9C38 
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

There are two rings involved in the Copy Engine (CE) receive path
handling, the CE status (STS) ring and the CE destination (DST) ring.
Each time CE hardware needs to send an event (e.g. WMI event) to host,
CE hardware finds a buffer (to which the tail pointer (TP) points) in
DST ring and fills it with payload, then hardware fills meta data in
STS ring and fires interrupt to host. Please note the TP of DST ring is
expected to be advanced by CE hardware before interrupting host. While
handling the interrupt, host finds that DST ring buffers are used hence
increases rx_buf_needed to record the number of buffers to be replenished.
Note before that, host compares TP and head pointer (HP) of DST ring to
see if there is available space. Normally rx_buf_needed simply equals
available space. But sometimes CE hardware doesn't (for whatever reason)
update TP timely, making the comparison fails, then enqueue is cancelled
and a warning is logged.

However even enqueue fails this time, rx_buf_needed still records the
numbers of needed buffers. Later when TP gets updated correctly, the
missing buffer will be eventually replenished. And there is no doubt on
the late update, it always comes (or lots of such warnings should be seen).

Since this won't cause any functional issue, downgrade logging level to
avoid misleading.

Compile tested only.

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ce.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
index c5aadbc6367ce0d18080bb0e15a88d3ddf2e34ff..9a63608838ace31587691dd53c1d4aa8f081cb6f 100644
--- a/drivers/net/wireless/ath/ath12k/ce.c
+++ b/drivers/net/wireless/ath/ath12k/ce.c
@@ -392,7 +392,8 @@ static int ath12k_ce_rx_post_pipe(struct ath12k_ce_pipe *pipe)
 
 		ret = ath12k_ce_rx_buf_enqueue_pipe(pipe, skb, paddr);
 		if (ret) {
-			ath12k_warn(ab, "failed to enqueue rx buf: %d\n", ret);
+			ath12k_dbg(ab, ATH12K_DBG_CE, "failed to enqueue rx buf: %d\n",
+				   ret);
 			dma_unmap_single(ab->dev, paddr,
 					 skb->len + skb_tailroom(skb),
 					 DMA_FROM_DEVICE);

-- 
2.25.1


