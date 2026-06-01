Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E2CCD6E56
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 12:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMiK8OgpXNqn+pLMaKARtdgsOHhiw9538/Yziz0a0G0=; b=PNAL0hkqr0pwU2krueZCiCW2Ai
	IgVRwKRv5wEZZKLTKNAWRePi5pniRrJXx1QHvZw8ngsxSVZh8FKyDFj/b0RV7/IuG+xKVxcQ791l2
	QeWOAOPbhkN0lUGiF+ejqgNMtR34itJME9/6TXdw+jusudpiSycH7zQLeu/7ahmXlxYcSQJ9qTQ1i
	JbHYZAe4m2YIpzyZkaeXanhCOKDOqZBcq1rB4tlrEPf9Vy1Q2ZzV3AQReKoepH8dYt5ywGlN8uWTk
	GKy0M1vYurC09XXOwZGelv6qyenZBmgMloRRR8yA+6RD269Jfs2HFQ4xFxAebVOnUYQCnSKPUjgvY
	Rd7YQVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU25U-0000000BALH-3Bxv;
	Mon, 01 Jun 2026 12:49:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU25T-0000000BAL9-0TzX
	for ath12k@bombadil.infradead.org;
	Mon, 01 Jun 2026 12:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FMiK8OgpXNqn+pLMaKARtdgsOHhiw9538/Yziz0a0G0=; b=CqdsWnUoMiK8SIYwesY35V0a0a
	fT/NKYtKr/+UT5JMQ7wWN/afSRZvmcmLyamMCLQDrZxcB9vfUrFIaIq8bd+GT7EmT2sadch6bdaLO
	TrYF3lnbRJe/ZowD82wWc+aahPHxJrVWB67h6DjIt5idd3ZH576K30LnvyQM4MZuevEZ9W2oJO386
	6GNM3Zl6Cd/UNR8IUIR9nzGjFwp2QV5Vh2nfSrNYfsFxk4LV0TY9K7zMIYU9S+mU87dMQjpiasV6h
	1t3VqigirMlir2dLWTJIr4rHzLFrob6qkf1Tp6OQsWg++3emLqIptW8YH4fULrgUlA6X8ylEBYCuJ
	Pd97/2/w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU25P-00000006jLX-1RAm
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 12:49:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518dnw24110823
	for <ath12k@lists.infradead.org>; Mon, 1 Jun 2026 12:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FMiK8OgpXNqn+pLMaKARtdgsOHhiw9538/Yziz0a0G0=; b=VvxLvE3OSRAoZ/lI
	NEIdxNLsDjKcXNRqxsMZHWtPKMRXlgmqwkaP5muTTDCkTFbP7XbqcwUa8zaPFBPV
	Hv7IP/XE3wbHrsyuysTo8sNFC9BDIDghn3A2yJMDfo04dZYzekHMQ+9Avrv+/IfJ
	J8BuRTDq6MXjtZaa6ypSSZpMTbdz0idoDkGAow0uNpIAOLHfY47KiydHH2d3240s
	LYI2u5mC/gnVgmj/cspJe/dOt9M0cccy+6RtmaFGqiLIOAVZvo84hV8MAl1IeBEq
	AVEE6jjyd46137OJsq0n5/3nkPra6yzfvgXsQEn6+LLBKmGT1xMzb0X5w7X3Jy0w
	Mmm76A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s3ryep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 12:49:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8424aac207eso1018840b3a.0
        for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 05:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780318178; x=1780922978; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMiK8OgpXNqn+pLMaKARtdgsOHhiw9538/Yziz0a0G0=;
        b=ZLq1YU9tQw2vDH6MHNMI1RI0OBJXPVKqd4M9aJG6gl7TfwtQwD2k/kZSRfQp3glwIi
         mNQGnHUUYf1mHsqX0f/+ABotshUW0+H9El8+a9KRVN135QLr++awtnb3PWkBYJHTJafP
         YvpzRCOjTknIC5pAqbiBnNtgdpc/5hvuaJItVtg2XFCPrZhb3cL/2Nlx/r57htdQW0yE
         hft3E9pf1zBGbXmq6HFnBuSyQxd3ucgUw6JNFJuZoBGAD8UzmWh7XZPXTLRl/YWckueg
         ipjWuDj4PGjTTdUQNqsfKm+Hd7kILu4jmvKq/BavZ5M28Xl/CuO9/GTrx0W/hyPXH7ji
         4DVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780318178; x=1780922978;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMiK8OgpXNqn+pLMaKARtdgsOHhiw9538/Yziz0a0G0=;
        b=YhpiFs65K9jdKmMZd/HNWHnuNaGDz6yO/ny/lhUaXHkiIrvRGZXFLLNzEZEdFXO1pS
         QPreMByCprkUzptQsPbnNbKVRzJ0CSzC+uaTar9PdlRJ1BHolxbuNaypN52I+U3oBpqs
         xZEmnec62WrjXyeQ3uF2bFAHNYvmumeS5zY/Z0QAsXqg1hgAtOgWkf8+1Fqn54Jb6sud
         c7Ds47csR/HlOR//mE2nzbPJi1bdOWbCGgrAIG+OuIpXv/MJSD+JGSCGWWhXbPL+diJq
         Tnjzh2UYkrBz11Jqv9cydTZ8gNps3uc5Qxmc1jtWgVaajkNjRJNK3yBdl78/j6SktED1
         x8Pg==
