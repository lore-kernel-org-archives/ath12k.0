Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D64CCFA13
	for <ath12k@archiver.kernel.org>; Thu, 30 Apr 2026 21:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oD/hwFjD2LNpSn907GkM770fKxCvjrV9J6VUXwvJVyk=; b=J4YK1mJrQ8jOHTe3jpVqF908Uu
	JuC9+RgaUKso7OQwoho3C3P5+d2AZuryA+ffDi7CLxRFAQh1/g5uVGxKf4LqZHS7wEf2GR3jZsF+g
	TdFMuYKzbH/aIzxuwjailORPJqejeXBe+XpOLfIN3jpqlv9dj5w1K/7d3+dQz3Wb4ciFjpeOz49Lb
	htgFqmSqIMHsyo2ThrIN4Zkq4b7Q006GNj+RuOjx4WktJwlqnCtdVuL7l/R/i1jEWtei6O9N16FWa
	aW6Xkv/K7vxZMCE1VDrBiNnDyDpytHtnDokbWsn5jmbV1Ee5gugAtOCVFyKHFekh2P27xqxwKgpGE
	LG1yw5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZKo-000000060wq-37Jp;
	Thu, 30 Apr 2026 21:54:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZKm-000000060wR-1RAf
	for ath12k@lists.infradead.org;
	Thu, 30 Apr 2026 21:54:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UGIcld2121658
	for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 21:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oD/hwFjD2LNpSn907GkM770fKxCvjrV9J6VUXwvJVyk=; b=IdEFwmdNbwRqQAUT
	vAqHPqSgxaw7LsSVuvKhZPLpEAHKjn1Ki6Jnqqrk1QvKXji/phDgmnlL8tHKULUE
	O9hdHa+4lDOjdkmCs/YnSTmcA5Ud76ozHgkaBSLyxTLv+ZF9utMuLofw/3rqmz3C
	JX82xY+bbxh1IWwrbxNuM2viPwOVg31LCfUZa+tbBoI4kJGsNbJrktB9WZqKVQYR
	6wxQz+caN++kiHQz7+IUhRRvmYd35ZJunzBZztaP3dn+tdldDq8kppgEAqnlHpM4
	exMqdREdWtVeUfQ0Pw8YUzzUBdfMJvlB9SE10AIID8JB3aykpOG6NpIBU9U9c74Z
	0ebbdg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvag4semh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 21:54:11 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c8de02a4dso8047044c88.1
        for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 14:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777586051; x=1778190851; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oD/hwFjD2LNpSn907GkM770fKxCvjrV9J6VUXwvJVyk=;
        b=kHqbO6IMzfzbOqvry6WaXNIT0lxhAAiwsbXQbiU0mLUTpN4+G03AUr50eJDaz8bT9C
         7FYXdd8vHEct7eggQGX7u+5SsphkfaDapgxkzHOm2f+JR63cle2+N8EP+P/FbUeTTI02
         ZigF2M4r8NGahcP+dBYcFKRZ1S6jvWvZ36ShSvVQbMnchVn2fqbSHZcpxveUSLGYU1ip
         hpgK5hAqumb/Tgomlc3VgugSsWu6Qm8YW/rXRYLNas78MUCoCFrkpRoaL4Z/kZOSIUkf
         PKds2V33q97QUe7MAMvIPku4kQ+wLOjF6iXo3cNGUJa1NH/tGgbliX4eWFjb80MdCBjW
         a1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777586051; x=1778190851;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oD/hwFjD2LNpSn907GkM770fKxCvjrV9J6VUXwvJVyk=;
        b=Cc9jyg5/4C372YWDiU6/RCdXO9lYxNPEendyCcA77ghb50oycZa7jiacPhXdoiD2Ci
         UhNRxQIQGvmjcqSj+QlT8V2DV1GPnitikg9MnPV173YxjoK6VhOG4UWdN3k/WnoQP0u/
         SvcgiIIUQ4+DC59huvpoJ6Jy3UiWLdtRGTTcD8XNzQMo8X1zUuUuELtScBwT/AYZED/f
         ECEsK+dO6pJVoaGsPFPEyUzyXwrhXbVPhl4ZeEh0az+fHi4rQ2ZfqCVdF85Pc+fXxLsG
         7h+TBjE70w8hnwxhoWHSCfRxpfs0I+EA38O9HWqEAq5MnaUINP2pV1awmv//dB0ImW1e
         CBUA==
X-Forwarded-Encrypted: i=1; AFNElJ9BWYABJcxwkeAipkq6Z4zWvhZZtKDORIYqSH1oYIAEygDjCYSSYBps6o/QPXGOVp7SRDsFMlg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUtQygJvoxbxtJY8S5bNAPOEiSXde97qNCIpddlguZT2ZvHvpr
	xu3CxuAoj6fulVO7Omg4tzWsLfcjFcTocHX0PAPKpxM8h7xTtsPHNyBKWuF6vANQjcNBQQRdENn
	02Sh2OGBkkRSGUjriwz1++jZNeRPn0ZzN+i/cvlIDhcDlx85Hs+Fa6+8jrvomt/t7
