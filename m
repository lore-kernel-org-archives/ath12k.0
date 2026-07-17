Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED80C44512
	for <ath12k@archiver.kernel.org>; Fri, 17 Jul 2026 01:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYmYfrikvQI+7+A4AEKNdmuoRFW8vKoYWNnncp4gSAE=; b=TUcBsd13gLSh6P3i++uASv26rZ
	PkGBEUrz+dKPBSjrwPa6Nz03XhY+KfaNTLVxC9RsOTozRcHSumCZCT/dTmTc3I+jhOXpL1QiVn1Sk
	2meB6LI07zRE0kaYFuZbrTa3O27qFX48VHgcPZQYT1MJ/WLCE489C776OXfO6aBSkbD2X+c4YKGDF
	oGPJYHXo6Ioj6qOmIvVEQOfiMkCrdDfJGYfzXrEjpmazaRdTVIy5We/YeLi8mivrTeu9j+mELQUcN
	U65b7oMJKt6LyKKsw8qdKoZfV8/zn+8rRv7uvCYaA/Xc1ZxyZYgSCJf8BjjDIdUxHh1Zzo1r+zMFt
	PtEXlVbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkXmK-00000000vYn-0CZi;
	Fri, 17 Jul 2026 01:54:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkXmG-00000000vXg-0AAy
	for ath12k@lists.infradead.org;
	Fri, 17 Jul 2026 01:54:15 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNIFEw186850
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 01:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XYmYfrikvQI+7+A4AEKNdmuoRFW8vKoYWNnncp4gSAE=; b=hoxqc+SzxrhtfB7i
	H5hh+XNKxSCta6NOdHXjeH9nLIdKDAEVvmJl5FcnwCsW8VwCbUWTUPLK9G3vwQOs
	RIBkvCaaXz0n+3p9tHj2UTAyTBf6+eMXDHBhBIPILHN6qCRkZlxYTVkEp6FOJF6n
	viE+PmUUdRcjeiPPCWR8Yi2xsC5V5m6CN/2vNo2+8nAW9ky8KOTy4WcvS70+YCPS
	ZBVNyTpQrZQJLfjAfHKumV315foRIZRg7XzBIn7CJs1TWQZL2s70fN/33ho5hqFM
	UNyiUcYtVeUyI2Q2BrLNqO2+7c7EDq61szMdu8Blk1NB6HqbzLaPxuP/dq1RlRnM
	mgScZQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf47wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 01:54:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dad28e86eso9419471a91.0
        for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 18:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784253251; x=1784858051; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XYmYfrikvQI+7+A4AEKNdmuoRFW8vKoYWNnncp4gSAE=;
        b=IhyArvLr6d4PIQ2keYW1xT5MMPsMv2C1JRtC/ZMj3BmeiVWDsT2XrymdNKzUM1YlW4
         JssWfhx3u0vqiORBOkRMrLUeS83nJSh+dcvtEYjeoAXrCh8DYQNKdEgAj7DHHxOmFyju
         0ANOsffxjAq+wSPjFqOBVNcfTPe3kA0I1OJDx1+urgk3Bp6OGLv4O1DEPuWimpXoow4K
         aS6oH79zDKxhcqA/ASMzOfIQ/Mjbu7aoVL5SzMLH25JsFMMkfkoaWF2AZJRfgUhUSrg3
         aEtSCX/sVgO7aVmLq0LGWPC3uBy61uvPngUF58CPUz1nme8lKfgKFIG6GrKkxmHMC14p
         syDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784253251; x=1784858051;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYmYfrikvQI+7+A4AEKNdmuoRFW8vKoYWNnncp4gSAE=;
        b=TPRqOVAI0POjg7+E+D9Vtx94EGwOVue0mZcHyA3eDWX9E49xvdQ4qADCKvtKKQmHmh
         AuvxWxsSmztFdG02TtSsEUWHuahy2KhTh8LGxeAJkoFIsPjnFpvdJqJFCZO3hps2Gl+j
         Vmf6T/GtZeuqcwuFrhK1k0JkkgoWIvPQ/L9jVwQth6HsN6X8Tp/hiJHRow/qD7oEVTPd
         f0Gk4CG+gMDEAT3mpJ0bFRcuFsrCcQiyqMGVv8FlBsPzPo6gmLAFpuxFKD+qC526zVSO
         rQjdSY2pGwU0huBkE1ga/ll5hLlVTlq2ctEsl0fFvGWb3JWSsA7uMg+GfWbfVgyVbOXd
         5hog==
