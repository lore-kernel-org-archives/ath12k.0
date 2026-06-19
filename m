Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BAECD98F6
	for <ath12k@archiver.kernel.org>; Fri, 19 Jun 2026 06:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahKfd5WfoSqw0wTb06gbiq8U5qGM5/pMRyhSC9UY/bM=; b=AOn55m9uYhz83cVwxT8MYMqnPZ
	xTUAqrS330uoQi1fGtFZNa1pDPlLcF3Rmc/BruiOOBz6mNgtSPmvPX/GadWK8NWsbA+8Jq5qGB2hE
	sT1857brvHYIfTtbiYazCMZRRD9VQ6gcDn89gNZ600j3Ywc8CFuxbTtLI3Glk0C8iuGZmHdZTyEHw
	vMWb4yJ4ksP/up9Torn2epJdJq5UMFz6Sz8X2eELdYmtu3eZ9AYBXaS9yOef8aGlOxTlk7RVX6pF4
	ed2DZH/hj5irPB4aVufojzSCiG9yW7MRR5Q0PBG5dbteHE7jjRtl6bcEf6zdTj2JQOtKgZFpFykVI
	t5MWaaOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waSc7-000000022i6-3oh1;
	Fri, 19 Jun 2026 06:22:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waSc4-000000022hj-3bgk
	for ath12k@lists.infradead.org;
	Fri, 19 Jun 2026 06:22:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J2u10A3629061
	for <ath12k@lists.infradead.org>; Fri, 19 Jun 2026 06:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahKfd5WfoSqw0wTb06gbiq8U5qGM5/pMRyhSC9UY/bM=; b=VP1+dqH9ZGgw2hih
	cQm5F82Yk/AHDcP1uzVs/u8hqBmsCHP4DYTEruSrfnrX7+feeIPrEdWBMQeRkzsy
	G18Isyk+S/iYShGvF4M+GQ06kM9FVXdwUdJOqOOseUOkAuMwRG3VFyFkgkvInvrx
	PA5tZ0fACPadi8ek0KPyS1aJo30R19vPZ5GrDUWOPhHEqdK2bJFKTLVHc2fxKSuu
	UAodGgrl97Kj0X5F9Rlejpx21Q2PhHQf6WKUpBgRhrlD4yp/AHjpdV0bRq6FZDmx
	rAuGvYofOTRerKXtF+pvmxc/MSYwwN2kKKGmJtouKXIUOK9HL4DKESHeq2imXrBf
	qgVYrQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm20juru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 19 Jun 2026 06:21:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88fc985a65so1205412a12.2
        for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 23:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781850118; x=1782454918; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ahKfd5WfoSqw0wTb06gbiq8U5qGM5/pMRyhSC9UY/bM=;
        b=JMEKl+P+NZ/UWmVdtKqnUMveEGlDazZaQv3NRwvG1d8JUIViIfPBTEaKgBmppBDQJi
         /RlQtpjktsfI3Gl3cM/gvIMd32z+yOjAIY34HfZwEyBP+r4uV+tex98UtCRoZRfK4Ex2
         CTKK2Pr4MBQtFBjT8op+DeXdnydd9dN2t56bnnDLiH/b56eYN1k7uzSzOvXxzbtAw++h
         pGOBqoiVzRHdhueDFILjU5vpP8Mm/bDRMCyN/3++6/xvmyo9eq+lGEgu77kJFXmB+hLe
         Ns72z3NIEa3Y1pLT74ggthabcznsqdYmLX2LrE2/d2sbk/1rJboLk/5RaKYYpaI91sRg
         jW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781850118; x=1782454918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahKfd5WfoSqw0wTb06gbiq8U5qGM5/pMRyhSC9UY/bM=;
        b=FpH3RfCQhhQ3MiU8l/9AdeoPCEg2FeF679OBnDSj1Vkwt7oCGMiFp4/6uHj7Rdjlar
         7/WrQxOHneS18dh+EM2IxXNa53djzugwRMAjOG2M74HhfzL1oEyqdGVhxRMyHgZk5Cxu
         BD5B7aUVSBbJog6rkSeN63y/iwL/Nb6eIgl3bUzTeQ1/uzxpPkPCGm3eT5X3LzkT1wPe
         V9JTs7VyT0tKjabfrojXDM3u0E/HK7xYlnicK16ZGfPvMgbf1qL2eh/5ec23yFRhFmzN
         MHpdW4K4F/xA6MgFuzAqfKraAf2hxFWxHNqBXV+7pb44nFYcr9r/tAU/K6By/sTWnQfV
         i+iA==
