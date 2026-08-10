Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A3EC5B567
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 17:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S48qOwKdPhjKW9g/k5WtgK031NWC9FEe5GRmE5AYuWA=; b=WnIMTVV9NpUUOkZ0MDZmwNiAwY
	wevgBo3F7Mob04iYPwBkK/ZJo7JA82v1NU8u7zJHa+kLzjZ7KRqcX96+45g2ihTsVsQg/kv8YKb4A
	PLvJdeIpGFTCS1aWQRPDAdLfyq4og2Y+FeWGVhc1cJmoz22eckGLs7KvS6BzZIP/HsHPeoyVbmp52
	fgtM2oPWWlTJpW5kWTwY/hqBxvdx3v87OtT+9utjYWv6x1kv/Sc0N0xZPgUi2fQzFLa8HP7rjyhdQ
	52/80hCNO0Ng6kZ5eFBBnZbGaHso/e474URDNxYXtL2qjkJ1qsufLXYfGCPAbwIdCuFWuMfZQlkgw
	NRvVkvNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtU6P-0000000CYje-3nvy;
	Mon, 10 Aug 2026 17:47:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtU6M-0000000CYjH-2XI4
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 17:47:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AHL6GA2588879
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 17:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=S48qOwKdPhjKW9g/k5WtgK031NWC9FEe5GR
	mE5AYuWA=; b=mYpjhPtyLHoVzztvn1cNaV2PSw0XLa2o/uAGTCbu6paql8hDzJz
	h1qi2aArCK2lObEGZdbfqtpF4mKjWqGSJQKBGrFBzT5pUgXJDob3f/Rvf7K+dc08
	TBc0FK6LADV8Z5XZnF0cA1Oww9YStXydJFEevw4dyWl6quuSYxf3h6DgkZWuGgew
	l5h4goIT4CpdbojAUK4EfJIDjwOsSDJI058yjj5hGDIsU8C9tFS7zWG4wgTf3fn7
	JGKoNBKXp4E4MgRuBtlZRUmqarBqh7Dv6fwz56F0F9VOpjWPG9leq9GgnuU6GGTP
	oKk5YXlD3vwYJkrX4u8cBbUy/EKAVt7s0IQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyfr4ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 17:47:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7621655eso4077847a91.0
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 10:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786384071; x=1786988871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S48qOwKdPhjKW9g/k5WtgK031NWC9FEe5GRmE5AYuWA=;
        b=T+9xqnCvotK1ueFYrjQAj6ybHGFHNSqsZworrShgWaK3XO2DmMqMiKgZskiL1YPQGR
         aD0rVv8vmHNpoiX/krfAfpu2CxCSIi14x6FTAQXKyXfKqBiqXbc524NkaLijdjBJsjqE
         2u1nEAgy9pSvxu338vwB/BirJUrfxBaZXjPUEEuCkT9KE/ssCy8T+rgUVMmVzSmfzWg7
         N7DggrabJgUc/EFHwV2FtukP7nVTdgJItM6ELn37niptwX2OfV2TDC+9k25Vjq7veWJ1
         V8zUcj1W8dSkMiP3Zys8TyT1FYD3i80gJIwc5h5oP1N6tciyMWQlXt2BjhcIgcI+KikJ
         iZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786384071; x=1786988871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S48qOwKdPhjKW9g/k5WtgK031NWC9FEe5GRmE5AYuWA=;
        b=G1oS4BZid+mYM5zV1G6YLBY3bIIe+27e++Tp3G1JI0g/5g5HOUP+jwIzV0Wx/C8NL1
         tDGmw/mwqWWkaMqDXNMak9fl75u+scvBh8OgwlgP7V6yAiWi4YHl7Vunny/s65QYz7vA
         qh/17qPM2i4XF2pnUJidGOtP9pfAfdIelijK3E4lDxqOludREvZp2ongoWD86+x4plkG
         0FtJxPnb31KhJW7LnnWEnhIbgDBJOF47pcpsgfZWWq6H8y6/TxtkChz+C45ZV5GTxHOf
         HlZyvJOofK3YQiISzVVnxKMot+piHW96BO+JaU1nQXId1iDr/KuCgVlePzdcObcuAJm4
         MMDQ==
X-Gm-Message-State: AOJu0YxtB4w7pTOXNM9ORontuqJxvr69/MTzExekSYHfxOVh8teiF9TZ
	95p72uWS8uMr8fmYWAjfa9wHT00/wxe7jrRhquVcInrUBuFQj+PJbDaF2YJL2dDJgbh4pccKXUS
	iKRNw3Tw3r3GOQly0vi3Y6b/Zr13DzceIP5LS4gsEurQiqHP1JBxdpKpcm7I08+RyEjjyTKi3
