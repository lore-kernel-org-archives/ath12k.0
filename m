Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A43CCF9FA
	for <ath12k@archiver.kernel.org>; Fri, 31 Oct 2025 09:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r2gV9G+uV+a0gsM+/uOO6OJ5yTgkshM4YxjarPszGk=; b=KkVZeOzAFrI39sbdykp3g9pzOV
	//w+CkJJsh8169TKOQfe3RGH7n/PtzSjHwwtK8DH4vBgXtT6GSF/M6B/UceMd4pHwY29BaEKWJdCI
	kiE04FFX6+ehi/Vz/0Egiyk0g9/CB0ZwF18mjdwb/vK5mM0lmROMhRbdAN8gSsU4CdHFQC3JWwnLh
	59WbgFI0E7Ll6dmWsUwkjO/x2WkdeosLJCaiOgWmWDbXB70TYGNQTFUl3JO8XSWGzcHefbbfW/R/e
	5YVLdxK6Cx1vjLLioVU6gb7Wy8bNqz1tRQvLOs2JqQOuWVeMdPRBCTNOJNW9v/pKfFmExUVOP1t/x
	hQgTRmng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElf8-00000005pEU-0p0M;
	Fri, 31 Oct 2025 09:43:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElf5-00000005pE6-0OCc
	for ath12k@lists.infradead.org;
	Fri, 31 Oct 2025 09:43:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V73QE62058894
	for <ath12k@lists.infradead.org>; Fri, 31 Oct 2025 09:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2r2gV9G+uV+a0gsM+/uOO6OJ5yTgkshM4YxjarPszGk=; b=jXUA5gQrby5Hb44O
	SzfrZXxE5Jmb8dPSTuEyjrZKXeEbUW9OgUVqnb32GnMEj2gg2KJ+z4L54+C5wfKR
	+M2rqbSt3oQfDIXMklPHNRSwtkHkwHZcB+EFsq3QXkiVq9qNTI8e69W3I5FZeue0
	v/RXUCyoUw0Y3RcTL/q53itPwZsJT9nfj8ZOKp+sA21K6krieliiwTVut6oVS0aT
	Zw/uJJgjOrgy2yCkiehdtXVu80ZmyrC+AWIG5ARTA2C636DU6b1vr9tGr+0tpQ6A
	QrCNiWOHbsszrU8CCVwmB8km5Hzfo+nRMvN8nisBv054r3QUHYnAXYQG8VL4JonV
	rWisgw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4rcvgesw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Oct 2025 09:43:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29085106b99so21313225ad.1
        for <ath12k@lists.infradead.org>; Fri, 31 Oct 2025 02:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761903790; x=1762508590; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2r2gV9G+uV+a0gsM+/uOO6OJ5yTgkshM4YxjarPszGk=;
        b=TT3GOOXxdyxDVmT67SAq+kUiWBOqGGENseld3Dradmf/6IQqHu+0gTQekAahUvKaAC
         H9BJduovqMUvl0xD6xVc8PHEBWxiIhXl8PS1QoMikL6EKKoX45wjfeAt9C0VpETv7X6O
         ZKno/SRe7ixg5We3pB/UB19z5YozegQIZyq09kWEagZliihQK9DUNCvOsrKo5p1g5eP0
         wYeAp3++7x5hn90eRdi18qlQjjztf1Kbkr8fppd67rHMd2EyAQpASsFd9Le0nTdvV5ae
         0NIhVPmUvAML6oLU+xBY/y8Nv2W6GvjVZdGwDmyMxwYzfEDSW7IH26Ke2NGwxXa2scRL
         dUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761903790; x=1762508590;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2r2gV9G+uV+a0gsM+/uOO6OJ5yTgkshM4YxjarPszGk=;
        b=wr45sP6L8IrTzF5JjR6ERptKzouECp0kZL/mAicccNqPIqpwGKSSq6RuDLQmJIOOQc
         ChwBwbYVQXofERg8RChkIlJHJu9WMh/KFjB4O5fHXI7beami+uSSb5J0/+UviCkCR4Zz
         Ax0MnXTSxOtu9ltqZXhytYKzgKQEpOCzvkjOYInf5d6OTFkX3j3evWiOb0Yl/9EXvEKM
         rFGd5YZDxVkFLsgR3V7iFaAeCKHU++HC8P3AQcn8RPheE9I0mwrl4l4iLIFQwRy1hxRq
         4hdmcn2GWHpQg2wOVE41m8yke2Y33zVGfDEaA9SBEIOsjW/2tFNKIxpwq2IT3AXT6OXT
         Sz/w==
X-Forwarded-Encrypted: i=1; AJvYcCUkoIUHdaXimJq0xt0um70e8ZAwAQCEllbsTe87TNBDfgmfrFebKV/HqOz75I6MMzuRYELRQko=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYjgXNp3nYYufThfLG2gveU2oCbBfp1A5PLU3ip3vnpBsLKT4s
	0DtbQg24mvYHUZtI6DaSC2LL7SJssSL8AfK/FG102OVPesDLPsEWQeBOkEkUtsMYSBlzKkQJQpl
	Wq/6GNHfdv6sgXlZS589TblZcpoEqfTDQ3B9E/s9cY9S1rPSkFa5EEsjURuJaJAkX
