Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0844CCD18D
	for <ath12k@archiver.kernel.org>; Mon, 13 Oct 2025 15:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFxfNALQj0kVo1nFaR/pZdz97+/8Uqorpj5QRkTfdsg=; b=Ogak4hW3Hgu/wTts8kSnp8TErK
	E8PFWdwpTWc/B8+1azIHidFl5KLxZttsSY4VF7Hw09WH7oLSegTgY3PeIKApnKvsdtwv3ctaQlYAf
	A5JPrb40qnc7yuU0r5xFczrYNng80MQVdKcKgcOwvD4Maipkvpybs7gADNgUnAZS8hZpE2a3I6j0T
	c20xiorEU44EsEq4gDAocTzovw8jmo/LDU1FevuWzvHhcPnpetf+7yk/VwWJ0d0XPrfbDwqPBI9ki
	q4V22Kf1csCFMLY5eOha1XC9qIOO08+VPHSrSnjvGwncfg6VqdcfG0fo6xdsjq5tu6VqUpCX3kOaQ
	34VfC/1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KeN-0000000DjLI-2LoO;
	Mon, 13 Oct 2025 15:39:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KeM-0000000DjKS-1EkM
	for ath12k@bombadil.infradead.org;
	Mon, 13 Oct 2025 15:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gFxfNALQj0kVo1nFaR/pZdz97+/8Uqorpj5QRkTfdsg=; b=D8YCWxglREzAUWPRiewF+yAzNV
	LPzPP8+U7pomnZYTdNuMmbl+VDJWNwfncg54M1pFlEGneYgdASougAvuw5UyNcPQ1zQAlsVOZL5dD
	Rs63Le0lan5wI7xOvU5I1enpTK7be7q6wV2rkxXbq95pB14afPvYlhodRjD5uOKKjglnR+VwNrA8T
	ftyTIYrkqIfpFduW9aRa3ySZQk5XulUwZBVdrGOEDRnzvkkwmMNyUb1uKwfyChme1ZqK3ZkaEnfx8
	CDC5zyfyYWorWCbdqzg/s55VcCTeoOqS5LxamlxXE0j8T/0g+NYfkm3OzuaW4zYuReW/azRdvxGbb
	5Ic1ihDA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KeH-00000004QPO-2JZV
	for ath12k@lists.infradead.org;
	Mon, 13 Oct 2025 15:39:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAUjhG000396
	for <ath12k@lists.infradead.org>; Mon, 13 Oct 2025 15:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gFxfNALQj0kVo1nFaR/pZdz97+/8Uqorpj5QRkTfdsg=; b=F9j/NwLmz4Fbf0Lv
	A2kJotKX+VXn1eUmSlYnDhzKxqBC5XE48IsCjtZZ30/XWpM4dyMHBANlJqygJZxm
	gu99K5aLjf21rYg/CvZVnZMX4jvZ54cJgny4UL1GtuGXydsFOtPS8Bl2f17j08/R
	ruDr6Iw/B4PZhn9Zu/e0foTZFg6lahdYJnZXUjgkBJCpyjjv6Z+iFEUkAc0wwXHT
	CFuP6WPWHMrP3yjLWdjZIXOoi/8od7s1gKZ+ohioK7tbKwZrpN5sxlHlAUXqAvTA
	aWDSbeXWJab8h5N3iBRWivo0ajVM4zJ8IqMg8BCG3k7EPULC8bQVys1kWFs/aP0U
	MLo1fA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qferw765-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Oct 2025 15:39:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-780f82484faso5307046b3a.3
        for <ath12k@lists.infradead.org>; Mon, 13 Oct 2025 08:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369979; x=1760974779;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gFxfNALQj0kVo1nFaR/pZdz97+/8Uqorpj5QRkTfdsg=;
        b=WQ70m1ph0h84m28qBLXeSWuGLFlCkXdmktJ+shHmHVRTLy+c1fqrjKIYSXxAOLELUB
         t6P7q3GuZJtssiofGHw9IivPyvSUbyPBVE88DMC44Eiog4G3ZUsxOgH7Jp3OZkWC/DPQ
         EklavJwQ/WjxBoRvYQ/ZWpKCueGFCXqltAMSJxZ9rJhpzkbAJwupbHVkfx2sAhhQsGBH
         Pf4u6XQZ0djXOz3Ej1wul2I81bQisnsZyltmE7D2/ngn0DS3ABE26IsU67i8k+3ia0My
         A/vuuQo2Bg4SxSRrGXh0h1yL033QCuniqPvP2Kqf/3q8RSAbKEovSxxT8HJZxtbERU3z
         Fm+g==
X-Forwarded-Encrypted: i=1; AJvYcCVJAK53gqk0TaNR1sTgEEy37t1Qz0qmB2h+hvklg7jW1D676xRoRvv03fjzhjwI4SNc2JI83/A=@lists.infradead.org
X-Gm-Message-State: AOJu0YydaITejeg8CL/Mo61sk/1wTYNY8gjeT/XJx3o5yQC2RGYPxjSH
	nphTT/FKEY1Y3eDgm5VyJy6CqLk6J3oi9AYIxz2tUVnuX+TyablEmSWpxJUFJnduFWEnF8/TFyx
	QDfxtlZnO+saKRqmvRinzdPhd8pv0bKHTCCAcISMTI5dzTyzLo66S+pTcUdwhjR8U
