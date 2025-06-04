Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499C3C5B543
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 09:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4gLuogvnUZ5BsRuEHeQX26ZSFw3hTDdMUZj/wBFfVw=; b=YWYTkm/Uft1Ou3g7K5hW+RnKzg
	O0tEJjVt/3GtMIr6jqiGSKfAhKkif0P/hbxtNOI1DYT4rHNi20vgJAIEkNWhpL3yEvDdxGXp+VuCl
	FS0J0e4Gvk0SL0Fh/J+ZpBvIAH/plqAQQjExsUkO/ZH+DFm2GODxNUSLt3+J+GttexpQztqwzeiSK
	cjy6wQyBqrIC6805gseH45NQEfWPD6+GKDGpjESIGWUVC89LLzWznr+O2vOJisDqwJ49gz4KJrt5Y
	9GOIp9WjQ9cdh+Gh+xMdYWxaspkqb5pqWG8/Pjy66/7bCiHBIBnJutUuvzmHtwPL4T8awsi7j/Ppm
	xbdKDhRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjyi-0000000Cy30-0Fng;
	Wed, 04 Jun 2025 09:00:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjyf-0000000Cy2X-2cVG
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 09:00:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55480OdO006326
	for <ath12k@lists.infradead.org>; Wed, 4 Jun 2025 09:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u4gLuogvnUZ5BsRuEHeQX26ZSFw3hTDdMUZj/wBFfVw=; b=Zu6DSFLZ8b1cTMVh
	C1kpj3VIZ8aeAbbWYReX3frt2wJrG1DKBYODE1Q6wRpGBAL4VYiNnDhuamUF5nXa
	a5aYi7m48F2KJOrTw509v/ZWigoT8wT3LLqW3vlX7ZirMMgpbSH+NZHocEQcKw63
	JEGhreCJ3cdJMMoKu6q+Wlo6DzwL8gyO36Ha9C0qDRrs4/H3dTx31WbkQel4wHip
	oBSFRW6gqkBDnjcURIAy/Qs2OLOY9PfPSHsPHCpnkMzgTBoP2GR99zxQDWLGnND2
	JGWXKsuos0lWJuRpI77KH5WuUEMakBHqipwsIUT10DJQ0+3IXXNLIpiJ+ns3dzij
	21viVA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8swfm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Jun 2025 09:00:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b26db9af463so6751059a12.2
        for <ath12k@lists.infradead.org>; Wed, 04 Jun 2025 02:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749027604; x=1749632404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u4gLuogvnUZ5BsRuEHeQX26ZSFw3hTDdMUZj/wBFfVw=;
        b=aMjvPm8V4d4GL7xem7nlylb4YVn3VyBjUui5e2M9bP0RMeiSb2QJFtexngtjFjhin3
         izTyBwRKdP/dFkNE08NBVDj6lHETAQ7jf1G307JVljPxcbIShZD0M2ZzpIGJ7kJkYwqZ
         SLa2MDIPHCkT08bCXotlFxWfN7fubY3gJVYoxJGrd2zm5I9XROwZuZwoT5HbQe3ocIHK
         7m75fscUwAoZNfOK7CFgozdrWMnyl1aPACzmy1BgajBPJkxJeXgKyb3NSsIrZqxIFix7
         c9SA/hrYtRKPvFwsq2gdtD94pwjVEI0dJzgyd6JZAPM5asCULpAbYfTGYHR3dlTfXA+x
         tJig==
X-Forwarded-Encrypted: i=1; AJvYcCVMmsExTvBhlRj1tsUXiqhEPqqQCj4wdt61terqjRya4OOWTEi7uVYu8QrUrR2oznsPED/I+Iw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yywv81ckUismIbCYCObgbh3h9HFFWIoFjyV7ms58dZYmT0phgeG
	oXUwuxN08OQXuUtm+ARUIO+aX0HvCd3zcNjOqSn+CCLM7VwG7Lkkj00Rx41msVwbB6xAbiKBXFt
	QXsnfhrTopIiVpXJEC8LZ4tR8IqYFp38d34ChJkyPXr5j2p2vCkmx7uFhyhwbnOQG+ZhpZkX1