X-Gm-Gg: AR+sD12r89JjeAVsoB+8zyoUYPMCr10Gk9J+DsASv5A/PCyGIJLSyj89Q5hmXUwS7CT
	AwR1Xv6c8wRk2WBPBsV7js0u0hhy2LTbav5lVEChZgpXoqQFc+94F7LlBl7mRfqoWBUiVYXZ9HG
	BnpJaUY6bt0Vnriv/uifeTn2WijfZiutFHPadG7y9lqyJRp/yo42mLRgdTBVv6ZEiF9D/ED5Zxs
	uoYdXh7/bETWyw+g+IanYNBtzipQsLuSFg/qyfDCeD5ldLvz7M2Hi/evAyQ4HdGI1ZbLgAjAfc8
	dL3hflSQj07JqtfPA4JFyA9DVtzeDWL/A+pX2gL6ybcZIXwMZwhqDcTT9816QSUF12WMORYS0X9
	FIoFaqIcUFRnmTrwW8rsO2uttEQLnWtB3sbCvdQ/6VWSqzUxvs+SMIMswWFmhcC2OvY+Wson8l2
	yUEGlE4baBdBLveVWHWbzYE2uND8TjR7T1vBJxqg==
X-Received: by 2002:a17:90b:53c5:b0:381:bc4c:da5b with SMTP id 98e67ed59e1d1-3903c61098cmr48516451a91.18.1786384071118;
        Mon, 10 Aug 2026 10:47:51 -0700 (PDT)
X-Received: by 2002:a17:90b:53c5:b0:381:bc4c:da5b with SMTP id 98e67ed59e1d1-3903c61098cmr48516391a91.18.1786384070575;
        Mon, 10 Aug 2026 10:47:50 -0700 (PDT)
Received: from hu-vthiagar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86e917sm51090228eec.5.2026.08.10.10.47.49
        for <ath12k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:47:50 -0700 (PDT)
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Subject: [PATCH] mailmap: update email address for Vasanthakumar Thiagarajan
Date: Mon, 10 Aug 2026 23:17:46 +0530
Message-Id: <20260810174746.3272636-1-vasanthakumar.thiagarajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: l-tSvqjdE9UMaODLkp52OzI18_qoSKOQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE1MiBTYWx0ZWRfX11JGkR9on1mD
 jDWNMZ2F77fL82GDXKY5xYmOdfzEp4+wmjeDvMwE5p4l06Tq6B/bWhlbTi4bOjkhDjPa4/vuHog
 bizguvxAq8R+S2A0cYsK2z5PQdZrlZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE1MiBTYWx0ZWRfX9RyYlyfkyV+/
 C3lcfUii+FCMrE2in1/O2g+gnIqGNYt42hLnD8zP7DQ91VJWBin2aurHoEL6z72Po9aaLv1nP81
 Vd5HWuRzOGoEXFc9/rtMPCrRbSExvCvtz1PiyABE6p+hKkVmrn8GdsA8C62CVdu6tOcFqprhqyp
 4px4LFmkbROgfPvaZz4bESiNOK1NXne9jpdL9nuO5G4LIjbleVBvBa7QqBCANwpL+lkE1NqSWQM
 CdqQXRpDu5+pEgg00wMrfZ8wZVw+RqCZ7MPnXzn4GrIpJY41kZmq5TKU1f1yrTvulY+FbsHJPJp
 2nS6j3r5u6jdcB146PiJ55bwooig9Qf8YTK459rpm10WBJ1MuqVwkXRXCR3DJxxDBeGW1NUkQ1H
 2dXOog3rWJc9p/tTVt8MrGvFO1XaUj6GsmHA9vYOUnaeuDqN/zG8bWOHnVGpb9OEmUY/q2JhwB0
 33eTg7NWiXi8BpMH/0Q==
X-Proofpoint-GUID: l-tSvqjdE9UMaODLkp52OzI18_qoSKOQ
X-Authority-Analysis: v=2.4 cv=Zd4t8MVA c=1 sm=1 tr=0 ts=6a7a0ec8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=IwewOrElAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=TYBLyS7eAAAA:8
 a=6rqHouBjAAAA:8 a=tmtSDGaQAAAA:8 a=NUqVmu0UPruunvr4EfIA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=m_kAQ7LXad6gYJC9lHss:22 a=TjNXssC_j7lpFel5tvFf:22
 a=pioyyrs4ZptJ924tMmac:22 a=zvYvwCWiE4KgVXXeO06c:22 a=Hx1yvPaMooE3kwe23bt7:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_04,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_104754_786156_73C76D7F 
X-CRM114-Status: UNSURE (   9.10  )
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

Add my current oss email address and map old codeaurora and
quicinc addresses to it.

Signed-off-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
---
 .mailmap | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index a0f64c31abcc..7e118b29652a 100644
--- a/.mailmap
+++ b/.mailmap
@@ -906,7 +906,8 @@ Vadim Fedorenko <vadim.fedorenko@linux.dev> <vfedorenko@novek.ru>
 Valdis Kletnieks <Valdis.Kletnieks@vt.edu>
 Vara Reddy <quic_varar@quicinc.com> <varar@codeaurora.org>
 Varadarajan Narayanan <quic_varada@quicinc.com> <varada@codeaurora.org>
-Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com> <vthiagar@codeaurora.org>
+Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com> <quic_vthiagar@quicinc.com>
+Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com> <vthiagar@codeaurora.org>
 Vasily Averin <vasily.averin@linux.dev> <vvs@virtuozzo.com>
 Vasily Averin <vasily.averin@linux.dev> <vvs@openvz.org>
 Vasily Averin <vasily.averin@linux.dev> <vvs@parallels.com>
-- 
2.34.1


