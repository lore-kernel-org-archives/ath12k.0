Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C53FC4451B
	for <ath12k@archiver.kernel.org>; Sun, 19 Jul 2026 15:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Q4SC8NtttZk++EtMhiJma5PmFZ92WlKLiK8pVJDm0U=; b=MgHwC/T7UAafnP7iDHWkEbQG1U
	54x3MjFcwodRE1H36MkE7qWfKwAWxLw/WDf+hYbiGb1qqM+hp4mfKmn/5WTLu8g0JsL45TSaFF2pl
	mG3ImEL1pY6ZTtTL8Gjcnjo+I+w0zFyUbRwryZ+geg+HpoI86/rhHhXCs9qff6EgTq17VdCCQNGnp
	FBe7cpJUWL6F0PHo+sUDyrukHLJ2nZB5VAtW71KirG83LEkMMlNTIyPATK6UyJcEaMuTgwWwiTm1J
	4tyXu7/hvA6k/1Yfyp0sTm9CvhR+HDRDgWrD5Z9Vg6AKZ6CGCsN9t9zp7DbzYYS0L/30MUYS3Wtxf
	rEjNKc1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlT2i-000000055Nf-3pyY;
	Sun, 19 Jul 2026 15:03:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlT2g-000000055Mq-29Ah
	for ath12k@lists.infradead.org;
	Sun, 19 Jul 2026 15:02:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JDvxhc686895
	for <ath12k@lists.infradead.org>; Sun, 19 Jul 2026 15:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Q4SC8NtttZk++EtMhiJma5PmFZ92WlKLiK8pVJDm0U=; b=ZVo9oO46dNovUoDT
	eS8NEz8C/6cCQgvt/ZFBukCdY2TTd2Id8IsbDVJ37O66p74XibHrdkr99kIBFkK6
	f7mRK9TbdP3223zJFPL2vRBaKFY7Q5cRK6hlUpWntOcEbbKccN9eZyKLcJVxYJ3p
	O9ONwbxD3m2CKGyWTlu8HnK37XPiIYZAEDD+KeYbmA97h+CeYLj92zFq0cIB2gfn
	C17t22lasASzSmUZVnlGXDSTfDLhcdja9xfKrO0qL2EDhmMytAaJfRt3BdLxB7pH
	Jt8e7+G8U1VThXK2cjiAj9Pisn/hF0W2Jlj+BnMD4fNOSsfCMiRwfY16YdPU/m6X
	pHZUEQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2aatx2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 19 Jul 2026 15:02:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so4316169a91.1
        for <ath12k@lists.infradead.org>; Sun, 19 Jul 2026 08:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784473376; x=1785078176; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Q4SC8NtttZk++EtMhiJma5PmFZ92WlKLiK8pVJDm0U=;
        b=KYPHtPSYej425iSMILzcA0+B5+zilmZZn5TTFM3WdIP1MaakiQwaeCCNycp7rGOr9g
         6hWEf6TD9jzTMlSux5Mhq7Lxrjr7fi1wY3cY1X8DEF9OuqcKmycZdOumXb3hcHZ42Arf
         T7gLQYCQlnjbc2RoomsXtrg2WYuIFNVaO0FYw2xPIUV3St3kqSsR9Ki7BZ8BxrCpyu0C
         p1QMhi1ci51ViUvpFxQ5+RimFoF4Jid0QgUMOBaYXPoNj/2IHcjW1u//k/M0N5eQ7mp+
         huhs2JH7sWTRGQre4EExqgNL1bTT/fiRII3fBaShKuyErCe705IlgloabkLiauOHc7L7
         J4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784473376; x=1785078176;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Q4SC8NtttZk++EtMhiJma5PmFZ92WlKLiK8pVJDm0U=;
        b=RaAMiVRqSJGog10h7I+YS8mC0dCZnpMwWo8aPgNFY71qYGZ0vHTZCTs75ka2jwwQMP
         WoQvnHvpoetMgJmC5/OJ7GsOSmIs2vcNIecdoGwWIEePtJpLmskKXaroQnftmnm+FKrB
         EmzplIMenYbrpVtXRjPmCIR4cfpymQSKltrctqddzGrKzvBVcJ9ub/KW2S2ns1Ln6PYl
         UMEBiBtTnUNIMHPt8OXtcba00QJc7JBYFoa69B1rhzUpBG2YoW0rynAts+UaCL6sp/Ll
         4c5n1z7J8DlBqxMtJQLhdDBINOHsuNm1ofyKbyRVE7jBOebd+zFfCS2JNxTJKarcNb1D
         1Y3g==