X-Gm-Gg: ASbGnctiCtMpt8roqkAnkVyvWz/dmrFSg2DvrQxBEeiQBU0MG/ezIowCLBMTrz7zv3x
	4uSGHW0sn2oUJ/5BOZK2j6tNuRcGmT1qKhXYrMTVS5GR26b+SnbHRTI4rdmwxSYKSgrryDegHio
	Mk0VbSPeTaYtWdYxpRGLWbvwwTRtzyXfPj3vMLO/fnRNadJ/ltZBWZuNnXBZL6uIGdzYU+WGzDO
	4lZqkcUouXGbYX0gv5J+6N3iF5+QcZ/V3sxQ1KSkc8hAoeG/pG3wT5PYIrCtVlKeOCqd8BzNhd7
	doA6BhYRzds05mLdeKLt4lVsugqNbwuUz6f5f8v15ldiEOjWoq3kWVk34DJtMsC9dNzPDwGLy4G
	SQsnrYybKhDEBD8Xgrt+OKEh0
X-Received: by 2002:a05:6a00:2389:b0:77f:68a4:a88 with SMTP id d2e1a72fcca58-7938762f6cdmr23218486b3a.21.1760369979396;
        Mon, 13 Oct 2025 08:39:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4kxqkpVz9sQusAyfzIDLIVnk2b1584b0w/ts/XE/aPdVbk1/Yuuxpe1N910zi6UxYAFwSQQ==
X-Received: by 2002:a05:6a00:2389:b0:77f:68a4:a88 with SMTP id d2e1a72fcca58-7938762f6cdmr23218460b3a.21.1760369978948;
        Mon, 13 Oct 2025 08:39:38 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d096527sm11927416b3a.44.2025.10.13.08.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:39:38 -0700 (PDT)
Message-ID: <1f47148e-30cd-4698-8b1b-3a22a6c1fefe@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 08:39:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20251006
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <45843a5f-011f-4751-b9bc-004768b1454e@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <45843a5f-011f-4751-b9bc-004768b1454e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ed1d3c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=WHy267Qvh4jMVSjEg6QA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 5wYvQ5L7TzQPnlr7Ss0npIm6juEScPLz
X-Proofpoint-ORIG-GUID: 5wYvQ5L7TzQPnlr7Ss0npIm6juEScPLz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXzf5A1nAeBTVR
 UY/mK2LUDSUAlniZjjsdW1rF8i1MF+3m7Bl2jBqNlpLqvixIt7wIUk2VC9ITlDRrn8OPZBoY3FN
 uITWvLRMUHACrtzlIRdOUtFV0ESSc7JdkKaH0IcDWtxmBWvpEs95Js41T+xRrnDK8+n5W9j2u1W
 Q2nJNoXanOxH79yBNsKVbjwOwh8u7FBgWT11TKowSIsFguQcEa15gmH+IZA3rxQg6VmBykbsmZw
 TxxTs4Rs4zVZQ69bLScsxjCnl+IrGWRQX9Gw9eesCn0jNyWZeGPGoHMcYknbVnUAhJSG9ESeeVY
 UZQyJetnGhRAOtY0tern3hiaa0QrolyJm3fNufqJHc0lb5kNtjcIxbRFejlaTTU66srLiYzrZ9C
 WmYG0ENrm39yu7jL+THSjEpQhbhJTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_163946_159136_02DEB74B 
X-CRM114-Status: GOOD (  13.50  )
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

On 10/6/2025 10:12 AM, Jeff Johnson wrote:
> The following changes since commit 4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4:
> 
>   Merge tag 'net-6.17-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2025-09-25 08:23:52 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20251006
> 
> for you to fetch changes up to 9c78e747dd4fee6c36fcc926212e20032055cf9d:
> 
>   wifi: ath11k: avoid bit operation on key flags (2025-10-06 09:48:55 -0700)
> 
> ----------------------------------------------------------------
> ath.git update for v6.18-rc1
> 
> Fix memory leaks in both ath10k and ath12k.
> Fix a sparse issue in ath11k.
> Allow ath11k suspend/resume to work on more Lenovo laptops.
> 
> ----------------------------------------------------------------
> Karthik M (1):
>       wifi: ath12k: free skb during idr cleanup callback
> 
> Loic Poulain (1):
>       wifi: ath10k: Fix memory leak on unsupported WMI command
> 
> Mark Pearson (1):
>       wifi: ath11k: Add missing platform IDs for quirk table
> 
> Rameshkumar Sundaram (1):
>       wifi: ath11k: avoid bit operation on key flags
> 
>  drivers/net/wireless/ath/ath10k/wmi.c  |  1 +
>  drivers/net/wireless/ath/ath11k/core.c | 54 ++++++++++++++++++++++++++++++----
>  drivers/net/wireless/ath/ath11k/mac.c  | 10 +++----
>  drivers/net/wireless/ath/ath12k/mac.c  | 34 +++++++++++----------
>  4 files changed, 72 insertions(+), 27 deletions(-)

Johannes,
Hopefully this can get picked up for -rc2?

/jeff

