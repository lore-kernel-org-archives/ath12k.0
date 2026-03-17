Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F058BFF6E6B
	for <ath12k@archiver.kernel.org>; Tue, 17 Mar 2026 20:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13JEGb7aTnX7IY7HCWv/idnN4TiZVfefOdq8xjCIpRA=; b=Ckd9wMTyoMLuLNdcXotDLuDwVM
	vLy4WR8DH76SUMg/nWVi0A9AoeVzs/Dysg/f3RyCawtMyScJlNjcHoWiYhYYwtZ5neledreP+YTVx
	hIiMq3LQn5gMEobIY21YPzMrVJsaVn3vol97o2VnVwrhyO+Y6cJkTVlpeJxPB9Ukqk0Y9iTjqHyo8
	24P/VKIrZPkw1scno5CWZ9qje2JtmRv9TNeBCOs2ybADJZ045XJyYMO6y4T73cLYkbZ+zyjWNeFFQ
	wqmYkyz/QqDMmFqY0HbSz0jT87yWLxMWkOOAG720J2BQK7TG3cVzbH74rMOCX8YbmfrKDCHXzh5dZ
	vvoCfiOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bUT-00000007Dgq-1PeX;
	Tue, 17 Mar 2026 20:58:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bUR-00000007Dg0-1tln
	for ath12k@lists.infradead.org;
	Tue, 17 Mar 2026 20:58:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJaeo3164980
	for <ath12k@lists.infradead.org>; Tue, 17 Mar 2026 20:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=13JEGb7aTnX7IY7HCWv/idnN
	4TiZVfefOdq8xjCIpRA=; b=PbX4K2Bqg4rwv9YhBy6BCIkis1123gnDwv1ZUynk
	avZ4xOdADkyRER5OZ6i4XUeUqV+BvuIyEchK9dODrt50fnytLyRlmcEV6Ku22Tka
	QWu7KKQJH0hd+CnHIoMSSPRfBBQBSUNni4UK+WcU77OT+gb7vV8s30S+ZzpGuSAP
	R9IDtHPsRJwHDGT7ZvVtQgXOqDPlR9RkjVrU3KQupUBuDOKFeqbKJnR/EEZZetJ4
	jENqq3vrgpgdTCfDTsmhYoiyJd8GlJi+G5KU+YaUuDL0wkOEjdEw6hF3CcYbogq/
	+8/M2tQPoOEDoEnGclSKd5CXB+zk4SaG7Jn5wL7GnX2R7w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy4v6tbf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 17 Mar 2026 20:58:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd773dd409so870824485a.1
        for <ath12k@lists.infradead.org>; Tue, 17 Mar 2026 13:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773781089; x=1774385889; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=13JEGb7aTnX7IY7HCWv/idnN4TiZVfefOdq8xjCIpRA=;
        b=KTPzG5wPvEKjDA3QNayVahrInST0lkIFiNFklwAG/FUxq/8FDn+XluEGBZpF5bdC0g
         huwoKWUlqktY67cWYEBA3rg3MkI0zrY2wcjNIs4T37HS86F1u582KNT6PBQn5S0GS7Ik
         zczqI67sCmOY+5lfMfWN+8fo3m0TjYqszYzIaXre2OGcHzoj4i275Zr5+hJd268qElRy
         XuS7VZ7PD/M4xhH/jTYZGH8A2gTg+UFItQ8TxOPQKBdI70z/JvphRgt2R7DEp0pbeMab
         TR+Kc30zvobp9joxHY7sEvojMCW6ZdXqmDKMzT15Kqd4o8qqY4vSUpNlkB1Oqp0lQGeU
         JGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773781089; x=1774385889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13JEGb7aTnX7IY7HCWv/idnN4TiZVfefOdq8xjCIpRA=;
        b=Z8LXKCd58CflYYVY/oVEXn78503YQy1bGBbxXUBmBjfuRtDnzk9uaq9Z3H/udmKQ5o
         Milo+M1MXr93M2CqWqgZ2O4+ouokrk3rIuw8lInhbkRnesmG73X2UtED3hmXe3bgzBpA
         2ZCbd0mqyTdfNDXmXqySeqAlfFlyZughK4kCbQbNCBSN/Lb6/RaXO5RUiYINIQi/quAH
         qqJ97YaKLG126XdTaoruOEY272h/AkAHk4VmXJQjNXeCBVCEfYmjJe/9ML8yPUe6t4GB
         AO85PuVYYkDJL1FxbxOaFtMB/I8BcbrlWCWFPqWUr3po1ZjX1kQV/LC98HrEs0Q/8hlJ
         xyzw==
X-Forwarded-Encrypted: i=1; AJvYcCUeXeL29HwHdZqIqeW1Q5qcoPLH4eUqL+NVRYukMGy2toEqagXKfVxETKWSneQn23vF04xpir4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6jpP7ZWx2QK//ZunJJ+XGmr3zMmBoMiMrwkFZMW9jXXFVcKsz
	p44wURVFDKAMJjdOZQgitJUSIEmIUmYRheuXyqBVLH3sgvR1O1hiAjtPk//D8Ogp5eltDvxAr73
	kXwl5FfevbaC3IPdMiASZkAXffva4RTXZNa5/o9QtfxdiMBqVK0jG70IkKCm3dpQg
