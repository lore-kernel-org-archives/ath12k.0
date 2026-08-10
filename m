Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951B8C5AD4E
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 05:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e1Be3qT+Byza5pTrsTmxPgvYHx7Aze69uJsQoNFc7HE=; b=p+q25pSI6EgDpkNYvuAwqW2D6k
	mZtW1q5Il1Yppe6u1VuyjWP/AAO6hEHlKaKPa0cS62XQiN3KNWcpmy0OQhgKCbW5OeA4Te9BZfjda
	y8CZT5XDFEDrsJr+Ut5/aCCIeIEMO+TceTs77hVG510XrLA9R7COGEPdKbuTcvZjXHbFdfC6EKdfZ
	3pthlyi8fZrxXkyEXCchyjjD9uZkJCV4ig0jdAs5Tf5TKf1TArKRMf6X+HyWnE+nZqQzCGRi7qx7N
	dOady0nX/041sBVu/0YEhgzj/EUgezYo8Z+w72naL9ZKavXuipUsVp0FpNTaNttdQVCBhm0APCXdY
	gdfY1WQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtIpV-0000000B3r3-0UlX;
	Mon, 10 Aug 2026 05:45:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtIpS-0000000B3qk-0bmY
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 05:45:43 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5HmCS924177
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 05:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=e1Be3qT+Byza5pTrsTmxPgvYHx7Aze69uJs
	QoNFc7HE=; b=DMW9YLVOc3y85opY78Fd/5MKPXORVWtrknkDT8Z4YZHiwqX5+YS
	J3JzRl/jW75Dno9Oqc4tYVfyyDvK5gZcK4bC1FmuNvezgSJ8od2a79vXYGvdHmcm
	22VLaUN90VA3hu1IzQAcjQ5cqu0JQgD3R7EY9YpbmDkQANvWjB9tQKE5pOtns2cX
	RaV7WEnj0x78TFTwAIgoRnHuxc5E08uO/YQSrmJzQZg7FfuPKJz3/JpxTkYtzrrl
	Rmd8r2Y7UY56xF5wX+1v+erj2Q1N6zL0fpXGtvBQXbUFynk1jJlgkFtI4+U7VpWE
	tp3YCoELRnD2Cd2KB9XQf+s2azG/fBKaWLQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xs0mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 05:45:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso48659875ad.2
        for <ath12k@lists.infradead.org>; Sun, 09 Aug 2026 22:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786340740; x=1786945540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e1Be3qT+Byza5pTrsTmxPgvYHx7Aze69uJsQoNFc7HE=;
        b=RMKw35GWdVvlt07Ycxd9If4fDNSIlszL0YDQenRxjIwwno/oiLZJiPCPhLxwhO2a16
         9D+xr09hyvMTDcuw6VDGqjIa35TOQZITujId/h3J0Lg7+YPRNi/HOjhRPmflsSK4kv/S
         PLGft5bifL6NmIwrCllay8sGSuoO2UjzjutKsv6FlOHA4pfe+mfCjyRk26G/eeqzeaBt
         zUKB6hZFmtmAghRaEOH9K+l5gdQoGOfDDFb0fbqQZDbFggxf2HGLcNUbekDxy6q1RJFK
         qjaLCylmqvfuaiEaJmiJt8iAOYDRTsrO1RrqwYkjciNmpd0H6pd33XwCa5b5e0HhClhC
         qVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786340740; x=1786945540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1Be3qT+Byza5pTrsTmxPgvYHx7Aze69uJsQoNFc7HE=;
        b=oFmQL2zIwYIsqfR8CHGK+Yr62wm9Uly6gRVQmQgYu/WahUxE7S07AgFIgO8seLYkkE
         wWl098wdw+ts3zneDpRxtW2AA1rM7PzuxTr2xBpAxBdfkWdutnHr3bBrg1I5dRLXezgF
         cEprfDyEMsH0qMbfhp++vwkEOWn9xPwJXzrwIddeSKtHCe/2Vye3NflvNvEc1FJ9UJdY
         sjt449XuWNYXZAMW/FhwncdIJcX7ObHzYl5+pP1d9193PvUnwUELFkXHK25penRZ4FHL
         qeV41TS8kS4OKLYT3OWYoIsugcDXKMjYHWkFzOLLpsjay95UY2us0TJokWan5rkrqn//
         DUEQ==
X-Gm-Message-State: AOJu0YzDt1agcS8FACgQp59tIbrNxkbNT7q65DrNLRYYXrCBGkTi7vBE
	E77YgXZQbbm52bkI8hNsMdCz9uXJDo2//U9EXyUniR3NBCBBoMdzijjVaDvFfgkhYeJphTlEe0t
	+L/vxcpfcFpFRVwoEZ5v0TOGMnnCVQDs77sEbGn4JpyBQOUcg2KTbDzH1Qmx7/WuxRreMHx+B