X-Forwarded-Encrypted: i=1; AFNElJ9c63mtBkZWHpUqMIBgGgtAreJEs4fIwlHyArycg8Xh+krbTqrq/tM9mWR82uFY6zY8QCkMMJk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwyoXgCYsT2N1zgTDFs1hyQgOUCd1QbVmKsPZ8m8HdZ4Aw/nogX
	8IFZdo4Ct5tkfiTgOifSGMloCRgBJGoCd98bCr5kfdsu7Qj1g0yfDcFb1R42deqHb6fodJiHfdD
	vUYxvPOGQH5s3JU84448/R1acGfllPwul3zGz2Qd4/yoBAvJa8JfpYrYgXdx9vbHT
X-Gm-Gg: AfdE7cldejkr2YBv63cTY8tDoIbeyNkvww7ryOmMWDwsz7jJL6XMdKeLiYjRQwRVTYl
	zY2PnDQSru/rzces4NmEK+4qQJY7cI8mqYSINjvbzwVthmfV1r/lXzLaYMUq9T/vCbpy9lK3t0v
	sw/Y+5/BSCFbCQqr07a7iwq1MN9WRKYoAc4FRyUfALyKJ4lAEZ3OUfuGLI13DXb5GwCBSWVEjys
	0Or72VSsV6z58v7tBL8+kbg5KaSzSvor7rXS0IHOVmi9v4kbfflq2axWD/T6/0h3MnusmHpKMhQ
	lAK4virfi3RUUUetOmHm02GIceWo53ydVIJMSCMY3G5tTJz8MZqL6nE7gqIamFGNBYzzslPYbt9
	q+4vmu+ospK6jMVltrJI/9GcL3pM38xXh+9oNZi3EkPy0
X-Received: by 2002:a05:6a21:e098:b0:3b2:8685:118b with SMTP id adf61e73a8af0-3bb33f48a7fmr2634545637.20.1781850118431;
        Thu, 18 Jun 2026 23:21:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:e098:b0:3b2:8685:118b with SMTP id adf61e73a8af0-3bb33f48a7fmr2634506637.20.1781850117953;
        Thu, 18 Jun 2026 23:21:57 -0700 (PDT)
Received: from [10.152.222.171] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8afcb36977sm647159a12.17.2026.06.18.23.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 23:21:57 -0700 (PDT)
Message-ID: <35d384ae-c28b-4ca6-9f90-71a89b112aac@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 11:51:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: add QMI capability negotiation for
 dynamic memory mode
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath12k@lists.infradead.org, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org
References: <20260601031850.3715354-1-aaradhana.sahu@oss.qualcomm.com>
 <7f3f0f10-3493-49b7-ac6d-cc5efca24746@oss.qualcomm.com>
 <4fc10b44-3107-4e0b-9b1f-793713c28e0f@oss.qualcomm.com>
 <96953b10-379b-41d9-a151-68982b9a9854@oss.qualcomm.com>
 <17927ece-f0e3-4014-9143-891a15344bef@oss.qualcomm.com>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <17927ece-f0e3-4014-9143-891a15344bef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA1NiBTYWx0ZWRfXwUb7v0c1E9NS
 c7A9mcT8grQFKUu5rgbDHN134tYDmrYe6+gpgfDhKLiNSu78X5fv4mc0GG8We696gvnREa5m5B+
 rtRH7BNLGbJBrTvAFQ7fCnHEKytXVyYJgRsXE3Ws+frIlxA0YpcAH4SEkCIVEp7XzvaBJox0H4K
 aQUD38cq9HmWZwZ4TAlEVA5Q1t6LVejxXp/GOdMDFn/HWo/WHSRGNTyloDhyBayOi8UEU/ahZMN
 /G2NvkMPDXE+4AW4G5LpAKM6/pg3k6KPwud2xkTj+9GGHTXmxOSz5NCsn7KNmJ0NjZCGsonuhw3
 9BS+bnO1LOfEeYHgkf46BzQVoj2wcaEpTAoersXGfBmmgqprV5iAhqKCvfu2XdjoqQN18qolcoL
 HTnsmZyZ0PXPXhM/rw753wV18RNQY1juxXrcsDCTJOzHtf7pkdOvZX6gBW5NoZTcZgHu4DTuX9k
 Rb9rP9xkj5uyecWR7NA==
