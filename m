Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FBFC53219
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 01:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b8lvaeEa9L03FoFsbXkFBNDcr8fgF0GHUf3602Z1cqM=; b=I0wycE9ckHvy2gJPtAS5oUdR2E
	DDzqTX29ZP9UoK7j3ynhIs2mMq6iVuU+oY0ldAbguzzy8yBKZYyWkjIvUuoSUmis0OiaOjHcOwDzW
	nXX6181CPEKyXBl804/3Z0cpWfKzsgVG/0Lpy8E/GezpzEAGVosOJiNDhunJfPiXtFRubMs76kWjA
	AP35uhiwGf3X+tMPm02yeCJkBYuz7NWogvVk8AmCgfZfrbFALpu0o226MuqzOFWbc0Vwwqw3gIF59
	+ITuGI2uYwh9leNQY+NOv+umvxMrsmiS7TvZ31RCqjVYddGsU5MGGDx2pvwahguLkXJvgnW7Rp3qY
	FIptRrXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wostQ-00000006ZUW-3DXW;
	Wed, 29 Jul 2026 01:15:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wostO-00000006ZUB-3vba
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 01:15:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SN4ZBB4142958
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 01:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=b8lvaeEa9L03FoFsbXkFBN
	Dcr8fgF0GHUf3602Z1cqM=; b=JO6vB+Psdn4duW8LBcL6KrJi/oebf9PZ8a4mVP
	qKnt+6xllsa7Vp/IHqJoTr9MXTRi4aYh+R/qqVFVw9nAOmjJgWUxV0xn6lLu0Rjk
	V19L+5aLUlF7JIOrOn7EPWhJseFUCYFT2UvDXrNKtlCaqYtMv0SSnarg096WrkpF
	6imXzU2ZdfiMxdsrPyefwOlZzTAcHJpBoDjDdeViawNlGLQkpUAbivvZCLB02mZd
	rq3vfIYCpJ7V3bpx5FxLPzInxohFa8jeMsF3A/4x+PhQHRnn+FM6Rv26Q14kJNYK
	BmGsvG9DefTuq/NL8Dg2C50Y0iyNZ2KukB1VqsMreg1NJyyA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq5sagbdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 01:15:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso518998a91.2
        for <ath12k@lists.infradead.org>; Tue, 28 Jul 2026 18:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785287729; x=1785892529; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b8lvaeEa9L03FoFsbXkFBNDcr8fgF0GHUf3602Z1cqM=;
        b=aY1f7MZHxHkWZQIcbGPAWbgf/hzKGIAlfa0nEYK25ALA+kyTLNPGdm+gxQLcDIBABn
         /GcX/bXm+5q/0erFM8AqE8rLnTtbaZLLtMF31Tv3LPJ2IHcZ65LaofoM8pbYZWHdEn9X
         nzdrMip9Z1kZCAKab55rW7eVvTxhZ5IG1xn6l3pTvvOhY0oiO6vjLbRmORbuMNGf9Iy8
         DJlpjC4IxewupMBaS12Sxhsk1ojfY3syOTb9UK645iH2NqPSVVdOzJyX9R8cBWHjIFu2
         RPX1JKdy/PgdKxw2356m+I1DhzviJedcNuvP90p73P1U0RGkcQwpGg5Td5MZk8fTo3OD
         U6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785287729; x=1785892529;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b8lvaeEa9L03FoFsbXkFBNDcr8fgF0GHUf3602Z1cqM=;
        b=cf2q4OEQUlMe1ybOT5zMWs4NDKZCaIF4wuXRF7ML6qF1QgXZ/+rgF8MrQy03enTrLZ
         4F9mZ5H4HP40els/hyETMpnXJmEdT4swz7R1HV9POhJUdPXr8akds5UfgIdnu1hWotRx
         7RK0bDlObkQkUTq/TGOplHlGm5QlkxoCeLK40/4IaOkrah2ivyAsKC5pG1jTDoaz/7lu
         Z+9H6XAVQWEypplMruns+xMSdxiQc5P4jB4X0w8yyqmprDqhn+NzlUQg8pcX45ftRcg+
         R19g6AVTzvC9Z4fGsUFsEmPJbFHo9A80rW32ZSCdkwye6nD2oRA/8/9Y88aprjKrIEw/
         Ds+A==
X-Forwarded-Encrypted: i=1; AHgh+RobFnTN8MLqXBuIhfdEuhmtmXmfJXDvPxkAfuGpu/IPqFOro3ml90zQjBKCPu+dUdZTsx3P4iw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVj4XHd4uQUA3lf9AZcS5S0ds66KOpoUy2yAmYEwsSfy/XgisS
	XuGVxPDeo9UYDul0UXwQbR4eoX8XNQ1xZ/mqI5RaocUfDn1weOse3/uRPCbFD4zOgdIaKuDaJ/2
	H55u+pxI06C7wG2Hg7KTkt/K5rb8Mslv3FJkKo03ejAE6LHV/Xlm1DKAA8o5jSoHu
