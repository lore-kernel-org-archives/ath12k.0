Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25128CD98ED
	for <ath12k@archiver.kernel.org>; Thu, 18 Jun 2026 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymu1pZtY6Qzkufo8znnNgsaolHtKmq4ib+tAPwdv2dQ=; b=GYEm1W6UI340CBsl+10+chKI1K
	xKo+W5ZbN0wkYEA8aoycX1McJc/ml0XCoIdL5yWy60NjGxL5g9F3vQgozXOb4auxxmNLKwUzzvXZd
	6yfXXn1bk2BI0sqmUQPeV/BXKFSgga7xwKGpQES0e/Ob/jv5+mmzLlBDuI7rh+j/xX3N+kzzRFfmB
	Qe9iKoGoCF6BXnnM9ASZmIwgvQNONQpuBm3/x2kaeVe1o5Dqxr+Gb50PrUacpQt6ckjWIVTUPkSz/
	dlkkI0WNcMBI/WehJ6kixqwERjRtjIXc1zb8L0TzF+okRPcIooy0gKBVgBr+4trX1aayoqnbEpIGP
	83UgHw9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8x8-00000000vm8-3kxG;
	Thu, 18 Jun 2026 09:22:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8x6-00000000vjm-2tFf
	for ath12k@lists.infradead.org;
	Thu, 18 Jun 2026 09:22:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8DgDJ692872
	for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 09:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ymu1pZtY6Qzkufo8znnNgsaolHtKmq4ib+tAPwdv2dQ=; b=jiYzsvUdYkkGcfQT
	uYJjPMIvJAKYooqcW/rpZxHfMuZ24DwMjSddeNzkdU4lKdlHQDzy7XpA1KymqsMa
	tgz1knuW8renpZP3odni5MrwULG0IiYoGOLEFTlJO5hYN20sqxewW7qTZfjX94Ec
	Aj6Iz3QDRO4NOXOgpkIgbrfSS0dRGXfU994nhjnadkCg9vp4iU2fvZoAL8w1pAeK
	1XgkYuo/4OKhATZF5jF1RAao6H5Q49rLa9G+tioXeJNjbyGYrkhO1jBXKkb7H6ss
	7KVyMjhyb7QNX7IPV7O17BTZ9fTsKfSxMNN2dDavgOESNTGjMNrUGr7XaadxhLcg
	rUvCOQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2cbv7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 09:22:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8426ed9f24dso1143184b3a.1
        for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 02:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781774543; x=1782379343; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ymu1pZtY6Qzkufo8znnNgsaolHtKmq4ib+tAPwdv2dQ=;
        b=V2DxBEF05LupfRZAfFLO1gFyLZhUF65xgMCOITO2Pgc8AKb/3Xhw21SQOyKQ7j3QGU
         XjjOW0PVj7fvYFu4GEnYGJFKRccv6NVebC6ufGf0eDPkTqzKuA1Z2IyrqRCFAE+QF5h8
         naFU2DxDj+sNfBmAiRsnTj9Ol7snJkS30CzIcvpDj8d7ih/l3kgQpQSaYEMGqGpoCa/N
         6NVPHIOAEZ8SKV22wXzCjvdqTkQi8DoBK0M9CPflruKawXDOg5TO1pjzkwEFRXBwOfbJ
         TU1k0TnnxSVWltDdAzDSe1YDvmFlipBrToq10n0FtBzyNTNAaAjpIDlJp14Xn6dOH62Z
         5nrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781774543; x=1782379343;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymu1pZtY6Qzkufo8znnNgsaolHtKmq4ib+tAPwdv2dQ=;
        b=S9VQDeMM1NXg9PZc4SQzf2zMg7y3CXPOyLHx/RsOfXcDiq6FSXV2wTtsxEpMIv9835
         ajWU++E6t6gr6pmD43JQD1/X5iMXwUKznr1B/z3x9fPwmJQPZDzkCFtuD04R7BPi3Dq1
         qAJD46At1tFGLYztqioHLdaTMJmfD6q0Y3BSsy2Z+5jCEgcFU3ycTujMPPIIHzapdCIc
         XBfFkk8qBQrJolfYf7+KU2/Z3aK0TbbJjEyam2tQJvpLLpiV2RHQVirF1+R4GBoFcXoH
         CpsCrRgU2As6bLQBWarKKhY6NI9iRKGUfILT8VZulcDGstc4FkSEe2ZQWpccn4DOO6mM
         Ukww==