X-Gm-Gg: ASbGncvrxI/NrYQPn2O7PF9ZTz7VNHl0VJ7NRpm/+F9N197zoYZBjNLNmjSKc25cE/l
	k+r2igLbcFTYlz6bcP1CpjW6FBx9cDPoRZer4kTOPBC1bALmLbsgZ4Ru2jTXu3ddxg/xJsErLPs
	yScQwBh5zzpYnEnVEBsWQTgA5Z1ejHkuiujb2IVOHXh5/36tnw9csGtoyxag8W1YqcDYW4MjYIU
	mxVJURFG7aB+4np5qRxQEWKUsuJyEQauXXn9f9wSUFRvFyVZ0dc04Zpfn0Cep1RabUUdqS+aEH0
	dUS06jUlywC+PKExaYVT1WowiB4sUkGEGPz49/EfqQVDTQ4XLb/9cP8MCvoayMq9yiKdS1+PYIC
	/DBRHqZFNrD9pA/1Dvzmy4CGCQvOQvXEWll7qCr9GWfVI
X-Received: by 2002:a17:903:1206:b0:294:ee1c:78c7 with SMTP id d9443c01a7336-2951a527091mr39290895ad.54.1761903789595;
        Fri, 31 Oct 2025 02:43:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERLfHB/VUdV4k5DCZVAbH2GtHr7Y3ncuGgFQmvXGxpBTJEnJlVQXZT+YvVvgQGm9EO1kYiVg==
X-Received: by 2002:a17:903:1206:b0:294:ee1c:78c7 with SMTP id d9443c01a7336-2951a527091mr39290645ad.54.1761903789126;
        Fri, 31 Oct 2025 02:43:09 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29526870f22sm17183475ad.12.2025.10.31.02.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 02:43:08 -0700 (PDT)
Message-ID: <4f4184ed-508c-14e3-122d-b8e3cfe5a9f2@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 15:13:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Address issues during beacon
 stats retrieval
Content-Language: en-US
To: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251031-beacon_stats-v1-0-f52fce7b03ac@qti.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251031-beacon_stats-v1-0-f52fce7b03ac@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bJYb4f+Z c=1 sm=1 tr=0 ts=690484ae cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_JD12454azqmeQhFCGEA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4OCBTYWx0ZWRfX5loE0HcdNNBf
 +6KGwjekUiBDbdqMzaiRiRruOKG5HY27VwLKxVyMqJFI0dKvdd7PKvAYgZT9wktnsnC+FAz3yTL
 rRfpWs0Q3lFpSFEFCN1p0HbdktNkZ0soTpZmnaatqt+vr7RgJ2qlWEW2HIAxTZ0Clfc1hlir1FO
 MyvEgjC5Sjm1EYp+dGYbtqPbrZKN8K8xpa7tX5eEq525KDeX95xyhFjwycJX/dBhV+JEhAbYJBZ
 YkB9z9Ock2g5pVrERsRq16T1voL//n3YrELs9Sopzbaz6yk0KKGUg5CnSjXBkCJrbiO6gHM00pG
 L+NyHOCFxZvpBjISu6JVu2zvaKVinBG4AWBNlS6WIDitxfIBisyeEDhKTU5TmUYGEbfVS3yphXT
 UQjj/BThgW5ZYofVJL8jGI6MZQoZJA==
X-Proofpoint-ORIG-GUID: ZpL6G6r6d4PoqpiW0fTXtsDfwrjd4wpo
X-Proofpoint-GUID: ZpL6G6r6d4PoqpiW0fTXtsDfwrjd4wpo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_024311_145454_0C1E8714 
X-CRM114-Status: GOOD (  11.33  )
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



On 10/31/2025 8:37 AM, Manish Dharanenthiran wrote:
> Currently, retrieving beacon stats is getting failed with timed out error
> when multiple BSSes are enabled. This patch series tries to address the
> mentioned issue by the following,
> 
> #1: Reset the firmware stats only after retrieving the complete stats
>   #2: Remove the wait timeout to get stats for all enabled BSSes during
>   beacon stats retrieval.
> 
> ---
> Manish Dharanenthiran (2):
>        wifi: ath12k: Make firmware stats reset caller-driven
>        wifi: ath12k: Fix timeout error during beacon stats retrieval
> 
>   drivers/net/wireless/ath/ath12k/core.c    |  2 --
>   drivers/net/wireless/ath/ath12k/core.h    |  1 -
>   drivers/net/wireless/ath/ath12k/debugfs.c |  9 +++------
>   drivers/net/wireless/ath/ath12k/mac.c     | 15 ++++++++++-----
>   drivers/net/wireless/ath/ath12k/wmi.c     | 12 +-----------
>   5 files changed, 14 insertions(+), 25 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

