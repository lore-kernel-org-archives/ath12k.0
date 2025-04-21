Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE42AC369AB
	for <ath12k@archiver.kernel.org>; Mon, 21 Apr 2025 06:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81wtBN9+V7tXS0MM9Mk0cNCiAxviM10Y/8IbcHUZVzk=; b=jbrbAWLga18wglyVIkuA7yO/h9
	QoZq4zJxQfil4eBAW/ZUVvGtFcvjcG1+dxiCWVlwLUQ+QeYO25jVWRie1SroVkLoSc2Y9SLg1QRX0
	GayFnkzuwwFjEMChEDtuFhrmG3jS/ULVPXrilmqN0MxkbsT40CGvdQ5jfdBzowbB+1XuZKTf0ANsk
	rwH0xwCYBCGycemlqdeIzatk3OXvrJf+Fon6vbDPGjCWLTsP5zfUcnNebKzq+FtiI22FQ+6PcDZbl
	U0/sVrHC9H49leAuw6tkLCOa382TUwraTKJ1uGwLc2eTnmXa9SpVMABR9bTKWsgyfiy53UToeK40L
	yWUj+kxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kbj-00000003hzF-1hrm;
	Mon, 21 Apr 2025 06:26:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kbg-00000003hwg-0h0d
	for ath12k@lists.infradead.org;
	Mon, 21 Apr 2025 06:26:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KMU278016032
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 06:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	81wtBN9+V7tXS0MM9Mk0cNCiAxviM10Y/8IbcHUZVzk=; b=Xx0Zs0uy2PLEplQm
	Figf5rUsODrhui6vPd+zq3iq0iKAAONZ2d1FAVf46wqXz18YsSV2iMCfsDMmtRhz
	6YNRKD74g//tv1pvpAmoa98FRNjmJ1V+9154oWG17RZ1aRjJ1fpjpkyAhIVTQvKE
	v0edFFPQ1zJVZaFfir7Y2hA5Qo5RaFjx1LZGgFhYrTdGZUu6CV9NSs94lIxnRgzI
	8RD/aX2pY+Rl2glZJ/TysrvTTffLORv7vU2SAY0zo9I2RrkvTnxSCE82FEeXeISX
	ZrNt117Zd37WWfkNrYNF/cI+aCI+oPjW/INLzoVJ01DCmJULWdHDDxlO7aGpL1ci
	QfRZ5g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643wwk82y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 06:26:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b06b29fee16so3890097a12.0
        for <ath12k@lists.infradead.org>; Sun, 20 Apr 2025 23:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745216773; x=1745821573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=81wtBN9+V7tXS0MM9Mk0cNCiAxviM10Y/8IbcHUZVzk=;
        b=OyEIOzwFL7GHjjrjAB2fDtkuCeBkWigcPH0Y6w3EZM/NH6pqJu5eVqoxj24Hg2uTcy
         Y5mXN4dr0tO5FSdIF0vtfDmPSLeM9j+il8NyTribJ/Z+6PkrJR4mPxycHqcNYAJcVWcA
         iXdFiLmwROdxB9kVt+ZWzW419ja8sOidUUjk/VFCcKKlseam9BPzJ7Mqt/H/Pap7lDcR
         GqHuJWtgfEn5dJLhAnAZrKZaY7XmcqoXbIpajS/l332YjRd7E1uMZ4pPMHIGjPUl4Sc3
         ykwnflB9zoSgDKe8iEq8x9ckboETEFtf7qUhyDf/XvTzZwpeL+Hyh+xPz3/PUBhKnu0A
         i3RQ==
X-Forwarded-Encrypted: i=1; AJvYcCULb9fRG5t/x+loVIbonoPOJc3gWAZDZBoJQcoVvpcVVB34QuGoQzcg7ZpKnj7djhyUVt23mHw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEgQjsyqxCmDbRqpUixmLTheTDOzIPgrYgenXmCda5kUC0+pP0
	02i5wf2zrpWfkdQPrULcFD9Vr7H9xnq7aJWik8H9P2XKKCKL6jQGKu0lbv0ypahlWSb+7LWoLrm
	HnBwBrqVf8V9vCyORDiIWKPVyTWiRw1nQXjtJau/BAA4FarOBYYXa7dwx79F3
X-Gm-Gg: ASbGncvTVI7xqT2WQNDwehmootzlU1COrcWH7dWxLt2QIZ1G9b8Vb8ooSeZQ8TzZmWI
	1uhj5DELfJapvKQGJJ2j5rWFUwwbzY0ELPs8rQ4rQmHXwjlHwYetT1Xu4gwmzjM/yvxA3sbHFRK
	vl9Htuydbb9UK2kbpd3xSNy0AxSjT+NHHsu4GDJcX6QLQHrfBspetg+IDy/E2NYrCpZwL3KtA0a
	lT9420Vh1tQv7+fu9hp4QC7kfiR4AhkBxBwwUszAHokw625tQPk/ameADl9bXg6Bpdi8ydhSc2e
	HFRSwvFhD5ACYuea7yQJD00yrBPd0ADCBJSkWbkIVNdC41CVRsNY7jZVehxkk21gn3IjmmIQak4
	=
