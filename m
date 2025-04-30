Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2F6C369D9
	for <ath12k@archiver.kernel.org>; Wed, 30 Apr 2025 06:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhdZAfqJLdzz5mNg6DhyrEfY4eRZ7zUfKuRa7uPoXrc=; b=LTb41oBdPM9rNa4aB3rOhKa3jU
	Kg2tRAhXRSdJWRlDQ+HPH5CrAXr4OuxJmhHT14BUwtcBWWQDzikV+Js5At0aEZu5hpqp+3uHpyJS2
	1t1etktMm3kLDuYD8ZFPMD32VKYiTAfo9Ym+tUwEpnm6w+UueWMyDhftOOvO6OfMlbDcufa2H5Sfw
	x64n87OONMid/bngChVFY3HoAX+3zLdZLDZZ8xk5c4YOgEUk1g8P7kemLoVMAWBzIbbN+QX7pEnDv
	rOjtbF5YPJFGiN3eW2sXKLw3beyMdNhXwPleS/i7TAoVmbKCMsRSfyVhOGBkh2q+npJPprsAwSmwt
	nSUah0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0fU-0000000BpkK-2W13;
	Wed, 30 Apr 2025 06:11:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0Zi-0000000Bp3F-3AfZ
	for ath12k@lists.infradead.org;
	Wed, 30 Apr 2025 06:05:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLb86i014946
	for <ath12k@lists.infradead.org>; Wed, 30 Apr 2025 06:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qhdZAfqJLdzz5mNg6DhyrEfY4eRZ7zUfKuRa7uPoXrc=; b=jDPAM5FJN4lEuOe8
	951w+jLJfWbyE4RP5vrVEmnpM9zQUeYqcFufzipNmf33BSDkIkT8dryxoRTs2sG2
	0ohQk7vgzyMrcw2asyE4idav1Ti84s5u2KDAVKKd9nblDmtAbaSrdOIWr2Ri3gJP
	ZFSrRDFabz4+FEcfS8MlDRmMbUR4KcAtAyzX+QyFbtuPeRTgdtARajU4z60CZLcb
	iPL26hkcY/0qTsCfBCNA0EZdFSbyZLQaZhDMMAg2reLtcmh46jTcVD3XpgdtQAFS
	2ns0JOIwTIsoOiAFgnqU45xhWL9pepT04Bhys6r025WRvjKLhzBQb1SDQWvF3SAr
	HWFgpA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubgymm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 30 Apr 2025 06:05:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff7cf599beso6309402a91.0
        for <ath12k@lists.infradead.org>; Tue, 29 Apr 2025 23:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745993140; x=1746597940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qhdZAfqJLdzz5mNg6DhyrEfY4eRZ7zUfKuRa7uPoXrc=;
        b=a1+igxnF+yU/W/1ByQ5NY6E3Ieo398qFecvj7vJYpjR05YNcHN2CxcOUTuAhHSAWHq
         AVPZy8HU5VZFZPS/2QnlElUl6XkW1u9G0JrTEUpP8Swx/ZsLdR5ClNzn6G0xmWJzCpQn
         FkSA/pl8ZMBDtHE6Jo470gkvoi6JdY1oX2D+lmdPwXN7LrAxYk92Fcrpd0uqhPjZMp66
         ZyMH1v0naXLs1fjCfzAttX4Xbx+oME7mx/QH/diQXVkSRfhqyzVPgGkJuGkmRxgB4g2T
         bN/dT+DZjF47ysnCWLa/jBhl8j3UTuSSfEwQniagYhgXfv3uKHa5xFdpNrnYFiLsCmcR
         qnww==
X-Forwarded-Encrypted: i=1; AJvYcCWlCb6W4NCnBl/6QD3dwE+MCG0uKHVWE5PxGl0qxD8kRY6VLw5fxWZKSenB1YslBhbr9ZZHFnU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUP8dzlduKanGIfWM9vhSCjwcMZS1f5RZpWErdk21vgiic1pzw
	RyvkETt819cVHR7ocT6qILaskH3ZlowZiEyRXR4JfUmcoeYVz3v5U7gyY4Z+v6vj833dpvfuxil
	V5PYilHTMN44CwAJNTR/FFFp7vyPkYIIExInhuRzrpq7CljvvMfq3cZg3Z/+6
X-Gm-Gg: ASbGnctljA85tgDjmmVMBWcDi/UQb6H2gAyK2tmFMph1YSYgBhsuqsMmTmRTlWDZeqo
	KjusKB9ACHrgIhv8NHLOIer8WBioLeAmoIQEIROaC01DNbPFIJKozOQXT96e1xZMYJqLucAdxqC
	sIHAHciZcyMNdstJTwsTHV4YFxflqmRY/PX+bLYR/wCI+D1SWxSgHBFyeCcVNaX+aY8jzfbSnSM
	HFHVgtToHkemkQW1JDsJDmatg36EN+BSbPEYv9z/o8i9962lSHn5mqLD9OysUYrP6v2kRX0iEhG
	2eY3drJ20XO8WKYpiSfqD65lhmdtgIsAW8m5mjJvdtRxM/Z8fw==
