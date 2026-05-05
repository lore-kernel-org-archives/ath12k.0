Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3C9CD3427
	for <ath12k@archiver.kernel.org>; Tue,  5 May 2026 17:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LpmOdSwKqZjJwQwTl0UCBPLiRs17tqnTcHQ78riYdc=; b=P1/pODN9isNdpAZGKUQ1tDFsd3
	NHbkC02tUnR4mJShdUVKQ7xcmBdZpjlQ2eZM3TqCZqPndYfyBdwpASqfprfRmVoZuG3bPRXVEXV3+
	5RLlDHsr/A2pme0hGXC+I3Qro9FRzGh6HMD8iCZh9usjcPrORI1VaaNhD1sHGxXn21IbvpHJ14xl4
	XROKgpupL3uo2CwdkVRC5/zuJCds9TfwWMQv69kD5KVhxlcQrLDtYEm0Xh7b909Az6qwmPoOVHpgZ
	3ArAnNRfylTwMAHtECbdN0OweU8zF2oi8QMUd1H9DstFh7S2WpV6U9mWTcHlCxCoUJ6tVKULRcdrc
	REjpvqfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJTq-0000000H2ij-3mN5;
	Tue, 05 May 2026 17:22:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJTn-0000000H2iJ-37xz
	for ath12k@lists.infradead.org;
	Tue, 05 May 2026 17:22:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645EL3sJ152184
	for <ath12k@lists.infradead.org>; Tue, 5 May 2026 17:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6LpmOdSwKqZjJwQwTl0UCBPLiRs17tqnTcHQ78riYdc=; b=SSJfHgz3npZPUwnR
	iitgS6O8cHo5IcsljbxSZQRjY3eZVXU7UCGNBvSQJAF598F3T5c53BOwDUHN0bce
	a6kK1nswJu6ix+YMBPEcx6wf1GhXwIl4yqWs6Rca4mb1lt7nOrfp7/krMb6Cc3Qo
	7tOywxbSESBaUEJ1zEKV678wiqXFPIyBpqsNV07VGnK3v1EWVKcee0ZbkDxdkcZA
	Iu8RwbDDI83z4c9C6xXb8MKZ+8fgJZOewmAahf3GKcO41H4toBu1/JnsypXXuAUu
	6fyzN5POgRrGsn7ZbrZEoNymKwlEiUJudyLSw/eY0+N9rQuVFq1u3i7TuIzbIgTQ
	Dd6aBQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj808tyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 05 May 2026 17:22:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ef62078ee7so3247879eec.0
        for <ath12k@lists.infradead.org>; Tue, 05 May 2026 10:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778001762; x=1778606562; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6LpmOdSwKqZjJwQwTl0UCBPLiRs17tqnTcHQ78riYdc=;
        b=G+9owfvy4x1P6XLxtoVR+k14J6R7ZJSB7vhVEFZvLaa3jF6itNkmI3ye8SwrAgdkWz
         /YjZGkDB9GejvmiBKSEby81bG72MzatCZOaG+krwkFBq0vYUqa/tHKRTQsSm59/vGD0V
         f5I2+pnu1DeJ+RJHgB8eTDEFUquhJW9wIBRTTsKKYk8sB6EfSL+nEJFqJtn3qp9LnQeC
         2VAtmTapVRfEiiuiOPXcv/WGdwhdpRcgY2fC7zuCSUns3zbdWPzB19IbaTpIpgx6kgng
         bMO79F5n2QtKXmJaHIKN0UvkLLP6+MkE8z2vhCYKx8l5pxJPEsv8Vo3lzVAIidPVYxqE
         XktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778001762; x=1778606562;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6LpmOdSwKqZjJwQwTl0UCBPLiRs17tqnTcHQ78riYdc=;
        b=CdWi/AEr2uTbdFxH7PkvXQe4Pdu9ChGMx8CHxZE278JlIQYmjUL8qCAr3zQrc9jARF
         KER/+v2ciVExeoI1LBqYBXOQrS/1/OFbiCjvCOHtGGIqkaSoQdLiWd0etiINxiPgBped
         nwn2rsNc3psT7dfVaRlw8qIEUn2Ao6Ch2nCXZZsdcrXo9kOGV+hC5sAp/YSngRsg7eVI
         SM1WaKYDeS7Io6O2Bppm17HaC4BIr6VG/kI2dFcrsnBpy7q26ZEgz86GKUM+Mw9hdVnN
         enIGMTccLnyKxESRheHIrk4Cl66WMZL7fpxL7GgvFtqKVBf5C3e1YBK2zrAwHJISMrD8
         hogg==
