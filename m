Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667C9C77B7C
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 18:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSlSLiXE9ML5oVRqrkn0OwhaNJ+Eurdiuji/Hh4dp2A=; b=LzQZtkJCLoAkqtOUPCNLWdnWSi
	4cxAMEfjxCKCKjhfdeYOkLfX4iLMN4ITZl8AoOTi/UtcciSr2c3omarX4hibX9AgDohpGVgNfqNMm
	pyqrpeCIYEwnLcRE08sBjcox53ih1oe+WfInsBpWCAaYu+6dWyX+4jXR5D/irwfaIzX1+L83JYbF5
	D0mAElvfjx3fgnztR8go3ZNSXZ1g7KIFKYyGK4ws6JD2YcnV4bpired8baql4OXoCgq3617/8TuCU
	IkBOI7AG5FQiwNgpP8BpoUq7PIt7Ns7VfAkBRh1IowVE6Ky8iauhTwRKd9m9+OezR7pR0wVvZYiYE
	sQoDnunQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTm4L-00000003iMf-0WdC;
	Mon, 23 Jun 2025 18:39:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTifF-000000039Ec-3hf2
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 15:00:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9vSSW013999
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 15:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jSlSLiXE9ML5oVRqrkn0OwhaNJ+Eurdiuji/Hh4dp2A=; b=muv1LrfI6fQfE/9N
	bU4Ebn3xwqoNrav6Ntazr9z+L3QR9eeaVAlZuJyO2ZshGr7/cVVrOtnpaePK4rHl
	CxTsCbxNlyj+9E+Fo/YZa4S947mMa3BC5JzypOt5fYsSekqczVIYTnVgDkm1j89h
	77EZQCYiVJNt/+spruq+ySYXEm9OZ/1tPo69VAwyxV/GbaXD9hwsqTEUxpzlUy9m
	IRQht1z1zUQfmTWL2T+8OnSqTquljQvx8X3uiNQV8QnvE2fKdKCtcz/oKEYGktjh
	ctKXjJSUSh5T2lIQYFbpshob1qWDcmGkpxQGaz6YhR7lBfns8K+P9pZ1CNVrtCeg
	zFZUBw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5j5qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 15:00:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b31cc625817so3282040a12.0
        for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 08:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690852; x=1751295652;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jSlSLiXE9ML5oVRqrkn0OwhaNJ+Eurdiuji/Hh4dp2A=;
        b=HL0YVH8rqzFb5tDr1ziojIxJBcGBh7e6ObtWj3VkGa1kl2Z8dCs2uSw6RLdgM6TDBB
         IPWpZv5FDHRypa30a0a8stpudsb8JstsJuYnLubB2a3VDmz1m6qlhhrCh3OhKCzQHsRL
         3svEEO12O8P7SQjO1MTk3MDc9BIniaLuh+kmX3MLtNdvp8zNl8znL/Becqq3kRIutVc0
         ubW7VQTIVnnU3nE5azcQI3GRQwOH9hlFkG1ETehZqQpKEhgVzQJvGjxlgxJ60k/q6sKn
         jHiyU9vh9qzZesqOQocmADEXdPvKzLbzOIYtmq2UtbkYPMotehM5Bp72ATN8jcll5ru+
         s43Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaP6fsRrL+GzYjdfxp2gvOXTwbSlkuCplNI2fOXeMscklWvjC9SswCMuS5NG3TDuDlFgEVqk4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxaiLWetv3o4gcOseDu9xYpW9egj5FwdwXkZdq6DXcBi3WHcWTY
	MLvddgEl0Z6gLJBA95USBWf4CQqkHvEFw65g4+2Nx62TaI0KCdnprfm7+laTg1B8ET4JGt7JB+z
	vGylZ9KYb+r7zeEH/8XwGNoGMkbRI2xhFuyZW35aQ5n8Ol44lcNyhokxRHzjpGkE7
X-Gm-Gg: ASbGncvCmP0jE4PklbjqTF4+Hmkh0J5cybLFM1coMINWg+NgVOX8jmV1GVfE8CphaI7
	RX+Bol4hizFx7eBjfhyoWQSzgP8N0IZ4IYOhOYqLToTaQKkH/YjF9q8GFG71iNZg2Uz7Tfo42rJ
	x0D0CVb6WeGHZo5TDRhTwYkRa9Jc1yczRed9A9ErII2QUVwZ9XyHtIk2GOfVzNF1Yi46Hr5+vDX
	LPOI/P3ZnXcCoyQwzFdrCK7b2Dqd5Mmt/4Q+66C58XEEA3JnrMcjUQXse8VJNC7iv62cOZi2cRN
	uXcAZV0C5X/yoWGiImxLZdNzVjE4ObxWZr13iTMt3BjeLhIBP7Sw2j8R5X4uOt8elphNYbrHrCT
	8cA==
