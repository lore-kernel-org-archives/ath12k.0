Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACE6C531CC
	for <ath12k@archiver.kernel.org>; Fri, 24 Jul 2026 01:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WblrNcLsi/Jl44g9G73gbyP9Kj6CCa18WawMWQHVOgg=; b=RD971OeVsXwKIuh/hVV4sRRG+F
	SL1Kju7Tw3Zqf3/89bTmZO0y3f7G81MGjuyCtzpGhiJKKeDBR/UTJ+9sC7Va4zPKt3An+VuKRucN8
	hJ3XpQTtctReYTQf+vztKflM1gyL3Z998+xfWwPGBdd+C9gukL4BQaV7IwfFSxOfPhHivNUu2TD4d
	4gS/RQAWHPTbL57Uz3AYbZ3okdeGu4a7F7/6Y6Zcba6pvnA6/xn22O7r3Y5o2Ock+5+DlA1qaThhS
	RxLkzBUvmpXeQQ+aJaTUc2BbONGuaP/M/dIr171DrSPC/8vh9DDXXvT0YkAk8j7j900kwcX9ruJZG
	npbCEURg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4Ir-0000000FJz5-0WY8;
	Fri, 24 Jul 2026 01:02:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4Ip-0000000FJy4-14dA
	for ath12k@lists.infradead.org;
	Fri, 24 Jul 2026 01:02:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NLeEeU1174500
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 01:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WblrNcLsi/Jl44g9G73gbyP9Kj6CCa18WawMWQHVOgg=; b=G4kfaSh0GY3IABY8
	Fs16utljFixWv1jqvV5aqkUM05FpUg6ZMMH6ZKLFnnyyf2iKHHa1cSY3I6C1tt0A
	CV0rgXYVG8ILdPPadGoJaC2b79WumJT60NjZ9R41e1HDcDHylq2+ihtAfPLyGuKZ
	U3ci0cIys5cTT1lLm7vl7vcLJ5h6aCyvL1U4W5atOSEktnuDiYFquoCTkDO+bMw+
	mOOQpmQAN8ZPjPYV3HpcwUyy/or4VeCbWlyvTMUa5UHdzYzJpOMDu8iV/RdMnovc
	kIHF3gq0G6LgZMaIbGVMP/Gq8NRBidkOBdrjP2oSVU7KLH8TxoWIR1XXzY+7WGZB
	IA+cww==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahrnje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 01:02:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so1122067a12.0
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 18:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784854933; x=1785459733; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WblrNcLsi/Jl44g9G73gbyP9Kj6CCa18WawMWQHVOgg=;
        b=QPeK8RCRJN2SmJWniscbQkxtF6j6FCIgqV+DkzLQwb7rE7M1qijuSP1rNWN9iRtIxn
         QNkhSFtHB47y/7h1LR5H6lDY9BbXd4gBTFGScyLUj8xoU2Pjv5bmmuZJc5MKr8hHMOyN
         tvftkba2Kufu0B8b8LfZSf+uqFkcmoUUVAcaf2b/eMWk+f25TTe5KfD6u0BkUDeIHXpE
         EWLdYzid1IeT+NnlkjGQ3y2GyvFxWMOsU4rRGOgRmddJ+h5jxaQgE48LjhTJZqwDPOrF
         OFY37mIAZOoXEPvJVdPo0l4uq7X2vE1T7iUNWBdS91SK1uuY2adjrhDcr95K2owc7zlk
         WN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784854933; x=1785459733;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WblrNcLsi/Jl44g9G73gbyP9Kj6CCa18WawMWQHVOgg=;
        b=E/tYZif5v/03J2TJRur0s2ILPZ2B/6bYP3rvVzOe28VeBeBNtnTH9ZczfbLlCtKUS5
         F4Yd43BIsCXU0o2nNeN/JUKI2klmnuvIOZXpOUyfa+SA5WzmORLCcwr1v4+g32VqVdCr
         eQzY6Y3NmjvD+a9oV4RvYFhyPMC1FjnZyNS2DXEhEJ5Wu9RlZeiLoDhahexpVgGMqIlq
         JrcSpRad2tPotQjsIX6zGNeoV3xCX9T0uDTMjUt+9STAINeMdpg4Do81pNYVziC/X69q
         tB6Qtu5Qo5stzmhE7hpxUSPLxwFwWbPTSnc26xC136ttZyJtEsWFOAiaLyW9EUy2blFc
         SpTQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAfXpHzoxJCiMgj+rOoF9of+upyMrNibmL+G3onkWaeBPIJ84QNf4LQDSF5lELtwq+GLJqVpc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyL+zN3ZBbj1ghcBd1xOcmxeloAXZn5PCwK0vk3ns+qzJj1HFLd
	ofPDtlvZfYTl+vS0edQlOTw9OiIZTL9uXYIAhWQLh868a6xIb2jupyC0Kv7k81jMpZFgMC3nrQs
	fpUPFQ1rfN+DaLFx9XRt69Z3WwBHJE83z+eHBw+3MkMR4cLPtKioRkqAGXc55pdqH