X-Received: by 2002:a17:903:41c7:b0:220:faa2:c911 with SMTP id d9443c01a7336-22c535a4b39mr144451025ad.14.1745216773253;
        Sun, 20 Apr 2025 23:26:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz7puTIUYsZfLXpiAYIfV0IpMtR7YCW1rRySiCsm+qOdt9M669LFqpmigrbCIjADkzxITKxw==
X-Received: by 2002:a17:903:41c7:b0:220:faa2:c911 with SMTP id d9443c01a7336-22c535a4b39mr144450715ad.14.1745216772785;
        Sun, 20 Apr 2025 23:26:12 -0700 (PDT)
Received: from [10.133.33.171] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fe2411sm57881205ad.256.2025.04.20.23.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Apr 2025 23:26:12 -0700 (PDT)
Message-ID: <8d428614-adea-43a5-a47f-457b569bc604@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 14:26:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v5] wifi: ath12k: read country code from SMBIOS
 for WCN7850
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Wen Gong <quic_wgong@quicinc.com>
References: <20250417024227.1712-1-kang.yang@oss.qualcomm.com>
 <83e417e5-31d8-4fe5-9774-fd97fb51f663@oss.qualcomm.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <83e417e5-31d8-4fe5-9774-fd97fb51f663@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IpEecK/g c=1 sm=1 tr=0 ts=6805e506 cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=h2vc5te2_RImeTn38vYA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wdsyvz9woxcwDfJ7AH4VcSSn1sz6Qvy8
X-Proofpoint-ORIG-GUID: wdsyvz9woxcwDfJ7AH4VcSSn1sz6Qvy8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_232616_347363_8E584821 
X-CRM114-Status: GOOD (  21.71  )
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


