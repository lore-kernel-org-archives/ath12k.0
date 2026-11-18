Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01640606A31C
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 08:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2XwKt79K;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e4RdIY0/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kaBAEZSW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fYM6biazjD+1IGbbGcSkuJ0q8m6jV66uLXtNgEaUleU=; b=2XwKt79K/etWBtfDIYsn+Wojdd
	yIiHtf9CPIZCQHIuPriwu5yP/pGNvjoEr/TGbHM3na0RqFv6v1BmhaQE7MvAGcfDqn1Zg0H3XB29x
	lcKxOIWuZcZjAvC+su7S/NylUmRNs+bmdfSP5TaBWL5OvMJHdWiVPM8tjzkhWY+JDfIkC3nzc7erH
	f7Bksg/6DPcm6EVOmnoRebj3+NUOaB/i9BCSePV8A6spTmJP/fF+TvQlA8CPwHsWsb00gCulXKobs
	NEPm3DSucRLADdl9HMbDsZJjE/MY4L+o+AuC7iBgO1h1UW84T3TIXZ5nRLdMfvralwOr3tEZVfkvK
	VUFa9JpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbQh-00000008F2H-1elw;
	Wed, 18 Nov 2026 08:54:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbQd-00000008F05-1ALh
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 08:54:10 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8AJG21959636
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fYM6biazjD+1IGbbGcSkuJ
	0q8m6jV66uLXtNgEaUleU=; b=e4RdIY0/9sVcp1c+XDxoCnnx8xao+C2zGV9MM0
	2c2qcKOOGKvRYDQguZqZiLlFTzuD27nSwGtvWkV8qsVV5UeKYvGRINFm++x//jN3
	TJLabJ0M0qvdX+cUjOt3F//GUA7TldE6t4ckFG+KlqgigcR0xUrgXpz/W4JBQFmK
	JPMHU+bOdUYAs363iAADjBgUzvwCNgMPnT61j+9YrpVqPOFHpj6yap3M6MeiWyxS
	WfvA1Y5iX/pdikBSPow/Ik8Przed8L4yTICzyc9D7LeVYcE8AlTRPxQI2ZoP6cm9
	xxGw+QjP/BLyKKTb2ls/ZV6X8dcj0VKqpCQbRcdKh0Y31LTQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9j512-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:54:05 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-704a881f959so652194eaf.2
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 00:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794992045; x=1795596845; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fYM6biazjD+1IGbbGcSkuJ0q8m6jV66uLXtNgEaUleU=;
        b=kaBAEZSWZgGAAHyuGytHsACFR7PJ+b8cHF4roRGBDyEN16uG3h0wYVJWL3Z8llHej8
         jyXQcxhRSTjneuSOvFz8x8v9U5RdUSPfAfF3cj0X1dJeTGHlyk4jIcxEU8r7C9GRaLJH
         sldKwGvL1ENAskPo5XoTKaxffkjdATr8IpEYkDBVXT7U60Fbn+QM9xnLEG5W/Pghp2UR
         rBki83RuKxmCMKWXm6gEgI/oRpXHCijyMyy2JMvTyB0pGX+dDjxOz1D2uU0Bj4tijOvf
         qku9wsrXS+QIFWmJzsuLTZLnXr2yUchHVhJIce60c22/xG7seAfNockoD5oOnHcz2q5k
         +8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992045; x=1795596845;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fYM6biazjD+1IGbbGcSkuJ0q8m6jV66uLXtNgEaUleU=;
        b=h277vZl2/hS2GHkZnfAxXO+TgU+hhlFoPOEKhY3OUK/8EV+NlMQm4rV1Xcgl78N4BA
         S81wnzKS1y66kcpeVQbPI5CkA4/Bc6fTWDiG1xJBDIJrIIb5QWoPnWVecPOw6mo0oucm
         FDAT8pVoqqy/5pk21xcLK8IRsToXwI4YU0Fpwg0RYx522EEkCiNQsjkOcaW18piKVq8L
         OfEdZUZOgb6yirstFkA2hcvm/fRpF2hZtEs1Um6gap6s3ax+7zGhTL2+XHKSH1OLzBpB
         FlWRsIp2lQaUNuSlHUfvydLFZDK7gJnRzwwd9CHfE3fPIWXwFd7pX+BTnbWkmO9fbbdI
         NOQA==
