Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFBED49C6D
	for <ath12k@archiver.kernel.org>; Fri, 30 Jan 2026 07:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEhxEUxpF/NBMQhInmGK4G71CIrV6GX1rOHUdXYrZC4=; b=NIqrbAy6bOaKakLKqtDy8QLoY+
	5O+0unKFsrD9D189af0DRE/1IWZhsHVz66AgFnRp1nVbEsXyB4MFvTRl0KtKmos1MCdFoRPuuphiG
	fsMRJsDzz1JKFejzOz5IigPdXqZndNIjM6gv9UA0S1jrNOdclOIYujjPz7u8Y2NBDIWL5hzRKBM7p
	HfLsbouDM19mkPfuEhm5opsg6/KYSuJlwUbDiUZfGqW3bPrgdNp9bP80zfANnEIAA9XEEUTAD6H9a
	GSIy0B4vc4KQmivgalAV5xyVwiUXh7uA4Ufr14z9wtIVisSTADf1/cvslwE44+eHFbOD/R15O44t9
	ddRGDg3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljHQ-00000001ATv-1uBy;
	Fri, 30 Jan 2026 07:51:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljHN-00000001ATW-2cjA
	for ath12k@lists.infradead.org;
	Fri, 30 Jan 2026 07:50:59 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U4bnLH1826296
	for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 07:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEhxEUxpF/NBMQhInmGK4G71CIrV6GX1rOHUdXYrZC4=; b=nUiHslfQ1YyyojXk
	25tvVEpl7npqnnV08Vw0tjwoH03/4Mxzb1h4r72WiebBRWRkwsMCRtDzMEpK/k7Y
	zatNmNrxIXc7qPYN0jOA4j7w7wrPhl5VXnowcOtUXwVTZxT0E9vHsXvKgNitZJi2
	zz+dTXdZBGMY/CK5+MN9EYekZjPeVOFuo6OnaiwQB9gnSHOrzonKkWoykhWEcMR+
	Pqj5iG1K7g4No10HKYq3s5Se8Xujm8xbsooBnmB2ByKCgQjPm5iuTJpafGGDi2XR
	OcUmtBT6Fn1c9C6Aog2l9OXTvqVHLvmUUBt2CCFixicCArkCKDOkkE2ttPZpSmdx
	yJOnDA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0nsmrga7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 07:50:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f2481ab87so2042773b3a.0
        for <ath12k@lists.infradead.org>; Thu, 29 Jan 2026 23:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769759455; x=1770364255; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEhxEUxpF/NBMQhInmGK4G71CIrV6GX1rOHUdXYrZC4=;
        b=Nhd9m3XDBpb/glmMh/37NroQ0TUXYyr0PH3HmlBABGYGrG8yp/c02lNJeejEN74emb
         aZG2acgfHwgj7ICd6jKY5Ai2BONo8KEV6RNMOvqx4UnN3dw/n5CPjWUbp2To19dVKVSg
         /WVsUStjHzetf4uCbF3C6zEMk5bTyguQIUUuz/jw6yvIe4/WcZpgz3X8EWPfPbwMc+YX
         mEjQWYvF6EV0FfqjR0SAbPgQexEOu9tvnahm2LgW0FNk8/qkbC7y7xIVeTDhIzq9L6GL
         imnGPhqQ+aAdo54LZyJKFXJ3Cm3uFzSOYbpIxCwEVk24y3XczJliowME50L2MClemoqk
         MOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769759455; x=1770364255;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEhxEUxpF/NBMQhInmGK4G71CIrV6GX1rOHUdXYrZC4=;
        b=SWi3G4Kw54ouBTFxROSlRjsQ+vuCCCzi6bpEVHfq3awhUPFxuAak4StgfAy/AfsxeY
         jNYHa1Mt73r4yoQiXYgLJwMAgamNSebJrJZ5HRAebPrXOaxDgo680F1h7Z5AoC9T/rPo
         pXCaIdhwN0anUbHN2vTOj2Xp6FthVZ+1oc0d0hsioWNuX8bhSYslRiG/tWKhZ4RtBVT4
         M+FRsGr+p8QqlPW37hCJ6uikymnw7nPBWHnSxXmnbQ6ePf1Rbs+2M4ZRvqewGXjvYc8E
         wCG5ESBA3rnxw6y6O4P3oEkBDSpMb9wp16/o0VZcD/I8QjppmOwIx77oOTGlAIsMu6u7
         my5g==
X-Gm-Message-State: AOJu0Ywk2Bs4Ww/r8KxeCiosqRrFPENx9YSZBqff5553QnF0kMtAaX6+
	DDXSRSxOSNP6AkGkBnrl+bZpFE8vTOFmkOjAWUYaOo5+NWLVYDxYNAdzetEi9FmjnGwIzbJdXie
	7Gu2EL7eFSI12zQSQ4QesIufsy21uadxNE56nLMl3ZWtuMxQ3uCMJEkEvgffco06Q
X-Gm-Gg: AZuq6aLbaMxETyuVOTDPpNIhFpIq7MIh3pdlw+Qvzk5AQwyPxUaCX16oTg8R6li8xQ6
	yWYa7xoI60LTD4bTzvOh0nKnaOXNCj0gKRhq4coMCa6rbr9m8ao6bs503Zu6ZNSh2U9j3ga2gRT
	bShogB5mB0zEVj3DYnk3zemcFAMdaGdbXZfctkrYdLS5+lQ/rEsCSsOrxmyCcjA1GJmD2NIsKCm
	ZzYn4RocjuDu8AEUYwUuAe3hMeiqoB5uQ2sRS4lS0DO77Y+VD+b3inm5vERHmtA0A03/YL17iHK
	C4Q3DA81fj8vajp3xEKfuqUGuldb09Vbbf/OWvilaz68ZGds8lIeIFcvaxQLM4zuKo7o0Fp4Ypq
	5k6ziJ8+WhEvnqibJPhnrGRRYLbLYQsHee5g/GuYjctj5+IaIBtEdMsShcjIC4DWMY7HzKn+03Y
	mtn/cBMA==
X-Received: by 2002:a05:6a00:2e82:b0:823:9c0:47a8 with SMTP id d2e1a72fcca58-823aa3fd374mr1857592b3a.9.1769759455445;
        Thu, 29 Jan 2026 23:50:55 -0800 (PST)
X-Received: by 2002:a05:6a00:2e82:b0:823:9c0:47a8 with SMTP id d2e1a72fcca58-823aa3fd374mr1857575b3a.9.1769759454848;
        Thu, 29 Jan 2026 23:50:54 -0800 (PST)
Received: from [10.133.33.47] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b1ef88sm6465051b3a.8.2026.01.29.23.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 23:50:54 -0800 (PST)
Message-ID: <49212251-acec-4c45-856e-8b28b0a56768@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 15:50:49 +0800
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
 <fbcbeb0f-c073-4da5-9dbe-2518a1d31f20@oss.qualcomm.com>
 <CAAFDt1uSQce_9AG2488yaeeEjCwQwQubW51K51VHiJF8Rp6xRQ@mail.gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAAFDt1uSQce_9AG2488yaeeEjCwQwQubW51K51VHiJF8Rp6xRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA2MCBTYWx0ZWRfX2fvVO0GAnypd
 NY9A7Ak3kXpnok45MuRih0oK30a7kFy+IGMWfBI0k8CRCwyiDrhq8cIuoc/3uxZfO0xluGU6jeo
 DotX1TfGoIR0OKNz6TSUYsBHUnT7XyQA3UiDimKA6sNl8nrCdeki/C995G8O1Py+jdcTA7OtL1h
 iRXZ2s0u1oRXwr2uhWPqwVL+VSChDP5AahAREcIpAoumBk3jcBdA0W/ffos81dhdQBvEoA9T/ry
 9G/oEqBaTYneNUQ4Avfp07+0b7FFJw74Q0TMgQXEByW0w5xClN53VEJALg0xmhLBLNssURNDTGB
 C1OmGEbui5MGTV/6xCJGA0x0wFFlz8zBcvWkJ5n7cnHJORj7BDsFQ8J+PEU7Oik+TB1BrdXArHV
 Ix816z//XbEbcAce73fhb0RYspiJN9+w9NlI7coS30XZJQNHopQkEh4EdSyvgiS38YM5fV6h6Xe
 NgmZYdL9QyFBCK0oPMg==
X-Proofpoint-GUID: NlYtSMvl9mhA6MyTXf8ICe_qRU_SL3P1
X-Proofpoint-ORIG-GUID: NlYtSMvl9mhA6MyTXf8ICe_qRU_SL3P1
X-Authority-Analysis: v=2.4 cv=HMbO14tv c=1 sm=1 tr=0 ts=697c62e0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=danhDmx_AAAA:8
 a=pGLkceISAAAA:8 a=J3Hy4y-j4yJuyjteYWcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_235057_677199_563F3280 
X-CRM114-Status: GOOD (  29.56  )
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



On 1/30/2026 3:32 PM, Saikiran B wrote:
> On Fri, Jan 30, 2026 at 7:39 AM Baochen Qiang
> <baochen.qiang@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 1/29/2026 10:06 PM, Saikiran B wrote:
>>> On Thu, Jan 29, 2026 at 7:57 AM Baochen Qiang
>>> <baochen.qiang@oss.qualcomm.com> wrote:
>>>>
>>>>
>>>>
>>>> On 1/27/2026 12:40 PM, Saikiran B wrote:
>>>>> I have analyzed the logs and code flow in depth to provide more
>>>>> definitive answers for your questions.
>>>>>
>>>>> The log entries showing the failure are:
>>>>> [  563.574076] ath12k_pci 0004:01:00.0: failed to pull fw stats: -71
>>>>> [  564.575896] ath12k_pci 0004:01:00.0: time out while waiting for get fw stats
>>>>>
>>>>> 1. Why are other stats populated?
>>>>> The "failed to pull fw stats: -71" error is not the initial failure
>>>>> but a symptom that appears after repeated operations. The leak happens
>>>>> during *successful* calls prior to this error.
>>>>>
>>>>> Code flow proving the leak:
>>>>> - ath12k_mac_get_fw_stats() sends WMI_REQUEST_PDEV_STAT.
>>>>> - Firmware responds. ath12k_update_stats_event() parses the response.
>>>>> - ath12k_wmi_fw_stats_process() is called, which splices 'vdevs' and
>>>>> 'beacon' stats into ar->fw_stats.vdevs/bcn.
>>>>> - ath12k_mac_get_fw_stats() returns 0 (Success).
>>>>> - In ath12k_mac_op_get_txpower(), the check `if (!pdev)` fails if the
>>>>> pdev-specific list is empty (but vdev list is NOT empty).
>>>>> - The function exits via `err_fallback` WITHOUT calling ath12k_fw_stats_reset().
>>>>> - Result: The 'vdev' and 'beacon' stats that were spliced into
>>>>> ar->fw_stats remain there, leaking memory and accumulating with every
>>>>> call.
>>>>>
>>>>> 2. Exact place where -71 is printed:
>>>>> The error "failed to pull fw stats: -71" is printed in
>>>>> [ath12k_update_stats_event()](drivers/net/wireless/ath/ath12k/wmi.c).
>>>>> It corresponds to "ret = ath12k_wmi_pull_fw_stats()" returning -EPROTO.
>>>>> This propagates from
>>>>> [ath12k_wmi_tlv_fw_stats_data_parse()](drivers/net/wireless/ath/ath12k/wmi.c),
>>>>> when buffer validation checks (like `len < sizeof(*src)`) fail.
>>>>>
>>>>> Conclusion:
>>>>> The fix in my patch (resetting stats when `!pdev`) is critical because
>>>>> it ensures that the accumulated 'vdev' and 'beacon' stats are freed
>>>>> even when the 'pdev' list ends up empty.
>>>>>
>>>>> Let me know if you need anything else.
>>>>
>>>> can you please try below to see if it can fix your issue?
>>>>
>>>> https://lore.kernel.org/r/20260129-ath12k-fw-stats-fixes-v1-0-55d66064f4d5@oss.qualcomm.com
>>>>
>>>>>
>>>>> Thanks & Regards,
>>>>> Saikiran
>>>>>
>>>>> On Tue, Jan 27, 2026 at 9:47 AM Saikiran B <bjsaikiran@gmail.com> wrote:
>>>>>>
>>>>>> Hi Baochen,
>>>>>>
>>>>>> Regarding your questions:
>>>>>>
>>>>>> "Are other stats populated?"
>>>>>>
>>>>>> Yes. When ath12k_mac_get_fw_stats() returns success (0), it means the
>>>>>> firmware response was received and valid WMI events were processed.
>>>>>> The firmware response to WMI_REQUEST_PDEV_STAT typically includes
>>>>>> multiple stats TLVs (vdev stats, beacon stats, etc.). Even if the
>>>>>> "pdev stats" list ends up empty (e.g., due to specific filtering or
>>>>>> availability), the firmware should have populated other lists (like
>>>>>> vdevs or beacons) in the ar->fw_stats structure. If we don't reset,
>>>>>> these valid entries leak and accumulate.
>>>>>>
>>>>>> "Where exactly is -71 (EPROTO) printed?"
>>>>>>
>>>>>> The log "failed to pull fw stats: -71" is printed in
>>>>>> ath12k_update_stats_event() (wmi.c line 8500 in my tree). This error
>>>>>> code (-EPROTO) propagates from ath12k_wmi_tlv_fw_stats_data_parse(),
>>>>>> where it is returned when buffer validation checks fail (e.g., if (len
>>>>>> < sizeof(*src))). This failure suggests that the accumulated state or
>>>>>> memory corruption from the leak eventually causes the parser to fail
>>>>>> on subsequent events.
>>>>>>
>>>>>> So, fixing the leak is necessary for correctness regardless of the
>>>>>> specific side-effect error code.
>>>>>>
>>>>>> Thanks & Regards,
>>>>>> Saikiran
>>>>>>
>>>>>> On Tue, Jan 27, 2026 at 8:57 AM Baochen Qiang
>>>>>> <baochen.qiang@oss.qualcomm.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 1/26/2026 5:52 PM, Saikiran wrote:
>>>>>>>> The commits bd6ec8111e65 and 2977567b244f changed firmware stats handling
>>>>>>>> to be caller-driven, requiring explicit ath12k_fw_stats_reset() calls
>>>>>>>> after using ath12k_mac_get_fw_stats().
>>>>>>>>
>>>>>>>> In ath12k_mac_op_get_txpower(), when ath12k_mac_get_fw_stats() succeeds
>>>>>>>> but the pdev stats list is empty, the function exits without calling
>>>>>>>> ath12k_fw_stats_reset(). Even though the pdev list is empty, the firmware
>>>>>>>> may have populated other stats lists (vdevs, beacons, etc.) in the
>>>>>>>
>>>>>>> 'may' is not enough, we need to be 100% sure whether other stats are populated. This is
>>>>>>> critical for us to find the root cause.
>>>>>>>
>>>>>>>> ar->fw_stats structure.
>>>>>>>>
>>>>>>>> Without resetting the stats buffer, this data accumulates across multiple
>>>>>>>> calls, eventually causing the stats buffer to overflow and leading to
>>>>>>>> firmware communication failures (error -71/EPROTO) during subsequent
>>>>>>>> operations.
>>>>>>>>
>>>>>>>> The issue manifests during 5GHz scanning which triggers multiple TX power
>>>>>>>> queries. Symptoms include:
>>>>>>>> - "failed to pull fw stats: -71" errors in dmesg
>>>>>>>
>>>>>>> still, can you please check the logs to see at which exact place is this printed?
>>>>>>>
>>>>>>>> - 5GHz networks not detected despite hardware support
>>>>>>>> - 2.4GHz networks work normally
>>>>>>>>
>>>>>>>> Fix by calling ath12k_fw_stats_reset() when the pdev list is empty,
>>>>>>>> ensuring the stats buffer is properly cleaned up even when only partial
>>>>>>>> stats data is received from firmware.
>>>>>>>>
>>>>>>>> Fixes: bd6ec8111e65 ("wifi: ath12k: Make firmware stats reset caller-driven")
>>>>>>>> Link: https://bugs.launchpad.net/ubuntu-concept/+bug/2138308
>>>>>>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim 7x)
>>>>>>>> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
>>>>>>>> ---
>>>>>>>>  drivers/net/wireless/ath/ath12k/mac.c | 1 +
>>>>>>>>  1 file changed, 1 insertion(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>>>>>>>> index e0e49f782bf8..6e35c3ee9864 100644
>>>>>>>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>>>>>>>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>>>>>>>> @@ -5169,6 +5169,7 @@ static int ath12k_mac_op_get_txpower(struct ieee80211_hw *hw,
>>>>>>>>                                       struct ath12k_fw_stats_pdev, list);
>>>>>>>>       if (!pdev) {
>>>>>>>>               spin_unlock_bh(&ar->data_lock);
>>>>>>>> +             ath12k_fw_stats_reset(ar);
>>>>>>>>               goto err_fallback;
>>>>>>>>       }
>>>>>>>>
>>>>>>>
>>>>
>>>
>>> Hi Baochen,
>>>
>>> I tried applying your patches on top of v6.19-rc7 (which is the latest
>>> mainline release candidate I'm testing on), but I ran into build
>>> issues because some of the dependencies seem missing.
>>>
>>> Specifically:
>>> Patch 2 ("wifi: ath12k: fix station lookup failure when disconnecting
>>> from AP") uses `ath12k_link_sta_find_by_addr()`, which does not exist
>>> in my tree. It seems your patches are based on a different tree
>>> (ath-next?) that has newer changes not yet in the mainline.
>>>
>>> Could you please point me to the specific git repo/branch you are
>>> using? I can try to build and test on that baseline to be sure.
>>
>> My bad. Please try the latest ath tree:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/
>>
>> the base commit is ath-202601271544 tag.
>>
>>>
>>> Regarding the firmware stats issue:
>>> I verified the firmware files match the latest available (MD5 sums
>>> matched), yet the "-71" errors and memory leak persist on my device
>>> without fixes.
>>>
>>> I successfully applied the logic from your Patch 1 manually (since
>>> [ath12k_mac_get_target_pdev_id](cci:1://file:///home/saikiran/linux/kernel/x1e/x1e/drivers/net/wireless/ath/ath12k/mac.c:989:0-1008:1)
>>> exists), but I haven't fully validated if it alone resolves the leak
>>> in all scenarios.
>>>
>>> However, the fix I proposed in my v2 patch (resetting stats when pdev
>>> list is empty) definitely stops the leak mechanism by ensuring cleanup
>>> happens even when the firmware returns partial stats (which seems to
>>> be the trigger condition).
>>>
>>> I'll wait for your pointer to the base tree to do a proper test of your series.
>>>
>>> Thanks & Regards,
>>> Saikiran
>>
> 
> Hi,
> 
> I have merged the tag, applied your patches and I can confirm that the
> leak has been fixed.

Thank you Saikiran for the test!

> 
> Thanks & Regards,
> Saikiran