X-Gm-Gg: AR+sD10eTtNSd4a80RK8iePo5MRvqpYvFYcWlcal+NAawiy3NovEePtdfqcF8byPNE8
	4nTY54H9e9L8xJLkn0jU99crUF4b1efmB4Z09tb1kHhofRCmbsOAHY7Biyhqx0+KOGZLAMqRu6z
	RNbG0VMbUs/YIyppFytdeRyg1fXawqELWwqSTWOWzOyHOM+7b8Uq//lkrEkuoogUZBv0r/qTE19
	ocJ1Bl8Myht9FWmOAWkf5VMpLBDtqWZYM47bhGL10XHEJKWRelQc54BqKVaut1ergW1+l5udbTc
	s1irDycBe83sWTx6EEy/jAo5aCrApfzISdhN6onEvIuMQ7hwQLdHVuqQLndJCXxR8ywF/GxAOBE
	HaaeT8c7vBuoXbIjyxplDpYE6MNCYp7qdzqY1ojwHzm+oQa69uBEnPI/FOA==
X-Received: by 2002:a05:6a21:6494:b0:3b3:1c7b:ff7 with SMTP id adf61e73a8af0-3c44b1a3cfdmr6067894637.46.1784854933189;
        Thu, 23 Jul 2026 18:02:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:6494:b0:3b3:1c7b:ff7 with SMTP id adf61e73a8af0-3c44b1a3cfdmr6067856637.46.1784854932699;
        Thu, 23 Jul 2026 18:02:12 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1b6a45sm24180258eec.28.2026.07.23.18.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 18:02:12 -0700 (PDT)
Message-ID: <1c554956-4b33-4b29-bc65-ae6dcbaa124d@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 18:02:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] wifi: ath11k: release QMI handle on late init
 failures
To: Guangshuo Li <lgs201920130244@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org
References: <20260718074026.3085688-1-lgs201920130244@gmail.com>
 <20260718074026.3085688-2-lgs201920130244@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260718074026.3085688-2-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAwNyBTYWx0ZWRfX3DUcvl8WGJN6
 31EeZZygRQA4nIyy23s4MNvw3jRDlNono8Y0PdVRtkUDpXQEnC5IiNH/IrOKS4JO3LGbAvz1+Pb
 wqRTq/Rpn/E59Pr+NbeYnjMq2EZfgoU=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a62b996 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=pGLkceISAAAA:8 a=iCY2eI6ydM37Y8nmTysA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: -2EQW69skiHrey-TkTW_MfWV7jEfK_0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAwNyBTYWx0ZWRfXwa18CclbdvL9
 CW2sB9y+3hqiDl6KEFF2Sc8EzbNrsRmNhYSx7/8UgO0S1yIaAR7u/iuLMhrOuVHLFZZtrJ47Idu
 rlCp6LQhS4yaiWBIAkVx4uFwVbvkV5nKBDYbak7VKMcnPrdqRXpqlipB8h7OE7TbX/RSDjb1/7a
 9xDezunXFmVwKPuEKiwUi4XpaZdB3uCexq/3mOEAe3CPJ8vZosyEfsmodicZbkw4uK4eUpqMPDM
 kUV2FHGkoCcCwCc+HvxOA8WHoMSAekRTMVfmr1+lAqjMuEXyWqI/9sbkhxkW/UdaRaKyoNidlsa
 iOrKSvq3mdawd20nkcj+biFwLgJb0IFQ7NcoCazX43Gw5JVzQeXagQxDPwOXJkHUwjNQdMzNuPL
 PG+OyD9ipAtRn5U4ZAhYnp4zOoofKHMuJNOzCPPTp82lEcy3FD9A69QFZqhXK4h7pqKx7l17N5F
 wcfSWTqQTw9zXKDGxaA==
X-Proofpoint-ORIG-GUID: -2EQW69skiHrey-TkTW_MfWV7jEfK_0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_180215_405167_3663F599 
X-CRM114-Status: GOOD (  18.54  )
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

On 7/18/2026 12:40 AM, Guangshuo Li wrote:

(dropping obsolete @quicinc.com and @codeaurora.org e-mail addresses)

> ath11k_qmi_init_service() initializes the QMI handle before allocating
> the QMI event workqueue and registering the service lookup.
> 
> If either of these later initialization steps fails, the function
> returns without releasing the initialized QMI handle, leaking its
> resources.
> 
> Release the QMI handle on the late failure paths.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index 410a7ee076a0..6e3f82169d24 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -3329,7 +3329,8 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
>  	ab->qmi.event_wq = alloc_ordered_workqueue("ath11k_qmi_driver_event", 0);
>  	if (!ab->qmi.event_wq) {
>  		ath11k_err(ab, "failed to allocate workqueue\n");
> -		return -EFAULT;
> +		ret = -EFAULT;
> +		goto err_release_qmi_handle;
>  	}
>  
>  	INIT_LIST_HEAD(&ab->qmi.event_list);
> @@ -3342,9 +3343,14 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
>  	if (ret < 0) {
>  		ath11k_warn(ab, "failed to add qmi lookup: %d\n", ret);
>  		destroy_workqueue(ab->qmi.event_wq);

Since you are adding cleanup labels, it would be more idiomatic to have a
separate err_destroy_workqueue: label to perform this cleanup

> -		return ret;
> +		goto err_release_qmi_handle;
>  	}
>  
> +	return ret;
> +

so here have
err_destroy_workqueue:
	destroy_workqueue(ab->qmi.event_wq);

> +err_release_qmi_handle:
> +	qmi_handle_release(&ab->qmi.handle);
> +
>  	return ret;
>  }
>  

same comment applies to ath12k

