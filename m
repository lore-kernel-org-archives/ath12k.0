Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB112C5B56A
	for <ath12k@archiver.kernel.org>; Wed, 12 Aug 2026 18:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTpDCdHVX8oh2DPLWNozYILlYQ0f211QbctU4RV5Ejg=; b=XytyagvvJGZNlcC0yycbgK6cVd
	RbjWFYDElkk99qzNK7XrnFGAiaNt88WOaYsYnh5BxJUNcJK90ajsFY8MYcY8PoPiUBtpduMkxA2Hr
	ERKnnxrgqEKEBhfd3fjwpE4DNys8nKjVLo83ElyrmWx3QGUpatj+pPEXXiZ2PPo7XutywOOzdY2m3
	yBYjSj+bn1aUB6VwUhgkpknTRtpsrEjWhywgPP11N3T9DLBpKZt8H7DKW9gVq5xyW7MXbDf7cezW3
	Oxk1Aet49wVmQTTAzzT4jik/j+gquCNymnKw/KvBZigV+QSir5LH+gTMqDpO6vUlXQH0drcFNcy58
	bp6Ifm5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDag-0000000GmmX-24LI;
	Wed, 12 Aug 2026 18:22:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDae-0000000Gmlf-0zbF
	for ath12k@lists.infradead.org;
	Wed, 12 Aug 2026 18:22:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CI8QBO702721
	for <ath12k@lists.infradead.org>; Wed, 12 Aug 2026 18:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BTpDCdHVX8oh2DPLWNozYILl
	YQ0f211QbctU4RV5Ejg=; b=RNoO8uTxebvsNptxCwD3Ns0BjS7IEodYyNlciKAf
	PBFv3TMp4F6Edo9s49akYyP79KoGii8ogmQfP7SCbv5EBgZzM8RUSphkFbYJgiNA
	zrlbATQcMLuEd520TIyKqJQ1iG/kYyXg+e4MyCMOdNT2NdjmgdAB6PUV7+QVLN3C
	v80I+4BHI//muwfwug0CdLzLrHq8LjQf3sTIEJfgA41HMbV13ADjOP1tuLB/r9gg
	fNlpFZ1eAHpcqK8/ibaeEkybHhKbKmtIR6aF7wRxjlLZA2dSzBBClsS0K5qVg3MK
	sYl2E9rxZLA8wRNYPX/XDmkk9g/itU5cjsBYJcNf5ztdKw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nucjfy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 12 Aug 2026 18:22:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8db414c7so17858971cf.0
        for <ath12k@lists.infradead.org>; Wed, 12 Aug 2026 11:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786558930; x=1787163730; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BTpDCdHVX8oh2DPLWNozYILlYQ0f211QbctU4RV5Ejg=;
        b=jLeqgGeaRLUKiPpkHTY6IjOcGxrCCP1odJOQlvQB0Fzx/hzPIzvJdLUv2whZxDAv3M
         GzoxvFqJ8ffmjB98dmG/ow8bOnAGgZvfYvnvo7+0GNvZ7etsBU1Vald2K4u1h78PJQaU
         Ni2COco/gwlkf1ccBNWf1JaB3BHZ+MJ6NyttEWSRcc2T7U9OIvBNhl2flL9vFHIvt3G/
         zw7XEeZyvfTif3A+EKH+n0XS89ISoKr8koWUV/l9PjSI20UUqPBzxuNfLRzDChi5lfmZ
         oe02fmF+Os/xW/eD9H67XzD7sWgXiVmpzL1pJ9fD2a+1VkNn9oirxbNm8zygO29XO9Va
         dM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786558930; x=1787163730;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTpDCdHVX8oh2DPLWNozYILlYQ0f211QbctU4RV5Ejg=;
        b=g+5I6GImam/m0rL0fU6kobLl+abJZFEhBntGrtDMODnadqMkEAyLbGz70YcNkZOxkb
         L1sNZQWzTEYIvDvfrF32kI4tOPmC6vDJ+aIOcW7K591IpZaP3Y5ClTGC/d3VWS61Y6CR
         xm8PzsQY0R6I3CQ1szcIRV7wX+SB8yezp/5aqxRMLQZQOwwKCnJon0ofMhhbmAGj1i8J
         bmK1b1CT/VhibG1z+S3AznUT7A/KfL0Zypxmv3eps642ike9a74Ufnn2kPpjwXaRamep
         O/j4+/BUPXbBexNwM7woiDm05MYsUD5jooIaMGyIXlyF0KqO1LNt3CSZq86oe8I3WZBH
         cVLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpv0sSrGHwZNwzrtmwo0zibDoz1YAm34NaSsaHttap/ymLr8VnFrzYxwVc1AKu41/zgdPEtW8M=@lists.infradead.org
