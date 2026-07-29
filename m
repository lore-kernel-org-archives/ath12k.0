Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA83C53200
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 15:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OI/t43mfQ0qzruQ5TObcMZyGLP55nw3pV4Y1yJ3MdnM=; b=A6MfyhT95IpEu1GnbT+pk4Su0h
	WEinZ/wAKRQAZz/vp1J7ts3ONdfgj/Pap3q/Pv9YYbmLewY7nkE54RnIxObxUdFln2K4W/urBAj/v
	JdP16uVQNsZQGFHY5DQKay1BhfwcZH1BSVmg1aL3YLEyqekSB4o90PuIaC76aEEJoZ8lZe/32q0Ds
	SffZvzWume9Rn9hISpGetcI07TGuw4j/+JivyrxOxOvRYDJHolezv5YqpZwmXrzxTv4Gd1c1ohVdq
	oJ7to0Hix+AJC1MXniJq8Olt84OFAm7AGhTdHvBvebPR9+GgEQU1KsqaqE/VccAHy5XBYud53OAf0
	Fn0TskkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6EH-00000008PiB-0kNM;
	Wed, 29 Jul 2026 15:29:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6EE-00000008PgZ-2WUc
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 15:29:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3BTW2108196
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OI/t43mfQ0qzruQ5TObcMZyGLP55nw3pV4Y1yJ3MdnM=; b=ekq+x5+PkVIAKXk5
	Ok9wOh+zzBtq5i5G3kTcLafs32k/PasA0bYyP1KXpWGiC1+xMz2aFe3oRZyztt9G
	0xJ8WswWonSQ7YN9RFfJiA5IC+GpMUFOoynZcZfmqQBZPcVtYcRB0SjeGGeNpeKT
	BSLCjy6p9BwiXkNP7/kpFub9IRvswg/xoBg4ydVBzQlNM2tPXrJXWQ1/WDAxku8o
	9N965dY/TJCNDylEUSVcUPhlbwcZRuY0YW5D2N0PSR4VQJl2jiCclPvNostA93vv
	BnuCjYZWU7HpRoBxtahMWeCl2rSLWTJseFVCzoIV0mp7ekHMyhtZA1H6aPI5DVo4
	oMit+A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqkds8ar1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:29:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso1469670a91.3
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 08:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785338983; x=1785943783; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OI/t43mfQ0qzruQ5TObcMZyGLP55nw3pV4Y1yJ3MdnM=;
        b=RwhDthyuI+J+m+2Gm8GU+xht+f7VlLtA7DLN73wwp5B2Fh/DXWrBSEJtIky1QCFTQm
         ccnAiaBx47riJ84DRhKCeU0cKdNyjnlx+dmv4SOe9Ac2aPlFWgzwvFfrVGO/TjNiFYf2
         uCXnGuyAt33L4exal9C3SizNEysLICJxLchngPV2b4Qa4MsFgmmlnkCCavfpD1X77Mbn
         CmGov/qG4wZCzSTeODJCZ+1R4prcUA4T3fdQ0aSTLMZy0aeV9liosRAhwn8NkznYEm7X
         +Q+6UvHvxOGgjZZ5gLKnnF3BnjOt7YQUUihNc2O7MDzQ3TQ5Z8cHNaxDhaH/SkFbSCMR
         OJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338983; x=1785943783;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OI/t43mfQ0qzruQ5TObcMZyGLP55nw3pV4Y1yJ3MdnM=;
        b=ZVQwQN8eRfk4R5KaCY3HHlQUCjcTbvNMWEeG9hMJujl1DrA3S6D0K8chTrW8dPKwWs
         XovOPwn9AxpHthbU77stMTdJzcHFs7UIm7HP+dpgkbicjSoHGyQuNYYuA+G6yELABxOt
         RuRuyJODD65KUiAByE3XHOQQUe19/VvRBfQQWBcHYS6KDMJIfjPxACATUf/qiy/h4n6E
         OTpJVlQzVw31/mx/PVgkmYcE3lx+kRKsg4voX6Uo6NqY85TyeVOO1aYS1xyfQc3Snjf2
         cZ/ScH7FI2p2OSYeQfO2e4JT1Ngvo4mqgAswrerUAk9pSob4ye4/4ejDx1U6N2SCZXyh
         9emw==
X-Forwarded-Encrypted: i=1; AHgh+RohoTLyqCVEyCzdTNNCsjN3SV2iceV/1AdD14mHBNJfJkDs17aGm0zZsVK3gWQnI98gK8PcVsE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxdA8pUJvLWX0UKM7XHT/lwLFRf8ZjhSFTAri2pdHxtmMn3Rtus
	WV2wezi05IyYhVfkzp4LPTI8qtYVeT8MLTbqgJEEhMkjKFyQ1DEpBrEZFchOrTfsJ4ODjA6m3Yr
	qcX+bqsyHznRMINc+KncMQ7VodLHK9S9ROxq2E7naulb9SqaLdDy0ATqjZtjxG3Th
