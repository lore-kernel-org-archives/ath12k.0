Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48261CAC597
	for <ath12k@archiver.kernel.org>; Thu, 18 Sep 2025 07:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRPWTQoR8hA7x6PFpW61s8iJ3hsYQG3RiIDz2KF195Q=; b=Zv7I0e8KV40aS9OWMzzQF2chTl
	qcXn0GgDqJFgE3pz3dnNiOBKwC8ZXwXIY6t9DRXnur2RuI1JzcVbQ8P17l7Hy/0SdHwP6Le4eT8vq
	shTOg+7jCAAWbZQVUnmd8USr5dGmxDH6xH8KCK3HE+AbjjE2xBj8CV1qjVJ/Tf6dy8kzyyfQ3SYef
	QKsf3zqFgWA8vnIrMxzu0HTpe9oAmhlqZWSrpvlS5puyirqIbeqCQTBBrTolHU/VfIMjGvQF1XbWc
	3GmFk8M9KFozHh8Q33C/HgyPLyyvIrWSEwGig2fjZSzUA67ev5jgPP/chp9gUX8QUyTNc/imdIy8n
	2LvM57Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9No-0000000GbcU-0CKj;
	Thu, 18 Sep 2025 07:48:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9Nl-0000000Gbbp-34uc
	for ath12k@lists.infradead.org;
	Thu, 18 Sep 2025 07:48:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I2wcC0019524
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 07:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FRPWTQoR8hA7x6PFpW61s8iJ3hsYQG3RiIDz2KF195Q=; b=M+0a7Q7Rb3CT/WlM
	lIMol5XExUQQwdwlOAZ6YP5/vKhI2mWZm7v1Cm5GEixnxJ3tiLslB+MST99XZJu+
	Y1mFgr06d7JRuP4hRy9akg/JPb+9GfV3STWS8rHgSQawqndDBi06ZB5zgzCrFk+U
	/YkIAhy4+jf7U+vvfl8c9T3jdUmXIapRSrDnbrWB1p+wFW1LYGpwfx/ohLEwE4e9
	9VnEh84i8Ac1NiPtFwZPzLPzjShZRmW85iKI3XyJgL9lTUkjnnt+8fyCUeKklOb6
	BJE9CBNqrgNqImcqMxcKBt8P05Rtha/HUoPep6VaIwdR04W1kqCUFDp0MGSbGVz/
	cxzyTQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy1wgvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 07:48:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4d48818a04so491329a12.1
        for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 00:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758181723; x=1758786523;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FRPWTQoR8hA7x6PFpW61s8iJ3hsYQG3RiIDz2KF195Q=;
        b=MG+8CdY5LtUTItB8G+ad5VDHrhcll0+hGtqfiHsWikQysoK0wHLxv/wbnA6sE/+Rfk
         KyNUjJADWiUuM1AcZEjtqBuG7htBPd7X1LzLwJgcbsxzXhbN5iJ4L6qFRhtdFAAdmHc5
         4zEgrl1P42GgEWcLnNZt3ZEQ5uDS4oDd0BIXRtHLi5Db586E3QntNXFrd8/hNJQRD+T0
         m/vOF9utnbbjduLfT12xWlmfpBXYhgFRGvmwOUIeMYCoCE+SQYG0BKoZo+PvvB/jfx0u
         fFqWuU37eUf+W5jmyBYWu36PNRnCecvvK40OR+ufXUuqsF3EQ2sB2Gwl0oLynNn05CbG
         +4cw==
X-Forwarded-Encrypted: i=1; AJvYcCWY+Q2gUKaVxB8N5g49JP4C/2xBPpItkbSLxeQePcQr+JhMZNx2o0dkmjYUr+YwrzNG2afeSOA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyIcoj5KQJLs4jkeIMuBllr4eA8jIMv2nPzwUSocyclKC1J8u1K
	CW8EI/blGKEDbHBuJgn4SRA/4IpIl98jJkXiXy98rXwcbT8m6a+RFbWZxqULwHj7keCdb2o537g
	l8SBrTetHhCDKnee2U7vIB9DsHlPDhS7LvqCM0jmmpPD1Ya/vzpLaQYW2TmbzxSM4
