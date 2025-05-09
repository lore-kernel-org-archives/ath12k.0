Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15903C3ABBC
	for <ath12k@archiver.kernel.org>; Fri,  9 May 2025 18:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dN6HcVUk9DFxo5EJlJc1UBo/NrapMDB33csra2IpO7c=; b=rdoUExBMbQunhsZtm4uouh0+FL
	T/j2+fcfWNEkw43Uzzu/q2qRR1DDzBARPZEXeyIKa2H7G9rXbfvORf5OUJNXRUAUC15uK+FLq+8GT
	81CE8m0ttjbQB0ny2eJGqOgmTKJbyxEFxW2XktCvfCps+D/IDZzbRWcZtFiuC7JwLPhIPOvVx6p/2
	aIAg9I2NQZSAsaHqRccw5KeUbJG2ZJ88CvdVpis2fAklejgSNX34YRGSLK1veuSaGCdt8Y2diBiJ/
	j3YFy1Fw3ebbobTdB+ArAJjLZ1Mee22ikkKBzVGyfcnkw3rH2EvGhFIO0TUlX+4Y88l7knTNqiCIk
	sqEa1vNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSKa-00000004YSs-3Jqt;
	Fri, 09 May 2025 18:20:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQGN-00000004DkY-36ve
	for ath12k@lists.infradead.org;
	Fri, 09 May 2025 16:07:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BDsos010638
	for <ath12k@lists.infradead.org>; Fri, 9 May 2025 16:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dN6HcVUk9DFxo5EJlJc1UBo/NrapMDB33csra2IpO7c=; b=GBfNV7lOnDTXXxxb
	lhTm0XxDKtBIYwQ79D/t82pov/xLKosSTReKc3vokOlhSfQC0+gF1aesHg4NOkg/
	hJQe7zn/hHGtwGXYCSHjdLw2Fkqlm6+j4+vRNiRuZ8fDLLKMeF9oxGRNCj5tVKvr
	SW/zj2jbQ288/MdbcUhqhYTtH+uQVJZYev8XqZM7UIw5q5RkAF5f35DC2z8LljeA
	BAXCLts3ubJivDFzoWlG0ks/A12LPILKQTUTWhd131mzDY+oZq/OBm3gjIZFGD6z
	omC7B6IObasQ+Zn1psSzntogRPuHgmR94d+knGi4R7ObfyVSApeRUhm5eNUYg+FW
	u2CzXQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmn74c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 09 May 2025 16:07:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7375e2642b4so1757979b3a.2
        for <ath12k@lists.infradead.org>; Fri, 09 May 2025 09:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806869; x=1747411669;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dN6HcVUk9DFxo5EJlJc1UBo/NrapMDB33csra2IpO7c=;
        b=HCj0h1FIhBhn9R9FEN/4R9dNcGm+i4PsR/cvxOphljyG3Lmnbdmtg7fnOS+npejhH0
         eqO0JQ3nl1TTwLALpY46bzBcHZGCrYCGw8+drNQWEcq4wz7iFe90ip8hQXMZ+RNHwQj/
         TnH7bfr0Z/wIcjcwZsT9Uj/keInbiu27f4LTZ1MqwJyNHOCuAKszwQVJK3aRs3AltNrN
         2krF0R3C99iSw/fHRRPyOWPEJDQHDExjlwslQbAzZnIZFhfMPCWXstTvIuAb1I4zatOw
         z3aTFTC/1PFqVjTuGffP/RtlHbZbGAe5D79/MS76PSWq6mMNI6sMkksa6OB6xyb6/kzf
         MAnw==
X-Forwarded-Encrypted: i=1; AJvYcCWboUTjS5r3RrxnxEqbrKdpWHx8JUrI8bdR/+p+HZy/k9tIuVTdZ251Dj1/vxKBO6x7HA95vtA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyvXdfR0ZgP7zvwefW+a/l3zCaYEcq3+52jIZkmktMBLZo6q7rp
	OZZPhfEi59Iq1rad8ByloiQ5jPqFy/awbZh75NhUPoQmM7udQ/bsUdZchhDuG/s9XRo66RtGYGl
	O2Ft74OlOb1pugGIeS4AQhMxFFDR00VMJKyOo2ICyLgW597NhHlv3JhUtcdHz
X-Gm-Gg: ASbGncvqfNRoxkIjXcvXg8DWnaI/Auxm9d0DqooEr2NwKZg4NExsxc0GleprxpveUez
	eIZrmQQTzm02XydteIG2e9z5Nqmlomh0BuIbNkRtsMGcsH9HW6pL60jpNvB3QEbMqUOSgOc+BZn
	4tVS6oYXn3sXN6+V8UQLhnblj+Jhq0hDRlPaJmTlgYelWnsjKOmQZSYUke30oWruzyJAzusausi
	8ir147ZSuFsQ5VuPazq+PFqcaoSy5YYXjh0KJUZpcp1BQVey9g4ptBdPBEumcS7m8K15Ghxm8aC
	/jFlmB0c/2mdiN5cposlqS3jyCV+DMou7VBhI68QtfWOru2YQ0ty9Ea6Q6i/lSdGHMu5whdJB2Y
	v/Utn
X-Received: by 2002:a05:6a00:84e:b0:742:39fa:13df with SMTP id d2e1a72fcca58-7423c061bb2mr5660976b3a.19.1746806869132;
        Fri, 09 May 2025 09:07:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq2z4W0Zc4/O/ESHS2E2kpfWTddtiwZqN4bqCv+BJNJBoRqAW4ZUvRY5SPSUTlIVZgKOsOlw==
