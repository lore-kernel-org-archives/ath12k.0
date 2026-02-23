Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C24EA4FB0
	for <ath12k@archiver.kernel.org>; Mon, 23 Feb 2026 11:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+c4XKQV6/kHOvgBRBPJwvx4KXL7WsI8ItcU1unO0zc=; b=ccPWrpCfiujCgyKcZXbX5eqhJN
	uly5hMj7Abw6uzbdIMW3dG/IBEtIVdMCYCBTE7x+oZVhTIQJWqh+qAgGaTHAL+OVQxhrzab7OLeL0
	6OrP+yX8xF9va2t/8ORNVEJK9HyZ+9MUhe/XEKZRK38TSrLDTuuOdv/yJz8A4Bx9cwtdYx9LLKwGy
	ZXeGPv7pZ4Ak6IzHFqSxoPd3qLXVtmZbAgV3p64fYZ5QQZYwZZWFd6l0MIjLyZAyuV5FL4ZTM94J9
	B3MLkQ2j2sYMBqOKWReISvS8YWa5LR1v50wjmnVwSg0i2J0Mh9PpWtvQqCDhS+F9QUqbkdi5NrHUs
	7w8oaoxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTzy-00000000AIh-00CI;
	Mon, 23 Feb 2026 11:21:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTzu-00000000AHl-3C3Z
	for ath12k@lists.infradead.org;
	Mon, 23 Feb 2026 11:21:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYBPS561291
	for <ath12k@lists.infradead.org>; Mon, 23 Feb 2026 11:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+c4XKQV6/kHOvgBRBPJwvx4KXL7WsI8ItcU1unO0zc=; b=BasElSICVLSMm87e
	DQP/wcHm0FfsAXxWWS4/w3gk1nuRp8QIvlDpEgtyIj4HejLBtS35e/SnElf5AlzL
	l/WAnuIookQWZPGBxZuY1/IVgGXIzUmvMSQ8XwsdbEMdmO8ydkOAWcZG9Xm7IZyS
	K4j6Ro/IY2B2w7jBRs7XxBzWH+ZpMDz795mLBIdTjY3MTUnXfYT4wq00klMhkI1k
	aTTGyi43RdclJ9EQ+x9Q3LBQwoP/qvi/mjU9zR967RpFy0bX8SFNP9WsgoUX+o7J
	q1t+QhdtCtdhkmfYa/eSRGoOxfP/WwsppyX2fXniR+uiHUpL77TKR9AXwiFUptrC
	a6znCA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8r849c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Feb 2026 11:21:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3569ceeb335so4117612a91.2
        for <ath12k@lists.infradead.org>; Mon, 23 Feb 2026 03:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771845666; x=1772450466; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q+c4XKQV6/kHOvgBRBPJwvx4KXL7WsI8ItcU1unO0zc=;
        b=N6iTr+vJj/U+HYPfquaRXXbNmytf0g0+CKO2mYGkZPnMCF0uZhNH1cyY28k8hmCvSi
         BKcHcv1/fzw/sJ3PUkHvgQ3lsKV7yY2Q+esdihil7S6CrvbaQAoZM/Re5EQ/C+Cg7fAj
         u8wAHiG73iaj3djXBNZ6WlLNk3QNx4A4EWYeHo7QJQKBhoJUDLU7UA/SiC9qhw3esE92
         7f2oGUdGOSnhqLM65XktNK9QpW5d4QjFlpQLvzkO3g96adJ6V8d2EXVmilbgNkaR4WgE
         LJ1bDY9h71jHncXckO2X4GNb2HqiSRiMrPzNZa18A7BdYWSB2zM889ZzY4cuaahVCXUE
         pkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845666; x=1772450466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+c4XKQV6/kHOvgBRBPJwvx4KXL7WsI8ItcU1unO0zc=;
        b=ghtLUdCaWGn+PsZAjWgESRv4f2u56i1089eemEptLLLWnDReE5PIQuLI4Z9JGM9fvT
         czsZyogcyTMjZzxJh4FBysbHDUXcMHOL8j6PrQzdzqXzFw1Fb65WAtQCCCmidy7QiHqt
         wdx+9eQ7Acm0Jil/5s3Mh39NB7zKZTJmINIJhsy+8EUFwE5g+t1Eo1m9gnYvE8lQUE/H
         cqNcLfRZJB83eDj9FCAa0zv7mRSpkJQ24zccgv2P//O03cGTUkgS3oa7/FGvSrp9Xe5c
         bu0m3MIOXlAhs98lgnK8ZDXVisLQ51sZcJ/xZBulQZ0ZkCltmkmEYp/byUxYZY8goSuA
         MqGg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ6/iJNQTQL4YGeCu8ZV3rDeHDIE0/fw4g4HhM1aaNFKN3/8OTdxjox6aUAltDREE5Gt/12bA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUmsiIUpSR1lDR+jWTBrVamLK3o46uvwMHKyZ8ejn8X8dqchb4
	62XnLRWWmKchpDRMNd65f6fDeK2NFw1NPfJbUh/0d0PXkdDz99ccZm7405LjuDrqPsB+3tQIHug
	kIW3hNGAj+7FZHVi+jOzaNxVpVTGznfxlhnaf7dDc6d020gdeepHAEm/hkQl51+y7