X-Gm-Gg: ASbGncslUqyhv2P4TJKlZl3igf5uOKL5CKxNEUAa9adUpc9X6hxAH4FPpEVq48LMEqs
	flclsQ4hccbhHg4TDDahIe5yIQg1pem5CJmzPiUz5JXYWtDso3Hzv8XHOnBs8XeaddosKT/5Cat
	UQOGUe9COIUiata1YA9LJ+Y81Br9PQjML7VAO9DvtkmS+AzW9QmMDz/c/DeuIcWFlxcO5SCZiPO
	vRZms6mstZ0Ggb4NTuyYTZ5qFlEaPI0LQeks1/ErlCpmridAhZZJyr8LtcBHI6jAla4lS8akcYo
	BnYnPNujNQSP/P459DFZv2EVGKtriijmJaeN11fUkVWFIeBaU9Q=
X-Received: by 2002:a05:6a21:618b:b0:218:59b:b2f4 with SMTP id adf61e73a8af0-21d22c52999mr2945105637.42.1749027603672;
        Wed, 04 Jun 2025 02:00:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhXyOzupgZsix6xphSRh8LzKjkSSN/p4l53n+2/5C6u8VJJB9YTJcZX92QZK5UEtB3L2BXoA==
X-Received: by 2002:a05:6a21:618b:b0:218:59b:b2f4 with SMTP id adf61e73a8af0-21d22c52999mr2945075637.42.1749027603232;
        Wed, 04 Jun 2025 02:00:03 -0700 (PDT)
Received: from [10.152.192.246] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb28c98sm8309595a12.19.2025.06.04.02.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 02:00:02 -0700 (PDT)
Message-ID: <3249b83b-00e6-464a-a6ad-80e114ffd438@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 14:29:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: allow beacon protection keys to be
 installed in hardware
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250421114711.3660911-1-karthikeyan.kathirvel@oss.qualcomm.com>
 <D9J8O65N947J.Y0LSNAOS0AYG@gmail.com>
 <57064b98-5950-4b9e-8d76-265e56127dd1@oss.qualcomm.com>
 <9605558d-e785-4eb8-a752-1f591eff393e@oss.qualcomm.com>
Content-Language: en-US
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
In-Reply-To: <9605558d-e785-4eb8-a752-1f591eff393e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1QyQY5EWC1XNdnC_qyjE37BjoyO2oG6G
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=68400b14 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=WJSFguKkjCZlOGsh5swA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: 1QyQY5EWC1XNdnC_qyjE37BjoyO2oG6G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2NyBTYWx0ZWRfXxBV4Os/fStNi
 TN8NEe7CaeQdVSLn5x5N+5zBclxLE8qMGY4+TuyLwy5aWdY3pTsCNFvZt/H/MWciEf4wb0/O3PF
 hZdvNBfBn3HVET1buXtxjYRwSNx/1uqSDV3AAgnT1JsJip5q9f4v9tZ3wHAlpbDxn+KOkvh7+vT
 mVfAKsQ7BkmRxdL0UgngYjhTNmZgCu2kol6MTrIQx7xSnnY282SDia1uGmgm4liyOKhT0VgfrP0
 hXDLlKCAXssF3QK+YXetl6U8v7cD8WLUEd/DcKDuj0MNYu1VvAs85g7D7SzgwBvIBtkV7+f/TnD
 G2HJkcu4JqH0B6trlpoFabCllnqVE1TqnJJ+pBTMHOxDAMDCHkl0XG9XovvrjbkpWVDADPX+kOm
 IZTqF2XLpD19E/72Cde5m8SEFd/H5HnW9OH39VAK+RDTXfwBO+D1Pm0tznvMbL7bgVR4dPm2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_020005_677348_8C225177 
X-CRM114-Status: GOOD (  21.74  )
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



On 5/9/2025 9:37 PM, Jeff Johnson wrote:
> On 4/29/2025 11:05 PM, Karthikeyan Kathirvel wrote:
>>
>> On 4/29/2025 9:17 PM, Nicolas Escande wrote:
>>> On Mon Apr 21, 2025 at 1:47 PM CEST, Karthikeyan Kathirvel wrote:
>>>> Install beacon protection keys in hardware for AP modes only if hardware
>>>> supports it, as indicated by the WMI service bit
>>>> WMI_TLV_SERVICE_BEACON_PROTECTION_SUPPORT. Allow keyidx up to 7, since
>>>> beacon protection uses keyidx 6 and 7.
>>>>
>>>> Control this feature by setting bit 0 of feature_enable_bitmap when sending
>>>> the WMI_BCN_TMPL_CMDID command to firmware.
>>>>
>>>> Check for the beacon protection enabled bit in both tx and non-tx profiles
>>>> for MBSSID cases. If set in either profile, enable the beacon protection
>>>> feature in firmware for transmitted vif.
>>>>
>>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
>>>>
>>>> Signed-off-by: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
>>> [...]
>>>> @@ -4964,14 +4994,6 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
>>>>    
>>>>    	lockdep_assert_wiphy(hw->wiphy);
>>>>    
>>>> -	/* BIP needs to be done in software */
>>>> -	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
>>>> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
>>>> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
>>>> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256) {
>>>> -		return 1;
>>>> -	}
>>>> -
>>>>    	if (key->keyidx > WMI_MAX_KEY_INDEX)
>>>>    		return -ENOSPC;
>>>>    
>>> This hunk seems to break station mode on QCN9274. Maybe on WCN7850 too ? I see
>>> that it was not tested against that HW.
>>>
>>> With that hunk I cannot receive broadcast trafic sent by the ap anymore.
>>> Generated by a simple "arping -b X.X.X.X -I br0" in my case.
>>>
>>> Replacing that hunk with something similar as what is done in CLO [0] seems to
>>> fix the issue:
>>>
>>> @@ -5575,13 +5605,9 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
>>>    
>>>    	lockdep_assert_wiphy(hw->wiphy);
>>>    
>>> -	/* BIP needs to be done in software */
>>> -	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
>>> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
>>> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
>>> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256) {
>>> +	/* IGTK needs to be done in host software */
>>> +	if (key->keyidx == 4 || key->keyidx == 5)
>>>    		return 1;
>>> -	}
>>>    
>>>    	if (key->keyidx > WMI_MAX_KEY_INDEX)
>>>    		return -ENOSPC;
>>>
>>>
>>> PS: I tested that with firmware PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
>>>
>>> [0] https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/blob/win.wlan_host_opensource.3.0/patches/ath12k/726-ath12k-add-beacon-protection-support-for-ath12k.patch?ref_type=heads
>>
>> Thanks for catching this Nicolas, will check and get back on this
> 
> Will you be spinning a v2? Note the dependent mac80211 change has merged.
Yes Jeff, we've identified and confirmed a firmware bug that gets 
triggered during IGTK key installation, which leads to corruption of the 
GTK keys in firmware. To work around this, I’ll send a new version where 
IGTK uses software crypto. Once the firmware bug is resolved upstream, 
we can re-enable hardware offload for IGTK.
> 
> Also there is an indentation issue in the blob:
Will address this in next version
>> -static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif, struct sk_buff *bcn,
>> +static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif,
>> +				     struct ath12k_link_vif *tx_arvif,
>> +					 struct sk_buff *bcn,
>>   				     u8 bssid_index, bool *nontx_profile_found)
> 
> struct sk_buff *bcn is not aligned on the (
> 
> /jeff