X-Gm-Message-State: AOJu0YwmidIWH2U38iYu8+oZa8OZ1DyiCsYeSLKHHMmP5t7Figvqlqh5
	xbbGeWDUol9tLVI7/i9jhM6YTRWqGZvj5YlbHEhv1OfSY8+rP+O0UylfCBO7Q1wZF1XyZV+FxQd
	yGFa7nCMxP+LhSO3soHkCowIL479kAXv8InNSXbzcLyotVdtgyLh4JnoMoOPSE6E0
X-Gm-Gg: AeBDiesUqd8qnG4d4ZMv76VytLJLWKFWGW7xUZdq4BITJMC3pFrYxY4DDgpXUjVyryg
	LQV3xOs2FhjfoKe6jStV1HCLvd6Zzi+i/NqazuiZvcpDYMoLIxt5o+ONQYv7WE6hCTmCikHhFHL
	uB5LK/oqIr+c9Z1fFjQqrrc+iQEDDwYtEGQlOTVrVKS/Kjn8toeRddS30w+heuS/Q1yYYk+jokP
	uSkTSXC3TInhuorPIc/UyRc5GC1fZNoOqkTDQn170khRfuq9k+1jgY4+sscMMVrSDC4zxleTPjW
	5OF5EFymVYzRpyOYOINDTmgIgHj9WtQpIa5U9BRwaPilQTY9MxQp20YHciWsKWaD6OCgnbQYfz5
	O1NQaIaK4mstv3Olp0GYQnBAk1U8Dr6HAj56rLoQvVsYW5x1DSzoot6VIuNorspJ621nj3n4+jD
	J7CX+SYQqv6IG05UYq
X-Received: by 2002:a05:7300:e78d:b0:2d0:239a:23c9 with SMTP id 5a478bee46e88-2f54a7840c2mr78136eec.16.1778001761760;
        Tue, 05 May 2026 10:22:41 -0700 (PDT)
X-Received: by 2002:a05:7300:e78d:b0:2d0:239a:23c9 with SMTP id 5a478bee46e88-2f54a7840c2mr78101eec.16.1778001761032;
        Tue, 05 May 2026 10:22:41 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm25724426eec.0.2026.05.05.10.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 10:22:40 -0700 (PDT)
Message-ID: <69fd7b6b-ebda-4203-a798-6227feba7350@oss.qualcomm.com>
Date: Tue, 5 May 2026 10:22:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix incorrect HT/VHT/HE/EHT MCS
 reporting in monitor mode
To: Tamizh Raja <tamizh.raja@oss.qualcomm.com>,
        kwan1996 <laicheehou9@gmail.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20260505040920.57521-1-laicheehou9@gmail.com>
 <CABkEBKbVG-UGWOQUgi0Q4M9HkMqOF-nc2gWTwBn9gebC8s7U8Q@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CABkEBKbVG-UGWOQUgi0Q4M9HkMqOF-nc2gWTwBn9gebC8s7U8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XvnK/1F9 c=1 sm=1 tr=0 ts=69fa2762 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=lPGbPuhWIpbB3OlBjl0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: uVmEg_Y2iakyNuhRRjGMNpoWzxLQf9bE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2NyBTYWx0ZWRfX/lfA3XWDn1G1
 F/FqQ8CwrSNaD+OXVXsIu3MvrUf7ttwbGRv2NwKSZkYhCJSVvdxJJaxfeXUEkymL7QBkqjxOZBM
 hXA9c5t5yTUpU+QQeftecX9xgqpUBC+PnwNMJ17GqU32wwGVFq+HO8qzCIZ9sDsVNI8DpYpE+8/
 xS81UzIkEEYU6l03AmYzzsqnzbN4/X7rNULv8AEoi9kYYdkYEj0XKNw1KgpE3fz5P0LaJ1RRms1
 zDF9kzz9cUREjQ7JqxvpyfZtc7s3KuQ7k6gpAT3ebqfZMSqRTr/MpZlZqufj3I+O/Y9T8L1yz8d
 40TpgqC432gTeU7VrNsB+xO2tkaUidd6YsE5rSkhwd0rrL2myfZaBxwWlGTexxlNh/BuxeM9haE
 M1q3G2n87QupYyPDjq8/1Lgje4P9yGbuuls6HG2KGpk8usDIr3O7m43GccL+ou8qUadn/WKQsCG
 tp1a1K0jwDbxK290PXw==
X-Proofpoint-GUID: uVmEg_Y2iakyNuhRRjGMNpoWzxLQf9bE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_102243_809089_8AF4B76D 
X-CRM114-Status: GOOD (  19.00  )
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

