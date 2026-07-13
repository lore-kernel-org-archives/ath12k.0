Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA83C43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 03:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8rJJgcg5hWvGHnmMlB/vJr/mhGZXs+mdRV5ZzRHmeU=; b=ZWegmvshfTbj+s5h52wFut2hvN
	ZuWjUpaN2DG56mYOYnP1WYQSVhXX4AUeIaUhtbG8kxF517lmybG7JSScAhbvQkTZBssn5wdImCHJn
	g7g6sbhZ2wzXt+2BeVOhJ5itbuMrSXxAhuSFvvN1H0DHAc1quITfuFpZY9KIM2W2jYHVQDK3kPHzY
	Yb+l0HPsRCZPgHy6au2I5asN6BfukRgp9NLfU4lw5vpDL1cYEZTsm1sdI5tdZ2YkhMH3ETPHK+F6B
	Q2j6WIR/zswIRqVRZtyxyaxl793+8CPBcMs4hA2MHBCZvzgsYvGSMP09oZR7JB74l4C1FANjfAvdF
	n4d/w10w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj7Q0-000000082ci-40Iz;
	Mon, 13 Jul 2026 03:33:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj7Py-000000082cG-01cV
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 03:33:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3A7p5257754
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 03:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F8rJJgcg5hWvGHnmMlB/vJr/mhGZXs+mdRV5ZzRHmeU=; b=W7kzXzAXZluWWEvH
	JTbb6yvH1bVwlZFG+jGdqx7rRU0w9KsdWKvmG+eOClmVhveyEOEaT0svjCAR17MH
	R1EH8oqQNywTq3yyh31eHVSMoaK6oU3E6ABrSlfsSA75B3hMh0lQv66wC5Al43UK
	RXz2fUqPcv28zQCaPdljADNl7o9iBf/mEDjAQWU+kYOUulFX1nwuyVeZEGUBNzuO
	JKH/4fi5WIsIYO5AYxrY7GoSOIAhiGuT7FTKzhENzlc4l5jfRTZJSa8ckf+E4Qyh
	bP1YW7dHNWpuni+nYlmeWWtdZ28F+ZqF9puk/c0flttusWM51N65yoU0feAmkRg/
	AgKE/Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe9hm7dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 03:33:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc6dd43737so58054485ad.2
        for <ath12k@lists.infradead.org>; Sun, 12 Jul 2026 20:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783913596; x=1784518396; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8rJJgcg5hWvGHnmMlB/vJr/mhGZXs+mdRV5ZzRHmeU=;
        b=eXQSqrRaLYXcTfwoRrUsvOcFVzCyI8Z1iuaMe7LXNce949rnBqAQnOyDqhUsJ7gtYE
         u4Poy8SGZ9ccyBH7MQ8gAj3xHYoi+gHSMM3Em0pM98rjITlPH166vDK1aNEKlTBpd63N
         /GicytY3Evuw2vHszEkCibeCo22HeqMmgmIzUhGiKlf5mIJZTj7bRs5CGeDj+mwxo0p0
         mL8C37KyO9jo1QSBDlKKwdDp2L5o55cj5KDFE6SE1jqlQilS0hbzzr99qSYmxeL3tEjZ
         Pckh5b4xHqsu2eDTrIFA618VkqpOwbJvms2q9j54JQsS2S54KfxneOwfBWgtm97q+sJw
         V8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783913596; x=1784518396;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F8rJJgcg5hWvGHnmMlB/vJr/mhGZXs+mdRV5ZzRHmeU=;
        b=c2zSyg3dIFZcvdLYsJT6pg0S3RI1yFOVeKaZbscCfOjB0Rx6gIkU2/+p/FWSZk5cY6
         nTd7tlv5s+sJeoKh057NW9b23Nt9KKjoRI5VvArpj3F/f6sr3iAAmJDqBKqjzcfaH3La
         Vl2o/yFKFs4SQmMlJb03nhqhkieCJi13brKoNyEmp2STpTYN8Pd223x88VrBCI4rhdMY
         nO+ki3z6ehWbQ+iSskLQ2RCWvlbF0+1Agk/2Oct+9N9i2m6XPv/AjBiUJPOD7Wu0wr8O
         0SkW5R6ZNmJLfn3VZ6X9NFBfwI9acqyLEVfM8ggxulmNV0ATcb/ICdb9R6Fr2hBCcPwQ
         SmdA==
X-Forwarded-Encrypted: i=1; AHgh+RpGncPuNi1AOpmAo5Rc2Xg0lnEHnQhjevaS/8VAolWqZ8ux3pVjswN9Dn8nvWKA4xcCoELBPto=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Ka7U1N4r8VrYb7jcFh7biPPhqOTTS+OWvQ+DzNUCxQqPWXFV
	oSdg7w5Uel7caWeDDmZUEa90I+un5IAnzk5UyxWnq1lLaqedS5XNGxQkDA2XPg4q+K9q6j2wLkS
	peK4lq7h6nD5bEQCetnfWQ7UMHIDhR+wIsYdIVNfY6zsgsuC2+LCvgjlW5Yy0QFQp
X-Gm-Gg: AfdE7cmUds0ZrW+C+5VOvCP1Vkaz5gYl5I5SZPV7veHRBv0HkiAmt4dZ4OH9qhyPWS5
	m8+ECJyhFdUJlG4t4GqJDCJ6MpBoXcWiq1cL1Avjc6MbWdaw2NCGSzXvmVwiJ2YwCicV4JcdHBY
	kokQ5RY3TnF9tr4mN/2P4wNeYY1yrHC/VUL+C9wjeAAsL0F+djf9fe8SfKeXn3/06qFDL//hwf/
	2gxQgF1cOP6uzqoYsJnB41jods/emC5Qh2BYx3rjQD4WhWVga13tdkZXOfCSYssQnajQyTm2ghX
	tLaKjK2FP020vSCzjUEZV+9MLR0uFJHxtOrcgUI0SuGwwSOI2HGFufR89RU3/zog3TRYaM+XG/j
	9YTnRw9gQgJZDn30BIBVxSSHPQIHj/X3vK3TyCWa6hmMkNbdmFI6VgFx7Nzl009pfh7KntwxEXr
	0TBiG396E=