X-Gm-Message-State: AOJu0YzZiZxupxqJMRtQ9d+SlmCv5m3r58ggmz24m4MTUEvBXQ5BldvG
	+yT9gYucaiCRQuMTwFD6FQszi6vMqw7siaFIvO055xS5zS219mhKQL4JNyXvPpBkPRFzzetJLkB
	M666NkGvVnYBA12dI9pZLb9fnlhuW8d4aoBZBt34JgJ8aeDIubJJNm5QRuw7t2052
X-Gm-Gg: AfdE7cnRBjqwEcFV//+cIo+jTRODRdK5ia39zT48XRJlKHZa44Yo8yWvDBydy5XEnay
	pgVwOyiHl5NhHWIwJk7qBlJ3rRWDw0VIw96XmkVRBSBcgy6crHqWPHNVUKbNrWdWgFZJPTO9H8E
	UAEcrxfDObHLMylg9VUi+SLGzvUNaXHP5nK0MwmxpJbFWTtxE6hUveHKC6uqPEkysAyRa3uodQ1
	WbVBjUFbJ8DwhU2i7hICHvahE0NWgICefy8l3dOOLuU4M0nI6TLqY0hCFknu/p4+2LlzoIckDPL
	s2Di5v45S8ZE+jrAAfdiVk2qJEACstqqlvBOsRaYmGpB5Mbw+xFB3mjzTsfMOQtr1zJRaHbCzwn
	SwxkP9H15c7XNnqea8mi8iY1vj6j2EpHAc7doHuhkFCdcro1DhzuOafE=
X-Received: by 2002:a17:90b:3bcd:b0:387:e0cb:c8e1 with SMTP id 98e67ed59e1d1-38e4b594dadmr10869549a91.42.1784473376100;
        Sun, 19 Jul 2026 08:02:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3bcd:b0:387:e0cb:c8e1 with SMTP id 98e67ed59e1d1-38e4b594dadmr10869484a91.42.1784473375527;
        Sun, 19 Jul 2026 08:02:55 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm24638707eec.11.2026.07.19.08.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 08:02:54 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260717014302.284034-1-daizhuang.bai@oss.qualcomm.com>
References: <20260717014302.284034-1-daizhuang.bai@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Set DTIM policy to stick mode
 for station interface
Message-Id: <178447337433.3680261.7368997594464473638.b4-ty@oss.qualcomm.com>
Date: Sun, 19 Jul 2026 08:02:54 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ldQdgHbFJ3qMqM6auFWWmrjkqeeVFKZp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDE2NiBTYWx0ZWRfX5Y9r3G2QF9Yu
 6Bxma0S64rprXHmQD8qVGXjcKHL6y1KmDtxrEcnEStavpS5FdviWBKcOgqjPJ0r8kG/9VYT3uzI
 XLWP9C2NGio92a5oyVAOyt2eJbRSyFU=
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=6a5ce721 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=S7poeZ7bz1ikm6sqKk4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ldQdgHbFJ3qMqM6auFWWmrjkqeeVFKZp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDE2NiBTYWx0ZWRfX9PbRTa8HWvss
 kyPK/fKAzGcUz1X8UHpuCPWLKP2DaL2rwpj3T/ydmVNUiFvbzQey9LZp8jpGPu/DYe7iwYa38d8
 AbsiaSJ3m/OLGFzlR6Rng00CHXH9z6FVVof8m8SrVdLvkcheFnAWi1vtgqP0XXYyPskQBVRnUMh
 /zbvsPuvNDc4y4EpExU49cTmz79feXVfKVQNDHlwyeuMIEIp9+2Q4OWIr7CPldF7Bdwop3bY1W0
 rRbQsLfAiOCPpb6EXAkVoqlik/1bWrTbM8lklz1JiV5WRr6LovNXhaxJNefPaNqNepw+V97gkfV
 I17C8gSyACJ8KMJV3FEBwz1wr/4Qh8XsUYGfEsa1VBE37pEl7103bddO/mytTSLneB6bbRx27jA
 mK+3BWgZ8CtTrcdk8vhsFJ/0oMSBTnB26nNZSNPPgob+EN/Ugr4z0H2HU785j0uqbx1Vr5vtpSz
 Eg1AQ5g8bnSHWO5ROgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607190166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_080258_573227_89622658 
X-CRM114-Status: UNSURE (   9.82  )
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


On Fri, 17 Jul 2026 07:13:02 +0530, Daizhuang Bai wrote:
> Currently, the station always follows the listen interval regardless of
> the DTIM value. The DTIM function does not work as expected. The default
> value of the listen interval is 5 so that the STA wakes up every 500ms
> when power save is on. This can cause a data transmission delay.
> 
> Set the DTIM policy to DTIM stick mode so that the station follows the AP
> DTIM interval rather than the listen interval, which is set in the peer
> assoc command. DTIM stick mode is preferable per the firmware team's request.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Set DTIM policy to stick mode for station interface
      commit: 4834ac1d4894a2c3513e8f28d5693170829b1e68

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


