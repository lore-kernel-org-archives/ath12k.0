Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8C7606A339
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 08:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zigc2+s2;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LsamRRBf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E7rWpsxd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DrledQ7asg/l1mmrglnd/iAJEwcVyja1FuRFpnl9nSc=; b=Zigc2+s27DFqPxbjk84Rl6dnGu
	A+RTYleCXtESr5GIodcmjnXWDNbvgy0FVEWdhd+zHnL1SFje+0uXAKdykDit+dg5Q2lBfwZTQ6vOu
	GzZH+9ugfdkhpp8bkj5rlewHNb/e3b7p2vwwnKLlm5yBDFObwH5a/XiOH1dYoO4Z3LGFwznpx1pjb
	1x6clV15goli4GbRZ2+7BuvvYcuMq9rZmGtScj6QTjjGTL+QrX5xVXdB1z83dvrS+9MHo8Z/K/voH
	lpukF8B378l2INPyJ9XyYHmfG9o2wKRw04po5AOwBSxEFx5UPz0YaXt0m6GJqX9edMkBcQqu1ZM4R
	lrVNRW9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTacq-000000085IZ-3RgT;
	Wed, 18 Nov 2026 08:02:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTacm-000000085IF-0kow
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 08:02:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UuwV2453536
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DrledQ7asg/l1mmrglnd/i
	AJEwcVyja1FuRFpnl9nSc=; b=LsamRRBftHbtS/cOyz+Ycz+GDLKyHOm4bl2aGY
	McXYe7IZ7rihpK/bQRRm6Wasz8TKAVAnS22Y+ei7wFpM4gdyCSezHMVSM/sL59dD
	dFEJmp92XIS4tAYSgGYGouvBCO/DW1Cpx8UzR6T5PxiylA8yDK40n5aMmLD0p00W
	is8v9TFRuVuryA2uYRPHXWIdvap2DTCAWP7jk+8iKcGIbxQk0q7v1x32/Tp41toY
	mjAuvXpgutTxBvoiZGoxrJveDF9DUU56x2dtkKCjyYOIaSgrE8hqCR4tal0WXhqM
	FoMDonLV8k6nZiJ144pLKKdRZ5KwUseqwzPnspaurwI7MCng==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99wd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:02:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdd4dafdcf3so706921a12.2
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 00:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794988953; x=1795593753; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DrledQ7asg/l1mmrglnd/iAJEwcVyja1FuRFpnl9nSc=;
        b=E7rWpsxdKYd7B/dRK7rAJLRKOHnRdnnE428lQtWX2uApZaB0QI1hClaFMd5Dm3DqkE
         utiAn5XW0g18wUORH36WuN1UWID4rQXqVdWZQf/8RdCEKekxc3P0gIMvCdBNs3A6UmPz
         kBDEQ7u8N6WmLpfD/HmncPcBIB8yJTJC+JbyLO9RTknYu6pz438zoL8vkwYd8u16kHAP
         rMCA/5fYb6Syd6AbPXiOAWZr73hzBNYtnfei/H5Nv6ymYTUgRzpGYh8MryHv/EsSNzcx
         xM5xYNVH0ntQd9QZyMk+mJTf1kG5qgHYRr5G2NWKyTgu6zgN4WSEdKKyye8sZ+R7iizv
         OT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988953; x=1795593753;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DrledQ7asg/l1mmrglnd/iAJEwcVyja1FuRFpnl9nSc=;
        b=lPV10gYaXaGYibzFTenkPvGvJ+0W2FqqMW7v28kutjNpiWAg7ZndAOuB1nvR9R7V1t
         7Hfs8ihIt/Ktg00GYoF8PuQdZgo/kQ/i1NjgbVfniniq8U/TNxlfYWLFtWSrrMjiYP7H
         uMPyAZXpjEazWv4nt07i7OC+66lIh86P8zasCtP4lCAIRCIDWHnvvUklWNKNb8rxtp5+
         kLkMyt2cd/NvuPLB5lyy45O5+U3gLqOhsio4/vSPAoWF+Htp4fA+IGNX5gk8lAVZZDEQ
         S0xZfjBrSwa1AjicxIe4APKLiO3K23BT6qEEcQ8k0E88b7OHtMQ2pRR9Ur9dB2LOm9vB
         hw3A==
X-Gm-Message-State: APuU4Z+/F+CQs37yU7duSB0Fg6tBdFFSRyngeq05N2VRZKrfJ4O33rCr
	SilcK3KGcizOwUG7SNwhIHkrdUMf9YH9fS9jFgXKrEeWCAKlPcmVQIsH+a37AEvXmfpNCWycBXz
	mAHBbsE9m6PzPJv9NWwhq74WPzNwkHleU7jjaUNsXZe9bL1xSLqdV84BOPHnqcds+353WKLhp