X-Gm-Gg: AR+sD10efCUC0/ak7tofZBU9SeKMcR9o01iXpsU6pYuKYDz7Snr1poOooAuyejmjFM/
	ssNlKUsjSuWd0uqR2vgZjvrN0QrOCAA3+N7022eC1cwaErN0uAZE1j9l6lwpLRHobjjhx24w7p8
	c2pC+JFvBF0UMKm7bv4LOd5is3TU+xcFdcco9u+VsKx/Hc9OXodtklhKlwEJuJhk3eNSc60WZLp
	hvPq+w/blc6j0fkdLnYaLrEzwTB2ugO0ORxWCF705hKY0EAFUN0fotVp+UchTPkUbBUNFms8QTF
	cuyzL9zbPirX8AUEAKvNeQDV1YHMibcg67gwnvcxwQ+YHMjzSsj3pY47OTXWPnVgSS7V6P33bfD
	9UDJ8YBoDcuduMi0mQp/jGbjHm0u+KuIFz7cE68S8g1ndpTG8YPQMHlHTlCyR0UEUqZbxmPThfC
	saVYICHNKgQAnGCd7LUfIf52xxPjQZ
X-Received: by 2002:a17:903:2b03:b0:2ca:4f33:e86f with SMTP id d9443c01a7336-2d294c222b1mr258967965ad.12.1786340739752;
        Sun, 09 Aug 2026 22:45:39 -0700 (PDT)
X-Received: by 2002:a17:903:2b03:b0:2ca:4f33:e86f with SMTP id d9443c01a7336-2d294c222b1mr258967465ad.12.1786340739370;
        Sun, 09 Aug 2026 22:45:39 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb883d9sm38156560eec.15.2026.08.09.22.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:45:38 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH] mailmap: add entries for Rameshkumar Sundaram
Date: Mon, 10 Aug 2026 11:14:52 +0530
Message-Id: <20260810054452.3245263-1-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA0NSBTYWx0ZWRfX6T7+bqAiSr1b
 taILTp1fBCU9PrSW7nhRxgCT6tcg7is4PHmGX0oV9ByIcTN19GBQNNa2/yVQqhuvRcejycuGDnS
 nqB+HWDAUG5UjDykQGYYey7lYwlp7W4=
X-Proofpoint-ORIG-GUID: fulz5SataohJSMSRac7J9cCeM7tO3oer
X-Proofpoint-GUID: fulz5SataohJSMSRac7J9cCeM7tO3oer
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a796584 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=WPyIoOwQAAAA:8 a=JfrnYn6hAAAA:8
 a=68eEZQRoAAAA:8 a=yPCof4ZbAAAA:8 a=dlI4R5ZWAAAA:8 a=Oir6XmlsqzsE75upo00A:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
 a=S-HzPIwwDS8t1QcwSuWs:22 a=1CNFftbPRP8L7MoqJWF3:22 a=LtnCznAjXzoUKPIqZXsJ:22
 a=_Et68LT86lDbNqPJMOLW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA0NSBTYWx0ZWRfX2RDf+omptp8t
 v5YDUj8lKBGx1IM1PdFLEUYuPlpmZ+9SIkfMmCP/2DGCA9iXw/xlVX9CxITo2HAUpa5SROdkOTl
 nslmgajaRhZAj1qLDgRQg+peb5VR/KYkxcgCzxJJf2tp7TEkQifI/vgjanLs5nUcahCOtzyyorU
 ZxZZCFgCa0MLR+H49PHC9+KJDZa/NoF9yBFxEzdPf/1vfnbbzSc3WLXUtoYvDnKYyKHaUuEzYfc
 qPBVscovhtNhhkLpQLrNzLzUG5aQ11luFgTYciE15XS13OOty56OFjp8B4m/gWCqgajDLGIq8AA
 IzEMD4ps72NicSuu1zJH2krpFocMnpGv1NrAsFUKRBzzE7hHec2Ipmg8eVXPXry6BULLhGOIB4G
 EGa9VzJYKNrrY+qIQ4OCG4C4gPqgzTfBA9wJvAXkefd/trd/XcFPqRfGxHGUQHMY6ZQGGgdbyNw
 gkfyxiXLu9CL9dDWrMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_224542_301757_3A108B33 
X-CRM114-Status: UNSURE (   9.39  )
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

Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index fd5e272bca9a..7d582df8aa31 100644
--- a/.mailmap
+++ b/.mailmap
@@ -730,6 +730,8 @@ Rakesh Pillai <quic_pillair@quicinc.com> <pillair@codeaurora.org>
 Ralf Baechle <ralf@linux-mips.org>
 Ralf Wildenhues <Ralf.Wildenhues@gmx.de>
 Ram Chandra Jangir <quic_rjangir@quicinc.com> <rjangir@codeaurora.org>
+Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com> <quic_ramess@quicinc.com>
+Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com> <ramess@codeaurora.org>
 Randy Dunlap <rdunlap@infradead.org> <rdunlap@xenotime.net>
 Randy Dunlap <rdunlap@infradead.org> <randy.dunlap@oracle.com>
 Randy Dunlap <rdunlap@infradead.org> <rddunlap@osdl.org>

base-commit: e07447e654476262558bee570f4cf456e2b32565
-- 
2.34.1