X-Authority-Analysis: v=2.4 cv=GKw41ONK c=1 sm=1 tr=0 ts=6a34e007 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=nT0Eqzq0tNwubFL82DkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA1NiBTYWx0ZWRfXzCxCCjymxQZ9
 v8MPbjEbuT+cRydC2e0+xi/Y4qYaDfSGA9yWv+EnJcec1MSe0kVCZbo7ON4XgqtPXeH9LQP+goz
 ZBLPOvzfHCfJzAY2NOrEIBt8ywxkbDI=
X-Proofpoint-GUID: 5OM8f6_wUMrR5V0UTZ-X4MNc-625mIVd
X-Proofpoint-ORIG-GUID: 5OM8f6_wUMrR5V0UTZ-X4MNc-625mIVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_232201_342750_37B10A55 
X-CRM114-Status: GOOD (  20.39  )
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



On 6/19/2026 4:55 AM, Jeff Johnson wrote:
> On 6/18/2026 2:29 AM, Rameshkumar Sundaram wrote:
>> On 6/18/2026 2:22 PM, Aaradhana Sahu wrote:
>>>
>>>
>>> On 6/18/2026 12:18 PM, Rameshkumar Sundaram wrote:
>>>> On 6/1/2026 8:48 AM, Aaradhana Sahu wrote:
>>>>> On AHB platforms, firmware operates in two modes: fixed-memory mode where
>>>>> firmware uses hardcoded addresses for memory regions such as BDF and does
>>>>> not request HOST_DDR memory from the host, and dynamic-memory mode where
>>>>> firmware expects the host to provide memory addresses including HOST_DDR
>>>>> after the Q6 read-only region and relies on host allocation for all memory
>>>>> types.
>>>>>
>>>>> Introduce QMI capability negotiation to support both modes. Add a new QMI
>>>>> PHY capability flag dynamic_ddr_support which is advertised by firmware to
>>>>> indicate it supports dynamic memory mode. When the host detects this
>>>>> capability, set the dynamic_mem_support flag in the host capability message
>>>>> to signal the host is ready to provide dynamic memory allocation. This
>>>>> triggers firmware to send the HOST_DDR memory request and use the
>>>>> host-provided address.
>>>>>
>>>>> For backward compatibility, if firmware doesn't advertise
>>>>> dynamic_ddr_support, the firmware continues to operate in fixed-memory mode
>>>>> where firmware uses predefined addresses.
>>>>>
>>>>> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
>>>>>
>>>>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
>>>>> ---
>>>>>    drivers/net/wireless/ath/ath12k/qmi.c | 50 +++++++++++++++++++++++++--
>>>>>    drivers/net/wireless/ath/ath12k/qmi.h | 10 ++++--
>>>>>    2 files changed, 54 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>>>>> index fd762b5d7bb5..85406d6e6da1 100644
>>>>> --- a/drivers/net/wireless/ath/ath12k/qmi.c
>>>>> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
>>>>> @@ -506,6 +506,24 @@ static const struct qmi_elem_info qmi_wlanfw_host_cap_req_msg_v01_ei[] = {
>>>>>            .offset        = offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
>>>>>                           feature_list),
>>>>>        },
>>>>> +    {
>>>>> +        .data_type    = QMI_OPT_FLAG,
>>>>> +        .elem_len    = 1,
>>>>> +        .elem_size    = sizeof(u8),
>>>>> +        .array_type    = NO_ARRAY,
>>>>> +        .tlv_type    = 0x33,
>>>>> +        .offset        = offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
>>>>> +                       dynamic_mem_support_valid),
>>>>> +    },
>>>>> +    {
>>>>> +        .data_type    = QMI_UNSIGNED_1_BYTE,
>>>>> +        .elem_len    = 1,
>>>>> +        .elem_size    = sizeof(u8),
>>>>> +        .array_type    = NO_ARRAY,
>>>>> +        .tlv_type    = 0x33,
>>>>> +        .offset        = offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
>>>>> +                       dynamic_mem_support),
>>>>> +    },
>>>>>        {
>>>>>            .data_type    = QMI_EOTI,
>>>>>            .array_type    = NO_ARRAY,
>>>>> @@ -602,6 +620,24 @@ static const struct qmi_elem_info qmi_wlanfw_phy_cap_resp_msg_v01_ei[] = {
>>>>>            .offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
>>>>>                           single_chip_mlo_support),
>>>>>        },
>>>>> +    {
>>>>> +        .data_type      = QMI_OPT_FLAG,
>>>>> +        .elem_len       = 1,
>>>>> +        .elem_size      = sizeof(u8),
>>>>> +        .array_type     = NO_ARRAY,
>>>>> +        .tlv_type       = 0x17,
>>>>> +        .offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
>>>>> +                       dynamic_ddr_support_valid),
>>>>> +    },
>>>>> +    {
>>>>> +        .data_type      = QMI_UNSIGNED_1_BYTE,
>>>>> +        .elem_len       = 1,
>>>>> +        .elem_size      = sizeof(u8),
>>>>> +        .array_type     = NO_ARRAY,
>>>>> +        .tlv_type       = 0x17,
>>>>> +        .offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
>>>>> +                       dynamic_ddr_support),
>>>>> +    },
>>>>>        {
>>>>>            .data_type    = QMI_EOTI,
>>>>>            .array_type    = NO_ARRAY,
>>>>> @@ -2248,6 +2284,11 @@ int ath12k_qmi_host_cap_send(struct ath12k_base *ab)
>>>>>        if (ret < 0)
>>>>>            goto out;
>>>>>    +    if (ab->qmi.dynamic_ddr_support) {
>>>>> +        req.dynamic_mem_support_valid = 1;
>>>>> +        req.dynamic_mem_support = 1;
>>>>> +    }
>>>>> +
>>>>>        ret = qmi_txn_init(&ab->qmi.handle, &txn,
>>>>>                   qmi_wlanfw_host_cap_resp_msg_v01_ei, &resp);
>>>>>        if (ret < 0)
>>>>> @@ -2319,11 +2360,14 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
>>>>>          ab->qmi.num_radios = resp.num_phy;
>>>>>    +    if (resp.dynamic_ddr_support_valid)
>>>>> +        ab->qmi.dynamic_ddr_support = resp.dynamic_ddr_support;
>>>>> +
>>>>>        ath12k_dbg(ab, ATH12K_DBG_QMI,
>>>>> -           "phy capability resp valid %d single_chip_mlo_support %d valid %d num_phy %d valid %d board_id %d\n",
>>>>> +           "phy capability resp valid %d single_chip_mlo_support %d valid %d num_phy %d valid %d board_id %d dynamic_ddr_valid %d dynamic_ddr_support %d\n",
>>>>>               resp.single_chip_mlo_support_valid, resp.single_chip_mlo_support,
>>>>> -           resp.num_phy_valid, resp.num_phy,
>>>>> -           resp.board_id_valid, resp.board_id);
>>>>> +           resp.num_phy_valid, resp.num_phy, resp.board_id_valid, resp.board_id,
>>>>> +           resp.dynamic_ddr_support_valid, resp.dynamic_ddr_support);
>>>>>          return;
>>>>>    diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
>>>>> index 2a63e214eb42..dbde76e5a78d 100644
>>>>> --- a/drivers/net/wireless/ath/ath12k/qmi.h
>>>>> +++ b/drivers/net/wireless/ath/ath12k/qmi.h
>>>>> @@ -156,9 +156,10 @@ struct ath12k_qmi {
>>>>>        struct m3_mem_region aux_uc_mem;
>>>>>        unsigned int service_ins_id;
>>>>>        struct dev_mem_info dev_mem[ATH12K_QMI_WLFW_MAX_DEV_MEM_NUM_V01];
>>>>> +    u8 dynamic_ddr_support;
>>>>>    };
>>>>>    -#define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN        261
>>>>> +#define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN        265
>>>>>    #define QMI_WLANFW_HOST_CAP_REQ_V01            0x0034
>>>>>    #define QMI_WLANFW_HOST_CAP_RESP_MSG_V01_MAX_LEN    7
>>>>>    #define QMI_WLFW_HOST_CAP_RESP_V01            0x0034
>>>>> @@ -258,7 +259,8 @@ struct qmi_wlanfw_host_cap_req_msg_v01 {
>>>>>        struct wlfw_host_mlo_chip_info_s_v01 mlo_chip_info[QMI_WLFW_MAX_NUM_MLO_CHIPS_V01];
>>>>>        u8 feature_list_valid;
>>>>>        u64 feature_list;
>>>>> -
>>>>> +    u8 dynamic_mem_support_valid;
>>>>> +    u8 dynamic_mem_support;
>>>>>    };
>>>>>      struct qmi_wlanfw_host_cap_resp_msg_v01 {
>>>>> @@ -267,7 +269,7 @@ struct qmi_wlanfw_host_cap_resp_msg_v01 {
>>>>>      #define QMI_WLANFW_PHY_CAP_REQ_MSG_V01_MAX_LEN        0
>>>>>    #define QMI_WLANFW_PHY_CAP_REQ_V01            0x0057
>>>>> -#define QMI_WLANFW_PHY_CAP_RESP_MSG_V01_MAX_LEN        18
>>>>> +#define QMI_WLANFW_PHY_CAP_RESP_MSG_V01_MAX_LEN        22
>>>>
>>>> this is not used anywhere, but since you're touching it should this be 26 ? response TLV 7, num_phy 4, board_id 7, existing single_chip_mlo_support 4, and new dynamic_ddr_support 4
>>>>
>>>>
>>>> -- 
>>>> Ramesh
>>>
>>> I checked the driver and found there are several unused QMI_*_RESP_MSG_LEN macros.
>>> Since this macro is not used anywhere, I think it is better to remove this
>>> change from the current patch.
>>> I will send a separate cleanup patch to remove all unused QMI macros.
>>>
>>> Hope that’s fine with you.
>>>
>>
>>
>> I couldn’t trace the history either.
>> My guess is that the response-length macro was retained either as schema 
>> documentation or to keep it consistent with the generated QMI definitions.
>>
>> Jeff may be able to confirm the original intent.
> 
> I suspect this was from the code generator and was just pulled in.
> Concur we should just drop this (and have a cleanup patch to remove any others
> that are unused).
> 
> And this V01 naming convention seems broken since we've regularly extended
> messages and yet still call them V01. I would have expected each extension
> would have incremented the version number...
> 
> And I also think it is strange to pass the message length anyway since the
> serializer should be able to figure that out -- having the clients pass that
> means the clients must know the details of the serialization algorithm which
> is a layering violation. But that is a preexisting issue with the QMI interface.
> 
> /jeff
> 
> /jeff
>>
> 

Thanks for the clarification. I will drop this change in the next version and
send a separate cleanup patch to remove the unused QMI response length macros.