X-Gm-Message-State: APuU4Z+Qb9TWt4nJr+KiXFe6p8TOA9V5uK8FKtzTtqbryxermEo1ocQ3
	lBCjx5mZoAAVcIqbl91qxaMy7HsWa9/ctLhB7WqU/U7stdBc77CqaQ+xpBEjM7wex4hSFNLG3l7
	/n4WT1nSi3aSHn5VuvnwubSCziX9yH0+Mjz1qcia1vJhVXdfGVuqKeWHPMY6w9yqAKQZhN6xmOQ
	8=
X-Gm-Gg: AYBFou2ednq/cqpd+FDE9xLRaoP9br4wGuvPLu70sahXCKMD2Wsq7R3KutHQ/Yiub9O
	DOmqqwkpW8FDitHb7OTeeGVmkHz6WJDfrQF3XDJvNOlWfVVs8pfdm/gvoEzZ1hzI40QCBK+xVVF
	lcn+DBXLbZQGzg5eQ4laKhZGSiFW1NWHNguk2JXAVGkcrdosW9NVLtHIihTFktp5YZiFkH0CFGa
	G3lxtgTdB3SEWDeVJWkTIQT/+0/Fu9FRNgnOJFfU0L7Xz9YIQTE8n8ekfesTHO2WaqWKUHi0Qrw
	70uebKiFT1M6O+M6DXAun+DaQBTLdFY8CXCpYgmzsaf67v4u1tX4p7SR0Uep25rClGezaV1vtxG
	nAm8x8Fcl2iF7Ph3infMp5ZS6OwMUx7TYVXaP4HrUKkBBombS6pCX+pA610mM1W5mvrbjyvgHch
	bJeZU3Bdb9bECptmsxhLI/2ISDk0f/
X-Received: by 2002:a05:6820:1355:b0:71a:f543:d4a1 with SMTP id 006d021491bc7-71b1884ceaamr1492244eaf.86.1794992044974;
        Wed, 18 Nov 2026 00:54:04 -0800 (PST)
X-Received: by 2002:a05:6820:1355:b0:71a:f543:d4a1 with SMTP id 006d021491bc7-71b1884ceaamr1492234eaf.86.1794992044435;
        Wed, 18 Nov 2026 00:54:04 -0800 (PST)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b1956f16bsm1557516eaf.13.2026.11.18.00.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:54:04 -0800 (PST)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 00:53:57 -0800
Subject: [PATCH v2] mailmap: add entry for Chunkai Deng
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261118-mailmap-chunkai-deng-v2-1-a5a5a7430663@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKRn/WoC/4WNTQ6CMBSEr0K69hFbf6CuvIdhUdoKT2mLfUA0h
 Ltb8ABuJvmSmflmRjaiJXbJZhbthITBJxC7jOlW+cYCmsRM7MWZc16CU9g51YNuR/9UCMb6BqS
 QZcGNUlKcWJr20d7xvd3eqh/TWD+sHtavtdEiDSF+Nu/E194fxcSBg6n1oZbFvTDl8RqI8teoO
 h2cy1OwalmWL1DO59fRAAAA