X-Forwarded-Encrypted: i=1; AHgh+RoxgJQywFpWmsWt6F7FpvPLnfoIlM467yhp3NxhoEhmqC0Nop0R2FgiIbKOwLaytaHFwinFbzU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSWhN9OP18tkDeWTUXRU4qd2Dow4oXPanhoCs/5b/0ms4ZweKw
	fNnVVz3UE9DydOoFg/V4Q9OqIUEJeGUJujtg4DfKTgVdbjHHk+1m95iEMlgAEjJXt90V0A0STh+
	AoCi0eo07XMfSLPox4Vx/32PuyeDS1kOilASKMGtm7xh6JvVQV4bwmNUnZb4QqxVzNOgCWeAz
X-Gm-Gg: AfdE7cko7LuE4VhJPZBXiGI/g5Cs01WTS9XM+nZaxBsqj40dbL2XusGvLw4E+8OyA4j
	T+CBfVzN9hbgeeb96CN+gOK+p0rqi85CuLd9xcRlxmPpylmJJManadRi5Tjw2Wzmaql7qzzZVGl
	8XAQlDlJtVMrJpqWsoVRXRKomnF1d0P2s05/bLdY55nVMr/Ush13uJHi30XwFvS/w5P2vNQLIXd
	vSXKwpzUkyuM5VXNo1PjRcYxHpFHFPnmsBaK0033qN48Vx0SAAGSFBP8RUS/LFuicAJ84Kd2r3j
	8EU/I3jHYOORPSQsZfaUN1IBeOdWietR1yz6Q3LsiSZM+nMUe+W5EAj3QXaWLLqkxAqD75UnnMG
	cjz2sm6EFXPvMnDn1WGasyHrjiUr8y+hZ8HiOLQBW69tiv/lxY8FibWvpF3lPzUjDf4LASkLc
X-Received: by 2002:a17:90b:5608:b0:38e:488f:7068 with SMTP id 98e67ed59e1d1-38e4b43108bmr533318a91.2.1784253250674;
        Thu, 16 Jul 2026 18:54:10 -0700 (PDT)
X-Received: by 2002:a17:90b:5608:b0:38e:488f:7068 with SMTP id 98e67ed59e1d1-38e4b43108bmr533294a91.2.1784253250093;
        Thu, 16 Jul 2026 18:54:10 -0700 (PDT)
Received: from [10.133.33.98] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39e2354dsm2073580a91.8.2026.07.16.18.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 18:54:09 -0700 (PDT)
Message-ID: <f3159efe-bf29-4b7f-b1d0-5a658b9e829a@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 09:54:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current 5/8] wifi: ath12k: introduce host_alloc_ml_id
 hardware parameter
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com>
 <20260713-ath12k-fw-allocated-ml-peer-id-v1-5-d0a2a1a519eb@oss.qualcomm.com>
 <a906aae4-b695-4f5f-9ee7-51d40700f8c8@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a906aae4-b695-4f5f-9ee7-51d40700f8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5L4-yeAW-1fMyuWCKVPGmIfPh66N_N-y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAxNSBTYWx0ZWRfX9V62jzVpAPjn
 2Tc6IGtRWnC93tk+maa//620rG9tW8ArJZPQyWALOfahaC4Qcm9USS+6tDvWnONc03aQjNCBEb+
 P5CIq6PCYhLlKaZzoKXnm0r/xV3FTrn7Te3yxuUb7x3HSgXwEbzwcEyqD2xO3rQyERdfpnkMfxo
 24WklbyLjsv8d+XZQa3EMZsFQbV1vnvdU5/NYq6slt0Gkg3auZ4YEIUk/2Y2vRvZHl76NvjQrsj
 JQkU01RJOraH47w5+8401tLhiExvir39hFDafriXzTQkHHaZFxVIsa0vwK+11wpBmLp+yv6IEQ2
 vWNAvlnSvuCWp46ewp4V6CghBjpWI8xvoHxfaE9wpjulqS/fosUN6jThZ7lyzxiLC6F6fVEoAT7
 ScW1w6xj9+R+XTkhqBbPEIaDE5ciisyuNZIDg00Nxf7c5yt1YHQ2qV+lOhFy/8tLMUo3YylGyZA
 65WSFgvQqbB2IqwC/Yg==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a598b43 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Di5Tgb74uudud7Oqj5sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 5L4-yeAW-1fMyuWCKVPGmIfPh66N_N-y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAxNSBTYWx0ZWRfXw93yXRn8t8R0
 ydX8gZLwThJ5yKs5z0UJD9qIFd3qrIpYJABrasQmSq7Mf+Vm0iaJE3dAP0a9wsW+qPHx3B/Mzmx
 Lr98BwICt3XN5oFuSHLMJzEzqlmlZG0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_185412_080625_BB3D276D 
