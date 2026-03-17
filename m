Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685DEFB5EA5
	for <ath12k@archiver.kernel.org>; Tue, 17 Mar 2026 03:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5d7SpaThv2YlpB2AIVm1TAoC97B3vVdAG0MkkHD9h4=; b=x4nEblk2oeobrL2Xn0UYtlq0Dx
	Yv79d+x6fMg+xCkkXySzUOZB6+FL1YTuzBwjx6o972lqowYB/wh8MXov+aNFROg2/7VrKm3OBa33C
	snkoY09ndQziqirmmxYoSUpxSdh7rmMcllISDPvYvxnQ5aiCPXQb+RjztBFExyLaOrk3dCFq0hT4W
	5yAQQKPC/myUOoRS3+tH0g+F9/MquXAcACkfq9ZgQkcpR/vbQzQCYrfkJ4nYEZ0ZB7Gc0f0i1tnYp
	c7LHLVp36a64D6YLRxusmv43wp57L3AwPtYIHzVu9hAsevO9QjSqqvtt4h5UMB75FvAI9rzoO3Yn+
	kGr5CAig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LAC-00000005KCl-3xba;
	Tue, 17 Mar 2026 03:32:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LAA-00000005KCN-3pva
	for ath12k@lists.infradead.org;
	Tue, 17 Mar 2026 03:32:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H1RPLY1533923
	for <ath12k@lists.infradead.org>; Tue, 17 Mar 2026 03:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z5d7SpaThv2YlpB2AIVm1TAoC97B3vVdAG0MkkHD9h4=; b=KxGHS7EraghVe/vP
	GoIDcjYK4hu6Ag2Mg9EBwGAnBF9rcTt1T6sOX9VhNEpGMq+fJru0yBFZnWbNA4zx
	2ubqrTOHrCXgmaj7Z8NnUrfT0SLRsKHDmSZG5/VxZkrgwM9DcoTKs1z1FjNzjqN+
	MqNDsMrIKeRNilKwOBhnrNEn4wrtMpLl4MfbSX9OZ98amzaaFqBLXlPVrFh4G6G5
	SC7vciumpz6kiutwMkhPFd7OmUMGtTPkseub6UjgmvfbDZHcAy+ScK+2HEXTCSW1
	MNsXkbFSIwNKjOwSQ3FtpM/tftYe7vaCWF+eNz+g/nuaRwtNR/H+mveRD/WWMluc
	Ni9EXA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm5k26ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 17 Mar 2026 03:32:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c73783c96baso2627654a12.2
        for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 20:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773718327; x=1774323127; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z5d7SpaThv2YlpB2AIVm1TAoC97B3vVdAG0MkkHD9h4=;
        b=ULlPkNr7SslpAsPJoboDm+zJYijz2xakAWSYpFVYcCPWthMruavAeVH9YWOYwwd1r+
         sivw/VFGSllAu5jehFpZrhtXOV99RNJqjwcPEtKjBm8Xd5y09QeWLdcBtFGLKNt5Bh12
         9J9SYCcdo75wPYyYoN55C8Fq+2eC8ixtEadfNUGOgEotN3aR5sH/34+53A14pPRSsIJ8
         cjIEMF+TaAcfY5NNjzdRgv9OinQdhNJnza+55VwWkwVqJ7FtwBTG08yAEYfuhg9MySdC
         luQGNKOLO880Uz0qDWFv3bGh6KLnQ3PMvoibfFx6RdlQD8gsFK5t5UCtcHNu513wgI/E
         J6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773718327; x=1774323127;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5d7SpaThv2YlpB2AIVm1TAoC97B3vVdAG0MkkHD9h4=;
        b=J7RBWc+3E3MXL3nOSMJ5/+p3wJf4AJo5airtTGGVdFe1JmYXDIxhfUnzuELP8XDL8H
         3ZsNIYoKhWDVCgoV03w99bR4fNfYKRnq0RcIUWl3qtddDokedrDykfLlzIiLmMHbVfzs
         KOCn9AwqWBUj+82yFmU6UKYgOYNKsL7ywJ6MMYjV+86TsnnuVx1Mu0EnkVXS8beq5Nvr
         q6grP7zX+gaLy13cvYhmMdv1P6622/lTgqI0AqZVVSM4QZI/M9Lr6KMIwmSTYfHDaMQe
         vn2WN3GPPLU+lPrjLXOhaGsuHIFg0uzllF92r/oOVaW9jxRKljv/Lu/qxsB9Az1Td2x+
         Mzww==
X-Forwarded-Encrypted: i=1; AJvYcCURHp8tb/DNq22inXPoCs5u26/QbYM68UZdio7aa0LwrwtT2TUFdtQpayCSWvWxtv+EGZ79lFA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtCmH2clsEfKkVwlijlIhV73K+2vbPy98Ua4gRiDNCICOy+TRX
	m+iu4sMWQKF5zrR+Z65cWotcfYgwDhNmwK6zv5QLAWKTYd8vncE1fC21+mJtaSIM72e6JSYsA5d
	WMt5HZP2zGA87emBe+8CwyctIYwWN9e0Hm7gMcYE4QOp1MRfJ+nc0a3nDHtMVohyYfCKHtOIEiW
	8=