X-Received: by 2002:a05:6a00:84e:b0:742:39fa:13df with SMTP id d2e1a72fcca58-7423c061bb2mr5660939b3a.19.1746806868700;
        Fri, 09 May 2025 09:07:48 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a0f141sm1902719b3a.117.2025.05.09.09.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 09:07:48 -0700 (PDT)
Message-ID: <9605558d-e785-4eb8-a752-1f591eff393e@oss.qualcomm.com>
Date: Fri, 9 May 2025 09:07:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: allow beacon protection keys to be
 installed in hardware
To: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>,
        Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250421114711.3660911-1-karthikeyan.kathirvel@oss.qualcomm.com>
 <D9J8O65N947J.Y0LSNAOS0AYG@gmail.com>
 <57064b98-5950-4b9e-8d76-265e56127dd1@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <57064b98-5950-4b9e-8d76-265e56127dd1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681e2856 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=4DEZz_zfAV2FwIUYn84A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 9PkUUNSOFO0dzZ8ET7FOHAccKPt4aMC7
X-Proofpoint-GUID: 9PkUUNSOFO0dzZ8ET7FOHAccKPt4aMC7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE1OSBTYWx0ZWRfX2l9HLpu97xgd
 8nqP23ZkdpSKEPofBLT8WKltYBuziOcgpR13jJBmAdJVh31SZwS1i2cglcdvqcFZn5bmPChdzYE
 gSPGP0ySDjYZZWOyYdjVgGAugDzFbuxidhgAhPGtXBqPgmD25vdaDrSBZTfa2uEuN0dTU0ObE7X
 EML/rUHeb2F0xUX2wlOCp9PEFjSuDpvkuNEhyivvmm5zU0TTACtz5zDF0wX2vD4V/N0Dlyy1c0J
 kO6RrsxXThOV5BrQPG79enfGJgpO3Ou6uPBJPjwAy+r2NZb7ANGaUqKMGRXDtD5Kx4EdZhJr4Jg
 Ep9nNVV8ylp0eOjXGTV9Yl51rxSYIR/50ho6RxVNWb5EVLji/LJtU2b2aep5Ad7+SlVA5Db38rf
 a+P6RsHjahOUISKRBfqsgwlcRn79Y5tA+1YqyC4MpuZx+xNFns7iNJk7C85EwCZDi/Sbj/Bd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_090751_801057_0BC37058 
X-CRM114-Status: GOOD (  20.68  )
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

On 4/29/2025 11:05 PM, Karthikeyan Kathirvel wrote:
> 
> On 4/29/2025 9:17 PM, Nicolas Escande wrote:
>> On Mon Apr 21, 2025 at 1:47 PM CEST, Karthikeyan Kathirvel wrote:
>>> Install beacon protection keys in hardware for AP modes only if hardware
>>> supports it, as indicated by the WMI service bit
>>> WMI_TLV_SERVICE_BEACON_PROTECTION_SUPPORT. Allow keyidx up to 7, since
>>> beacon protection uses keyidx 6 and 7.
>>>
>>> Control this feature by setting bit 0 of feature_enable_bitmap when sending
>>> the WMI_BCN_TMPL_CMDID command to firmware.
>>>
>>> Check for the beacon protection enabled bit in both tx and non-tx profiles
>>> for MBSSID cases. If set in either profile, enable the beacon protection
>>> feature in firmware for transmitted vif.
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
>> [...]
>>> @@ -4964,14 +4994,6 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
>>>   
>>>   	lockdep_assert_wiphy(hw->wiphy);
>>>   
>>> -	/* BIP needs to be done in software */
>>> -	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
>>> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
>>> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
>>> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256) {
>>> -		return 1;
>>> -	}
>>> -
>>>   	if (key->keyidx > WMI_MAX_KEY_INDEX)
>>>   		return -ENOSPC;
>>>   
>> This hunk seems to break station mode on QCN9274. Maybe on WCN7850 too ? I see
>> that it was not tested against that HW.
>>
>> With that hunk I cannot receive broadcast trafic sent by the ap anymore.
>> Generated by a simple "arping -b X.X.X.X -I br0" in my case.
>>
>> Replacing that hunk with something similar as what is done in CLO [0] seems to
>> fix the issue:
>>
>> @@ -5575,13 +5605,9 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
>>   
>>   	lockdep_assert_wiphy(hw->wiphy);
>>   
>> -	/* BIP needs to be done in software */
>> -	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
>> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
>> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
>> -	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256) {
>> +	/* IGTK needs to be done in host software */
>> +	if (key->keyidx == 4 || key->keyidx == 5)
>>   		return 1;
>> -	}
>>   
>>   	if (key->keyidx > WMI_MAX_KEY_INDEX)
>>   		return -ENOSPC;
>>
>>
>> PS: I tested that with firmware PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
>>
>> [0] https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/blob/win.wlan_host_opensource.3.0/patches/ath12k/726-ath12k-add-beacon-protection-support-for-ath12k.patch?ref_type=heads
> 
> Thanks for catching this Nicolas, will check and get back on this

Will you be spinning a v2? Note the dependent mac80211 change has merged.

Also there is an indentation issue in the blob:
> -static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif, struct sk_buff *bcn,
> +static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif,
> +				     struct ath12k_link_vif *tx_arvif,
> +					 struct sk_buff *bcn,
>  				     u8 bssid_index, bool *nontx_profile_found)

struct sk_buff *bcn is not aligned on the (

/jeff