X-Gm-Message-State: AOJu0Yz8bO3dYX8Am99a9JMkIix9BoMn11OLtdXnKemDhUbLmQ2QeRRs
	K+IpeTYCNp3iue7AjJc4G6WJu8IFtdef6zQRj0azdlOYlaZu3w3jHsAwSCmxH/9G2HOQXtGMbOi
	GNQSBwq75lrFXepG90+ALyHd8m3F9EPyLDf0HGqf/L6ZDX2MIGCSFk1y+wRNKkrQy
X-Gm-Gg: Acq92OHpa6Ldyt/yYYr3FvY1eCL02zoKqiMbAvay+V7sZx5jYUGIzEkpt/GVTVPEKd5
	wBWtF6A2HnQWcyowa9raajBhAdWwuvcQdj0Yh0ciKqlrSvxknu4wsnLqiF1xzlqbT9E+NAyiiZw
	nuh6pkIRXIj1EfHG/j1GmW4+z/jye9f0kx1wBzW0kchk4nEl3z1DH7Lr0YZ29wYYrVCldy39hsX
	L2bMRrR30/z2lul48U0Gq6FfZ4Kx8YfIBWeJoWwjVZpsEasMsauG3kn0SKvJUy+vX9ar/4454xs
	Onm8KfxWT/c+U9/3w01Kelooqm7oLQeIFNOUx0Wpi769z6vxsONUCjXXqN43U1r8h+O6u3BHTdu
	5FJGeD2C5oqq1Op1ZjsLDzZNQNvluXsVYDt5W0Vtz7oMNxPynO3/z789JK4c=
X-Received: by 2002:a05:6a00:812:b0:82f:684a:84ea with SMTP id d2e1a72fcca58-845391e1084mr2643987b3a.13.1781774543333;
        Thu, 18 Jun 2026 02:22:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:812:b0:82f:684a:84ea with SMTP id d2e1a72fcca58-845391e1084mr2643961b3a.13.1781774542841;
        Thu, 18 Jun 2026 02:22:22 -0700 (PDT)
