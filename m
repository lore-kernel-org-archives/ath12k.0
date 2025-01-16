Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1467C02183
	for <ath12k@archiver.kernel.org>; Thu, 16 Jan 2025 22:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGo09KYMPPRjhK/enIKlUz92CamNwS6kKxyZAl5uzYM=; b=0cCJgJCPqfIpUCgE7KRpo9/Gvi
	I7m/AuZId+5I5YNGBVtm1Giwh2TMZBhwlS3Tf2zvTcYI5/O0uVDUAyLP1YmCrsoxFKUDD4GpTtJSI
	7YB0QkYKtCCCqkJHlittsA7CkE4NypRDdcNU7ciyDot5ChqYEMpu6Utn31ySQdkkxxWCFhlN5O5yC
	+cMQOyzp4BwrWDdgzaCm/R/8do7J9nbQJVV8kdK9LJthrNXBEOWol3ZDzX+SDis0gHt2mUd7NdQkF
	k1fAv7I9t3zHoAbo1T9KXhxtIG0elB2H2mS02Wk8hl5r12FqDftQTzcNMNE0pNsc05XPJxgupwFUy
	vlgn6KsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYLA-0000000GClp-1gHg
	for ath12k@archiver.kernel.org;
	Thu, 16 Jan 2025 22:27:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYL6-0000000GClH-3ivX
	for ath12k@lists.infradead.org;
	Thu, 16 Jan 2025 22:27:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GKLjBF002856
	for <ath12k@lists.infradead.org>; Thu, 16 Jan 2025 22:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xGo09KYMPPRjhK/enIKlUz92CamNwS6kKxyZAl5uzYM=; b=j+UQR/Kie+JoF5c8
	+Kxw1ymnbr0QaD3woeaYUqV7/PQQ5E+0BbB+dwv2DZ7D9mcYaRcP+ZUxHoBCuFuO
	Q+KZZiC4DUfrG1clDhZAODXzXtg0Hd7HIe1Loan8KiLMcSGywA5+OCqjBg5Vekn2
	2hk0NjymYBBTr73jwmUCpB7bT8r8XLftWQILWYbTjxlbSExPs5e3g26AsBZDu4jb
	+mcqbvSuskzyT+3qoIo2j6XsRbahp1OZl9yueT4YCWJKd2VisZ9asXuXCP/W2LIN
	zAFXFYMGmOKkEzAum974oAeJ6BunYJSFgTAnScg7xCbhPx6sOKICY+vm7EYRdxJA
	cuMCjw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44793306x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 16 Jan 2025 22:27:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21681a2c0d5so27229345ad.2
        for <ath12k@lists.infradead.org>; Thu, 16 Jan 2025 14:27:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737066466; x=1737671266;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xGo09KYMPPRjhK/enIKlUz92CamNwS6kKxyZAl5uzYM=;
        b=Uz/u/ta6bfTsT/phBQg7lk5SUMtZsrePzA9kHn/qq2c5LfOtcWtMbqTF0vwJn4uKR2
         +abJTkjPzVUxiP8I5lLj1R1EAcafEYH1IPu6KqmPh1H2XQtCFYHLzK6vflxMHZdKQkS3
         piXl3uzeY6yzvC7kMQ7VBZj5aTx1yr+9yK+RB0Sj9cc41xOHwbvUkrtYZNymWU6DS6Eu
         GMHoVrnnZ3hufzhJ/Z2cgUyw+MLQ3VdH2d5Kr82GKWxsI4W0OdHgBGEWPhDp3ukrU8wf
         OUPWb3cpoL+IYgEGK4bpyolD0zJ7hc7Hgnvng96Tj9XP9yGZ9cC1zrBqMAI/3KazbkWb
         oaCg==
X-Gm-Message-State: AOJu0YxXg50p9rKPAQ9grLAxWM+zDOrGA6bVoqvpAqj2Fae3sTWBdKz+
	/qRy3etsLipwuTesFzz9FLetdtHYt1F8iwSCubl2JHVICwi8kPz7zsYolPGTDDNb3D+6zpAYnx4
	2t6Bj4EyfPGFZy/iFnwF60siRY273n8L6yjI/nmnEoCEFCx65wo8HvbNwyncq