X-Gm-Gg: ATEYQzxTbIGSDx/6we0E3wNHHeXkmuYcdsvWlSj9DsbT7mgdB+3ghzX1Y0kjXMtUURE
	Dp1sdymESfQ2avd39FM95y7yPWcggtWI5iWrNtg95Ahrvo/TXOtM7METD5e0imQM1yEcrLLReWS
	Nz1RFurcByeVR4M/WeKBPr/fwRBJg7bLA7KSFB2pp9gI/8kNjPBPWNeybhonvXfGxpB75TSFuFM
	8siGn4rUW3fhhimRVbZ7E3VSlwwfXGHHuGgOjp2NRlLmjprWOdIE+zx8MLeVmVUlOtArOTbqWis
	0z9UhF5z9EdsNVGX70D9GzrXLUMLASd1vrtTpWcPgonH8BYEKEh6K4JlouOYOpIO+IGllcrSzWw
	UvO9jvyKJEHF6neyOW3ntgoy4wrsZhX6ucSCS33H/RW6ptMfivG7/Mf2IOGQrrygP0T8LCyFTuv
	jQ3D3Kg7Lvzq7glsTqAeJmXUYde1C4U0Gp3e4=
X-Received: by 2002:a05:620a:7016:b0:8c7:a53:4d17 with SMTP id af79cd13be357-8cfad24abb6mr161539085a.21.1773781089340;
        Tue, 17 Mar 2026 13:58:09 -0700 (PDT)
X-Received: by 2002:a05:620a:7016:b0:8c7:a53:4d17 with SMTP id af79cd13be357-8cfad24abb6mr161534685a.21.1773781088780;
        Tue, 17 Mar 2026 13:58:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c7c77fsm101863e87.81.2026.03.17.13.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:58:06 -0700 (PDT)
Date: Tue, 17 Mar 2026 22:58:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260317
Message-ID: <sxyottdaf2tu7swtvs46cziq4s7vraebrgclia3i625lnczf3x@bo7ssgih5mjk>
References: <3ff94227-db20-429b-9872-75faf39daec2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ff94227-db20-429b-9872-75faf39daec2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uR0SV7qo0XHUn8UKBFjNdKZGIWZDulC0
X-Authority-Analysis: v=2.4 cv=Aa683nXG c=1 sm=1 tr=0 ts=69b9c062 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=p0WdMEafAAAA:8
 a=VwQbUJbxAAAA:8 a=5Y3Z_7dTJYxM88ERm3YA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: uR0SV7qo0XHUn8UKBFjNdKZGIWZDulC0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE4NCBTYWx0ZWRfX4lCnVxqB0/1n
 EfN8TVABMKgGwSkVFYeGLp02frcHR2pHDueLazsx8xMir0+7/5HaYVu1+q6ctcgKoU+GFXVK2ba
 1nYwsKJrTSOfIao3Xi/DKRopBs5lsmEJWywl1hko1LAn/G9N/Up/cfYPbcQl7V6hFxVKIwvGjwV
 oxXZxZsv25NT4X51DNUGBKlD8q980+KJr3b+BhUx9RvQzRcnTugGLTJI4HyvWnfFFK+levCCMf4
 I17KUbvUMVCX07fHZlwPaSyCfmZfZMcrF3UUWcCPtCd477uyx0bNMzDhgAU8sXVUvAMoJ1ETRJV
 F+37pGeVK+CPQyW+M9tytKhNBjDQ6AXh6EAIagQtKI9eHOSFdrZEboDAWHEsDTFZJVFUQanDFvL
 RyUjV5Z3Ss7qVqeHG6peo7NuBFkaVLCGGIWr9OAuvbyemxDZXOuYaC8silfvERj5nBgjPgB4h0y
 ja4+K8pe1gfereOlZSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_135811_512467_985AF336 
X-CRM114-Status: GOOD (  20.00  )
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

On Tue, Mar 17, 2026 at 01:18:59PM -0700, Jeff Johnson wrote:
> The following changes since commit 81f761d1b5fd51469d87d1633a959dbff4785f58:
> 
>   Merge branch 'mt792x-bt' into 'main' (2026-03-17 17:33:37 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260317
> 
> for you to fetch changes up to 6fb33265936075ee1bb5a31786a4fe1b30fdd001:
> 
>   ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3 (2026-03-17 13:07:48 -0700)
> 
> ----------------------------------------------------------------
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> No updates for ath10k or ath11k
> 
> For ath12k:
> Update WCN7850 firmware a new unified firmware supporting Mobile, IoT,
> and Automotive.

Thanks, updated and pushed out.
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/962

In future, could you please include similar information into the commit
message too?

> 
> Please let me know if there are any problems.
> 
> Thanks,
> /jeff
> 
> ----------------------------------------------------------------
> Jeff Johnson (1):
>       ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
>  WHENCE                        |   2 +-
>  ath12k/WCN7850/hw2.0/amss.bin | Bin 6082624 -> 6090816 bytes
>  ath12k/WCN7850/hw2.0/m3.bin   | Bin 299660 -> 299660 bytes
>  3 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry

