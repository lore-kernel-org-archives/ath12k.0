Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CC8D73EB2
	for <ath12k@archiver.kernel.org>; Fri, 30 Jan 2026 02:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qm2TVjtgCsnXke5ZAfLie6EgMEjIODsMKg2ruWeDJXQ=; b=NpujqcccBJnWRjR+0912P4/b/l
	ov1KDJxQXNwhXtDp9S4L6+RyOymkjXEBgTO1zgSdKn5FB2WehqxHGn6pSCSV3TzkD1A/Hh/R3Ug2i
	HKNXCleAQivRuJ0LYG44ePQEK6BGId/jn08leq2gTn2/Dlx5TQSCgMSqdkVUdD4VS2hsLuqYQNiIQ
	zis0zoq8Yoryuyyld/uc+HtMrWLpa4pm8s2BxoR8vu9VkbUEUYAekhrZTQygU6BuvsU4+lOzUKDtX
	8spxDHH/WgiapYwe2aeJYwtRK16daZpqKDG/MsJc7g9nNQgtlIXbnnqgqNxE2mz8G7d1JhV5QdkSW
	tZUJBloQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vldwg-00000000sjq-1RW3;
	Fri, 30 Jan 2026 02:09:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vldwd-00000000sjT-0sBW
	for ath12k@lists.infradead.org;
	Fri, 30 Jan 2026 02:09:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60THUVOW3901081
	for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 02:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qm2TVjtgCsnXke5ZAfLie6EgMEjIODsMKg2ruWeDJXQ=; b=EeATYrMkAJJfamdl
	RPMbaLLsttMiASFbVtyFaMEeJR/9HJ2uaWtOgOlkPakfI95hKxt+dJ1gAXOkPaAI
	Kk0CT6Z0Ut3rOdQySK5N9IfUdSQ8qFuFY8ulPAg4mtTlRvhG50Ah6Nnrn4YaOnd4
	4a3Iw+gGVVn4gF4BOeMw/RHXQPQbm7yKSteoC+zQ1/22TILH2PxLf3ky2v9JIHNh
	NCCNNAhMhrod/leIS+yJlWDfNJD+8NqK5rOoc+oasGDajDdWc26TIEF/mlB/ra4b
	1DDSjqgMWL+xnLmKTrTkt1RAMW5iPSc6etul5+z+XrdXaPM+l8qBTHrB8AmOS4QN
	D9lpfw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05seassb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 02:09:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c5539b9adbcso2931058a12.3
        for <ath12k@lists.infradead.org>; Thu, 29 Jan 2026 18:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769738950; x=1770343750; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qm2TVjtgCsnXke5ZAfLie6EgMEjIODsMKg2ruWeDJXQ=;
        b=iWzGWUzEQy/8GS9gFOPzWWeZQOFXvPRAV+saEYl++tvI9KTFoOlrEuZqbDnpdnhf3j
         xny+uVWAjFLvAG50633V41opgmnz37aCH+uK5uwfxG0BxK5nfDYAVCS9lW62bsf9qfTA
         0Ol///oe4pGg2BRUXGFngJDCRg05fr3iQQ5/VfvsPGI3/HhcDDTrBR3llZMPYvEN+xSf
         /kfqcS6Xy4+p0Y/FORGqySfd3d6qWMUPQgwUNZor58qrqqlw+W3D8/AI0nI14b+TqIWw
         pyfnMBl6OogxMYfU5aicESYXicqezoSVY6Q+6UZKXBNft+HSHubCa1UCGZP0CeS2DN2A
         Ck4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769738950; x=1770343750;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qm2TVjtgCsnXke5ZAfLie6EgMEjIODsMKg2ruWeDJXQ=;
        b=gqbRnAbe+1eMTjVzf60cFtmLp4ArW4upES5tCC+P0+Tm4uVNLD8c4Nb1Fq51wVYyxq
         n3bP9W16s/+WbGWOpMGibnu9PNioh/96q85pdVsMlmzh5q+M4bfTq0ryY3JDbUbx/hXG
         JJvDvPQCYJR1+VwkASN1zDtY9mZ+jOF8wtvbsA8xRRCF28mVppkJZXk3iq5eawddT6jB
         3a6LandrfKnWzPuFDj6swj26N1nirdqhI3ADjdL+pGyULFt5GSVwGpzRZYi7wS5p7YBU
         vPPW6EBgn/SF2lj+5CbbDzpXSDwypffoNNsNHrz0rVBBXraOJTDrdrqAOdr7ggqAASWx
         RN0A==
X-Gm-Message-State: AOJu0YwM46OZDb1LKEnBtSgRjQ3c9pEAlyVxFtmbpZTg+OdtSVzsiTnF
	dynRFnk7xRPebz23coearzFAlyV+EcSNpjnYbSdCS3ZZKHx82JIz3mnHhkll120f3dQFXxBgH+B
	C9lPjHtNvn3WuUucTv16SPLnEvSWDCIkybvkMYw/MSZig97kQ13qZli6yXfrF12JA
X-Gm-Gg: AZuq6aKZmty7V+O71eLe2gGzJ/basM7K5jcq4oYaiQSIxnh8VJATpdg2E+YEDrN2WcL
	BowTih/FjprewY+qSh6lN520Si9qAGSCKx3saOamw4XHdF4B/A+dLKT5cU+03lwTtmrgpaMHfcA
	Xc371JS03WCGh33uPgp2ZKxzu047WDRG83LPKZWUGc15RhSd4p9R03EN3VLSTcUMTWljZ8mdR9Y
	Vida51XHt1tTfPocvcHFwObl/ouyQSA3n4mCczBi+/ltiQ0MIDQw0att6weA8EXlirR79gBQTGT
	wt0jP3zMEfmINq4wziYcNyz6N/zeqyrzAHOPEZ7JPHLhdb9p7i/kRgUw/d8Qodmp48iMf4RW6TZ
	kIM43NpWKzBT1iq54NOXQPTM3sP0rHaZG1LILYCuUrxr/PT0FLaJYonNR1l4GEsgxemwXCK7rkM
	CZCRcx6uY=
X-Received: by 2002:a05:6a21:134b:b0:334:a523:abe7 with SMTP id adf61e73a8af0-392e00526e9mr1024498637.27.1769738949590;
        Thu, 29 Jan 2026 18:09:09 -0800 (PST)
X-Received: by 2002:a05:6a21:134b:b0:334:a523:abe7 with SMTP id adf61e73a8af0-392e00526e9mr1024467637.27.1769738948942;
        Thu, 29 Jan 2026 18:09:08 -0800 (PST)
Received: from [10.133.33.202] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6103e9fsm9247034a91.2.2026.01.29.18.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 18:09:08 -0800 (PST)
Message-ID: <fbcbeb0f-c073-4da5-9dbe-2518a1d31f20@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 10:09:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] wifi: ath12k: Fix firmware stats leak when pdev
 list is empty
To: Saikiran B <bjsaikiran@gmail.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        kvalo@kernel.org
References: <20260126095244.113301-1-bjsaikiran@gmail.com>
 <20260126095244.113301-3-bjsaikiran@gmail.com>
 <9ca7ceac-2799-4993-844c-8427508c7d9b@oss.qualcomm.com>
 <CAAFDt1sxWMb1xPaWGWGE1XVFxRKwjOuQPZ__fNTH2+ujXJ6d5A@mail.gmail.com>
 <CAAFDt1s8HPQWJpSiDDk8PmUAKqkQHELcJj_F0faZ1C9RfiYu6g@mail.gmail.com>
 <7fb6b431-58ea-47bc-b251-5144575db17d@oss.qualcomm.com>
 <CAAFDt1s_NtY1vXa5STRW7oQn9yDJBC0g7CPSZXn0tFhd+CSHrQ@mail.gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAAFDt1s_NtY1vXa5STRW7oQn9yDJBC0g7CPSZXn0tFhd+CSHrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GhGOukwcUi-UxVGrWSCQxwnfd3PQqRdR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAxNSBTYWx0ZWRfX26HgbUAC5p82
 wsRh674GHJXFOOeJhz5zwwUD4Gg3TlkGGNapp5mr4Z/4v9J42c55DMbIZ6Fc77jl8cB4YbITn4b
 +FSzCLNfVPpi/YYYkbsh8Xp2LLM3ip+DglP/26hx7sSY8jEIKlDjdvxDlkhybY/rKYpJdFQTc6A
 UUGDW0rjOnO2HncrvsaedVhpZoPazd8tIP4tWpEoMcy8AOas3iFjikplozW5WC0sqcFTHOCTKvl
 x32xg497AdUy5n6CCHbav1ckARDP/DcuBFdYQEjGCWIOxd5iPcLGxVl/jENu7yfK/yzXaBbNeT2
 9A032g6mOAsD43QZ4H0bBatUiAxnpLczoQ9HhBVi5vCBnMEp9l+gjse2iVgY/afsVLW+l1AzOb4
 rMtCUUu58FpSLgpHze+SWlR16X8Db33Nxe48sTRgYx3gRAtzSU9eGo9gltFe3CuhZbr17LDU4FM
 I5IxjWLlWLoqDTK5cpw==
X-Authority-Analysis: v=2.4 cv=RIu+3oi+ c=1 sm=1 tr=0 ts=697c12c6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=danhDmx_AAAA:8
 a=pGLkceISAAAA:8 a=zHTTzEKRCOz4Nm9c7lgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: GhGOukwcUi-UxVGrWSCQxwnfd3PQqRdR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_180911_257824_C328BF1E 
X-CRM114-Status: GOOD (  36.56  )
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



On 1/29/2026 10:06 PM, Saikiran B wrote:
> On Thu, Jan 29, 2026 at 7:57 AM Baochen Qiang
> <baochen.qiang@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 1/27/2026 12:40 PM, Saikiran B wrote:
>>> I have analyzed the logs and code flow in depth to provide more
>>> definitive answers for your questions.
>>>
>>> The log entries showing the failure are:
>>> [  563.574076] ath12k_pci 0004:01:00.0: failed to pull fw stats: -71
>>> [  564.575896] ath12k_pci 0004:01:00.0: time out while waiting for get fw stats
>>>
>>> 1. Why are other stats populated?
>>> The "failed to pull fw stats: -71" error is not the initial failure
>>> but a symptom that appears after repeated operations. The leak happens
>>> during *successful* calls prior to this error.
>>>
>>> Code flow proving the leak:
>>> - ath12k_mac_get_fw_stats() sends WMI_REQUEST_PDEV_STAT.
>>> - Firmware responds. ath12k_update_stats_event() parses the response.
>>> - ath12k_wmi_fw_stats_process() is called, which splices 'vdevs' and
>>> 'beacon' stats into ar->fw_stats.vdevs/bcn.
>>> - ath12k_mac_get_fw_stats() returns 0 (Success).
>>> - In ath12k_mac_op_get_txpower(), the check `if (!pdev)` fails if the
>>> pdev-specific list is empty (but vdev list is NOT empty).
>>> - The function exits via `err_fallback` WITHOUT calling ath12k_fw_stats_reset().
>>> - Result: The 'vdev' and 'beacon' stats that were spliced into
>>> ar->fw_stats remain there, leaking memory and accumulating with every
>>> call.
>>>
>>> 2. Exact place where -71 is printed:
>>> The error "failed to pull fw stats: -71" is printed in
>>> [ath12k_update_stats_event()](drivers/net/wireless/ath/ath12k/wmi.c).
>>> It corresponds to "ret = ath12k_wmi_pull_fw_stats()" returning -EPROTO.
>>> This propagates from
>>> [ath12k_wmi_tlv_fw_stats_data_parse()](drivers/net/wireless/ath/ath12k/wmi.c),
>>> when buffer validation checks (like `len < sizeof(*src)`) fail.
>>>
>>> Conclusion:
>>> The fix in my patch (resetting stats when `!pdev`) is critical because
>>> it ensures that the accumulated 'vdev' and 'beacon' stats are freed
>>> even when the 'pdev' list ends up empty.
>>>
>>> Let me know if you need anything else.
>>
>> can you please try below to see if it can fix your issue?
>>
>> https://lore.kernel.org/r/20260129-ath12k-fw-stats-fixes-v1-0-55d66064f4d5@oss.qualcomm.com
>>
>>>
>>> Thanks & Regards,
>>> Saikiran
>>>
>>> On Tue, Jan 27, 2026 at 9:47 AM Saikiran B <bjsaikiran@gmail.com> wrote:
>>>>
>>>> Hi Baochen,
>>>>
>>>> Regarding your questions:
>>>>
>>>> "Are other stats populated?"
>>>>
>>>> Yes. When ath12k_mac_get_fw_stats() returns success (0), it means the
>>>> firmware response was received and valid WMI events were processed.
>>>> The firmware response to WMI_REQUEST_PDEV_STAT typically includes
>>>> multiple stats TLVs (vdev stats, beacon stats, etc.). Even if the
>>>> "pdev stats" list ends up empty (e.g., due to specific filtering or
>>>> availability), the firmware should have populated other lists (like
>>>> vdevs or beacons) in the ar->fw_stats structure. If we don't reset,
>>>> these valid entries leak and accumulate.
>>>>
>>>> "Where exactly is -71 (EPROTO) printed?"
>>>>
>>>> The log "failed to pull fw stats: -71" is printed in
>>>> ath12k_update_stats_event() (wmi.c line 8500 in my tree). This error
>>>> code (-EPROTO) propagates from ath12k_wmi_tlv_fw_stats_data_parse(),
>>>> where it is returned when buffer validation checks fail (e.g., if (len
>>>> < sizeof(*src))). This failure suggests that the accumulated state or
>>>> memory corruption from the leak eventually causes the parser to fail
>>>> on subsequent events.
>>>>
>>>> So, fixing the leak is necessary for correctness regardless of the
>>>> specific side-effect error code.
>>>>
>>>> Thanks & Regards,
>>>> Saikiran
>>>>
>>>> On Tue, Jan 27, 2026 at 8:57 AM Baochen Qiang
>>>> <baochen.qiang@oss.qualcomm.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 1/26/2026 5:52 PM, Saikiran wrote:
>>>>>> The commits bd6ec8111e65 and 2977567b244f changed firmware stats handling
>>>>>> to be caller-driven, requiring explicit ath12k_fw_stats_reset() calls
>>>>>> after using ath12k_mac_get_fw_stats().
>>>>>>
>>>>>> In ath12k_mac_op_get_txpower(), when ath12k_mac_get_fw_stats() succeeds
>>>>>> but the pdev stats list is empty, the function exits without calling
>>>>>> ath12k_fw_stats_reset(). Even though the pdev list is empty, the firmware
>>>>>> may have populated other stats lists (vdevs, beacons, etc.) in the
>>>>>
>>>>> 'may' is not enough, we need to be 100% sure whether other stats are populated. This is
>>>>> critical for us to find the root cause.
>>>>>
>>>>>> ar->fw_stats structure.
>>>>>>
>>>>>> Without resetting the stats buffer, this data accumulates across multiple
>>>>>> calls, eventually causing the stats buffer to overflow and leading to
>>>>>> firmware communication failures (error -71/EPROTO) during subsequent
>>>>>> operations.
>>>>>>
>>>>>> The issue manifests during 5GHz scanning which triggers multiple TX power
>>>>>> queries. Symptoms include:
>>>>>> - "failed to pull fw stats: -71" errors in dmesg
>>>>>
>>>>> still, can you please check the logs to see at which exact place is this printed?
>>>>>
>>>>>> - 5GHz networks not detected despite hardware support
>>>>>> - 2.4GHz networks work normally
>>>>>>
>>>>>> Fix by calling ath12k_fw_stats_reset() when the pdev list is empty,
>>>>>> ensuring the stats buffer is properly cleaned up even when only partial
>>>>>> stats data is received from firmware.
>>>>>>
>>>>>> Fixes: bd6ec8111e65 ("wifi: ath12k: Make firmware stats reset caller-driven")
>>>>>> Link: https://bugs.launchpad.net/ubuntu-concept/+bug/2138308
>>>>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim 7x)
>>>>>> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
>>>>>> ---
>>>>>>  drivers/net/wireless/ath/ath12k/mac.c | 1 +
>>>>>>  1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>>>>>> index e0e49f782bf8..6e35c3ee9864 100644
>>>>>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>>>>>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>>>>>> @@ -5169,6 +5169,7 @@ static int ath12k_mac_op_get_txpower(struct ieee80211_hw *hw,
>>>>>>                                       struct ath12k_fw_stats_pdev, list);
>>>>>>       if (!pdev) {
>>>>>>               spin_unlock_bh(&ar->data_lock);
>>>>>> +             ath12k_fw_stats_reset(ar);
>>>>>>               goto err_fallback;
>>>>>>       }
>>>>>>
>>>>>
>>
> 
> Hi Baochen,
> 
> I tried applying your patches on top of v6.19-rc7 (which is the latest
> mainline release candidate I'm testing on), but I ran into build
> issues because some of the dependencies seem missing.
> 
> Specifically:
> Patch 2 ("wifi: ath12k: fix station lookup failure when disconnecting
> from AP") uses `ath12k_link_sta_find_by_addr()`, which does not exist
> in my tree. It seems your patches are based on a different tree
> (ath-next?) that has newer changes not yet in the mainline.
> 
> Could you please point me to the specific git repo/branch you are
> using? I can try to build and test on that baseline to be sure.

My bad. Please try the latest ath tree:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/

the base commit is ath-202601271544 tag.

> 
> Regarding the firmware stats issue:
> I verified the firmware files match the latest available (MD5 sums
> matched), yet the "-71" errors and memory leak persist on my device
> without fixes.
> 
> I successfully applied the logic from your Patch 1 manually (since
> [ath12k_mac_get_target_pdev_id](cci:1://file:///home/saikiran/linux/kernel/x1e/x1e/drivers/net/wireless/ath/ath12k/mac.c:989:0-1008:1)
> exists), but I haven't fully validated if it alone resolves the leak
> in all scenarios.
> 
> However, the fix I proposed in my v2 patch (resetting stats when pdev
> list is empty) definitely stops the leak mechanism by ensuring cleanup
> happens even when the firmware returns partial stats (which seems to
> be the trigger condition).
> 
> I'll wait for your pointer to the base tree to do a proper test of your series.
> 
> Thanks & Regards,
> Saikiran


