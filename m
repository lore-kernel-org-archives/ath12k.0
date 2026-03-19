Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E291090247
	for <ath12k@archiver.kernel.org>; Thu, 19 Mar 2026 15:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xCbyQSap6HnQiTqADbpDYYWdan8jqhSsfZUALvuHDE=; b=takVs4UmhrB57lkOjMX3E3Zrp5
	ZpU8KY8+8RlGJ42hB+s2yWMc9uP3smQryYTGRvsKLXCY5WWWnY/akxgi5fIl11+XMGb9toCEDWa3O
	F5jZnmalyK8JHeUaBXALBmFwoG5MNaeBrP0SubFIgI3uKNbRMjl9KdkQULoP3XKlqYZvbNA75EN4k
	8Rp9fbRcVzE6qjvOTYvNBF7Fn6lyg3gA3SMkdBGZ5fHPdH4y8vsowsB4K0bBL2vAIMil4/RnY6toj
	rlVlVx1EhiNRc5IOIMKxQs0tY3QozwsXY6Gc4BNkMD2MwkCZefX0sypUmGr+rxShmFu6tBFHW52EH
	9/txWSXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FmY-0000000B0XP-2XhV;
	Thu, 19 Mar 2026 15:59:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FmW-0000000B0VR-0Wlo
	for ath12k@lists.infradead.org;
	Thu, 19 Mar 2026 15:59:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JEXNE03648193
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 15:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5xCbyQSap6HnQiTqADbpDYYWdan8jqhSsfZUALvuHDE=; b=KaMasR3pYAaIoyg+
	OmotS48Rf/8vJSAx2yNefUzAXbeb94rqezeC6UEFk6wPBaCw8NXDat5nqOCceRk4
	lau/UXuulEfmYxfkW69bIdM20Om9vHsdMmCu88h8q0+9ONbqWPacV91xTG+iGbdC
	bLn8Dv0x+NtJ2Yr/Uh+W6iPn1Chgzi3fvHCEJHJmSq0lctcR9HOjOtfmPUTWtfV2
	P6QuLjgNAiUUD3ufd464O3tWUfQZtxlCcUMxznQTpmGC+DCLDnMw/8Nwbo0pmz4m
	Bubbxxt0HOn8JQ3LyxsCqoqb19BvxroLAtLDuWCqiWjOWaTz36BcwTH+kPvWWOPe
	VKWn7A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0k0v8a44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 15:59:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c0cb775215so22983165eec.0
        for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 08:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773935969; x=1774540769; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5xCbyQSap6HnQiTqADbpDYYWdan8jqhSsfZUALvuHDE=;
        b=NLCFmk4z6GxnQwbQPiygJrYKU270QIGtLxxfc28uaRvyHTni0YgIpxVTDkhvQ0n72F
         ANVTGUgj5umXYT75GXj5rYYpa0K8MhCdkNi1T0mP1sYZno3sHtLt0h/VmrE/16DThbdw
         PLN8JgSj/sfObpg9QRsdj8wLVZjb5HKf2+2+MS8/K0BhBEknzKzezTuNA3hqgu2Y0w/A
         CYw46iAdAW3LyO67jgJKnX7qCgehMKU7ZYvyQserFe2HbvNupK5BIyXC0Liym4mndAtt
         MT2EAc91jVOOpaZO4HZ428Jmhh0QU1PGfpSSMqO+Pm9Hph77LBc4dNp/RtzH8+Umpk3R
         DczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773935969; x=1774540769;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xCbyQSap6HnQiTqADbpDYYWdan8jqhSsfZUALvuHDE=;
        b=rZGzdjlpMPPmSZxoom6Y4D+9J2MXM3eLsliVjJvIXc95vDJbizWcLbHksnkYNsqJid
         xKK3gCYRGlKOHrtbq1viKVKiUaBtH6KdPBQcwxUnVetSwtYG3yXqXh93SMFdgrDsEOje
         0NyjE4IOIQ9ZE33VceUwuDVRyxVz0tALSBaaNwT6ro5zEzdGHQGsXXCZQ523JJC8OU+V
         7+lzoUvpi4dA8u+FT82L8PpqLq2uhstx17DIuGIGKElfeGLqeJGNgg13DT3hG4YeJPu0
         9c1ifLOYUJVwqa00Ykq52/566zXfM4vaI2QgqZXX8UU28paoApfH+98i9mzJC9C7zwBG
         wpvg==
