Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2713C7EE30
	for <ath12k@archiver.kernel.org>; Fri, 27 Jun 2025 00:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feBEAziDbBhk40XMqRH323WRC7gKriBS9CHHoFdAY/E=; b=yb3xr+ZG4wNvbrJgh6d2aEHJgP
	XmZfxiYtYHSjdWtoBQLzjlbWunRSW+AhTCd6g2BDml6UsHa9kvOv5Y/57N8yxUjUAtsCHtD2rTmFZ
	7PutyS2FRlA/Sz59yxt1y0J5/chAHx3iySwZVVrTRreSeGH4fyZR37IYYVglPn6GPLGug177fQuEp
	wtgzEck8LUptXHE1HL6ZuyFhCfKe/MWiJP9VwouP4soXjfBdV835JUfnM4m64HFY0g+rnzWJklYYn
	meFESCRIqdU8Tl+GxCi2AFu3GqbV7bUhPXldAkKdMcRDEaKIkJi5FVVZuucy7eNY1ZwB4FCNFbRA1
	cY9UXGUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwuS-0000000DCPe-2wRi;
	Fri, 27 Jun 2025 00:25:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvoU-0000000D21i-2n9y
	for ath12k@lists.infradead.org;
	Thu, 26 Jun 2025 23:15:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QIUPsV031194
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	feBEAziDbBhk40XMqRH323WRC7gKriBS9CHHoFdAY/E=; b=MSrSids7WLT0YSRx
	1Txe6hc2hreOQvpvQfZBc1rS/zOrvpzF3DQ1lPnTN+5YLyvzBh5wlAXG1QRIza85
	kGexsAGIwDY4w/2rGhAifqrFqbepAsp1WJN1CvGxxwP6JpmTYpHAbRoo8d98WjU0
	1wUmPc8lTl0Pj0plvKh1zNIdobdUiOtSoiLs5Tf8U+Np2K/TSJW6ypPuCX2UlZ5E
	+BK2muFZGYVcxpTO2HKBWqeTbHEp3X2M9LufCeaMIIpNZeHuIn3kbv/dFz/IxcHj
	/m+a687XBVVDRTRZxiZiGFdVOP7tKv9j2mzUKtmMMWP9wWwHp4ocZ93GimRurpX5
	rBP+kQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b44r24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so2370452a91.1
        for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 16:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979722; x=1751584522;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feBEAziDbBhk40XMqRH323WRC7gKriBS9CHHoFdAY/E=;
        b=q1yrJa2fz4IWPKdkoudPjr5FyMncQau4MrQCKRjni5s0IeCVGdE+qVPH0iqkUraoUg
         0Z4eAQbnm6wmGDfau5ww90P3MTGV6B9sb+5AK0VDiu6wnZJXjUWqskOBcMMZEU4jBXfB
         x/bdW85JdqtbRMqtWkewHB9B2Y7wmvro9sxF8tINjSPUPnVWj3CUdM7vPG6YxvbtfA6n
         XSIeUHOkqDFBL+y5zOs0J/TBxvijRWSZ3aTkr8Ugbu7GJPjqtfjcPscnNVc/OkAfD2rb
         P7AjaAKRTrWoptcUTd1WTxcZwxX3Aa4uMsdC+ljRUFMPl65HkYRFKBN+V4f7QtD9uk7r
         MvCA==
X-Gm-Message-State: AOJu0YwVQhGZERU+carFzxt2nn1qSqpTANUHfwowCYuBnqLb4D37iEoj
	tSnc1pbMob6TRdRdc+qGzM8Ixa/X8mM9B+NG6oz53jnf8tygYcbhHgUvMcENXv3ObfhOw0L6Km2
	xEvbIYYRRxhrVPOIhGIvsxhKVikPEHK7zU70OSnJew8YdcM0PfD3tvAOnbQUXFx5u