X-CRM114-Status: GOOD (  21.69  )
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



On 7/16/2026 10:55 PM, Rameshkumar Sundaram wrote:
> On 7/13/2026 1:03 PM, Baochen Qiang wrote:
>> Different ath12k devices diverge on who allocates MLD peer id:
>> WCN7850/QCC2072 have the firmware allocate it and notify the host via
>> HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP event; While others let the host allocate
>> it and pass it down through WMI_PEER_ASSOC_CMDID with
>> ATH12K_WMI_FLAG_MLO_PEER_ID_VALID set.
>>
>> Currently ath12k host allocates this ID and sends it to firmware by
>> default for all devices. This breaks WCN7850/QCC2072, because the host
>> maintained ID may be different from the firmware-allocated one.
>> Consequently data path may fail to find the dp peer and drop some received
>> packets. From user point of view, this results in bugs reported in [1] or
>> the 4-way handshake timeout issue.
>>
>> Add host_alloc_ml_id flag to struct ath12k_hw_params (and a copy on struct
>> ath12k_hw for hot-path access) so subsequent patches can branch on it. Set
>> true for QCN9274/IPQ5332/IPQ5424, false for WCN7850/QCC2072. The flag will
>> be consumed by subsequent patches.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221039 # 1
>> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/core.h     |  1 +
>>   drivers/net/wireless/ath/ath12k/hw.h       |  2 ++
>>   drivers/net/wireless/ath/ath12k/mac.c      | 17 ++++++++++++++++-
>>   drivers/net/wireless/ath/ath12k/wifi7/hw.c | 12 ++++++++++++
>>   4 files changed, 31 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/
>> core.h
>> index fc5127b5c1a3..1f56474efbea 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.h
>> +++ b/drivers/net/wireless/ath/ath12k/core.h
>> @@ -793,6 +793,7 @@ struct ath12k_hw {
>>       enum ath12k_hw_state state;
>>       bool regd_updated;
>>       bool use_6ghz_regd;
>> +    bool host_alloc_ml_id;
>>         u8 num_radio;
>>   diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
>> index d135b2936378..8091501cf742 100644
>> --- a/drivers/net/wireless/ath/ath12k/hw.h
>> +++ b/drivers/net/wireless/ath/ath12k/hw.h
>> @@ -232,6 +232,8 @@ struct ath12k_hw_params {
>>           u32 max_client_dbs;
>>           u32 max_client_dbs_sbs;
>>       } client;
>> +
>> +    bool host_alloc_ml_id;
>>   };
>>     struct ath12k_hw_ops {
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>> index 7d0d7d5fbf53..9e5fcbf8c730 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -15382,8 +15382,9 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
>>       int mac_id, device_id, total_radio, num_hw;
>>       struct ath12k_base *ab;
>>       struct ath12k_hw *ah;
>> -    int ret, i, j;
>> +    bool conf = false;
>>       u8 radio_per_hw;
>> +    int ret, i, j;
>>         total_radio = 0;
>>       for (i = 0; i < ag->num_devices; i++) {
>> @@ -15423,6 +15424,19 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
>>               }
>>                 ab = ag->ab[device_id];
>> +
>> +            /*
>> +             * the assumption is all devices within an ah
>> +             * share the same host_alloc_ml_id configuration
>> +             */
>> +            if (j == 0) {
>> +                conf = ab->hw_params->host_alloc_ml_id;
>> +            } else if (conf != ab->hw_params->host_alloc_ml_id) {
>> +                ath12k_warn(ab, "inconsistent ML ID config within ah, device 0 uses %s
>> allocated ID, while device %u doesn't\n",
>> +                        conf ? "host" : "firmware", device_id);
> 
> a garbage ret will be returned in this err path.

Good catch, will fix in next revision.

> 
>> +                goto err;
>> +            }
>> +
>>               pdev_map[j].ab = ab;
>>               pdev_map[j].pdev_idx = mac_id;
>>               mac_id++;
>> @@ -15447,6 +15461,7 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
>>           }
>>             ah->dev = ab->dev;
>> +        ah->host_alloc_ml_id = conf;
>>             ag->ah[i] = ah;
>>           ag->num_hw++;
> 
> -- 
> Ramesh