X-Gm-Gg: ATEYQzz3Lj8ftY2IsYunH4WEC9DFOqWVHQCFw1pbPzHl8SN3Lesk5ahL6gSTzS0bT0y
	qZLzoymQVdFWdMtOevyI9idVZYv+VdJo2u2OZWXcIeaDEf0/e/zEA+Rzq4QRGe0s75+h4rqeHoe
	GBXpjzVKB7QuqltJugiSWhQpPYL8mTGz8XjL0nLvhrcswD81Ij7OjDGS8/iva4xiR3NrwaOYn02
	5yX32GsKASgFYGEJ/hWU0dbpmcDjLpMskk1puRcXPd7D79HrwnPeydQQV9+1vd1FyAUMeEVXSuO
	S1LPic+GcG4HPSzll5HtSdfg+twGCcEzUk9ZjpVYoXcLhtKVDUL2Wyvov3D6MziPGU0hLXmNcUl
	WBOLPTbV/U6KrMe2MfzXFSz7ou/PVn+pgA+tzcZ5iKzno8AEtiWRpHBCoHtWsdPYf
X-Received: by 2002:a17:90b:3a8e:b0:340:66f9:381 with SMTP id 98e67ed59e1d1-358ae7f826emr6346112a91.10.1771845665301;
        Mon, 23 Feb 2026 03:21:05 -0800 (PST)
X-Received: by 2002:a17:90b:3a8e:b0:340:66f9:381 with SMTP id 98e67ed59e1d1-358ae7f826emr6346098a91.10.1771845664817;
        Mon, 23 Feb 2026 03:21:04 -0800 (PST)
Received: from [10.152.205.141] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358a1ba819bsm5460965a91.4.2026.02.23.03.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 03:21:04 -0800 (PST)
Message-ID: <4a8970e4-da6e-4b55-b1a0-a1bb9d8621b0@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 16:51:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: add basic hwmon temperature
 reporting
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
References: <20260219073440.19618-1-maharaja.kennadyrajan@oss.qualcomm.com>
 <DGITONL8L200.PJE38TDXYRQC@gmail.com>
Content-Language: en-US
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
In-Reply-To: <DGITONL8L200.PJE38TDXYRQC@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bEG0MHXzndHxujKerd17cHmH2A8McMTC
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699c3822 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=5WUcvfMz_r7U-ursyZAA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA5NyBTYWx0ZWRfXz0LUvOY3rB7S
 i2VTrxy6yQDF1AK5fTcRwhD/7loWoD356MmCvXpGjgr0Kc7OUJevBsuMIDdOhcqz1f5lRZg1pc2
 lP9FxehyYnw9zduz38vTsW9x2jimG/FBTLaVcyUJwVXwGdM/uDbn+zrKjti7qzeqjGQHAB2M+Hy
 WZjr9luonwO55hXP084cWY3bck0/szPseXpXj24i84E0yC0YIIDDgaTLrw4ARLoiisAz1SyL7ap
 /ItxlpIY7D0hltExXQNX98pZnITGWU8FmJ9GZ/mlxMv3X1BEQKNAd+R7+PMNS7P26HQCjiuUtmV
 ksFT0rDRqZ4D0dxz/pfhcDSwplRf/smbj+sZlHiLwn6DHd++o2K4lNXGGaS0JZyFMMQgcZ4nV2U
 LDoFF9f4DEUAPIKyhrqH3q57ZLmrIAw0oCmpksHJxm4l0KhgbRYHTv6gQk8lNH5gMLTCYHVgMhd
 ulj6n0A07gXxgpDnA4A==
X-Proofpoint-GUID: bEG0MHXzndHxujKerd17cHmH2A8McMTC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_032106_895433_2DCBEFFA 
X-CRM114-Status: GOOD (  16.14  )
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


On 2/19/2026 2:45 PM, Nicolas Escande wrote:
> On Thu Feb 19, 2026 at 8:34 AM CET, Maharaja Kennadyrajan wrote:
>> Add initial thermal support by wiring up a per-radio (pdev) hwmon temperature
>> sensor backed by the existing WMI pdev temperature command and event.
>> When userspace reads the sysfs file temp1_input, the driver sends
>> WMI_PDEV_GET_TEMPERATURE_CMDID (tag WMI_TAG_PDEV_GET_TEMPERATURE_CMD) and waits
>> for the corresponding WMI_PDEV_TEMPERATURE_EVENTID
>> (tag WMI_TAG_PDEV_TEMPERATURE_EVENT) to get the temperature and pdev_id.
>>
>> Export the reported value in millidegrees Celsius as required by hwmon.
>> The temperature reported is per-radio (pdev). In a multi-radio wiphy under a
>> single phy, a separate hwmon device is created for each radio.
>>
>> Sample command and output:
>> $ cat /sys/devices/pci0000:00/.../ieee80211/phyX/hwmonY/temp1_input
>> $ 50000
>>
> Hello,
>
> In ath10k & ath11k you guys also had the throtling feature. Do you guys plan to
> add this also at some point ?


Yes, we have a plan to add that throttling feature as well.


>
> [...]
>
>> --- a/drivers/net/wireless/ath/ath12k/Makefile
>> +++ b/drivers/net/wireless/ath/ath12k/Makefile
>> @@ -32,6 +32,7 @@ ath12k-$(CONFIG_ATH12K_TRACING) += trace.o
>>  ath12k-$(CONFIG_PM) += wow.o
>>  ath12k-$(CONFIG_ATH12K_COREDUMP) += coredump.o
>>  ath12k-$(CONFIG_NL80211_TESTMODE) += testmode.o
>> +ath12k-$(CONFIG_THERMAL) += thermal.o
>>
> I may be wrong but I do not see Kconfig changes that allows to actually build
> the new files. Is this intended ?
>   
>>  # for tracing framework to find trace.h
>>  CFLAGS_trace.o := -I$(src)
>> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c