X-Gm-Gg: AR+sD11nEn/jhh8uEuSluygtbIclnoSDWEhxLMqPLpa/otKvHs5Cb59iJqp04PBFkcm
	wwDYZq6iNVWaie71a9IdN61eR6DwcTb9g72K/iIZqyi0UIFsx1UdbjYqIbzOlRJSBzTU9BA/ND4
	1XTSP9Q+QIL0/tw5Fc0nxEH9U55z8+LOFQ5214Thn9iT9vtR7MhkMWTJG2Db0kERfBurVZk5wjN
	FKjgeiFeGSeWFfz2CAPCJoydwlFXex2Xegybb36O1C0cP6Q7C1k3F44oNaFRImrvHKVNB5Q6KN0
	YcLq7/2mRRbkBC2hIpWvajUUzMT0yMQwf2kUT0AIa/ty6gyDUMi3Xya7hpEgUDgSYrJ//2moXUq
	SETgLGMY97KAIoaLLw/GhP173jJ0H/7OCsADToij3LlRSpe6nCtJzweU=
X-Received: by 2002:a17:90b:4c4f:b0:381:5ab5:b667 with SMTP id 98e67ed59e1d1-38f6a4972bcmr4855291a91.31.1785287729575;
        Tue, 28 Jul 2026 18:15:29 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4f:b0:381:5ab5:b667 with SMTP id 98e67ed59e1d1-38f6a4972bcmr4855264a91.31.1785287729078;
        Tue, 28 Jul 2026 18:15:29 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f2b9e35sm565432a91.14.2026.07.28.18.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:15:28 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:15:24 -0700
Subject: [PATCH ath-next] wifi: ath12k: remove skb->data check in
 ath12k_wmi_process_tpc_stats()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-ath12k_wmi_process_tpc_stats-skb-check-v1-1-01b7d09be20d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACtUaWoC/5WOXQqDMBCEryL73Iib4l+feo8iIaZrDVZjs6m1i
 Hdv8AZ9GRg+mG82YPKWGC7JBp4Wy9ZNseApAdPr6UHC3mMHmckiK2UhdOhRDuozWjV7Z4hZhdk
 oDjqw4KEVpicziDw/Z1Vd6xbrEuLY7Kmz6yG6QdwQE60Bmkh6y8H57/FgwYP/K1tQoNDYoaSCd
 FXi1TGnr7d+GjeOaQxo9n3/AZCWiwztAAAA
X-Change-ID: 20260726-ath12k_wmi_process_tpc_stats-skb-check-5530899ab197
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: AXguVuCypfzoUcxu1XC7rvzC7rGDkuJf
X-Authority-Analysis: v=2.4 cv=C5fZDwP+ c=1 sm=1 tr=0 ts=6a695432 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=J9Q00Dv4GsgNDm0QbNcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: AXguVuCypfzoUcxu1XC7rvzC7rGDkuJf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAwNyBTYWx0ZWRfX0kTEeMZJGGBH
 Mbal/EimOgr+a8glIWcmpl1N9GWSrzfRI0+QEf2tlFKlg0EUOe4FDpSnSxvgW5TY+oAa3Ob3CH5
 55+sV1PchYdS/1YpG8MIj/khvvOc0Vk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAwNyBTYWx0ZWRfXyuKdH27HUwAF
 ri8pyQnzHcUOxXfWcSWfYsISOa9TRhHelk1PeJCkAgQtSR1/g6v4qJqpHPJz/fH1l9pFOSp+rpN
 H1k7cnYdP3Xl8OZ7VYvxhCN3ir9AmPGarVP80ltOzVwOTAni0zAPkpVTbIOU11At96Yoejqo1ui
 FleluojYT2pjbfZFH+v/13h18PGa3vpXrkOM+5p7cUU7o31zEoE6/wQx1jz1DnhN35XsfKqMov3
 qpaIwgaOiTB6mf6y+eqI0n1XdcHFZT7RyfWsV1wYxlHQTDtSO0Qnj2/sJLqNJiVAyWRIFoH2tDv
 usIvekHWUMoG9XKl7PIQRIPgur/fn2itV6hsP8WF5Tlk0v0egsUL1cGotxx0+nOwtWPk2X31DUo
 TNZ4U+G2Xz7A5tDht85XOmKm7RrM5ZCrCmt51mZQR1NlVcuy5vVdga0RgGwvOqGVH9BjTqKO5pP
 OzMB99XBSyc8fjf961Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_181531_022370_B3686874 
X-CRM114-Status: GOOD (  11.47  )
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

Currently, ath12k_wmi_process_tpc_stats() has a !skb->data check.  This
check is pointless since skb->data is accessed by ath12k_wmi_op_rx() in
order to dispatch the message to this function, therefore it is always
non-NULL.

Remove the pointless check and its associated warning message.

Compile tested only.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 2b707ffc1a20..cd3040b8388c 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -9973,11 +9973,6 @@ static void ath12k_wmi_process_tpc_stats(struct ath12k_base *ab,
 	u32 event_count;
 	int ret;
 
-	if (!skb->data) {
-		ath12k_warn(ab, "No data present in tpc stats event\n");
-		return;
-	}
-
 	if (skb->len < (sizeof(*fixed_param) + TLV_HDR_SIZE)) {
 		ath12k_warn(ab, "TPC stats event size invalid\n");
 		return;

---
base-commit: 32f39e331f889a0424f7a0a82893f628e2705727
change-id: 20260726-ath12k_wmi_process_tpc_stats-skb-check-5530899ab197