X-Received: by 2002:a17:902:d2c8:b0:2ca:ecfa:1308 with SMTP id d9443c01a7336-2ce9ead153emr73387175ad.20.1783913595834;
        Sun, 12 Jul 2026 20:33:15 -0700 (PDT)
X-Received: by 2002:a17:902:d2c8:b0:2ca:ecfa:1308 with SMTP id d9443c01a7336-2ce9ead153emr73386885ad.20.1783913595299;
        Sun, 12 Jul 2026 20:33:15 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ce7b3755a3sm49385165ad.80.2026.07.12.20.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 20:33:15 -0700 (PDT)
Message-ID: <c7d7e6d5-88e6-4bcc-8c35-8fd48d8a5464@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:33:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: release QMI handle on late init failures
To: Guangshuo Li <lgs201920130244@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260708100924.744386-1-lgs201920130244@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260708100924.744386-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Bwa4RmqmTP6DJ7K-vMlJZQopF-zcnUX5
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a545c7c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=BBdAH38HxtlORMPQ_CcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Bwa4RmqmTP6DJ7K-vMlJZQopF-zcnUX5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDAzMSBTYWx0ZWRfX2R/6xiz8Pdjk
 4AFA3/Nw/OGrGC6IcSONFRXye5SHQjxmCwYsYP72lgxH9ErhcW0Os+4g9jUiv0QNx7Py4fuY6m2
 Q3RvdUAvthdT5PKN9fl4wrJ3eMtgq8NLmJZjpzsbjz5NqfXQ/Ashd+7J26/8Pb3p/ZpG3U3YjuB
 YnY0/Rx9TmjFjckjP/8UNZ/GMq65YQvqOc/l+HM8OZ8I1JvOESUI1TnPRdAYAAhxg93fVazXAnB
 RsLbPUrTCw/v5jtsravCFeGhOIqziYzAKr+SLOKv6gMuXAdXdvcrEmPGEH6JL9UU0oUrKvCLecT
 UTxg2iH8P/JJFMCIL0E2jPsr6jU1kCDG1LcbBb87l+ZnwCYeAaDv6XwLxcrvbN2IwRFIgQUnF9X
 /ucpzwO6N1JfOcaKe7BFdIfj2QsvvV2jrNr9XYWJHhI2Fcxa11DlQa1TbV/zKzwzd/D0FoQVHB1
 aDUKBCitV12hcA6MJCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDAzMSBTYWx0ZWRfXxFum2dCq7miY
 EOmRc/ak62dXLySAhSmgp9Cef3NFhtK7EIItSi8PVVazFKi95UTBckdXLIo+z0UUK//4zpAVtf9
 pRbIyl77oXL2jL3P9RopUgOKX6zPQuI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_203318_169189_DE4B164C 
X-CRM114-Status: GOOD (  22.39  )
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



On 7/8/2026 6:09 PM, Guangshuo Li wrote:
> The change referenced by the Fixes tag makes hardware group creation
> skip the device whose ath12k_core_soc_create() failed, and only destroys
> devices that were created successfully before it.
> 
> That avoids releasing an uninitialized QMI handle when qmi_handle_init()
> fails, but it also means that ath12k_qmi_init_service() must clean up any
> resources it has already acquired before returning an error.
> 
> qmi_handle_init() can succeed before later initialization steps fail. If
> the QMI event workqueue allocation fails, or qmi_add_lookup() fails, the
> function returns an error without releasing the already initialized QMI
> handle. Since the failed device is now skipped by the hardware group
> rollback path, that handle is leaked.
> 
> Release the QMI handle on those late failure paths and clear ab->qmi.ab
> so the failed device is left in the same state as the qmi_handle_init()
> failure path.
> 
> Fixes: 088a099690e4 ("wifi: ath12k: fix error handling in creating hardware group")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/qmi.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
> index fd762b5d7bb5..31e9fa9a62be 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.c
> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> @@ -4054,7 +4054,8 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
>  	ab->qmi.event_wq = alloc_ordered_workqueue("ath12k_qmi_driver_event", 0);
>  	if (!ab->qmi.event_wq) {
>  		ath12k_err(ab, "failed to allocate workqueue\n");
> -		return -EFAULT;
> +		ret = -EFAULT;
> +		goto err_release_qmi_handle;
>  	}
>  
>  	INIT_LIST_HEAD(&ab->qmi.event_list);
> @@ -4067,9 +4068,15 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
>  	if (ret < 0) {
>  		ath12k_warn(ab, "failed to add qmi lookup\n");
>  		destroy_workqueue(ab->qmi.event_wq);
> -		return ret;
> +		goto err_release_qmi_handle;
>  	}
>  
> +	return ret;
> +
> +err_release_qmi_handle:
> +	qmi_handle_release(&ab->qmi.handle);
> +	ab->qmi.ab = NULL;

since ath12k_qmi_deinit_service() NULL-checks ab->qmi.ab to determine whether qmi service
init succeeds, does it make more sense to move ab->qmi.ab initialization in
ath12k_qmi_init_service() to the last step? This achieves symmetry and also avoids reset
in the failure path.

> +
>  	return ret;
>  }
>  