X-Received: by 2002:a17:90b:510b:b0:311:abba:53b6 with SMTP id 98e67ed59e1d1-3159f51aac2mr17078299a91.14.1750690851306;
        Mon, 23 Jun 2025 08:00:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGdABP063Vlk5OVUgONkfYW+i6XNH2ryukyv215HD7e7TxM3SjPrhrNyrPInpcakQhC9K4cA==
X-Received: by 2002:a17:90b:510b:b0:311:abba:53b6 with SMTP id 98e67ed59e1d1-3159f51aac2mr17078205a91.14.1750690850497;
        Mon, 23 Jun 2025 08:00:50 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a318733sm10835361a91.38.2025.06.23.08.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 08:00:50 -0700 (PDT)
Message-ID: <500a10c9-c56e-4192-818e-8e07ef6c51f4@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 08:00:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: use real noise floor value
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
References: <20250528-support_real_noise_floor-v1-0-04507bd3bc76@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250528-support_real_noise_floor-v1-0-04507bd3bc76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Yp2DRVfc2DOg7sW142CmDc3_jYMsreR8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA5MCBTYWx0ZWRfX7VYYWjAlUke2
 R9+D3PKeY9j5rYzFwrDbwbPkojkyNhFeLDBwE3Xe4AlOwSCWAr5ITbunYpArLc0567FfxjyM5gg
 4knY+ZhPgdzD6/Mq8NfIfqLAY2YuDw21KkQly9mRzvZZ6OJqu8F8hDarFPGoARqOwx6+pnT/qzP
 wGCSXMjYGnuKZLS7jh6kitwwKk65yZQB9woT/U/WL43hPQYEmDv5AoPiBEQg11erz9z73J7muiv
 5YW/mxbsoAsm4quOBSeDvdPgrorWjTgorZG9x3NY3SRZHR795zP15mjbkn6YhGrDsNfJYNPTx0X
 UAQHPS392D/KOoLdAHC6drkYOu1P8xSCiC6+v05zeWmc/ngbKs5yWUrOUTN3WixLjEYp0mzNkGs
 eLpsFP4JMH9iCAAtCqQBU1Knguatg5uzXpOpViDSuWiQcsArZP5j7rYuGDLuCTn5xE6655nF
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=68596c24 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=ksen3YYlDcNkJCCezrIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: Yp2DRVfc2DOg7sW142CmDc3_jYMsreR8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_080053_938225_1B61B18C 
X-CRM114-Status: GOOD (  16.65  )
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

On 5/28/2025 4:23 AM, Aditya Kumar Singh wrote:
> At present, the ATH12K_DEFAULT_NOISE_FLOOR (-95) is used to calculate RSSI
> value, providing an estimated noise floor value. Consequently, the RSSI
> value is also approximate. This works but however, using actual noise floor
> value will enable the reporting of the true RSSI value.
> 
> The firmware possesses the necessary data to determine the actual noise
> floor. This data is provided to the host via the WMI event
> WMI_PDEV_RSSI_DBM_CONVERSION_PARAMS_INFO_EVENTID, which includes the
> runtime parameters needed for calculating the real noise floor in dBm. This
> event is triggered by the firmware during channel changes, temperature
> offset adjustments, and hardware chainmask modifications.
> 
> Add support to handle and parse this WMI event. Use the received values to
> calculate and store the noise floor value and use at the required places.
> 
> ---
> Raj Kumar Bhagat (2):
>       wifi: ath12k: handle WMI event for real noise floor calculation
>       wifi: ath12k: use real noise floor instead of default value
> 
>  drivers/net/wireless/ath/ath12k/core.h   |  17 +++
>  drivers/net/wireless/ath/ath12k/dp_mon.c |   7 +-
>  drivers/net/wireless/ath/ath12k/dp_tx.c  |  20 ++-
>  drivers/net/wireless/ath/ath12k/mac.c    |  14 +-
>  drivers/net/wireless/ath/ath12k/wmi.c    | 233 ++++++++++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/wmi.h    |  42 ++++++
>  6 files changed, 324 insertions(+), 9 deletions(-)
> ---
> base-commit: 3d933084a072fd5fb5da54c06a017abc0412c86f
> change-id: 20250513-support_real_noise_floor-205986936cd3

This series no longer applies cleanly on ath/main, please rebase

Applying: wifi: ath12k: handle WMI event for real noise floor calculation
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/core.h
M       drivers/net/wireless/ath/ath12k/mac.c
M       drivers/net/wireless/ath/ath12k/wmi.c
M       drivers/net/wireless/ath/ath12k/wmi.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/wmi.h
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/wmi.h
Auto-merging drivers/net/wireless/ath/ath12k/wmi.c
Auto-merging drivers/net/wireless/ath/ath12k/mac.c
Auto-merging drivers/net/wireless/ath/ath12k/core.h
Recorded preimage for 'drivers/net/wireless/ath/ath12k/wmi.h'
error: Failed to merge in the changes.
Patch failed at 0001 wifi: ath12k: handle WMI event for real noise floor calculation

/jeff