On 4/18/2025 11:18 AM, Jeff Johnson wrote:
> On 4/16/2025 7:42 PM, Kang Yang wrote:
>> From: Wen Gong <quic_wgong@quicinc.com>
>>
>> Read the country code from SMBIOS and send it to the firmware. The
>> firmware will then indicate the regulatory domain information for
>> the country code, which ath12k will use.
>>
>> dmesg:
>> [ 1242.637253] ath12k_pci 0000:02:00.0: worldwide regdomain setting from SMBIOS
>> [ 1242.637259] ath12k_pci 0000:02:00.0: bdf variant name not found.
>> [ 1242.637261] ath12k_pci 0000:02:00.0: SMBIOS bdf variant name not set.
>> [ 1242.927543] ath12k_pci 0000:02:00.0: set current country pdev id 0 alpha2 00
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-02582-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
>>
>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
>> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
>> ---
>>
>> Note: This patch is an old patch in public review written by
>> Wen Gong. Just resend it for him.
>> Link: https://lore.kernel.org/linux-wireless/20230913105156.17618-1-quic_wgong@quicinc.com/
>>
>> v5:
>>      1. fix "From" header.
>>      2. rebase on tag: ath/main(ath-202504141512).
>>      3. change quic email to oss email.
>> v4:
>>      1. fix assignment error for case ATH12K_SMBIOS_CC_ISO.
>>      2. rebase on tag: ath/main(ath-202503251458).
>> v3:
>>      1. rebase on tag: ath-202503172347.
>>      2. add branch tag.
>>      3. add descripition for Wen Gong.
>> v2:
>>      1. rebase on tag: ath/main(ath-202502181756).
>>      2. rewrite commit message.
>>
>> ---
>>   drivers/net/wireless/ath/ath12k/core.c | 26 +++++++++++++++++++++++--
>>   drivers/net/wireless/ath/ath12k/core.h | 27 +++++++++++++++++++++++++-
>>   drivers/net/wireless/ath/ath12k/mac.c  | 11 +++++++++++
>>   3 files changed, 61 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
>> index 9b23329f1bf2..b5ade9c7530d 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.c
>> +++ b/drivers/net/wireless/ath/ath12k/core.c
>> @@ -697,7 +697,7 @@ static void ath12k_core_stop(struct ath12k_base *ab)
>>   	/* De-Init of components as needed */
>>   }
>>   
>> -static void ath12k_core_check_bdfext(const struct dmi_header *hdr, void *data)
>> +static void ath12k_core_check_cc_code_bdfext(const struct dmi_header *hdr, void *data)
>>   {
>>   	struct ath12k_base *ab = data;
>>   	const char *magic = ATH12K_SMBIOS_BDF_EXT_MAGIC;
>> @@ -719,6 +719,28 @@ static void ath12k_core_check_bdfext(const struct dmi_header *hdr, void *data)
>>   		return;
>>   	}
>>   
>> +	spin_lock_bh(&ab->base_lock);
>> +
>> +	switch (smbios->country_code_flag) {
>> +	case ATH12K_SMBIOS_CC_ISO:
>> +		ab->new_alpha2[0] = u16_get_bits(smbios->cc_code >> 8, 0xff);
>> +		ab->new_alpha2[1] = u16_get_bits(smbios->cc_code, 0xff);
>> +		ath12k_dbg(ab, ATH12K_DBG_BOOT, "boot smbios cc_code %c%c\n",
>> +			   ab->new_alpha2[0], ab->new_alpha2[1]);
>> +		break;
>> +	case ATH12K_SMBIOS_CC_WW:
>> +		ab->new_alpha2[0] = '0';
>> +		ab->new_alpha2[1] = '0';
>> +		ath12k_dbg(ab, ATH12K_DBG_BOOT, "boot smbios worldwide regdomain\n");
>> +		break;
>> +	default:
>> +		ath12k_dbg(ab, ATH12K_DBG_BOOT, "boot ignore smbios country code setting %d\n",
>> +			   smbios->country_code_flag);
>> +		break;
>> +	}
>> +
>> +	spin_unlock_bh(&ab->base_lock);
>> +
>>   	if (!smbios->bdf_enabled) {
>>   		ath12k_dbg(ab, ATH12K_DBG_BOOT, "bdf variant name not found.\n");
>>   		return;
>> @@ -758,7 +780,7 @@ static void ath12k_core_check_bdfext(const struct dmi_header *hdr, void *data)
>>   int ath12k_core_check_smbios(struct ath12k_base *ab)
>>   {
>>   	ab->qmi.target.bdf_ext[0] = '\0';
>> -	dmi_walk(ath12k_core_check_bdfext, ab);
>> +	dmi_walk(ath12k_core_check_cc_code_bdfext, ab);
>>   
>>   	if (ab->qmi.target.bdf_ext[0] == '\0')
>>   		return -ENODATA;
>> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
>> index 44e02ebb1071..3f9fcd4d6f20 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.h
>> +++ b/drivers/net/wireless/ath/ath12k/core.h
>> @@ -175,9 +175,34 @@ struct ath12k_ext_irq_grp {
>>   	struct net_device *napi_ndev;
>>   };
>>   
>> +enum ath12k_smbios_cc_type {
>> +	/* disable country code setting from SMBIOS */
>> +	ATH12K_SMBIOS_CC_DISABLE = 0,
>> +
>> +	/* set country code by ANSI country name, based on ISO3166-1 alpha2 */
>> +	ATH12K_SMBIOS_CC_ISO = 1,
>> +
>> +	/* worldwide regdomain */
>> +	ATH12K_SMBIOS_CC_WW = 2,
>> +};
>> +
>>   struct ath12k_smbios_bdf {
>>   	struct dmi_header hdr;
>> -	u32 padding;
>> +	u8 features_disabled;
>> +
>> +	/* enum ath12k_smbios_cc_type */
>> +	u8 country_code_flag;
>> +
>> +	/* To set specific country, you need to set country code
>> +	 * flag=ATH12K_SMBIOS_CC_ISO first, then if country is United
>> +	 * States, then country code value = 0x5553 ("US",'U' = 0x55, 'S'=
>> +	 * 0x53). To set country to INDONESIA, then country code value =
>> +	 * 0x4944 ("IN", 'I'=0x49, 'D'=0x44). If country code flag =
>> +	 * ATH12K_SMBIOS_CC_WW, then you can use worldwide regulatory
>> +	 * setting.
>> +	 */
>> +	u16 cc_code;
>> +
>>   	u8 bdf_enabled;
>>   	u8 bdf_ext[];
>>   } __packed;
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>> index 7af12733a1ff..aee3080a934c 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -11550,6 +11550,17 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>>   			goto err_unregister_hw;
>>   		}
>>   
>> +		if (ar->ab->hw_params->current_cc_support && ab->new_alpha2[0]) {
>> +			struct wmi_set_current_country_arg current_cc = {};
>> +
>> +			memcpy(&current_cc.alpha2, ab->new_alpha2, 2);
>> +			memcpy(&ar->alpha2, ab->new_alpha2, 2);
>> +			ret = ath12k_wmi_send_set_current_country_cmd(ar, &current_cc);
>> +			if (ret)
>> +				ath12k_warn(ar->ab,
>> +					    "failed set cc code for mac register: %d\n", ret);
> FYI I split this line in pending to fix the ath12k-check:
> drivers/net/wireless/ath/ath12k/mac.c:11648: line length of 94 exceeds 90 columns
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=2d2ccff4c0efa4cb55d0a21c75c6e7162788f9db

Oh, thanks


>
>> +		}
>> +
>>   		ath12k_fw_stats_init(ar);
>>   		ath12k_debugfs_register(ar);
>>   	}
>>
>> base-commit: b80c52642c1159c2596776b39b06eb1c2e36baff