X-Gm-Gg: ATEYQzxAn0BrLpxufPts5XE6WFPCT09nGXprghSS3KDgpiHvioxoR4boALFyVmHOmMm
	zk2dB575oqrn6o/RL/6sMxhJ/v6ClN6anxkw8/GWORc8TLp4EM2gYJufn2ZpCNJxL2DY4/8wGpX
	aDJ3Q7f0Oa3DsDR7r2NZYVLAddcN7UXkB9nR24RccLXq2GpngW0M3TRaJ4KD5hbJ9pqf+MNCYm5
	NjDZpXkX0h2jtXRruLRx+Vq6zJwBd5Y5HwsjOl8ujGi7WMZZACWC6COEycVNyF0vTJ1CxftxJQb
	T0H1DJpWiYF69muLnifhALxOpP3G9Oo09eILCVMnSVVIeDHrv3sl83Exw7rXjCm1hQR0oFYuN08
	04sNXC5RhtzPZ8bLZ3v5ClcTmaHlunKsniWMRQVlzUw7QYPczxuJav5/BOCjTeqeYIq3Ui9/1vA
	iaoyPEPghIcYeN7g7w1WY=
X-Received: by 2002:a05:6a00:7704:b0:827:2891:c17b with SMTP id d2e1a72fcca58-82a196d723cmr10511208b3a.17.1773718327360;
        Mon, 16 Mar 2026 20:32:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:7704:b0:827:2891:c17b with SMTP id d2e1a72fcca58-82a196d723cmr10511189b3a.17.1773718326726;
        Mon, 16 Mar 2026 20:32:06 -0700 (PDT)
Received: from [10.133.33.128] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a06fe211csm15255762b3a.0.2026.03.16.20.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 20:32:06 -0700 (PDT)
Message-ID: <bf6b4377-1673-4273-8d7d-6163f0109e33@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 11:32:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260316103248.3042158-1-nico.escande@gmail.com>
 <d38acb9f-60dc-4d37-a3b5-8cd09f76939e@oss.qualcomm.com>
 <DH45I9X47H77.74AIOL6V8R49@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <DH45I9X47H77.74AIOL6V8R49@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fJ00HJae c=1 sm=1 tr=0 ts=69b8cb38 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ByHDnCq9wcmhMw9lLjoA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDAyNyBTYWx0ZWRfX4gw5VIrye3Ly
 78TjznXoRsVY66U/qDO9IXqS16QDdzBXwmVnmcoHHGnwcGYnmCjW11WFB8htuwZGb4xSbN/5vEN
 8XkT09Vh1QjRlASTJkmJ0L+eUddxobEMAoRs01rQqEVtCGtP2IXh7TkS+aeENTb/khTIhJ3s/SM
 eVs7V0zYqI2pmj3ct5fcTPIoElIOhk3siSx5I0+hUyqw+9AnpC2uUMq9wReZMgF9uPx4bkN9SG6
 XmwHY7bGWIRQWbe9zFZKVbCR+SzV6/V4c6+faIgdqDPIynPaQRMXDDleYwgbLHFo4lYpCbVMuGu
 NDmuaIjx7OiqNpuZMdsxQykgMVLD9rGg3zpyJyghHnIoYPBxYrHaMa7pyI/xZnWWNV4dcyppJ/d
 P7nXsAwCuR5rW5zyh7TZFN9he0oFY4OUhbJqj62oAjE1CN4QNdJnNFD7TjuwVRaaKk3nLkNGWQu
 Lkb2ilDDCoZ9ZT94w+w==
X-Proofpoint-GUID: N2IDV_xLxz_QBANSh2uNK2OdCB4T4yN-
X-Proofpoint-ORIG-GUID: N2IDV_xLxz_QBANSh2uNK2OdCB4T4yN-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_203211_103525_02A36196 
X-CRM114-Status: GOOD (  15.30  )
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



On 3/16/2026 6:57 PM, Nicolas Escande wrote:
> On Mon Mar 16, 2026 at 11:42 AM CET, Baochen Qiang wrote:
> [...]
>>> --- a/drivers/net/wireless/ath/ath12k/core.c
>>> +++ b/drivers/net/wireless/ath/ath12k/core.c
>>> @@ -2321,5 +2321,24 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>>>  	return NULL;
>>>  }
>>>  
>>> +static int ath12k_init(void)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = ath12k_wmi_alloc();
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	return 0;
>>
>> nit: you can simply
>>
>> 	return ath12k_wmi_alloc();
> 
> Yes we can, but I did this in case we need to add more stuff in that function at
> some later point. It would generate less code chrun. But I'm ok with a direct
> return statement if you think that's better. Just tell me and I'll send the v4.

I would prefer a direct return for now. After all We can always change to your style if
necessary in the future.

> 
>>
>>> +}
>>> +
>>> +static void ath12k_exit(void)
>>> +{
>>> +	ath12k_wmi_free();
>>> +}
>>> +
>>> +module_init(ath12k_init);
>>> +module_exit(ath12k_exit);
>>> +
>>>  MODULE_DESCRIPTION("Driver support for Qualcomm Technologies WLAN devices");
>>>  MODULE_LICENSE("Dual BSD/GPL");
>>> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
>>> index 59c193b24764..02ee6c718621 100644
>>> --- a/drivers/net/wireless/ath/ath12k/core.h
>>> +++ b/drivers/net/wireless/ath/ath12k/core.h
>>> @@ -19,6 +19,7 @@
>>>  #include <linux/average.h>
>>>  #include <linux/of.h>
>>>  #include <linux/rhashtable.h>
>>> +#include <linux/percpu.h>
>>
>> does it make more sense to add this to wmi.c instead?
> 
> Indeed it does. I'll fix it.


