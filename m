Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117BBCD4851
	for <ath12k@archiver.kernel.org>; Thu, 14 May 2026 05:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPM1o9fLzpUSz4NKGWQfQ2x73fQgq520PvfqDJfaOWw=; b=q8gR/nsVtcEOd1qwprkFaYAX//
	YmrSALWgfC2eOtY9P0/rHazqkO5T46PTgJE/0VxbmfRZSIMH8H24toxtNHMYWI+1ny/nQNJ1aKMz5
	liXFxPNh0pt1Xuq0zWekT/GN5K4OcMTmoGGp3+GFO/1UQ+XLkvfFOgdYv5nnmyrhGW+RA4+10L2cz
	cgbb+OhmgAdeOZSiXb2Gxs+RINZ+hWgEWQGdl+jM7OOd5q3HwDISD3nhxqich8BBZm3ViiEe4p0Oa
	9InAn/AKBLWuxj88q9F15t2eseeH3Aia9IlzOFighGTpT3qfWritA67pKwwE4hO2wwBBJlPcU/FC3
	LoxdUQpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNOCQ-00000004aHb-2Qhf;
	Thu, 14 May 2026 05:01:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNOCO-00000004aGr-0eAn
	for ath12k@lists.infradead.org;
	Thu, 14 May 2026 05:01:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E2xfg71095445
	for <ath12k@lists.infradead.org>; Thu, 14 May 2026 05:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TPM1o9fLzpUSz4NKGWQfQ2x73fQgq520PvfqDJfaOWw=; b=ZWRTZd4RqwNUakZ4
	f7j5ifoCHnOianH8WwuIEK4fwVUFS/AS/LHqhntYskT7655nXRyldcFBYPLdo/X3
	FhdzitY3HA1WHomkCrmcYMvl7W8X/Yblp9EelrU5DlJ1uaIuD5bV2vicbcJffxFF
	6jqfkrhvyqWluNP+hMtvYTIPFovPQSOj0Y+htNgzE6CTcZSfakdfnzzlesVML30/
	5ClgMOwnwUJ4HiXkbnZMZ3baCHKHpTEU++R3hF5SUGfY8lAkwAGclLAoPo0/+YnG
	e5eQ1vA4iUAu0XZV3gnh0Zvq8IXAQECF6vPulPCnlBlNujXLuLr0klEmetWSBOR4
	K2Vh7A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e563hgaqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 14 May 2026 05:01:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4678c6171so80463975ad.1
        for <ath12k@lists.infradead.org>; Wed, 13 May 2026 22:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778734886; x=1779339686; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TPM1o9fLzpUSz4NKGWQfQ2x73fQgq520PvfqDJfaOWw=;
        b=NAVA9wYumnfu97/rUI9UFu7dGKrnVnu2WA1CdEghtsdtYkC/TizFNbbGyfATPM2DkW
         WapUKEZd70iR5Sql2YGd1Q+bV1IAaz6XQAPSR96wxx/fubDmBWVvhH+AEI9dIJ8ND8nM
         /eMs2BxHojlUynZHCuLrOu85o2q4mzHSMhMAQobHmsRTMEKzNDfopz0bpDliO3dgdhLQ
         gxIrhdn3IpG5HrnOgxzpejpYStDedoQzQ1tYvyPuMSxhzxrQ3T1wNWfWN7DsSm7rf0+0
         HUi1TUHasIxshAi1tlnEvYPTRWALJrzMPIq17/npPv/Y7zMWnQF+X+AFsdtoqkECUnsU
         /r9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778734886; x=1779339686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPM1o9fLzpUSz4NKGWQfQ2x73fQgq520PvfqDJfaOWw=;
        b=CEeuwzSkc3HtFU1TY9yc6tNnMsPHcpjqDlthQj6Irf/zyIaKpSLRi1sQgVsxnwRXu/
         d2IgY4NQ9GCdtKaTzHTkFGhYLYsXBAfVFNVN5DLXUoWYk1JTQhahISR3TMmxKMdl+74n
         SeZBAUACe69KiYMPrPt3L2AgVsPfJRjTOhFSGR6ti5S3ev7WOlroKfi9CqVvUL0d5+fd
         qW58ihJh6yslzJwyhtG4kB2fmoo+BJ9hga42DntIvvmiDEGpvLCeLN0/eomBnrW6gQ24
         tP33rxs/vHuevgnEp1tB1vDo0NJo6IOGO9Cv5u0HmCW2itPF0GJ8bVPVpn/8dszqA9F5
         +/VQ==
X-Forwarded-Encrypted: i=1; AFNElJ+oBjd8RlorlW5surbQ/Doh4XUIZmHeev3sbg6AGTpy9PTdZlJT3YOkxXq0m2HiX1dbacrI6K4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+6j9yKvqosQk0z5QQkPXLbGa6HXEGSiSusSkrcfCmcVWyfgiE
	si0kCDjVclQS4df5Qt4SLpFs2g7CIxiFhdprRczxA/yn1HPfu3Xi2ReUczHPB6rpZT1qOPXA6vA
	RbSKQ5STpWBEiH7QkJj8tKTP7Nm+YhrUYpPlgJOm3h7aMvXE9T88jl1h5khRom4LF