X-Change-ID: 20261118-mailmap-chunkai-deng-929871daa925
To: ath12k@lists.infradead.org
Cc: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794992043; l=1232;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=NOOnf+7t5gfIguUo8cj+9glQzRqH9Xl6Vxg1jN/8BZQ=;
 b=hh8yTr67lyTxDKoRmgnyhjMJFsDIQ9Y8GVwIFj5RL88Vsrpc7yOBovCAouPfTeLrx/7ozHa1/
 3u1DojnYbl5BgVjb2vhUClX+60lKMVA7wGiw1ozLxNlz8Yh8AL5hpvC
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd67ad cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=LG5T7v2SAAAA:8 a=t-IPkPogAAAA:8
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=JDjsHSkAAAAA:8 a=COk6AnOGAAAA:8
 a=XYAwZIGsAAAA:8 a=unkj71DYAAAA:8 a=P-IC7800AAAA:8 a=pCZNxC-SOsJ-1k62RsMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=dseMxAR1CDlncBZeV_se:22 a=TjNXssC_j7lpFel5tvFf:22
 a=E8ToXWR_bxluHZ7gmE-Z:22 a=5RyQM4v5J9L3wGZf4tZl:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: m2wCS0UmkvjJqtqHTV0DBExxdQz9Epgu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNSBTYWx0ZWRfX1lCuvfayQvY1
 kemyzcsQE6kb2XbNqolBPvlpoKUp4nQSDrmx9tXyPhJdW3FJks7211lSNYvfokR2BLwnL3n9k4P
 9QTzIwGw/lZffRfCdCu1OqX5YTRP2k38QU+o3zcqYLyXOIr4AAcVyvNAMcRh4rwQ0SmUC9JHyGR
 pCJe+QtXdSvyMbTPw+0nJO6WUqg6pWdWgOCiKFNwqe1WVbaVHdz2+qGqo3aUdHw1sONDM7Qz+O5
 DyjYXJTJr+SDTEgQ8e4zeg9hRJUjtym2gl7DsOB6c0ON77NeOXA+RGstxpQ4o+1m5Nd9/mUhPq0
 ekWfvVX/z0mIKdxuwzqqRfqGsSPfQSCqbskDudu0T2l+DBQmoH0m3ordV1/+GgKM6D3VUeoQBiM
 p2p2z6kh2jrSSQzrYFoWlWc9vzH8RQ2vROFJDThQhF1PB/VYPQ+ppioVY8OVLO2qrhGPhIO3CAf
 LHg+uClw8GtuNp1nz1w==
X-Proofpoint-GUID: m2wCS0UmkvjJqtqHTV0DBExxdQz9Epgu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNSBTYWx0ZWRfX+xelO4OBQcZn
 WTql2kzlX8ygdYDNdvaq/rB9qlqeBJChRgdu6iEzDp+t6r4wF3mjXoBajFsJYBWG3rHNemyNizY
 tbpZab+G4oLgrlQDGdvCzkX9AjvKZBw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1011 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_005407_319152_12961B91 
X-CRM114-Status: UNSURE (   9.56  )
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

Map past iterations of my e-mail addresses to the current one.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20261118-mailmap-chunkai-deng-v1-1-dbc3b97f7d84@oss.qualcomm.com
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 5f7290f77f0a..7c892b887d3e 100644
--- a/.mailmap
+++ b/.mailmap
@@ -236,6 +236,7 @@ Christoph Paasch <cpaasch@openai.com> <cpaasch@apple.com>
 Chuck Lever <cel@kernel.org> <chuck.lever@oracle.com>
 Chuck Lever <cel@kernel.org> <cel@netapp.com>
 Chuck Lever <cel@kernel.org> <cel@citi.umich.edu>
+Chunkai Deng <chunkai.deng@oss.qualcomm.com> <quic_chunkaid@quicinc.com>
 Claudiu Beznea <claudiu.beznea@tuxon.dev> <claudiu.beznea@microchip.com>
 Clément Léger <clement.leger@linux.dev> <cleger@kalray.eu>
 Clément Léger <clement.leger@linux.dev> <clement.leger@bootlin.com>

---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261118-mailmap-chunkai-deng-929871daa925

Best regards,
--  
Chunkai Deng <chunkai.deng@oss.qualcomm.com>