X-Received: by 2002:a17:90b:5745:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-30a332f6c1bmr3095797a91.10.1745993139713;
        Tue, 29 Apr 2025 23:05:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhjcWpX4vZ+z4aH6FHg11dEcAiSDK7V05vXKXpqAj7i8rbUqH7RwyZyv3ZWoepwlFqcsT2qA==
X-Received: by 2002:a17:90b:5745:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-30a332f6c1bmr3095752a91.10.1745993139205;
        Tue, 29 Apr 2025 23:05:39 -0700 (PDT)
Received: from [10.151.40.150] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3471ef7asm714076a91.9.2025.04.29.23.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 23:05:38 -0700 (PDT)
Message-ID: <57064b98-5950-4b9e-8d76-265e56127dd1@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 11:35:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: allow beacon protection keys to be
 installed in hardware
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250421114711.3660911-1-karthikeyan.kathirvel@oss.qualcomm.com>
 <D9J8O65N947J.Y0LSNAOS0AYG@gmail.com>
Content-Language: en-US
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
In-Reply-To: <D9J8O65N947J.Y0LSNAOS0AYG@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MrrUHksoWmttqhNPSUbo8H-yKnLanrEG
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=6811bdb5 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=pGegcu6JArvtW7RVeRQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA0MCBTYWx0ZWRfXwHUW1IHUvnzz 9cAmz0K7zJYsM1X/SzZjSjDCHAM674zjkuVD04XntIwqw0Fy5zOmDIqmyirPMNNrMz9t90oCKUv vrutlzhAKTadZmoiirat+w2+IM+hcF6LTqTjRaghEjaPJdyTha/ufcLb9QbQmHrKjn04AtJKN92
 fcMFwDMBMW0ZQmE1xpCnNcQ+DmHgavtZSzfNORw4DbpF+eWrwuPTwNLIAZbVSfa4QMV0FYmSNvO B2+BRHvAT+gNxJoHSjlAC/ljc8XMLCqqX2Dumwx/XtenNyT/7P0v7JuwE54sSn+ECMcFJtwmIVr IhDReMbTvxc8wpeQ6t+6V7eIc44T6OBhLuh1Xpri90lqIAuH4GlC1+7T9wMWr88HYvNf1gSjhxs
 rGbKhr8/WWUlWKEsJv5/SqOJ6vgViL0v/LK7swpbVjYHxsSeasTcIrh9R1ZbFfutrdvtjUYf
X-Proofpoint-ORIG-GUID: MrrUHksoWmttqhNPSUbo8H-yKnLanrEG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_230542_922597_EA670A15 
X-CRM114-Status: GOOD (  23.24  )
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


On 4/29/2025 9:17 PM, Nicolas Escande wrote:
> On Mon Apr 21, 2025 at 1:47 PM CEST, Karthikeyan Kathirvel wrote:
>> Install beacon protection keys in hardware for AP modes only if hardware
>> supports it, as indicated by the WMI service bit
>> WMI_TLV_SERVICE_BEACON_PROTECTION_SUPPORT. Allow keyidx up to 7, since
>> beacon protection uses keyidx 6 and 7.
>>
>> Control this feature by setting bit 0 of feature_enable_bitmap when sending
>> the WMI_BCN_TMPL_CMDID command to firmware.
>>
>> Check for the beacon protection enabled bit in both tx and non-tx profiles
>> for MBSSID cases. If set in either profile, enable the beacon protection
>> feature in firmware for transmitted vif.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
> [...]
>> @@ -4964,14 +4994,6 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
>>   
>>   	lockdep_assert_wiphy(hw->wiphy);
>>   
>> -	/* BIP needs to be done in software */
>> -	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
>> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
>> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
>> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256) {
>> -		return 1;
>> -	}
>> -
>>   	if (key->keyidx > WMI_MAX_KEY_INDEX)
>>   		return -ENOSPC;
>>   
> This hunk seems to break station mode on QCN9274. Maybe on WCN7850 too ? I see
> that it was not tested against that HW.
>
> With that hunk I cannot receive broadcast trafic sent by the ap anymore.
> Generated by a simple "arping -b X.X.X.X -I br0" in my case.
>
> Replacing that hunk with something similar as what is done in CLO [0] seems to
> fix the issue:
>
> @@ -5575,13 +5605,9 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
>   
>   	lockdep_assert_wiphy(hw->wiphy);
>   
> -	/* BIP needs to be done in software */
> -	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256) {
> +	/* IGTK needs to be done in host software */
> +	if (key->keyidx == 4 || key->keyidx == 5)
>   		return 1;
> -	}
>   
>   	if (key->keyidx > WMI_MAX_KEY_INDEX)
>   		return -ENOSPC;
>
>
> PS: I tested that with firmware PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
>
> [0] https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/blob/win.wlan_host_opensource.3.0/patches/ath12k/726-ath12k-add-beacon-protection-support-for-ath12k.patch?ref_type=heads

Thanks for catching this Nicolas, will check and get back on this