X-Gm-Gg: Acq92OFV+gt6BFpEa5xLHIAuuWcIRgsOLHcoLtyJ7tWQES7t7h0utueK9C8Fa7ZHamr
	x9uWihVjY3g1Ob197bFMeWVwJf+73k3J8VfE/hRSfHMoJQ1b4MZ4XuCB7sbvB3UliuWJnXFt8fb
	A2P4aP/ESZoWk3BNM4X5u+o9MGy+5JHcbuCfh8TbpcJN6lmZrbh9mfq0jZMFaTIbLOpZX0bkIAH
	ApSILOezoCWqBlzG5ai4VDkt6G90XlrNvbcXYW4lCDGb5MxRIcVKlModUShxCHGq2AjRHngaQ5b
	5V+0xNz6luDool9V+jV2KK/FQWo4W/33GTNDaO4awzYb+E9+MoWYet3qlShtB3BQCo5G1OPjAhT
	8RTefHfF0mzWZuJpVgfafwu9oSbCqnwaH7USJH8GC5Wn7eYgEkz+jmj2eGItiCg==
X-Received: by 2002:a17:902:ef0c:b0:2bc:db35:96c7 with SMTP id d9443c01a7336-2bd276dc126mr68369385ad.28.1778734885536;
        Wed, 13 May 2026 22:01:25 -0700 (PDT)
X-Received: by 2002:a17:902:ef0c:b0:2bc:db35:96c7 with SMTP id d9443c01a7336-2bd276dc126mr68369025ad.28.1778734885026;
        Wed, 13 May 2026 22:01:25 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fc80esm9432125ad.64.2026.05.13.22.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 22:01:24 -0700 (PDT)
Message-ID: <3683d8e1-5d53-47a1-84b2-7dcbb8ad20ff@oss.qualcomm.com>
Date: Thu, 14 May 2026 10:31:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: Add support for handling
 incumbent signal interference in 6 GHz
To: Amith A <amith.a@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260511040242.1351792-1-amith.a@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260511040242.1351792-1-amith.a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: thw_AJlt1aALOuDm8jspFpgwx2A9OZFU
X-Proofpoint-ORIG-GUID: thw_AJlt1aALOuDm8jspFpgwx2A9OZFU
X-Authority-Analysis: v=2.4 cv=DewnbPtW c=1 sm=1 tr=0 ts=6a055726 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=K02wEsJf6PS1E9QpTVUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA0NyBTYWx0ZWRfXyrWx1ck7BHqH
 2D9IOL9XQMekdM5vUJv8ggfgiEG91oWz3/F+E/E22MQOyYd+nLg6a7CTS01eSOsrMDKRYwVhz89
 YfazbnOF0thidWr89blhw/Gn39g5fJwYMCoDWxK35kinJ+oICgc+QcA4EEovmS1AW+NwB7OwSen
 L/4zAN4uChGVukqIPRj1klOiR64xcU2gIF5QZoWS/ZdwyJAQLX79+ZtozcAUgMLRzwMtt+LwqqU
 DdZ0ui34LbouC6MzLDHo4mkGc6Uz0+yqKcn6714fhFRvD4zwF5Ft+fzCRIsAurF2qSA5LkDAFzW
 a+O5N3dTE6d90Psi9rdbU59afMY5dgoolHTnbNYsvsznsIPk96AEvsYI+XRNydD062BesE1j6v+
 EA7BcI05QPYNSiKLbTgte8hHOqB5kX8+xA0EU1wxi5xrWj75zo8khCWyPlm85o+ZVDumJe80R0m
 sIBXjwSGEicxBPs8cXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_220128_363514_63DE3CB4 
X-CRM114-Status: GOOD (  17.47  )
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

On 5/11/2026 9:32 AM, Amith A wrote:
> This patch series adds the implementation of handling of interferences
> due to incumbent signals in 6 GHz channels. When an interference is
> detected, the firmware indicates it to the host using the
> WMI_DCS_INTERFERENCE_EVENT.
> 
> The driver is expected to parse the new WMI event to retrieve the
> interference information, validate the interference detected channel and
> bitmap, and indicate the interference to mac80211, which then notifies
> this interference to the userspace.
> ---
> Changes in v2:
>      - Added an explicit len check in sub-TLV parser before accessing info.
> ---
> Aishwarya R (2):
>    wifi: ath12k: Add support for handling incumbent signal interference
>      in 6 GHz
>    wifi: ath12k: Add debugfs support to simulate incumbent signal
>      interference
> 
>   drivers/net/wireless/ath/ath12k/core.h    |   8 +
>   drivers/net/wireless/ath/ath12k/debugfs.c |  46 +++
>   drivers/net/wireless/ath/ath12k/mac.c     |  46 +++
>   drivers/net/wireless/ath/ath12k/wmi.c     | 425 ++++++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/wmi.h     |  72 +++-
>   5 files changed, 596 insertions(+), 1 deletion(-)
> 
> 
> base-commit: e12d2d3983acb150fd987d19ec6a2a530da110df


Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