X-Gm-Gg: ASbGnctgmqeLT0ttZar89vaL88h8nhU9DbwIgqOEPJF3im8ehvJklHdByheV9fcV/up
	kUDR4uxZUU3zPQixBmsN7wTBuK9BdqyeNy11TF1SBIJ/WoDcPqlgx/eg5GnBhfxFxwUf3PT74Jt
	ApcM+8tjJo9wDg6IsL9rlNHk+MW8S7qkynRlvBnASl/HIu/beBzh2DSOQyxLs+9KxlUoThSI/lb
	rBzKool9e+GB4pA2maX38ixPQToezfg2dh3dzzwF068a5E5IdewXVy7SmCjn03dp4lzZwAOzLsG
	cIhiCIjM2SkGSNE6EA+M/4XAKdAx6pYs+Hwm/a648VmuT6ZiDJl6YuJqpAVmp/F0BNumfi1pGA7
	ImSNijRTQDYKh8/zaUu/Q2A0gJUgmiHmEvWLp
X-Received: by 2002:a05:6a20:258d:b0:250:1407:50a1 with SMTP id adf61e73a8af0-27a977f5dc1mr7095506637.24.1758181723377;
        Thu, 18 Sep 2025 00:48:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfes/PqpkoFNGiZuENNGJlcSWQenzs1s+gQ7ULGGFIo1R3OTFx77erXs2zC8ULBAY9qHNoxA==
X-Received: by 2002:a05:6a20:258d:b0:250:1407:50a1 with SMTP id adf61e73a8af0-27a977f5dc1mr7095475637.24.1758181722948;
        Thu, 18 Sep 2025 00:48:42 -0700 (PDT)
Received: from [10.133.33.30] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfc341236sm1525892b3a.38.2025.09.18.00.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 00:48:42 -0700 (PDT)
Message-ID: <80b711b3-5060-4e0f-94e1-cb1daff00f99@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 15:48:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/3] wifi: ath12k: Add support to handle
 inactivity STA kickout event
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250812111708.3686-1-maharaja.kennadyrajan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250812111708.3686-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: h22xtnezntocGKogQnVx1mNAHaxzJS23
X-Proofpoint-ORIG-GUID: h22xtnezntocGKogQnVx1mNAHaxzJS23
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXyNuaRgwaLUdO
 koW4DKBIVGucI3qsx8WrBNJ3A+v1RPGx+dfvljox3rKBx1oJUWv+LqCezJG0jdPZv3TxQwVYI9M
 26vZWTHAQ/XuvLGzf43YHqiJAwh9dbhLbAJQlhp/Me8LgVHuDRQ4ITB3QEWSJisMR7PCCFjdojB
 db4nSZQTvk1IvWtUrjYFtIngSyPHn3YPI48F86lr/1n6+YwCgoM+HfKmJJXEbky6l4101ku9I60
 11enVURz4LuhuHA81Vz14+t48S/zPCOiga7SjMZ2usN+iiLOJaJAm/1GsS42XykbJhLxZhhyEle
 syzeqPgIfm4RBlduT72vZol5OMs7MiyZbRJa74Z2UBR6XlWijtY4DbNWiFcwh9H4xlStrfRoUPJ
 ulAv47Pb
X-Authority-Analysis: v=2.4 cv=cf7SrmDM c=1 sm=1 tr=0 ts=68cbb95c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=o4nd2XIhPPp7Sg7KCEwA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_004845_896285_9D9E094E 
X-CRM114-Status: GOOD (  14.13  )
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



On 8/12/2025 7:17 PM, Maharaja Kennadyrajan wrote:
> In this patch series, enhance the WMI_PEER_STA_KICKOUT event by adding
> support for reporting the kickout reason and RSSI value.
> All reason codes are handled by reporting low ACKs, and will be leveraged
> in the future.
> 
> Add support to handle the peer non-AP STA kickout event for the reason
> inactivity.
> 
> Currently, the ath12k_mac_handle_beacon_miss() does not handle MLO non-AP
> STA. Hence, add support to handle the MLO non-AP support.
> 
> Arulanbu Balusamy (1):
>   wifi: ath12k: Add support to handle reason inactivity STA kickout
>     event for QCN9274/IPQ5332
> 
> Maharaja Kennadyrajan (2):
>   wifi: ath12k: enhance the WMI_PEER_STA_KICKOUT event with reasons and
>     RSSI reporting
>   wifi: ath12k: Extend beacon miss handling for MLO non-AP STA
> 
>  drivers/net/wireless/ath/ath12k/mac.c | 24 +++--------
>  drivers/net/wireless/ath/ath12k/mac.h |  3 +-
>  drivers/net/wireless/ath/ath12k/wmi.c | 60 ++++++++++++++++++++-------
>  drivers/net/wireless/ath/ath12k/wmi.h | 15 +++++++
>  4 files changed, 66 insertions(+), 36 deletions(-)
> 
> 
> base-commit: d9104cec3e8fe4b458b74709853231385779001f

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

