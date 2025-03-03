Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07335C282C6
	for <ath12k@archiver.kernel.org>; Mon,  3 Mar 2025 18:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsKHwPyakFDRtES+T+7/Q0gwDO/LMXT6KYV55aqeyaw=; b=aflkAQMOwO5zabfNIHK72I72Wg
	TBjMDOqtxAnYUmlOQmgYwyYqWwWct831yMZp7H+VPnyuaU+YvpFG8AdSqMFZyKph4kAAcvm4QMcSp
	F94LrzWyWeWTQOICeq6ZZ7iMQM50sS5hHHRBWUrghC8AnjnKcztSfxzpJYk9eagxMDMbBfefNRdmW
	Mrhzk8J1DQg54ZfCk4utkBsJ7c0rwJImY5zWxkgp72qDOkskCMxn2c9G5FCAEEvyiAihloLp63aGh
	1btDXBPWVDRwwkUaWV9yhnlHFPTW/XWbJ6e34UhP/ApaJiB+qDiGw+w+eUXUtQ58QXPcmkcj/4+AC
	kizQ9d5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAzl-000000020Lu-3Ggz
	for ath12k@archiver.kernel.org;
	Mon, 03 Mar 2025 18:58:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAzO-000000020KZ-03No
	for ath12k@lists.infradead.org;
	Mon, 03 Mar 2025 18:58:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523AmNZm001154
	for <ath12k@lists.infradead.org>; Mon, 3 Mar 2025 18:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YsKHwPyakFDRtES+T+7/Q0gwDO/LMXT6KYV55aqeyaw=; b=WreSL/YTco6Yth3N
	1PaARfUGv3SRN0b5i+PFGVu1qFL2ld4AUMDbfscADxapdjw3M8Lw6qx7S+zLbxhf
	64QbsI3vkyaRE3vRpX+ovRjLM5PhSwR2WSQbJb9TpMj2ELpGGUOiiYywllQDGrLb
	bmBYQ/RtqLOVyWoEQzuOHGNJAMhUOd+TuWfTN5lJDOWA83FoifwWhOXlVvtempTQ
	qOMmdzN8jzpOmHRgUp/ZjkF6Xp66xGNowMdqUYtwWoKItpFkPHjRs5Y3Ygxmc+/A
	yfn5xJXDxfAh1lcuVaTYyIVJoZAjgMGeUpxzCdaQ4VsipzwWBAYUwJ98/1BLtIm5
	36eG7Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453tasdvyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Mar 2025 18:58:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-223725aa321so7536415ad.2
        for <ath12k@lists.infradead.org>; Mon, 03 Mar 2025 10:58:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741028283; x=1741633083;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YsKHwPyakFDRtES+T+7/Q0gwDO/LMXT6KYV55aqeyaw=;
        b=RvVqK+v5Ss19giy4Ia8dQfTVgp/ropvWDylth6m+XRAgzqhgvZ6UDI2YAmczhFASO8
         09rACJsgE6x/6KNZJ7EApf1CvZyG+MY2042rCrJ1MDJhrlEEE6ojk1GJdGTVtNrzfJ6L
         1i9TDNqKPFb3Stc66dgC3gbABUgXAe/DgzrqS5VMyMjT08exfLDCwYhkJ9DctTmFw/iw
         MTTAj4MncMI0jPO+OL13XLvZycVkAtRr7ENxSmTfx74zjJA8eSksKteXJ8WCbVzGG4Ec
         FAFgwFvgE+MmdzovEhMvZL5fXkGzPHsghevZXzcFJRN4S8uTiWCiXWddseWdcVk/LuIf
         uDyA==
X-Forwarded-Encrypted: i=1; AJvYcCVvgygX1ouGLE5H5vfhByB05CzCFzPELUTZ3aBHnVLEsw2Ab4fddxkqBjfTFFE98PGKZpf3a8E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyiux2VT3hD0jCDmN/lO5GftWH6Q17ixRdkJX3pvQb1iVUM6Aak
	2WQE7MFFwZGUmMRZeYL3CF4SNxDRtmjNbbb+7RhRNNr8wgtefCek3vmhpT/COPU2TrRAFhFmXG6
	SmeDd6OR+ROx84NDg7raFDeD2+16SSnmozpYqyf/6OaHZieY71T4tCN6+2gKx