X-Gm-Gg: AeBDiesF2G16Ty2e+MN+pcf6balnMjW8QaHQtHOHSI7xQAflBIL9DviZnRehq7qHaAy
	0IC6YonOwWwZWZBaK0fRX85smeSvfvzRgjwBu73Wje3SQTrpYfdUdzJqoA6BZ7iVGN19J6dhqC2
	zr6hfNDz7AN7dmzrX+BHN/ximu8mc6/nyczPe0DdCpXQHngISu98ILMXlgZl0cZZ34lk9F2Uedk
	mrub3tsKi4s5EqSfx9L14lZZJn2ADBweTtVuCgGNIKnyGDh1pUMKTAGZT3RIOlSY1XvxCMZJTYp
	2txRS9ZR/44cnsosRXcwINTkuN4mt9SAyRjnhMgno/k2rs5bRvb3+8YoYAGqHNZ/mv3WmYFoL/K
	r/0eF60nwzacEZx83KxlzhMzN49nLrDbSh+c5BBgc0vPN9oPi3FgQBuyc5UpEvsJq3MaRtbz9Hq
	AAS1eHEqZvowgSL4EPxTTLN+m/
X-Received: by 2002:a05:7022:258f:b0:12c:8f92:c6ba with SMTP id a92af1059eb24-12dead0b926mr2583412c88.34.1777586050770;
        Thu, 30 Apr 2026 14:54:10 -0700 (PDT)
X-Received: by 2002:a05:7022:258f:b0:12c:8f92:c6ba with SMTP id a92af1059eb24-12dead0b926mr2583395c88.34.1777586050260;
        Thu, 30 Apr 2026 14:54:10 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8287711sm416994c88.4.2026.04.30.14.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 14:54:09 -0700 (PDT)
Message-ID: <67aba8de-9a4e-46bd-936a-688abdb5d01e@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:54:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath 0/2] fix leaks in some WMI error path
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260424144813.1708214-1-nico.escande@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260424144813.1708214-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VrXsefyNuqu6hPnBBVZgT1JgrSzTA-_A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDIyNiBTYWx0ZWRfXxBTkko/msc//
 r8BQBjXh2fwQ6EX5A1UnRqwDwype5z637FE4iDzpY9v9M2iULoYqUPQwuGABoeQWjy05ziI4cEh
 EBmTa4S99md8O7iold7mqdqoXfi+ISZ9Fa/6hQqayBSQUbjlRgEj/0blWFMWIzqeyWoW5V2lgxE
 XueFKQDbL1L9tvAc/ZG1H6PEwUqnA6hQxa5ws+4E6i3jiDgoyLWpvNhtXEtYdzNFdcGXCRRSYV1
 Q00zPp7IGr09clhmw/JY/kNAw/gm+MpsozWJ0eguMj6OYm1z8jptx3Sbw7Sl0zPKsQAKjeQwohI
 CA24rxqhSHXzh8j4fSGCxJ/dvOI9y6v3vQ3LkDm4KSCEP0PmxVxPG+Y2vSRlvCzQP56xrYXt0ss
 cCuCB3obV17sSDNPpGctMqUi9rXGUYB7gYev+LjyXt+GIFm9wO6DMu7JVy8CD+0OQEBU40tV1r+
 YUh0Cm74lQFVSHskdLg==
X-Authority-Analysis: v=2.4 cv=UcxhjqSN c=1 sm=1 tr=0 ts=69f3cf83 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=FqyUr2HIOI8AG8dd71AA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: VrXsefyNuqu6hPnBBVZgT1JgrSzTA-_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_145412_410950_5CA0391F 
X-CRM114-Status: GOOD (  13.54  )
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

On 4/24/2026 7:48 AM, Nicolas Escande wrote:
> So this is similar work to what has been posted here [0] for ath12k.
> 
> When we use the pattern 'return ath11k_wmi_cmd_send(...)' without
> explicitly checking the return value we fail to free the allocated skb.
> 
> This has been split into 2 patches per Jeff's guidance to hopefully
> ease the backporting process.
> 
> [0] https://lore.kernel.org/linux-wireless/20260422163258.3013872-1-nico.escande@gmail.com/
> 
> Nicolas Escande (2):
>   wifi: ath11k: fix leak in error path of some WOW related WMI commands
>   wifi: ath11k: fix error path leaks in some WMI calls
> 
>  drivers/net/wireless/ath/ath11k/wmi.c | 131 ++++++++++++++++++++++----
>  1 file changed, 112 insertions(+), 19 deletions(-)
> 

Please repost and include the ath11k list