Received: from [10.137.71.130] ([106.197.93.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accbec5sm18638584b3a.16.2026.06.18.02.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 02:22:22 -0700 (PDT)
Message-ID: <e8cd11fa-944d-4936-9a57-d1b0d3d856e0@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:52:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 3/5] wifi: ath12k: add HAL ops for monitor TLV
 header decode and alignment
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
 <20260509025819.1641630-4-miaoqing.pan@oss.qualcomm.com>
 <aa5e214f-2d9e-4c97-b45f-7181c81cf023@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aa5e214f-2d9e-4c97-b45f-7181c81cf023@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4NiBTYWx0ZWRfXyslEnJxJ6Tg+
 TQcFwTA5FVDS3LhC1mWYlnVFRESGSNB7JgveRCDwdjuZ3y8CSq/PT5j13LIge77jn9owtS6w5ho
 GzWu/+2mJuGEZI/wW5L2d2/iRK+ECur1GE/soTMML6zlFmOPwEM7lPPvtlBfQyhc35rpgt/Z3MQ
 mkO6mKTbKcmFHsrlALnYbVhT+5H3vVGw8J88mEnaEUPCBNdlZOcpG6BrmoYwxmBqUckLHNgxKl7
 norrpz41a9RDhaONJEUXfmedAMSCvXGP/wR3eoTKpLe10ca+xOEHR2q2NO9E1/t1FUf8HRsVmUx
 1Ixha+Y/kVduM+AK3YKy5q8jtRfIrefO6Nd6dqtIXqaXulGDmbqnHIwjpVIMHM71UxsmbQCklv/
 AfVX7ybXTRyZQQVbcNEWFiASEMlRxUPZE1nWuoiRCLsWg7Tet6F1Lr0xL1I2HYzJRt3rkfIfjxi
 sZnaPmiT+ciksa6W0CA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4NiBTYWx0ZWRfXwxGTs7WXeHMk
 VHQ49VGrPI3IN7Q0MHFGochMby7hm7jw2vgSU7szBeb4BLsEX9bu9V/BXsA7hCBYV6Q02/E2F/L
 KqmWlUoaXhL5Ru5ZyxHWqcZJ/HEXBjk=
X-Proofpoint-GUID: 91UEXCp8wEkJRvSTSywCp7ESrBtKV4dA
X-Proofpoint-ORIG-GUID: 91UEXCp8wEkJRvSTSywCp7ESrBtKV4dA
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a33b8d0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=wlpA7Av3g41Jdys7FXR3eg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=REP3-BY0cBNZE2ghv4IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_022224_737431_81EEC445 
X-CRM114-Status: GOOD (  16.25  )
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



On 6/18/2026 2:43 PM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 5/9/2026 8:28 AM, Miaoqing Pan wrote:
>> Wi-Fi 7 monitor RX status TLV parsing needs to decode TLV headers and
>> advance the pointer with the correct header alignment. Different targets
>> use different TLV header layouts (32-bit vs 64-bit), but the HAL ops for
>> dp_mon RX status header decode and header alignment were not populated
>> for all wifi7 targets.
>>
>> Add dp_mon RX status TLV header decode callbacks and TLV header alignment
>> helpers to the wifi7 HAL ops for QCC2072, QCN9274 and WCN7850. Export
>> helpers to query the required TLV header alignment for 32-bit and 64-bit
>> TLV headers so the caller can align the TLV walk correctly across targets.
>>
>> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
>>
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/hal.c               | 12 ++++++++++++
>>   drivers/net/wireless/ath/ath12k/hal.h               |  4 ++++
>>   drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c |  2 ++
>>   drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c |  2 ++
>>   drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c |  2 ++
>>   5 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
>> index d940f83cd92f..c0c3d2f047ef 100644
>> --- a/drivers/net/wireless/ath/ath12k/hal.c
>> +++ b/drivers/net/wireless/ath/ath12k/hal.c
>> @@ -875,3 +875,15 @@ void *ath12k_hal_decode_tlv32_hdr(void *tlv, u16 *tag, u16 *len, 
>> u16 *usrid)
>>       return tlv32->value;
>>   }
>>   EXPORT_SYMBOL(ath12k_hal_decode_tlv32_hdr);
>> +
>> +u32 ath12k_hal_get_tlv64_hdr_align(void)
>> +{
>> +    return HAL_TLV_64_ALIGN;
>> +}
>> +EXPORT_SYMBOL(ath12k_hal_get_tlv64_hdr_align);
>> +
>> +u32 ath12k_hal_get_tlv32_hdr_align(void)
>> +{
>> +    return HAL_TLV_ALIGN;
>> +}
>> +EXPORT_SYMBOL(ath12k_hal_get_tlv32_hdr_align);
>> diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
>> index 3158c1881c76..312993d3d5d4 100644
>> --- a/drivers/net/wireless/ath/ath12k/hal.h
>> +++ b/drivers/net/wireless/ath/ath12k/hal.h
>> @@ -1439,6 +1439,8 @@ struct hal_ops {
>>                        u8 *rbm, u32 *msdu_cnt);
>>       void *(*reo_cmd_enc_tlv_hdr)(void *tlv, u64 tag, u64 len);
>>       u16 (*reo_status_dec_tlv_hdr)(void *tlv, void **desc);
>> +    void *(*mon_rx_status_dec_tlv_hdr)(void *tlv, u16 *tag, u16 *len, u16 *usrid);
>> +    u32 (*get_tlv_hdr_align)(void);
>>   };
>>   #define HAL_TLV_HDR_TAG        GENMASK(9, 1)
>> @@ -1553,4 +1555,6 @@ void *ath12k_hal_encode_tlv64_hdr(void *tlv, u64 tag, u64 len);
>>   void *ath12k_hal_encode_tlv32_hdr(void *tlv, u64 tag, u64 len);
>>   void *ath12k_hal_decode_tlv64_hdr(void *tlv, u16 *tag, u16 *len, u16 *usrid);
>>   void *ath12k_hal_decode_tlv32_hdr(void *tlv, u16 *tag, u16 *len, u16 *usrid);
>> +u32 ath12k_hal_get_tlv64_hdr_align(void);
>> +u32 ath12k_hal_get_tlv32_hdr_align(void);
>>   #endif
>> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c 
>> b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
>> index c0583c3a2191..80ffadc47d48 100644
>> --- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
>> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
>> @@ -490,6 +490,8 @@ const struct hal_ops hal_qcc2072_ops = {
>>       .rx_reo_ent_buf_paddr_get = ath12k_wifi7_hal_rx_reo_ent_buf_paddr_get,
>>       .reo_cmd_enc_tlv_hdr = ath12k_hal_encode_tlv32_hdr,
>>       .reo_status_dec_tlv_hdr = ath12k_hal_reo_status_dec_tlv_hdr_qcc2072,
>> +    .mon_rx_status_dec_tlv_hdr = ath12k_hal_decode_tlv32_hdr,
>> +    .get_tlv_hdr_align = ath12k_hal_get_tlv32_hdr_align,
> 
> ops get_tlv_hdr_align() seems unused, may be patch 4/5 is supposed to
> used this ops instead of removing the alignment?

My bad, somehow overlooked it, it is indeed used in the patch 4/5.