X-Gm-Gg: ASbGncsXVoH1R5c9XRgtrNwvHkbulK7LWwCmURuYoL5hYS9VGHddHTl7HzkJ0urb7ku
	IeBnevSHGMoV7U46ZlFEg08XQLslcl+oY3fVHLJkpHQdSzpd1F9mkMArsUsp8G+cUMhMtl6T7Rm
	ZNDp0sTWbCTvUPeiEu9epVDRdwyg591O9p+qaSzMXDtkh7i4z4riwEuFG34ruIlUv/Mg1tfCMYP
	4VX0PEroXDswFj4S60mMtJcxSl50wFDy0ty00nQ5hMIurx2QYr04lBkC2eOnKzlSJLSoQwLx/hK
	9R6+9eqyYOnt9PSqrYxQF74EDKHTB7zseO8PpoRXQEY3rWlO0uypcjOLgIbYK2YnXHcqGGszEWx
	i8M2xAL1M
X-Received: by 2002:a05:6a21:110:b0:1f1:817:64cf with SMTP id adf61e73a8af0-1f2f4e4e495mr23799815637.37.1741028283228;
        Mon, 03 Mar 2025 10:58:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUykW5x9XbBIshU6ygZB6a+zQ9TtV2CwGQnAIwjD0aEsfN4kQZdY/EyizdJ71iGLwfZjj53Q==
X-Received: by 2002:a05:6a21:110:b0:1f1:817:64cf with SMTP id adf61e73a8af0-1f2f4e4e495mr23799789637.37.1741028282855;
        Mon, 03 Mar 2025 10:58:02 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734af6abc02sm7152633b3a.110.2025.03.03.10.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 10:58:02 -0800 (PST)
Message-ID: <d926be86-94d2-4c72-b9ad-4686583f8663@oss.qualcomm.com>
Date: Mon, 3 Mar 2025 10:58:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: Pass correct values of center freq1 and
 center freq2 for 160 MHz
To: Suraj P Kizhakkethil <quic_surapk@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250204053451.2703834-1-quic_surapk@quicinc.com>
 <20250204053451.2703834-2-quic_surapk@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250204053451.2703834-2-quic_surapk@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V9vd41s6HmGvTo7G79-0wmpjwDapw7P4
X-Proofpoint-ORIG-GUID: V9vd41s6HmGvTo7G79-0wmpjwDapw7P4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_09,2025-03-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_105806_200152_031EDB1C 
X-CRM114-Status: GOOD (  18.10  )
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

On 2/3/2025 9:34 PM, Suraj P Kizhakkethil wrote:
> Currently, for 160 MHz bandwidth, center frequency1 and
> center frequency2 are not passed correctly to the firmware.
> Set center frequency1 as the center frequency
> of the primary 80 MHz channel segment and center frequency2 as
> the center frequency of the 160 MHz channel and pass the values
> to the firmware.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Suraj P Kizhakkethil <quic_surapk@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/wmi.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index f934d49acee6..848a65268194 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -1037,14 +1037,24 @@ int ath12k_wmi_vdev_down(struct ath12k *ar, u8 vdev_id)
>  static void ath12k_wmi_put_wmi_channel(struct ath12k_wmi_channel_params *chan,
>  				       struct wmi_vdev_start_req_arg *arg)
>  {
> +	u32 center_freq1 = arg->band_center_freq1;
> +
>  	memset(chan, 0, sizeof(*chan));
>  
>  	chan->mhz = cpu_to_le32(arg->freq);
>  	chan->band_center_freq1 = cpu_to_le32(arg->band_center_freq1);

s/arg->band_center_freq1/center_freq1/ here and below

same for the 2/2 patch


> -	if (arg->mode == MODE_11AC_VHT80_80)
> +	if (arg->mode == MODE_11BE_EHT160) {
> +		if (arg->freq > arg->band_center_freq1)
> +			chan->band_center_freq1 = cpu_to_le32(center_freq1 + 40);
> +		else
> +			chan->band_center_freq1 = cpu_to_le32(center_freq1 - 40);
> +
> +		chan->band_center_freq2 = cpu_to_le32(arg->band_center_freq1);
> +	} else if (arg->mode == MODE_11BE_EHT80_80) {
>  		chan->band_center_freq2 = cpu_to_le32(arg->band_center_freq2);
> -	else
> +	} else {
>  		chan->band_center_freq2 = 0;
> +	}
>  
>  	chan->info |= le32_encode_bits(arg->mode, WMI_CHAN_INFO_MODE);
>  	if (arg->passive)