X-Gm-Message-State: AOJu0YzEIxvUsrcJ945V5FlyDWnG4oyTnlodEesO7u6kN60S3hGjq37Y
	KJJB7XhCpP6rMGwF7BCFNcejKSXLUEzxM4s3IkvA5Q8C7DgSQSx/L8uk/UzutTgZzuA5wb9ml0Q
	/giWF2tLE1hbErRvcekgeFIzOKHwwDM/NsW8MtHjYYPHI0mGSz26ZSEDybb9fLbI3QTss01R2
X-Gm-Gg: AR+sD13uMSY//50P97jboyzAybvDRyd1RBsBy2Or/B74dz8lkmFQOxCoegSB1mnt5J0
	tS7Yrm7HaZPi55xPCCyJ4awQ9l86bxp/JbtwshJGC+UnSG/HHMGmSRKUjrD51sgqMJekZYqV/eQ
	VEemeKbgSiHycWEPlVkXx/3DWipb9IfzChfwY5uiudemPtPuO/gvy6NIo/ZipxfppCBVL5wql6F
	T/pX6TL7/IKgTERkK0zjjR6ThxqUqBUu4q+NmU8ET2D5aGKoHXGN38ddt7Jz4aPym0w5i5Z+Kk1
	ADY/Mp65Gj2grygUDP2yb3cbk6+bovlc65RQ9VupFe1WIYzPwLPi02c+ZCBOsJN3M4NLgoxBADg
	MU1+NqSpCEw8C6kapzlX6IffV2MyJUvKlDhgwZmHjHBk4QP5UovRs1v0tFBgBncQhRK7Klc73Or
	tMy+QM9m/YhsIn
X-Received: by 2002:a05:622a:4c15:b0:516:e249:e30f with SMTP id d75a77b69052e-52d73df0ab2mr834041cf.42.1786558930130;
        Wed, 12 Aug 2026 11:22:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4c15:b0:516:e249:e30f with SMTP id d75a77b69052e-52d73df0ab2mr833301cf.42.1786558929327;
        Wed, 12 Aug 2026 11:22:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44d0477desm659199e87.74.2026.08.12.11.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 11:22:07 -0700 (PDT)
Date: Wed, 12 Aug 2026 21:22:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260812
Message-ID: <rrkoosnnkdkzgbqzfmpk3uwndoxuvfvanx2kjy7j4rp5ch4rop@wujgojy3qxxo>
References: <7736f627-e80d-48f5-a11c-97bf81597d6c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7736f627-e80d-48f5-a11c-97bf81597d6c@oss.qualcomm.com>
X-Proofpoint-GUID: eEmCY9jhZP4UH-x0s0uVS8oveo0G2EY4
X-Proofpoint-ORIG-GUID: eEmCY9jhZP4UH-x0s0uVS8oveo0G2EY4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE0NyBTYWx0ZWRfXyTVJSEFjT/Fz
 CgKc0U1mahB2yMdjnfm3yurw5ASnXn1RiACqWIbsdiw1qqlUcZR7+nMuVFmAB0/ZILQc4iBvwc6
 eVcrwdIIolsH8ojwY+9uurhNgzFx9uTM9YTZULicqN+BdAMCcfRR2iVsRfkQPOSwoj2rDs7aAi8
 nuoCTTFrL2zB5btR++8WIFi8VV3nILV0eBJtk9qKE2WRm/ZtGKRszPQpALtSjPJteal2bUF7qIU
 Hc++E4kdqqt8OVk6NIKY4WPdWLs2JfaLRoJZGS1aHvQQkGQyv0DSJVjS3KJd5NTK5+U5G4bUd7J
 /A9Cr/Jqq6lHKqYnIba/c+3RqjF4UywILABUN2ybf9HeLWFq7i+reQfSxJXqzImwcQ+si0tJ01D
 Q+N/Q0pVTc++PxJxDBBKrW3tksBGcpagB000SYuNV0TW4A4GjRs14EHVqqAURuPK16ln5w7BKKS
 /afnKi5dbayEHnBRFYg==
X-Authority-Analysis: v=2.4 cv=VcjH+lp9 c=1 sm=1 tr=0 ts=6a7cb9d3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=p0WdMEafAAAA:8
 a=W2b0fEEQJ4TDHmAVsWEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE0NyBTYWx0ZWRfX706ghNUkwwdy
 RuesFWLVMVxk04BO/eZD7iY1dqzj9YKycS3isBQweWIc15FQhqpyeYss8ueZMGUcWg3cfjz/mor
 mEO+4Xhb6TFBL7KWdLaGQKxSpl0Kj7o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_112212_390729_BE6A3B8B 
X-CRM114-Status: GOOD (  12.70  )
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

On Wed, Aug 12, 2026 at 10:44:05AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath10k or ath11k.
> 
> For ath12k, update the QCC2072 hw1.0 firmware to WLAN.COL.1.0.c2-00228.
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1177


-- 
With best wishes
Dmitry