X-Forwarded-Encrypted: i=1; AFNElJ8rJdGcK2xYuWtPuE87aN0//IiEhylv4puw7dteABd7BR88vJL9B5rBhe2y7TgBXNBd1H6Mm5c=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHShBAqw5DI/F9z26giKKw3qN/8wQ3eaL2cg2UPhX9gA2Ia7u0
	oBOVVnw7qYNpkGAAkO69+7walvZCI6aWtlT7eGJK3Z/PRBQkbK9lkArOaqr1J18M8sZeOPQqExv
	PfOQ5cc4WRWcvddjFmAJfyO0ETbh0LmFCENYBqa/s0a5gpxflb64mynhhWwsS9GgqIGyBTnRQ
X-Gm-Gg: Acq92OF9smQH7DnWyKFpaZtG+nRQXSb0LX7Zb7HC6cylWToub/BevwPHW6NCFWY5W2E
	a0h07mjFVji0gSBcrlJDjN+NSxFCmhc4na1X0OJpBLf9lhaJ1asBKJaEbgiqSIDigzDqxvpPoKv
	YCNoGTPxsYpD3+kMkr4dnqmcD2mLY6jfNnuiA4JRXz9wxTYiTuNbAMophuvPf4l+HUT5osVOIJx
	zpOhWCeK76hdhA4K2DW9/j5JRG8CJfAQTtWNIZtPm96MhVJMumAWd0LzvabiuzUOOtazNhcYzzg
	YHPkP9wDpAL6DQBYHCXKkz7dFf2FfrpMV4yYjOLxEU4Nr2UdW+aWxwdSthNVQIDttiHrX+Xj4Q5
	n4y05Jd12QVIQ9rM1cpy5DVtiwyruOPzln6UvNqV+cw4WS69BnB3iJexowoQnkjyZvuyVXSXQ3U
	Up
X-Received: by 2002:aa7:9313:0:b0:82d:62ed:b01d with SMTP id d2e1a72fcca58-842255d2908mr9910387b3a.45.1780318178219;
        Mon, 01 Jun 2026 05:49:38 -0700 (PDT)
X-Received: by 2002:aa7:9313:0:b0:82d:62ed:b01d with SMTP id d2e1a72fcca58-842255d2908mr9910361b3a.45.1780318177740;
        Mon, 01 Jun 2026 05:49:37 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.82.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423aeff467sm5590616b3a.25.2026.06.01.05.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 05:49:37 -0700 (PDT)
Message-ID: <11cc2fb6-e717-4f1e-8a9c-62e21e82ad00@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 18:19:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: add hardware parameters for
 maximum supported clients
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260515030909.3312511-1-aaradhana.sahu@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515030909.3312511-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AP3YypGC c=1 sm=1 tr=0 ts=6a1d7fe2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZCREz13nqshT/on6E9YcPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=MKq5ULF0EFEncfcVwOQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyOCBTYWx0ZWRfX1ySzlkluauig
 kjHJHUtYMjqCyaMQc7QZ1++S+ZNPyDPPmW6+K3GJNUkYSYBLPlMCBwZS1sdGshbRp2PjSl3DWAL
 aNQOn4pBP5c7HV+sLXy+ctfyRGbyunaZsWe8e4MWFYTKWEvDalCKUII/v1WZmfkZDoX8XV8Eeld
 ULvdif60x0B/z6XQ8zJeGkkk1PVR3ZktXiZrch2RjcVJItKptBUEHy9TJSuX/bMF1AuGBGMiZRS
 l0EF4EyIH/Xm4iU7KZRR+4+vQt3f+PnnxeQC2DqKXGN12YDPdZctpZy0N7/w3db2WEAGNxgXMFz
 DHvHFlWdfu7n6kQTVjOpYNC+9Jzzp2dplx++ww/18dyf9iai2e45RQAf5qtOmXoVaNvvXAvRMC5
 GNzYpVofDS4/j3LLH9+ANXaoeLbiD4xeYOyejsGkVSpWBYQDKfGe1f8l52gJCbJxzlRQyQ8104y
 qKpPx7MzIUX8ypfDUdQ==
X-Proofpoint-GUID: foZcfrlXx1gKjHCvlz7wZd5lHYvVvEXU
X-Proofpoint-ORIG-GUID: foZcfrlXx1gKjHCvlz7wZd5lHYvVvEXU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_134944_237151_3EDFAF02 
X-CRM114-Status: GOOD (  11.01  )
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

On 5/15/2026 8:39 AM, Aaradhana Sahu wrote:
> Currently, the driver uses memory profile parameters to determine the
> maximum number of supported clients, with a default limit of 512 for
> single-radio and 128 for DBS and DBS+SBS configurations. However,
> some devices have lower hardware limits depending on the radio
> configuration. Exceeding these hardware-specific limits can lead to
> firmware crashes.
> 
> Add hardware parameters in ath12k_hw_params to define the maximum supported
> clients for each radio configuration. The driver uses the minimum of the
> memory profile limit and the hardware capability limit to prevent exceeding
> hardware constraints.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

