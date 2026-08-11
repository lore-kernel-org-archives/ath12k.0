Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093EBC5AC67
	for <ath12k@archiver.kernel.org>; Tue, 11 Aug 2026 05:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PUgNk7fW3LOVXSmmf5jJdrpUKvYIdvXpHhv9JQB7/fs=; b=TQhet+YOnB6gMBTLQ2CuHE+E2+
	WUNLuZR/dY5X7OG+xcIPeC9OgNPFt2uEdGxZ0ep28wrIKeuKuLaf8RBSU04Mx0Zj9lnaZhH/d2gxE
	yTiahF0T03bhd36HYf5vuHVjQhR0F2HJt/aSpXWM3MQNaVCvy3OGO4zKwNynzEkRSxPRXN8KPZlkN
	Di3IA3DkjG0XpWWukeAo2m+FnPN6YeOojpUKU9xsctNQo2E+3Yxc7gLa+/68knlPBuGDX5G0ImcSs
	MaBDtqO/BPdJC5Jt/nFOJC9UxpKRgRbT1BFwpt76Ilq9PTLDioucthx0ZU9wTYWN8EaLKJAbGkdQE
	sArFOc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfW5-0000000DM6Y-2jbu;
	Tue, 11 Aug 2026 05:59:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfW4-0000000DM6F-0vD7
	for ath12k@lists.infradead.org;
	Tue, 11 Aug 2026 05:59:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMptt33047696
	for <ath12k@lists.infradead.org>; Tue, 11 Aug 2026 05:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PUgNk7fW3LOVXSmmf5jJdrpUKvYIdvXpHhv
	9JQB7/fs=; b=RB0eEMirfFO6lY3LBsK2ZEqn6iv5LicuSbBJFrR/qm2hxza55NG
	CPogpvxxsrHZxUoWHV+wv0WCIyTs6VJWSn6/CYHl9X7N8UdMOvKPKcDcsRmvDeoO
	gDPZ8NKOUFOzxCF86jPn//FwRuraSTYaWCv8KN9mc/OaGeZtPb/PdY2ipjhUrbz8
	mbhCo2KuRE2DYRCoysJdF82vZQWeEc1g9Rr2i0WZp2Qy2GfBBnmk5LxlfkYINdSZ
	bGG3fMUL78z6ZWr9T1yX+gz2TrLSPGJ6lEBc/qakgILCt/i20JTLZYAdz6dmGZUq
	xTKd/0OSvoi5GsFQraLhMvbVDTEKY4NhnuQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk22mee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 11 Aug 2026 05:59:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so650801a91.1
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 22:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786427951; x=1787032751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PUgNk7fW3LOVXSmmf5jJdrpUKvYIdvXpHhv9JQB7/fs=;
        b=IF74j7mHu/s7psXwkj4Q/wfwJLF8UppwnUX3H0Kme2QC14X3wU2rNNtQHrS5fzEfCx
         m7JwMcE8i81mpJP9SlLfd3RYoBczrrVVrdn2lhZoP4yHYQRIDkLqlocGuK4IIKUp0OAI
         b+5+BzJriTuBRrwMd3UBahX3y7bsamZdmGM9Xq1fvEcSddSw+VJGQsNoHAyT2QFvZn9l
         8ZXHg8TjAT1XwoQFz1yfXVDYKr6MWnMiOOlHyzAYV2n54b6R0PIa/KvfsSOJMpjccKH0
         dOoX3pdLmhJJ8fNI+cG0uH2FS/0vklKXpzhFcrKSG0AvJcZGU55F/RXEWtxCcOKTGZWU
         xttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786427951; x=1787032751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PUgNk7fW3LOVXSmmf5jJdrpUKvYIdvXpHhv9JQB7/fs=;
        b=gVxsn6v25gKAiv0kol9BXNf+xEsvQST3ZZHMdnuMNDFdR3O4r1BZyTWe9uDeaZrEFF
         2g9MbDJyLdUS3Q/kAr7p4zsNt7VOW0OSezsGBDI3um0mgOH+BIiGww8XEB+70CLlROot
         /W9nx77cm7nskqiSeA7kJSATetn8zBOH/zM9H5JuLEMyI9iMdof1A0ngFSi61xHsBEYn
         vuCuQlI4ktYlB890AAU5mtxuoK+jlyAlq98w0dYH7wG1L9r6cEGwMrwJywwzyqjoh4DU
         itzkOuKs+DM0twcIgoFRtGtLSTHkelaSE2SVFRJSP50y1pBEvD0UhmGQ1v8j/jCLbrgW
         +orA==
