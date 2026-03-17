Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799EBF3381D
	for <ath12k@archiver.kernel.org>; Tue, 17 Mar 2026 08:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OV3obMQI/7J+K630Ukd+PgokDskPuEquhbpR1hWlpzg=; b=pE3um3ePt021OrFJf/OtlkCmMM
	4EhfD3m6q6pI+2Jkb+yuZrylzb72GHMM9rCiIV3Rlq5WTfeqBnYHM7r5j7r0ypmwE5iM5rH/Zwpe2
	gQ3OcTAI21/71if7fauylYkAK++el1SO8jMFzEwxGvBTXtiy6ZDFP00LIdUzdK2ZSzy+ItKuBton7
	MkrgdAi7t+I2b/U3lB8o2WZC+WrdOMOOrH0jbTdHLZZr6mDIUEfM6e43i+XQb0GZAmTKIMtCw7b3l
	ITNaHZZqIlHy/7d512He1WPGvB+r8aPCVBHxTIJ9WFt89yhjIjMyZt+Mem02PV3YbRl8SlQT1hwF+
	xSiCWrbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QEx-00000005mBL-10g4;
	Tue, 17 Mar 2026 08:57:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QEv-00000005mAv-1yu1
	for ath12k@bombadil.infradead.org;
	Tue, 17 Mar 2026 08:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OV3obMQI/7J+K630Ukd+PgokDskPuEquhbpR1hWlpzg=; b=GmtHfloh8NY6NbTqd05xv+qs07
	x4QLAsmWuCM1bMk/20+SDry1DjvkxlKWf5vJ15T3MnbDFYk8p9zGo3QNnxivQZParU345fYz9Dhqn
	bxfKvEMCuve0yeeiTAjw0qCY89a6YxRAEniGtU+FoArsoUAcoxEpypUJRBJQwQDGWWnOxEZ1n0CmQ
	cbuD5nFB4QhZ5E59fceRqychL5IngfqLJ2gG1fAGEaMxFCAporFNPKz0KcID/9zYfC0ElaQ4EElOf
	X1OnftmNOSnNxmHirJagbhYwF+xr/zju/s/zcNc4AXcI7/HM/2grnBtMkZ1oPJKxUk6EJ31EZyBG8
	yOijzxVA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QEq-00000008T96-2sps
	for ath12k@lists.infradead.org;
	Tue, 17 Mar 2026 08:57:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H4NlAP1428760
	for <ath12k@lists.infradead.org>; Tue, 17 Mar 2026 08:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OV3obMQI/7J+K630Ukd+PgokDskPuEquhbpR1hWlpzg=; b=iUbIHtBllTEH6Rw0
	2lDK34soUaJvKtWFlJEp5DP9AbFgAonniIhUbmFYFkeUURa7STOxxloFbCd0YFI7
	tUR1TatwSMciw/+Zm7qTxXzz6UmCIiwRh2+BYLdRIs0rCrXyMVW0AfQlgLaHt3Lo
	elje1lOyWB05bC4DALFgHYKovxAIBA7TOxowyUnjBLiUhdygBfawWI9GCFRtmt92
	RF46+JeG9MhMk31QlBsHNN2Hgpc+EXNJqPIezmt9AvAAE7o//rcE/lXJdXUY0z+o
	cf6THapayIvToTdunrgDdMvRT8L8IEXbNVtuFDdZrsIr/jLIFqiOPVDCPtJ2ibtG
	CM0RSg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh99c0mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 17 Mar 2026 08:57:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35678f99c6eso4322812a91.1
        for <ath12k@lists.infradead.org>; Tue, 17 Mar 2026 01:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773737835; x=1774342635; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OV3obMQI/7J+K630Ukd+PgokDskPuEquhbpR1hWlpzg=;
        b=fChNHjnZnxRvSGbrVyk/winQPMppXbBzpN9K2OUssE/2+LclavP3IPT/VCnm2Guijh
         8QgSo0eF1ldxxAHXNi0gGG94b6AGS5N1F1IOVYIso1Nq0ZqeBic5QyQDJQ/2jd9OMW1A
         qiFPa3xrmA3Lpt2VJBrDGqFJSuxqacy2sC1fIX7ggy45tYd1eEpA+/UxBXqTpGrvt4LK
         dKtX/bwRUqzZqs0yPUGQlkRnlC2HNj1Nzs/xgUmBJrkZ7+bKGc28KtLsABSH757Qsbm4
         U9YzP+/EmLHiF3jvlMQe0gNCiqfPcrHV1WRCfn3pMqgyqOnTLFojCtoVJ9v+prBZpRhP
         LgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773737835; x=1774342635;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OV3obMQI/7J+K630Ukd+PgokDskPuEquhbpR1hWlpzg=;
        b=VUexU5fYYvFpZV4tluW+kA0qoTjMLOv/uxwudCud47N3qQ6y57EU5V8/fj1L12V1Aa
         PV+IkjI+05I4VkGj7xugDtpF7xOoLDNExhDm6q1z+4mcrRmlHQqQ53MiaPt3sp9J/mEx
         hrW7PgL82Pd9kXnYSalcv2t2pHDRbLs1zkXir+EX9WKpW4xUpgYe9hIT0ANemV805f/b
         reF6yiinj5vRFeY/lM79KKykvJTMKIBAeHkHZqw+DS33q+WGU3Elb/hzh3kKAeQ7YIri
         ZIeppB0ev8RVU5UBpsfdTh8Ad50cfHxP+d4yhRnPR6CTzp5ca/39M5CsOlqm6EUHRcSg
         QjRA==