X-Gm-Gg: ASbGncuk5UtNu0lX8JtL5j091TcVKnkNvR4qKOZguqxckbPSqwBADhyJQMXj7PnLp5t
	pJbLPV2nYOJH4yimzkCC45wiV3YzSK2lOh8LCF3lDn7Ja5ftMoAazxQZbzyET5jtA5njPNHcCXO
	cTVBCk/juieW2L9dj0/vzFfYLlFY+5ostqQrIy32Zd/Pc+iirLn9kTnddqmvD9u14WM9RNtRwNV
	Mvi3OSN8pFHsLPss6XWmG9+zLjSrPvDFxU4dpfhw3bE/UQqCwtvbzCADixOqCryn0yx09KYLlSC
	ZpTA3bDPvsUaGlC4ft8+hEdSZtf7CXlTFZ+10TUxDbnJaKpdcw==
X-Received: by 2002:a17:902:fc8d:b0:21c:fb6:7c3c with SMTP id d9443c01a7336-21c3540760emr6242405ad.17.1737066466307;
        Thu, 16 Jan 2025 14:27:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjVO/7b6/6ONrEtNjdMhKAKPGO1CAW6tywGRPInrnTp4C0qD2j8SMA6nlZIdeYiNEt27am2w==
X-Received: by 2002:a17:902:fc8d:b0:21c:fb6:7c3c with SMTP id d9443c01a7336-21c3540760emr6242215ad.17.1737066465935;
        Thu, 16 Jan 2025 14:27:45 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bce3a7bbesm542587a12.42.2025.01.16.14.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 14:27:45 -0800 (PST)
Message-ID: <31a449c1-260b-4b70-9498-c5015e74c972@oss.qualcomm.com>
Date: Thu, 16 Jan 2025 14:27:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix memory leak in ath12k_pci_remove()
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, kvalo@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20240314012746.2729101-1-quic_miaoqing@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20240314012746.2729101-1-quic_miaoqing@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Zg0saOUolV5XJ37KRPJlBhY_QwPGnx0L
X-Proofpoint-GUID: Zg0saOUolV5XJ37KRPJlBhY_QwPGnx0L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_09,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_142749_072909_C9D9EBA7 
X-CRM114-Status: GOOD (  16.88  )
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

On 3/13/2024 6:27 PM, Miaoqing Pan wrote:
> Kmemleak reported this error:
> 
>   unreferenced object 0xffff1c165cec3060 (size 32):
>     comm "insmod", pid 560, jiffies 4296964570 (age 235.596s)
>     backtrace:
>       [<000000005434db68>] __kmem_cache_alloc_node+0x1f4/0x2c0
>       [<000000001203b155>] kmalloc_trace+0x40/0x88
>       [<0000000028adc9c8>] _request_firmware+0xb8/0x608
>       [<00000000cad1aef7>] firmware_request_nowarn+0x50/0x80
>       [<000000005011a682>] local_pci_probe+0x48/0xd0
>       [<00000000077cd295>] pci_device_probe+0xb4/0x200
>       [<0000000087184c94>] really_probe+0x150/0x2c0
> 
> The firmware memory was allocated in ath12k_pci_probe(), but not
> freed in ath12k_pci_remove() in case ATH12K_FLAG_QMI_FAIL bit is
> set. So call ath12k_fw_unmap() to free the memory.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.2.0-02280-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> index 14954bc05144..f4b48f96a223 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -1505,6 +1505,7 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
>  	if (test_bit(ATH12K_FLAG_QMI_FAIL, &ab->dev_flags)) {
>  		ath12k_pci_power_down(ab);
>  		ath12k_qmi_deinit_service(ab);
> +		ath12k_fw_unmap(ab);
>  		goto qmi_fail;
>  	}
>  

This patch was previously deferred, and now no longer applies to ath/main.
If the fix is still valid, please post a new version of the patch.

/jeff