X-Gm-Gg: AZFdTZfRPb47NzctMxJq2Xeh6Ri4GDRwtviLFqWNIMvzCXOO7Kndb2onY9RFzFCIE12
	UOTVfrnUszFWWabNjgLTptuGm4fNoKwN7UkDVycrKcSnhFSZjgWhlxrMkYXHUl6DnHvEmRqoHtv
	L708pJWuRQ+yDl5JnkDOl+MPH/sQgx1exfCsZMq6IESV0/yUHG1ZxEp5UKWFCZg2WE7TmgrhwjN
	9ye6NlnRPDqkhmuyyLW14zIOK5HpJZwpxOxpDfRPvWjXRS2yK2okdfUhhmiBpFb+hNgtPUpTS4i
	sAMtISbUpFT8ED42qaSXXrmKlmyiSsvZ9DEpDBz6eKcEE4b6CQUvHt+dEuR1WzEZJMicSqBhYwM
	rywZgY3CCfyt81NZ/ahm1AdD2XvYSysuWgDpg1gYU3BB90W3l+XRA0Lx/kIKGUA5nLafyx4tWm/
	Q=
X-Received: by 2002:a17:90b:2684:b0:3ab:3384:1a44 with SMTP id 98e67ed59e1d1-3b3d07a24b9mr1884374a91.12.1794988953278;
        Wed, 18 Nov 2026 00:02:33 -0800 (PST)
X-Received: by 2002:a17:90b:2684:b0:3ab:3384:1a44 with SMTP id 98e67ed59e1d1-3b3d07a24b9mr1884333a91.12.1794988952551;
        Wed, 18 Nov 2026 00:02:32 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde45sm3022173a91.11.2026.11.18.00.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:02:32 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:32:25 +0530
Subject: [PATCH] mailmap: add entry for Sumit Kumar
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-mailmap-sumit-v1-1-0c674178495e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJBb/WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0ML3dzEzJzcxALd4tLczBLdJHNzkxQzy5RkCwMLJaCegqLUtMwKsHn
 RsbW1AE7ONQZfAAAA
X-Change-ID: 20261118-mailmap-sumit-b774d69dc808
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988950; l=1164;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=Xnn1LtxRhz23+8IMlgCLqST9EfapZNPN/wW0BQZ/t40=;
 b=gr9AQeM+IO4e5v+ZtmaJhyb3YJ8c5resaTpzy1tPoWNb1ldihmVLmu7gzn7iRk4p4CVtFxf1+
 Dgti4LD0dfgC9KF60IyO76BEKujMyu75t3nUxor/l7Ih2adJSgHe1pG
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX7qqIlgNNKyOG
 nCBbRk8zaTa5itoTSp8iiZQFd6HIny7HPNO82v8uO3vnk//pRdc/NZNOljNsYqczzh9X5LbHQBE
 3qfHKEy/ifU7CTAohIDKCvkVkvROeRM=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd5b9a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LpQP-O61AAAA:8 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8 a=sozttTNsAAAA:8 a=svCTMBYCAAAA:8
 a=PxZ3Jr3rAAAA:8 a=5WfTPKJtL--BJYubPpwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22 a=lbQUARmhvTNeubMQCRFT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX/3ivJCNgSOTL
 RnvcNA3wuT7K72DTPXCMz4wGY8almxxZMtLvDfzyW6EZsvPik5F2QpHNqzCxF5SmQkLAruO13Vu
 jag90tj7o++RJAz7IbKG+nxmOwFZo/HMjzzP/X4i/BvEoLGkZxp9Zi7InH5YPLQKZN0xnMAQg9H
 oJKj1jeYkaPuZOwbIdrefgK3L3rIjf0y1R2CJsUF/+m6KqvxPj54RyynI+ps/Cvq3NcP5HgTwOC
 uKETTrxEmRX85nSMyj/k9qXTpr8Kf6l7nT/7isPCVG6+yZMta/lyV9WAc8XVRy6lEORQJ5Fw9B1
 8Bi5QB8oUl2i1X0OGaGQmjzTDN2JtClcx5+BCMFmHU6fW9yn6fLWR5LJ50aYGZ31NqoiZCz0PIT
 lxK4tJ0unPtpmLYDnroxU1BykY0tAWIg/Bmo2XEqu0i7d3NHtibDCaTvmHb6yS3ffpOjN2VTHDV
 i/Hrx1vuW1CVevhr5YA==
X-Proofpoint-ORIG-GUID: O_GGZtDvzAUiG4Khg5njB1l7iOTdCLbY
X-Proofpoint-GUID: O_GGZtDvzAUiG4Khg5njB1l7iOTdCLbY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_000236_350539_8FB80D1B 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Map my old quic_sumk@quicinc.com address to my current
sumit.kumar@oss.qualcomm.com address, since the quicinc.com mailbox is
no longer accessible.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 0d05be949eff9aab8cb02ad6064ada796988fab3..60d64d14c8d36dbc2856426eba6cac6a9d655c36 100644
--- a/.mailmap
+++ b/.mailmap
@@ -909,6 +909,7 @@ Sudarshan Rajagopalan <quic_sudaraja@quicinc.com> <sudaraja@codeaurora.org>
 Sudeep Holla <sudeep.holla@kernel.org> Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>
 Sudeep Holla <sudeep.holla@kernel.org> <sudeep.holla@arm.com>
 Sumit Garg <sumit.garg@kernel.org> <sumit.garg@linaro.org>
+Sumit Kumar <sumit.kumar@oss.qualcomm.com> <quic_sumk@quicinc.com>
 Sumit Semwal <sumit.semwal@ti.com>
 Surabhi Vishnoi <quic_svishnoi@quicinc.com> <svishnoi@codeaurora.org>
 Sven Eckelmann <sven@narfation.org> <seckelmann@datto.com>

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261118-mailmap-sumit-b774d69dc808

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>


