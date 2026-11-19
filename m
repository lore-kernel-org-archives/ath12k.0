Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E0B606A334
	for <ath12k@archiver.kernel.org>; Thu, 19 Nov 2026 23:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WYeiakXN;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DCigIwcL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:From:Date:Message-Id:Subject
	:Cc:To:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ywdLYv7XjTS09LFKQvuVk3pTXGox0hEDPrVdY2rJ4es=; b=WYeiakXN4hW//p3+XymoG+rExO
	gsg2/xUFH3YRAew8D+e4vYW7aaNC0aUFP+C1jqiz1XZ4hLhWWcbcVe3JpeSeOd6KAAN/Ip25UKduQ
	dFcDGBJc4BgFujZ2fxhf7+T4K427cgqSZ36kAIQLAN4ew4eto8MrR8RLdghMgNbpsx1fGUd+7618x
	pKRTgvs/hOtr6cZkSSd5iPs2hiWKefEFBfEYi6VA01wcbsa148wOMszlhgCFnG+jAl6BKnlsQw30P
	f3dEnIqaRZjhCsyKuPlf/KsJAYWTFPy08PKJMayiVfcBmFH9uP+GtC3oFoRGkQbxG+4aAuCzrov2/
	Mv7QUUYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBqE-0000000Dg8Q-29HI;
	Thu, 19 Nov 2026 23:46:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBqC-0000000Dg85-1XJU
	for ath12k@lists.infradead.org;
	Thu, 19 Nov 2026 23:46:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJJ1egS095767;
	Thu, 19 Nov 2026 23:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=ywdLYv7XjTS0
	9LFKQvuVk3pTXGox0hEDPrVdY2rJ4es=; b=DCigIwcLfGfRI6IZXPBogW4JDxTu
	lu2nUbmc9xqZT5BFQv4J/530jAK+95zmblqPkiYJz9tFSwUDA64rY2K6Nl7kUgAT
	4dT8+QUSyfehx/aJoilCscVHMrSrOQ06pEJ1MguwSrt8TfuVGHfsx3WKo6SZByu6
	ZHXrqBl3QdP51O/BlghO06/fjzdFCUJvX8s1PnNG+P+24Jd5xgZUeHifoRkNPTWG
	ofOWqyjv3/+rVEIpt0SNi8DxV31Sq3csIFfC0362twuslLSrEZYOjZPWunCU9iS7
	tyrHZZctmsezBeKssCzElrTWe7N3m34rKL+vOX2Svr8reAx/622yVfZH6w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xx1bsh7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 23:46:53 +0000 (GMT)
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-jjohnson-lv.qualcomm.com [10.81.91.45])
	by NALASPPMTA03.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTPS id 6AJNkq5W1934784
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 23:46:52 GMT
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 61434)
	id 56AC524BAE; Thu, 19 Nov 2026 15:46:52 -0800 (PST)
To: neil.armstrong@linaro.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [net] wifi: ath12k: properly set single_chip_mlo_supp to true in ath12k_core_alloc()
Message-Id: <20261119234652.56AC524BAE@hu-devc-lv-u24-a.qualcomm.com>
Date: Thu, 19 Nov 2026 15:46:52 -0800 (PST)
From: Jeff Johnson <jjohnson@qualcomm.com>
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=PcBqFShd c=1 sm=1 tr=0 ts=6aff8a6d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=u5w7P5qLusBq6V5lPPMA:9
X-Proofpoint-ORIG-GUID: HYr4riAcr3207GssDV1TSDq4CJH_mp2S
X-Proofpoint-GUID: HYr4riAcr3207GssDV1TSDq4CJH_mp2S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA5NSBTYWx0ZWRfX+mB6W4+1ZfOm
 kPFLqs9a13vfdU5HSV3rd0SfQZA8/ZDbQQA57SIETcwhbaHlM3e3ECfynjq//aLxic1Rr/oJtXa
 xn9KvWR83ADnf5zLVclApDk7zEVcI1p80bRWTypQlXv4lNqP0B2AwWrMHFhDaRUkx397z4Ahruy
 jm7kfmk+RZR1Ts8ZWlDZQnv7ziAyuaF23Qm9/eew6n3tyzWhah207Th4i8icSA2gbeILHRSZ9Ar
 /QKwBCJeH/7rTNWkec29TrqdVD4FSHojQlEOxRNklvabwJpYEM2fI/7Y9ibVVelAIgbKLGlFOQp
 Oj/+3a14B+EW9Jj/AkOu37U+eYKHtgX26LdR+mm79EM9kknJpP4YihDEo0e8kCFgvcS+pnsOmsC
 Xt8nMKb1p1UUXeboYlsWEdB7gy+vCIgWWFde1ymajzzQFO7IyEXFPZtMSwK7Lh0jz5bpmIMPpi3
 Bb9YDbtWFJRB4J1pJGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA5NSBTYWx0ZWRfX7nh6IQOIFQIw
 SSKSUF/eEZkWSy7dBQGGrubRbkoRnJu9o3YHxRtSmRghW/hFhvRo3/Tjt9Ex5n0nZ/NTpcTbjpu
 wVKlwMdPObUSA16w8/zzoS4gxPImBeQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190095
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_154656_527974_20972D23 
X-CRM114-Status: UNSURE (   6.86  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

This is an automated message.

I am cleaning up my patchwork backlog, and this ancient patch does not
apply on top of the current main branch of ath.git. If you still wish for
this to be considered, please submit a new version of the patch, rebased on
the current main branch.

/jeff

