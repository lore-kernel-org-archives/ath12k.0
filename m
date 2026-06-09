Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867FCCD8CA4
	for <ath12k@archiver.kernel.org>; Tue,  9 Jun 2026 13:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPUhQU2r01fTv3p26ZiHt/lae2p6AaG41ksdfDwY4IQ=; b=IxAtoeSRKPP6iO++9V81LcTVSs
	5MeAVpukVSCIEREWPhFEGVjQ48Z5y6N0vesGcjPC3sYFahT0wj1Y0s1gbBkjSCAj0R04dKkbbsoZa
	txSlV9XT9l4velTt3aW76H8RIyEuGf/8HNwXMDn+AuCSR1oMFZMLRULou+tX1cZ2WiokXxl99shyX
	EP/lau1GHXvED+6YglQi5eenhRcxJy9c2DGT3UI43FJJ6AC2CT3iEFyQ+jsK1nif9o9fF6okhBmu+
	lnNLt7j6bQ0adCm0ognT3lN8BZK6uZndnuWChUoIeJaYX6g4H63SaY7NHn3XuzFm4aCLr78JDSzrD
	3LJEKK1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwvE-00000005iFK-0Es4;
	Tue, 09 Jun 2026 13:55:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwvA-00000005iDg-1KO9
	for ath12k@lists.infradead.org;
	Tue, 09 Jun 2026 13:55:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmgGX2700856
	for <ath12k@lists.infradead.org>; Tue, 9 Jun 2026 13:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tPUhQU2r01fTv3p26ZiHt/lae2p6AaG41ksdfDwY4IQ=; b=psIJa4hwrjT/9RRi
	WMl+IQdnpcyeDVvI/i5tCQ18DZxeWQr8JXXopWK1ZjzLlO/wcQzcsWkOk838yIPa
	QBSVvMQKdUt/BhPJPwTIni1WewXMwj+yGTCAE+lTMS4JjyQGNCVSskgfif6OmnNh
	SuyoNtAXpfR02A4TnNXrFJAiEom9YzABCttS4NvB86pNx3sPbftTcTalcQNNcH1F
	WIbRgtPFtVjYCrKeir2EdvRPtNlIO4O8LDQDjk9LeI8B0UxFFN4dkFisdYM+4dWN
	BMTE/L6NRIfi5bsl8fD/Uc/PI8Ma5gIhUYPt3I4RQVU40iG0myViCpdWQPIOt5mk
	e8373A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeaspc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 09 Jun 2026 13:55:11 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-138156c0492so3289455c88.1
        for <ath12k@lists.infradead.org>; Tue, 09 Jun 2026 06:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781013310; x=1781618110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPUhQU2r01fTv3p26ZiHt/lae2p6AaG41ksdfDwY4IQ=;
        b=F2DbvnWk/0ghEawstCY8D0WWhGA3feN4Tui5fRbfTZUwzGpfGC92z8nB5ITbXQSouf
         d8/6FobBuBhI7J0g/ZRTjKQkk9m70HOYnmo6p05gOVGiu7REKpa7s3qiLHy7ocqookga
         pD2v4vcoQByAFVL5K1KOeKG3lGTq1+fDPERdxjPdj2iNWfrH9YP4m0t+v1yD9Mu89Mk7
         vzX6R+mvp9yKOwnV8+AvfHUpI5J7rb1ESrp5JomUAakshou6APNeib6/bmLBEddUp4of
         3G6L+goF41g7HNlorFOyD/BUAJj3IBwhmVrs4BxtoiHQBJ1Qs5g9g5uKPNsWAs4Y9fRV
         zJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781013310; x=1781618110;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tPUhQU2r01fTv3p26ZiHt/lae2p6AaG41ksdfDwY4IQ=;
        b=FRQ+6+49T7ZD7CfcB2igSHd1wlMYsQ6YHw7QTq84gIzZoIbyRGdffog25AED+N2U53
         s3S+OXBHk5H5lFZmRPtBm4b7wYqrepKZhDzabHPG9IMyqA4YnuxZz3yacUqe65rEp6xR
         lr7PIHgUk8uxGclOxuXDFvN0BTQsBUt3mAHgsNPtO22M4VhF4fgLkSEw34CkSIiBt5oN
         L2FMp3YH96wvqyj+8KpquBvxN409FVbmYd0qJAZfBFHgTfdovzPi1uut+L4V+K1usjzM
         yg/E+jWo4sGvshfdk5Go8u5ihb3wqtfMtn6h3X3jXDI3vPuPjsWSQWuFzA+bBhZFapsh
         daxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+me6KyJhIZ5FHa9NKwWID/J7qWFJ7OQHi/wH0Czr0IvllhfQSWxeIifjDIpDfcSFrWrusbLM4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzG3mGb+AcfWcmccJXffGN+0UflwCCEvDd99yNN22N4nzCRLK55
	jbT+pXBRLhuFP+fzy8wwJp5U5zlWBeutV3uBuE4hrxm8UPdpyazxqBtCOZJ6uBG8wGstjNvijd8
	mftFiAfYyKpse/vjhBKqrUSJW4zMdtIYkgGW+j1sQL4EQjPjxRBq6xT79C2HqG6+s