X-Forwarded-Encrypted: i=1; AJvYcCV8hwfj8ZGYocx0Tr40ifhC4DbsIJ5SP1vmgv4YygknPAd/V8j20T8IwWEGHhsQfbD3PHqa/7M=@lists.infradead.org
X-Gm-Message-State: AOJu0YxApbueW51Xry6Kfq3UqK8JKu79YKKXZGuuqnq3itlVdCj8JDLw
	xHgfvq2/tbmZJXXgISuwvk65Pb91Qm+tBCxFpr4FZp0NVia6lyHAGI47N/nvQfsipkdV40cF55B
	Y4PiJbl8ky9Bz01fx91RNRbyUsbH9VuO0fV1yA0XCTpwH77JGCS7ep1JJKP1tVUbg6ykRewvr
X-Gm-Gg: ATEYQzxREaJXxEmQDRBxHbp6n9BXGSRgk7EwEqrsAU/4cCa1JEWLWHOR2vRDUZ97gWr
	8h7ejpwZ/THxT2PrRIvMysM6j3ypyO6VBSlsEoz9CjwRWNDaJzKW5fjh5JiAZ55eZfTkZr9oBUp
	GqGsG2u9EspgAdNeULU8wo2JLL4IuhYjli+Zl6bpzs7LsBC3VMFQ59zypCL1OWm4MQedeOVbosd
	Ld3TGgx+QCxViVkS/OwRZNHc5TR1cf5o9uu+Sy+NxvyrB25LU2K+4YP0+iuq2+4Wophw6UiDVhl
	uO+KIRgNUrN4NC+kywMSiii8zeu1gPwjqgV5PGPWzN1Qr/4eFzz2qRy2BqU4WkC2mPs6m38EIT5
	olm4hPRRhxUt1lauNHHnndYcyDHEbKA4rS6fzZLIRHggOb0TYmaERvIqZkAe2bwFfkP3/Oj0ip1
	Q0CxREuXE1Kd13Dg==
X-Received: by 2002:a05:7300:dc87:b0:2be:6f6:a39f with SMTP id 5a478bee46e88-2c0e5041c76mr3765207eec.26.1773935969216;
        Thu, 19 Mar 2026 08:59:29 -0700 (PDT)
X-Received: by 2002:a05:7300:dc87:b0:2be:6f6:a39f with SMTP id 5a478bee46e88-2c0e5041c76mr3765186eec.26.1773935968309;
        Thu, 19 Mar 2026 08:59:28 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e5368a7fsm12276871eec.1.2026.03.19.08.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 08:59:27 -0700 (PDT)
Message-ID: <40756be1-6a9a-4821-8c90-34f37db01e8b@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 08:59:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
To: Nicolas Escande <nico.escande@gmail.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260317084740.3756880-1-nico.escande@gmail.com>
 <36c1cae8-d6c0-4432-bc8e-57216c5ea3fd@oss.qualcomm.com>
 <DH6U1JMUQXVM.287BFERLLK9KK@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <DH6U1JMUQXVM.287BFERLLK9KK@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AdrN1373yRvLjbD8PLw_CUFgggRsnSws
X-Authority-Analysis: v=2.4 cv=EcjFgfmC c=1 sm=1 tr=0 ts=69bc1d63 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Lvwhq10UT3ZPFF2kUnIA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: AdrN1373yRvLjbD8PLw_CUFgggRsnSws
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEyNiBTYWx0ZWRfXygEuzKm7nrif
 LkXsDn7j0s4UeXteL+RxZUeOFjYTHlsZxmjLzCcfMuGYuvU6JbDcSepAvRzS4ixYaCVWzKVnh5K
 bEJwpnpyZRWj/X0UJAi7H8Dt9w9YNHO0EG4F/tQSTS/X7wb6ooTjjZfdgHFC/tss2GaDRaGE5fm
 rBz0Y8rHDLePrcFvoK2gMJclZnQ2wlXUOLzYHBrmFCuPC89rwj90mRewceBsLWPqcQWZ1QIB6p0
 18idpQb1F2CmDZHS07MYwdLKl0XRelj1gk7NYSJ+c0hJH3mcNDUEaScAw2A9POU7bZ9eugc/Q9i
 ovMdZuUiz4LJk0mCnFuDKvkpg6HrTIHfkWvAbpZqjo3/75ApF4Sr6Gff9EVgWALOlMaqRFJGhV1
 +E79WE0abBbkRHw5kvAJRLDmRFacMsERkK7dq4BxxuEMCOYk89ZRD+9hmpycnBCCnyQH8RT2fZC
 cXWkvmN0Ji1auDdWTyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_085932_293553_3ABD3F56 