X-Gm-Message-State: AOJu0YwWl8OijF4Fi2zlONARnw3TN5ShCh8rYSomxPnh3jtBRV0hadan
	gNa6CowueK/UdGO0LvFFBDUCgUSe8jdxmrE2XTsg2OR3Ux3AGmgj1d5oitKaNsLTlIMiL+o9uyq
	281Y/ohNyPdlBo8pmr/F64VeWwuSOQ0Q8yzka4EWWgAQ8ELUe6FFXbOZGOTDXNvt3004/Jsa2
X-Gm-Gg: AR+sD12SbHlg/c9c11KHOahSJPZ/rarGpjq0qfeXUdHLXKuGCpbrOT8BkBMEQcxTop+
	AkVTFOR30HsbGmmjXp6H4vEunusf3EJYGNlEApeCjapl78SKBS7Z428RKw74zUa44z1T5z0QxUe
	nj/sPSwR5uvRGcMCwfhoH2tX6Ra9tiT8hB5i/TBOJUTpiLy/RPfaP32RwduvQNKXCOQ/koH2lyE
	BWNBNYwFzQFgMgo/CC2cwan+nYVELqAEbOXfwe/KXdpoFzSzZy5pS5TyTHf+eU+yK6tWyeo0IA8
	CW181y9UK/Wfd/fAXaWnk+p49KHrhEraaQ1lvl92oqSsmqElrL/p69JYg7lXEwaM0aim7ou6+Ss
	E2nRws+D7SpnxcaFacfDmyDA35FtMcJjOt5oRvZ5zR5Oi8zVenTtWqbe9fwJuxtNZWm6IC4ywKp
	ap/GxtPUoMUoHZTlm2gnVH0xg=
X-Received: by 2002:a17:90b:580f:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-392ed749a34mr243322a91.8.1786427950904;
        Mon, 10 Aug 2026 22:59:10 -0700 (PDT)
X-Received: by 2002:a17:90b:580f:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-392ed749a34mr243298a91.8.1786427950475;
        Mon, 10 Aug 2026 22:59:10 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392edc7b005sm394565a91.0.2026.08.10.22.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 22:59:10 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH] .mailmap: add entries for Aaradhana Sahu
Date: Tue, 11 Aug 2026 11:29:02 +0530
Message-Id: <20260811055902.522384-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA0OCBTYWx0ZWRfX+aNV/4s13T36
 8GHnji3snCBbrL4JFZV/e6Tukoedu4LEyedtiM6xaRgtZSmR42mlmINVFVg6Ttkp+Lrn7fxwpf8
 CjPREOrGmXuUq1yrZA4Dr/KC6mOcsRE=
X-Proofpoint-GUID: NV-rBGYhLVKBr7s1CLEnz7OMvFELDHMv
X-Proofpoint-ORIG-GUID: NV-rBGYhLVKBr7s1CLEnz7OMvFELDHMv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA0OCBTYWx0ZWRfX821OUnKMtsQH
 lXSrtUnccNAXI/ZXukuCK1UeR63LogrdISYCO4tYewInL29Hc/QPX6jyWGmOYfWeWBafOjqUe28
 W4zy9WfISGqmnFCNUX9ab8WzMf91jXu3k+q/IkgWV8Tic+qcqhMqRsqPPBZvzcZCw2GZ9O6uHf/
 AOP2KDO1KZ4ltB4ltXj5eRQxmAYinnV+76qlap51+xbzISlM12bhTcuEtZFGQmUQ5AbZhiXDTbG
 y7TizvP3rXIXe5ZaHxXjro5382yfOKf89RouuF2AmPtq5w5A3e5/TmRgN8l9nVHRiGHZqVaZujx
 oxvY5XLWCvi2vHRJvU5QmcA2cLYOcRnxuD4XhKxD3dNrAFQFceQqNVx3jUSxEmFWzbrPC9cCRxA
 pu+DCX1IjUi0rrHqQymJ/I32nAhlbM/8yYwGKrW3nPRZrKxWc5uyQ54WicJUv7amhUS2iB1rYeq
 ghOq5OfG3/AfwSt3wKg==
X-Authority-Analysis: v=2.4 cv=eJ4jSnp1 c=1 sm=1 tr=0 ts=6a7aba2f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=1XWaLZrsAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=KKAkSRfTAAAA:8 a=ePolFlMnG8WXZRssHusA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22 a=ST-jHhOKWsTCqRlWije3:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_225912_263940_FEB6749E 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

Map past iterations of my e-mail addresses to the current one.

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index fd5e272bca9a..cd58e07b2217 100644
--- a/.mailmap
+++ b/.mailmap
@@ -10,6 +10,7 @@
 #
 # Please keep this list dictionary sorted.
 #
+Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com> <quic_aarasahu@quicinc.com>
 Aaron Durbin <adurbin@google.com>
 Abel Vesa <abelvesa@kernel.org> <abel.vesa@nxp.com>
 Abel Vesa <abelvesa@kernel.org> <abel.vesa@linaro.org>

base-commit: e07447e654476262558bee570f4cf456e2b32565
-- 
2.34.1