X-Gm-Gg: Acq92OH1kmWpXhJ3bvC0a1vUnsHyzidVZP40AdS3ZrUlINm2d2a6vl1WgM9FKsLrKKV
	H3bu+TCxHpvn/a1OLcbqZQKeycu1uEVbdn2Lx6rVbm+Akoac4rjN7BgxCyTTZ6vKVQSrdv0UrE/
	Sq9LdZyH1tz7dNFTgNLya+u1G48zUAvOeRMixAy4OEG+CgHDaKr5r8vrcd2waY1oDDABS7G272L
	eKIKz4bZEo4DCnMXVZY5LFcz0wSeCju7R1RRBy3B1prJEHl6KqUmRR19zZAitxWTw4F6lYav7rH
	YwkUujWizwouI/q0/8JPcWTXLLOJCzl7Kx1e3oJj9mCG6gUFUvVXP9WUWrR2SCqG43tN1xiTkUv
	2F2ubS+EJo2DaHZILdbHz8vYw7ZoRqLfCCYiOkTQsU5NamtnvJLaX1Wjeou7zYGyWE1/FuhLG9e
	gFL3dcraSniNk=
X-Received: by 2002:a05:7022:485:b0:12d:ff1b:92f5 with SMTP id a92af1059eb24-1380671c90amr10859159c88.28.1781013310228;
        Tue, 09 Jun 2026 06:55:10 -0700 (PDT)
X-Received: by 2002:a05:7022:485:b0:12d:ff1b:92f5 with SMTP id a92af1059eb24-1380671c90amr10859126c88.28.1781013309570;
        Tue, 09 Jun 2026 06:55:09 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f54c9c12sm15289555c88.6.2026.06.09.06.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:55:09 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org
In-Reply-To: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
References: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/4] wifi: ath: Update copyrights
Message-Id: <178101330879.3249128.7536641999721220001.b4-ty@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 06:55:08 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: GNMm6FSjgbQY4DxGUID_6NIbOn1CQWjo
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a281b3f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=p5YVH5xWJpdpfVUbqF8A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzMiBTYWx0ZWRfX0siUIIACFFQu
 ESxVWvIJFZedk8UFeyAGmkQ89RTyNAe8Wq4E6aBCynKhB7E5nZvaovaCKMf8k8UqjI6dcTr//4V
 T6fcmIVQQwZXl8HH7cN26CH+MZv8Z6X6KEtK039xkT0Zc84eMCiYO6iQxIEAKtoOBPA59Xthide
 iF7vDPCZa/zqEHIYsPs/1Gtq1SM+lFXDON+XcYsndIK7XtY9w2z8W7GtnrMDL28kBQiac9BsuDt
 7jT9TbNnznZaaLMdgAGv2I8HFpQnhlUxmKiexLsyIUO65hWpu5b5gmsYMjxLFurYIK5IS1XTgwt
 vgk3gmbwLiAvNjMYg6ynBOB0VtlE3QyE1VmaGRRKDZrRX+uc+Z5mlO6gSR2hkVC8HcgWTcFd+tX
 O3Yj3PtV7qxp9MqMQS6gq00/fYOHoul9+2Y98uL1Rk+b8GsO+uj8IVe0pcVAx7cRil3FyQS1GuF
 YlNjbPLs4i8XDbNzX0Q==
X-Proofpoint-GUID: GNMm6FSjgbQY4DxGUID_6NIbOn1CQWjo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_065512_517885_6A0E671F 
X-CRM114-Status: UNSURE (   8.26  )
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


On Mon, 08 Jun 2026 06:21:31 -0700, Jeff Johnson wrote:
> Update the Qualcomm copyrights in the ath wireless drivers that were
> substantially contributed by Qualcomm using the current guidance from
> the legal team.
> 

Applied, thanks!

[1/4] wifi: ath12k: Update Qualcomm copyrights
      commit: 1c316d02c399e5efb1279666c078f99b3f72b0ca
[2/4] wifi: ath11k: Update Qualcomm copyrights
      commit: 053a93808d4654fae18633b01a747caa7a281aaa
[3/4] wifi: ath10k: Update Qualcomm copyrights
      commit: ae667b0f98b80146ea22830a1b53c5758ad742f1
[4/4] wifi: ath: Update copyright in testmode_i.h
      commit: 21d83c6e9e45156f4cad8c7cd6fc2d5bbc76f73e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