X-Forwarded-Encrypted: i=1; AJvYcCVDze2snot2ngqNCgj2AzNzEYO1K5q1ChJid581ruL4AfjrWsTWfzw/lQ4vASQMDitt+ivZqck=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTGpD+Aw0+mKpmNzbHBFquT/D97fKebqFPamR9xy0brOaU1Eg8
	QVf3wj59tLtaY4vminZ7jtpfErew+CGB09iScW0dEL30T6pFzFBWQZOQAmDEU/Met1DBux0LTE/
	t9pkX24QsgqUCyCX18gptFvE74pCnm+QPCClZKjnfKOjfMpZq6w/z5vFQ2kiI4D5d
X-Gm-Gg: ATEYQzwFAnozOYno3drx2tgiXH7znb3lg3tyOj63JpnEqAXG79rqgZ4KNzi98u0UG13
	tDcyqAzALb+TVVOFHUh9WWGTTfG8s0gs9yeqg1iamr1eV3vdpA4SKFAz4IZa/1I7ueEd8g6YH5S
	tjEGOQ0jI/Tk/dcOrT1IRF8kjt4dU8WG8Tj7Lee8LwEWVcqtv3i08hpNFTHK7MNV7lSYozdyJhc
	cPvtyAZMA+pVdvZwN6LsvZ44CWB7t7e+qxogriuCUBiYUAFC6mrYgSH+wC+fm54RiRkCT6SKLS0
	P8yAyKMiGws52MoHaEZs4nzl4XSL8yHXHuQvCZV5I+/pxZOz4P7RB+jUzPObk5deiGeaHsam5Si
	b15a3lrFDjr32VyvrxK7PQRbPXPKHSnyzZsySiH3uZ5zrfyZQ/mj9sOnmmlnjnGrZ3YyZWmIkDE
	UI/jZuE5e3yrYJbgFzAso=
X-Received: by 2002:a17:90b:5345:b0:35b:93d8:6ab7 with SMTP id 98e67ed59e1d1-35b93d86c97mr8176175a91.28.1773737835508;
        Tue, 17 Mar 2026 01:57:15 -0700 (PDT)
X-Received: by 2002:a17:90b:5345:b0:35b:93d8:6ab7 with SMTP id 98e67ed59e1d1-35b93d86c97mr8176153a91.28.1773737835050;
        Tue, 17 Mar 2026 01:57:15 -0700 (PDT)
Received: from [10.133.33.128] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bada742absm2229106a91.10.2026.03.17.01.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:57:14 -0700 (PDT)
Message-ID: <7e71e5cd-3d28-4ece-8d11-c6ac8f7bab1f@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 16:57:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260317084740.3756880-1-nico.escande@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260317084740.3756880-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b9176c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=2fhWZu5mPpoZkjORUEUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA3OCBTYWx0ZWRfX72VL8dqNzc+k
 dPmvEZmiMra/7kAbflL4OM92qrGltKlMy6oDhBFiwMafbuuojeHhx2knmxbve5eiypxwqWPNXnJ
 5PnG3Dk9EWOESnnxVvAh4DXrglFEc2rNoLVDNFpXv+WKPScRqLAy4d3sblbkrqMUHtM8wF7h72f
 WK6aJXlXEiEKYnYXG2SyldKkQQCJcl/1mQ1Wx5OTmpF5zUo0GVj7j5EdO9L2Q7LihQEJlNV8XwR
 vKSTg9h7aGooy8/quqAZ/D3uNOict3nLLHildAoikV0FQ6sE8QLo0ttbrPwcuTupRs9047S3JKm
 UbvPNCWcxbya1b2Ez853nuWCdvjmM7DOyhz/Gkd8UCvpCbl396v6IDDG9xtgMZE+8s6ilLqf6sW
 EZZuqr3hHS681cAy2Dojd3Id5EFhw/RHYHU6khMgz3s1oUaUisjSG3d/wLUrf1HpfF1qI+y6pwr
 KgfvfA5wPnLU+Xx1a4w==
X-Proofpoint-ORIG-GUID: k2liezpejmEcjHgXdnJROqIdqcE4nfrT
X-Proofpoint-GUID: k2liezpejmEcjHgXdnJROqIdqcE4nfrT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_085721_160739_A4CCC4CF 
X-CRM114-Status: GOOD (  13.56  )
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



On 3/17/2026 4:47 PM, Nicolas Escande wrote:
> On each WMI message received from the hardware, we alloc a temporary array
> of WMI_TAG_MAX entries of type void *. This array is then populated with
> pointers of parsed structs depending on the WMI type, and then freed. This
> alloc can fail when memory pressure in the system is high enough.
> 
> Given the fact that it is scheduled in softirq with the system_bh_wq, we
> should not be able to parse more than one WMI message per CPU at any time.
> 
> So instead lets move to a per cpu allocated array, that is reused across
> calls: ath12K_wmi_tb that lives in wmi.c of the ath12K module. To alloc &
> free we added two new module_init/exit functions for the module and two
> new wmi functions to alloc/free this memory.
> 
> ath12k_wmi_tlv_parse_alloc() and ath12k_wmi_tlv_parse() are merged
> together as it no longer allocs mem but returns the existing per-cpu one.
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