X-CRM114-Status: GOOD (  30.23  )
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

On 3/19/2026 7:35 AM, Nicolas Escande wrote:
> On Thu Mar 19, 2026 at 12:08 PM CET, Rameshkumar Sundaram wrote:
>>
>> Since CONFIG_ATH12K is tristate, a built-in boot can continue past a 
>> failed ath12k_init() and still run ath12k_wifi7_init().
>>
> I genuinely thought the kernel prevented this. I was wrong.
> 
>> Please ensure that later initialization path is guarded against 
>> allocation failure.
>>
> I can add a flag like so to be able to check from ath12k_wifi7_init() if the
> init finished ok. Something in the lines of
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 6c034071cc6d..742fb33f41ff 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -34,6 +34,9 @@ module_param_named(ftm_mode, ath12k_ftm_mode, bool, 0444);
>  MODULE_PARM_DESC(ftm_mode, "Boots up in factory test mode");
>  EXPORT_SYMBOL(ath12k_ftm_mode);
>  
> +bool ath12k_init_ok = false;
> +EXPORT_SYMBOL(ath12k_init_ok);
> +
>  /* protected with ath12k_hw_group_mutex */
>  static struct list_head ath12k_hw_group_list = LIST_HEAD_INIT(ath12k_hw_group_list);
>  
> @@ -2323,7 +2326,14 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>  
>  static int ath12k_init(void)
>  {
> -	return ath12k_wmi_alloc();
> +	int ret;
> +
> +	ret = ath12k_wmi_alloc();
> +	if (ret)
> +		return -ENOMEM;
> +
> +	ath12k_init_ok = true;
> +	return 0;
>  }
>  
>  static void ath12k_exit(void)
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 59c193b24764..f35571b1a541 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -101,6 +101,8 @@ enum ath12k_crypt_mode {
>  	ATH12K_CRYPT_MODE_SW,
>  };
>  
> +extern bool ath12k_init_ok;
> +
>  static inline enum wme_ac ath12k_tid_to_ac(u32 tid)
>  {
>  	return (((tid == 0) || (tid == 3)) ? WME_AC_BE :
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/core.c b/drivers/net/wireless/ath/ath12k/wifi7/core.c
> index a02c57acf137..542ec10fabf1 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/core.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/core.c
> @@ -38,6 +38,9 @@ void ath12k_wifi7_arch_deinit(struct ath12k_base *ab)
>  
>  static int ath12k_wifi7_init(void)
>  {
> +	if (!ath12k_init_ok)
> +		return -ENOTSUPP;
> +
>  	ahb_err = ath12k_wifi7_ahb_init();
>  	if (ahb_err)
>  		pr_warn("Failed to initialize ath12k Wi-Fi 7 AHB device: %d\n",
> 
> 
> I don't like it much but it is easy enough.
> But I don't know if there is a more idiomatic way of doing things

I'd prefer to expose a function rather than a global variable.
In other words keep the flag static, and expose a function that returns the
value of the flag, i.e.:

bool ath12k_core_initialized(void)
{
	return ath12k_init_ok;
}
EXPORT_SYMBOL(ath12k_core_initialized);

> 
>> Or may be have this allocated on first device probe and free it on last 
>> device deinit ?
> 
> That seems even more involved. It would be easier to go back to the previous
> version and simply, alloc it once per ath12k_base
> 
> What do you guys think ?
> 

Going back to that may be the better solution. It isn't nice that this current
solution may allocate memory when the driver isn't actually used. But I'll let
others on the team weigh in as well.

/jeff