On 5/5/2026 9:43 AM, Tamizh Raja wrote:
> On Tue, May 5, 2026 at 9:40 AM kwan1996 <laicheehou9@gmail.com> wrote:
>>
>> In monitor mode, the driver incorrectly assigns the legacy rate
>> to the rate_idx field of the radiotap header for HT/VHT/HE/EHT
>> frames, ignoring the actual MCS value parsed from the hardware.
>>
>> This causes packet analyzers (like Wireshark) to display incorrect
>> MCS values (e.g., legacy base rates instead of the true MCS).
>>
>> Fix this by assigning ppdu_info->mcs instead of ppdu_info->rate
>> for HT/VHT/HE/EHT frame types in ath12k_dp_mon_fill_rx_rate()
>> and ath12k_dp_mon_update_radiotap().
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220864
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ
>>
>> Signed-off-by: kwan1996 <laicheehou9@gmail.com>
>>
>> ---
>>
>> v2: Fix indentation and formatting issues in v1.
>>
>> ---
>>  drivers/net/wireless/ath/ath12k/dp_mon.c | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
>> index 39d1967..4119bb8 100644
>> --- a/drivers/net/wireless/ath/ath12k/dp_mon.c
>> +++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
>> @@ -1925,6 +1925,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
>>                 }
>>                 break;
>>         case RX_MSDU_START_PKT_TYPE_11N:
>> +               rate_mcs = ppdu_info->mcs;
> 
> Can we assign this rate_mcs before the switch case? Since in all cases
> we are assigning unmodified ppdu_info->mcs.
>>                 rx_status->encoding = RX_ENC_HT;
>>                 if (rate_mcs > ATH12K_HT_MCS_MAX) {
>>                         ath12k_warn(ar->ab,
>> @@ -1937,6 +1938,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
>>                         rx_status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
>>                 break;
>>         case RX_MSDU_START_PKT_TYPE_11AC:
>> +               rate_mcs = ppdu_info->mcs;
>>                 rx_status->encoding = RX_ENC_VHT;
>>                 rx_status->rate_idx = rate_mcs;
>>                 if (rate_mcs > ATH12K_VHT_MCS_MAX) {
>> @@ -1949,6 +1951,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
>>                         rx_status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
>>                 break;
>>         case RX_MSDU_START_PKT_TYPE_11AX:
>> +               rate_mcs = ppdu_info->mcs;
>>                 rx_status->rate_idx = rate_mcs;
>>                 if (rate_mcs > ATH12K_HE_MCS_MAX) {
>>                         ath12k_warn(ar->ab,
>> @@ -1960,6 +1963,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
>>                 rx_status->he_gi = ath12k_he_gi_to_nl80211_he_gi(sgi);
>>                 break;
>>         case RX_MSDU_START_PKT_TYPE_11BE:
>> +               rate_mcs = ppdu_info->mcs;
>>                 rx_status->rate_idx = rate_mcs;
>>                 if (rate_mcs > ATH12K_EHT_MCS_MAX) {
>>                         ath12k_warn(ar->ab,
>> @@ -2259,13 +2263,13 @@ static void ath12k_dp_mon_update_radiotap(struct ath12k *ar,
>>                 rxs->encoding = RX_ENC_HE;
>>                 ptr = skb_push(mon_skb, sizeof(struct ieee80211_radiotap_he));
>>                 ath12k_dp_mon_rx_update_radiotap_he(ppduinfo, ptr);
>> -               rxs->rate_idx = ppduinfo->rate;
>> +               rxs->rate_idx = ppduinfo->mcs;
>>         } else if (ppduinfo->vht_flags) {
>>                 rxs->encoding = RX_ENC_VHT;
>> -               rxs->rate_idx = ppduinfo->rate;
>> +               rxs->rate_idx = ppduinfo->mcs;
>>         } else if (ppduinfo->ht_flags) {
>>                 rxs->encoding = RX_ENC_HT;
>> -               rxs->rate_idx = ppduinfo->rate;
>> +               rxs->rate_idx = ppduinfo->mcs;
> 
> rate_idx should be assigned with ppdu_info->rate only not mcs.

why is that? documentation says:
 * @rate_idx: index of data rate into band's supported rates or MCS index if
 *	HT or VHT is used (%RX_FLAG_HT/%RX_FLAG_VHT)

ppduinfo contains separate rate and mcs so doesn't one or the other need to be
copied to rxs->rate_idx based upon the current PHY configuration?

btw looks like the struct ieee80211_rx_status documentation needs to be
updated for HE & EHT (and UHR?)