X-Gm-Gg: ASbGncsXFP1qnDNRi33tvzltyQZJ5Bz2S1YJAzle0RH1GyVnRm6N5KzaS2B9s69h+sf
	Tf9gZDcmegbrWMmQsn8bOVnzU95XZQGEY1NJ4/+mTKnRRnLGBTWHYNz5Om3SoSQqQmGtzK+ykq2
	ofyedVkgU/UVCZxWMQZDoZSuhduaKYnK/fuafFfdvark4nR/dIRVl7Rr8cz8nqu1+ISzk+++sQa
	lQFU5E/RyckOug347zXf4t5cUnVlsYPs/UaxJ0gdiPyRZoZf+6+3jWfDe520XKIfWh6hUwGzLzQ
	G6JrL8/ZIAwEcWU9ooYVnfiQ4ToFaXyPHuWYTmRyF+3fJLP7EhJRO05jcY4=
X-Received: by 2002:a17:90a:d443:b0:313:bf67:b354 with SMTP id 98e67ed59e1d1-318c8cfa54emr1535780a91.0.1750979721823;
        Thu, 26 Jun 2025 16:15:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU7HL9zI+40GnbkCI4yRMz79dFM+dBPlbb34Lvze0KHCOxzHg3vI3JvtxVzgSVp5cCpBD1oQ==
X-Received: by 2002:a17:90a:d443:b0:313:bf67:b354 with SMTP id 98e67ed59e1d1-318c8cfa54emr1535751a91.0.1750979721439;
        Thu, 26 Jun 2025 16:15:21 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:21 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250617051136.264193-1-quic_rdevanat@quicinc.com>
References: <20250617051136.264193-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Support TDMA, MLO, RTT
 stats
Message-Id: <175097972093.153431.14008414767992768742.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:20 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMCBTYWx0ZWRfX2ondfMdgNHfb
 3aS7Cz0NZTZ2itNC7/eIFd/bW678Xe62pA2BL0yv80CEibamOE9uL0g0hKyDQzVkc6r2WQs0UcA
 8NqTtZdx+rStBfwPA65gRLcMFqpqPRyIgnuUvhdBeqOt88hEIW8lIhXLqZ20NQVPLvONpoHK4/b
 l1G+r9mrQ5QXA3xk713UXPbO1o3Uic526U8ZVDHr/X2K0f6EadacCyGPI/MR8uVH/2HgHVLia12
 kS1MIVFRDhE8OTxxkkjTvnuaaXbHtsKLkhg6EQSmRoL8rDD1INAeofHQHGeoAqd9ev3oNBovfpA
 UpXalQsx8mkG+ANK4HeRH10DAYrDNAUjSzY6Y5zrpBJMkBWpewnr9gMm6NgBS1zdC3jq5gYaR5E
 9rcpSnEbLiFkEVAcjds16AiTAPgy8o6DHoJrp+qdAod9e+o6HlCRDRkFUimM7K+BIRm1T86s
X-Proofpoint-ORIG-GUID: _kiGGUv8eP6ART91vnY9PCNOzIMHSVPZ
X-Proofpoint-GUID: _kiGGUv8eP6ART91vnY9PCNOzIMHSVPZ
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685dd48e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=806 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_161526_710332_DFE34BEF 
X-CRM114-Status: UNSURE (   8.01  )
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


On Tue, 17 Jun 2025 10:41:34 +0530, Roopni Devanathan wrote:
> Add support to request HTT stats type 57, 63, 64, 65 and 66 from
> firmware. These stats give TDMA stats, MLO scheduled stats, MLO IPC
> stats, RTT response stats and RTT initiator stats, respectively.
> 
> Maharaja Kennadyrajan (2):
>   wifi: ath12k: Add support to TDMA and MLO stats
>   wifi: ath12k: Add support to RTT stats
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Add support to TDMA and MLO stats
      commit: a7f74e782e274e8255808c165cb2cf63ee0876cc
[2/2] wifi: ath12k: Add support to RTT stats
      commit: 81a0286cefe6f81744160d3524d70e67479b314b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