X-Gm-Gg: AR+sD11Gc2yS4rtAu4+PRM9uwBdkxlUTr5XQCpqfP2bdR7BTEb8ShccBYiGtUyW2fx4
	SwZ9+hMmZiJRuB0rNm65kZUy0r71awKATaYKkeSeEsB/RiYXPsOp7tOtF69JGtx3Wb1Is6XaKPi
	eDTim3R2AS2hMWhI7hjFYVd6+AEjbk9vgNnARh2Rofwr3s6wxihHD8YtaUuHwXPgiK84VF+P3q/
	OcY9TgdxWC7nbm2dm3dKRaz75/PHm/W6VeDLGfQl1ChotFo1qosYTOY3JGaRdpvoncDx1mcZcHk
	nuQ2mdmNUuRTCjBdVnXLmpIOOiioi3NYQIEcPb/hovssOEo+dfNwdIW9ku58h1bAZyGtS1BGCd8
	uXuPcUu3ZKII5qjfsR+7+vFr6r1wzeIQwGlnD5UnVMAmYa7yI6EzmliaeWWRD
X-Received: by 2002:a17:90b:50c3:b0:38e:408:9d7d with SMTP id 98e67ed59e1d1-38f6a4acbe5mr7105061a91.36.1785338983021;
        Wed, 29 Jul 2026 08:29:43 -0700 (PDT)
X-Received: by 2002:a17:90b:50c3:b0:38e:408:9d7d with SMTP id 98e67ed59e1d1-38f6a4acbe5mr7105007a91.36.1785338982417;
        Wed, 29 Jul 2026 08:29:42 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d2ec2asm13082804eec.21.2026.07.29.08.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 08:29:41 -0700 (PDT)
Message-ID: <a0cc20a1-82c6-48bf-922a-dc7470663574@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:29:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath: fix stride mismatch in
 mac_phy_caps_parse
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260729-mac_phy_caps_parse-stride-mismatch-v1-0-077a1a0c50d8@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260729-mac_phy_caps_parse-stride-mismatch-v1-0-077a1a0c50d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfXyXILm3fmACR4
 V03u5et2tSGQbmAP/8+1uLKeGmI4JQPi4XSWtOHfIl5loyCKCNf7UeiUZFY/ljSkOI3GDjBOqCL
 V16I1IXnClNfbdsDHy+mAzB7VK+M624=
X-Proofpoint-ORIG-GUID: K1NERe8D1vy9cLrPdf59b6kXkjMuLftB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfX9vmX4s91wBC8
 hOY5G7lr4gQcNCw2d3A70IGgKCDd85qU2IatoWAE2V/V/9Vb8zr/Ls6mn6LGZkdxdHKsjOmbYxJ
 kuFHAC+JPCWB+7oPo16Oq7tgkL+jqqsdfTur0R3oKgSSBtS+ESy89krZfiAP4Q7Op9+eHI5P53g
 WC28I9GF8LWdvootxanpjC9mDdojyd3FF3tL3XAOk5pPpswGtww0OEBD4MJSouCLc7kN0dQGum6
 /mSddHD/fTjaf5QhmpqThgKpEkuGh8Pq0JUyjEljGzF0DmJmBrjoaXu16n8a+KPIiDT/7UMCeoJ
 9DqOdmT+zBqVXWpNmlJCYNlwhzhOrVcFrD6jNSTNBwhkVY43FIweQNibe+7SoLIkHf0ZQRL/WKb
 nJ0YNa3g/nKdPLnQlcaIebrki2IgiJdlN1zF0aY5Vo3WCk6niKwR+4PgRETXNHPpf5zB5ZOOlce
 JVjt80PxBWGtOAcMAOA==
X-Authority-Analysis: v=2.4 cv=VJTtWdPX c=1 sm=1 tr=0 ts=6a6a1c67 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EYLonMWaFkCW3L4CGEIA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: K1NERe8D1vy9cLrPdf59b6kXkjMuLftB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_082954_672869_15A56B35 
X-CRM114-Status: GOOD (  10.81  )
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

On 7/29/2026 8:26 AM, Jeff Johnson wrote:
> Both ath11k and ath12k have the same issue.
> 
> ---
> Jeff Johnson (2):
>       wifi: ath12k: fix stride mismatch in mac_phy_caps_parse()
>       wifi: ath11k: fix stride mismatch in mac_phy_caps_parse()
> 
>  drivers/net/wireless/ath/ath11k/wmi.c | 8 +++++---
>  drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++---
>  2 files changed, 10 insertions(+), 6 deletions(-)
> ---
> base-commit: 189721a4afa1804315e7dcfca9ca0539c7b1d7af
> change-id: 20260720-mac_phy_caps_parse-stride-mismatch-e7292580f072
> 

<sigh> ignore this repost. invoked the wrong maintainer script...

