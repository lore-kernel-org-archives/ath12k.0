Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D287CD98F0
	for <ath12k@archiver.kernel.org>; Thu, 18 Jun 2026 23:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9qXUzXn3LdTYjBBbXkLUO37GGMdGJbECqEM7fvxt1Q=; b=QCjcFVnjXfEL32KDj6ytn68K9I
	hAgwyABcAu1DebOYb7iyFbr9e/7/APkg1W4iBEQCnJp/iTV5QkiZi/BM1YrNGY/++dLV2vn4UPQGB
	NAdQ4vdJBlkqqxNRokA+W/9YIonJNI19ySx/O1F2rKrrtIULQaNkuxeys6CgHCEWky8HQ2/1EEtmZ
	omDjV5HA6pDdATC/pAfTsr0C9sk1L/uiXI5hcfGCtielt7owCCqFkstFm7rIRQX0Z5Wc0nr+xeGSs
	LW6sGFk5lLSGtl7gEsbQqYpZpXXqan0jN7ekDkn003naKRkMNmwOukokObzbMLWzU+CuP+CmxeUOc
	lGm4tz2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waM6w-00000001rT2-0mav;
	Thu, 18 Jun 2026 23:25:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waM6t-00000001rSW-129Z
	for ath12k@lists.infradead.org;
	Thu, 18 Jun 2026 23:25:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ILsI1d3060238
	for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 23:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s9qXUzXn3LdTYjBBbXkLUO37GGMdGJbECqEM7fvxt1Q=; b=Im2H85t8vqOhGtwL
	Uy1BmZZOugYrGfUN+vsdEg93HnvxRNO3+2zLpD0vBfFuLwFWXuHs6LgEcs18AP6K
	jks0lu3DnomSS3KrVZ12b7o+PyfIlvkFSpR5XggwbLNTb4y/ezpQPnhtumqKtgTb
	8ZtcS7ukg5FCKtwppUaEPjPrDyQb/rg0OqIX1a1Qi2XzfG2+voGvI0OuSOnWYAst
	u2BMRVfHo4jySsBtiZCuXn01GFIqX5gpu3vEpuRNW34kLZjSS0x14IYfCfza3/r0
	oxTDiiyBL562UWrDcchiPNJ40HfKvgB3moiY7cwWM/QiMMjSUDs8kZPZU0LxcR1x
	5DCU9Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmtj9g84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 23:25:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bdfcf7c14so6309269eec.0
        for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 16:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781825119; x=1782429919; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s9qXUzXn3LdTYjBBbXkLUO37GGMdGJbECqEM7fvxt1Q=;
        b=U8hkzTgrpoDVQef5R281tImLokklvt/HwgYxqjiSxgpaGw9cs8FDx75Ujbo7FEkW3P
         4WX+iT70E6TgoZ48HI8GK8+i1Mceflglea+ZyAmcuf5O0n/f6lbTxbzgb0EP8Wd4NQI7
         ZZ8VBydcKurS4eisLt3VOhamn4g6h++hjZCAd4fBVkMS/9GfON4Mfpmwj88RkAlYlwE/
         WJ1pc1ZOiJRum7eYXUh4lYLUXzB9pJThPXT0md4lEHvkyEkbz6c/uhVHCfh/4/Hl0o/4
         ibi7QzodMeerk4KAjP8dX+wUkVDJGe88I7WtjdFO4tA7UWbmjMmqImtnOf4H3Er1YFsA
         KUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781825119; x=1782429919;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9qXUzXn3LdTYjBBbXkLUO37GGMdGJbECqEM7fvxt1Q=;
        b=UFaptyTzRLrwAJUL41VZwCwFhPAHxr9VgRhqrlNh5uCn8RN8TCFIo1UgjuzXU4yOuB
         JDg7PqzjWeWgq4wP8HHQdK7K9RNqF1q4wukJRsVmmXG8H+TwtVoHJHezBYpizHt4WuHA
         X4dN8QU1LW6+OSsIcKbcYqgLxd98dtfZeFlUtQXk5OYPdEn2pYJrPrsfnMmTM/JPBuPO
         wcbHx/xdJvAAg/+bwk+VxSBR1LOeglBQBGOVAHsL03vBMsmguE69fyNhc4X2tykJJV8X
         GkD1LCnuCE2C2eZzJkw3FqUEOIzMYTcY30n5FnkCNwNpDNdAwVdyY5J3BZLIs5oFuo58
         AChQ==
X-Forwarded-Encrypted: i=1; AFNElJ86gMZR6F9l5HjLEX03uSNcNtDEfjwVVWaz1JMv0D51MUFDPXBc4eUVWAKFJoWA73Y7o9C+GuI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxELMBio8IK8ULdNZOyIBDgkgedUylmCHioYaRJy0BFKn9EdcEG
	mWEejw+JjsAJkjiyphk7k+yOl/9IZ+tExG49naqWbvkFTmSmQSzeLG25gkoWF7vuUaiLi+GyPzg
	fSKrm1XF8jGz7X93pVZzgAtLsR6jYEsSnZ9fxzXmGV04wEMdKYNB2lhLA6DtC06cU2HyAJTYm
X-Gm-Gg: AfdE7clWlFFpGHETBswMy//7WaxlTaGIltLr7WK5Qp174ta5Pwd6K1eP2v2npOKA85F
	hrRKvtjs3lbL8Nke382WSj15TLA2XeHXKF3guVqlAg6u2PAlnjZCIs18Sd/zUsFA6VMwOLlJ2tg
	N6CfGLN9Xjfyz25YxPaGyISlpN4g7FQx4m/8IY0POsqU5Min7caOmhuVIMrwRDYLWokYjTxglTO
	d1AjM8EScIkVCH3+76qzX0akB5jj9A5QUOlrAx+5kbUxZ6EVPGYP28Lw+miPwsVNh977SAfqffC
	NoEfgp0RXCyTz+I+SHLvleTp4wMQzJIo5ZnMx2QCc1Ez9jwpfWqHGD6nI9hmdMVfls5ec4Q8OHD
	VXQdwbiz56JE4nRTi/xarmV7AxSawYvwVwQCr63llWrqwxL8hbcmCFJQvkglmlNkd/FUMLsKj3w
	tKWVE=
X-Received: by 2002:a05:7022:6890:b0:138:4023:8c1 with SMTP id a92af1059eb24-139a4eca6f2mr86579c88.11.1781825119368;
        Thu, 18 Jun 2026 16:25:19 -0700 (PDT)
X-Received: by 2002:a05:7022:6890:b0:138:4023:8c1 with SMTP id a92af1059eb24-139a4eca6f2mr86561c88.11.1781825118803;
        Thu, 18 Jun 2026 16:25:18 -0700 (PDT)
Received: from [192.168.1.31] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139a3668243sm429870c88.14.2026.06.18.16.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 16:25:17 -0700 (PDT)
Message-ID: <17927ece-f0e3-4014-9143-891a15344bef@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 16:25:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: add QMI capability negotiation for
 dynamic memory mode
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org
References: <20260601031850.3715354-1-aaradhana.sahu@oss.qualcomm.com>
 <7f3f0f10-3493-49b7-ac6d-cc5efca24746@oss.qualcomm.com>
 <4fc10b44-3107-4e0b-9b1f-793713c28e0f@oss.qualcomm.com>
 <96953b10-379b-41d9-a151-68982b9a9854@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <96953b10-379b-41d9-a151-68982b9a9854@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDIxNCBTYWx0ZWRfX5AHn2HP48cS1
 O2fYRRe5wFOfoMrdP38zs51soiU3oOnigV/rlAuGf+yhZ6Dij+CqwzJ1Xo2F8XOh7b9kLJsOp20
 6BZeniNwdmXtjY7KxuDBfdNa3RCsfVE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDIxNCBTYWx0ZWRfX3mbGOgvtUwje
 rYgQQBIFfAOHB31ZwJDkufbXPoNNe5m6a0UflW794A6lPmqUwrAKas/HbaUk9Y18mmmlndF0E66
 VSZTIC07TTQq+BTigIaG3yx2ym0nvKkkJMqMC/b85wwjfG24w4hVaNyzT45hrU1v3cmon5I174v
 HpQKbDBo1vjUHxxw6/ISEh+BMUr2YSQzy6Yztu5s8gia5tO3CO9KolbiSEjp9/68EAvjZyacdrL
 lU2mp8i7hHrifRGr9QOwEinXU+WEiVEQFWBdZ0gweBnv8oBAgDrCKnPpR17/dobed8nPFpRqkBg
 tuT1o3P0GslXta4LZs6TtpxAwNyN69M/aM5phdah4NPr/eyzoliD1qcwmlQCySS0s2TwMc1yTfi
 hdH906xqfGQa5gvXrXqc7MY++xgodZ45loW4JBEpD2XG0kX2qaImqnDL1T+HG4TTn3DbqWhjzj1
 ygVW+bE5aFKz3TOoqkw==
X-Proofpoint-GUID: ZcDExt2Miiw_nz22P4MSck1FcSl4Vb5J
X-Proofpoint-ORIG-GUID: ZcDExt2Miiw_nz22P4MSck1FcSl4Vb5J
X-Authority-Analysis: v=2.4 cv=OM8XGyaB c=1 sm=1 tr=0 ts=6a347e60 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=RrAT5ANuwF0vCIftLWUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180214
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_162523_464756_85CF1533 
X-CRM114-Status: GOOD (  23.56  )
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

On 6/18/2026 2:29 AM, Rameshkumar Sundaram wrote:
> On 6/18/2026 2:22 PM, Aaradhana Sahu wrote:
>>
>>
>> On 6/18/2026 12:18 PM, Rameshkumar Sundaram wrote:
>>> On 6/1/2026 8:48 AM, Aaradhana Sahu wrote:
>>>> On AHB platforms, firmware operates in two modes: fixed-memory mode where
>>>> firmware uses hardcoded addresses for memory regions such as BDF and does
>>>> not request HOST_DDR memory from the host, and dynamic-memory mode where
>>>> firmware expects the host to provide memory addresses including HOST_DDR
>>>> after the Q6 read-only region and relies on host allocation for all memory
>>>> types.
>>>>
>>>> Introduce QMI capability negotiation to support both modes. Add a new QMI
>>>> PHY capability flag dynamic_ddr_support which is advertised by firmware to
>>>> indicate it supports dynamic memory mode. When the host detects this
>>>> capability, set the dynamic_mem_support flag in the host capability message
>>>> to signal the host is ready to provide dynamic memory allocation. This
>>>> triggers firmware to send the HOST_DDR memory request and use the
>>>> host-provided address.
>>>>
>>>> For backward compatibility, if firmware doesn't advertise
>>>> dynamic_ddr_support, the firmware continues to operate in fixed-memory mode
>>>> where firmware uses predefined addresses.
>>>>
>>>> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
>>>>
>>>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
>>>> ---
>>>>    drivers/net/wireless/ath/ath12k/qmi.c | 50 +++++++++++++++++++++++++--
>>>>    drivers/net/wireless/ath/ath12k/qmi.h | 10 ++++--
>>>>    2 files changed, 54 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>>>> index fd762b5d7bb5..85406d6e6da1 100644
>>>> --- a/drivers/net/wireless/ath/ath12k/qmi.c
>>>> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
>>>> @@ -506,6 +506,24 @@ static const struct qmi_elem_info qmi_wlanfw_host_cap_req_msg_v01_ei[] = {
>>>>            .offset        = offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
>>>>                           feature_list),
>>>>        },
>>>> +    {
>>>> +        .data_type    = QMI_OPT_FLAG,
>>>> +        .elem_len    = 1,
>>>> +        .elem_size    = sizeof(u8),
>>>> +        .array_type    = NO_ARRAY,
>>>> +        .tlv_type    = 0x33,
>>>> +        .offset        = offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
>>>> +                       dynamic_mem_support_valid),
>>>> +    },
>>>> +    {
>>>> +        .data_type    = QMI_UNSIGNED_1_BYTE,
>>>> +        .elem_len    = 1,
>>>> +        .elem_size    = sizeof(u8),
>>>> +        .array_type    = NO_ARRAY,
>>>> +        .tlv_type    = 0x33,
>>>> +        .offset        = offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
>>>> +                       dynamic_mem_support),
>>>> +    },
>>>>        {
>>>>            .data_type    = QMI_EOTI,
>>>>            .array_type    = NO_ARRAY,
>>>> @@ -602,6 +620,24 @@ static const struct qmi_elem_info qmi_wlanfw_phy_cap_resp_msg_v01_ei[] = {
>>>>            .offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
>>>>                           single_chip_mlo_support),
>>>>        },
>>>> +    {
>>>> +        .data_type      = QMI_OPT_FLAG,
>>>> +        .elem_len       = 1,
>>>> +        .elem_size      = sizeof(u8),
>>>> +        .array_type     = NO_ARRAY,
>>>> +        .tlv_type       = 0x17,
>>>> +        .offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
>>>> +                       dynamic_ddr_support_valid),
>>>> +    },
>>>> +    {
>>>> +        .data_type      = QMI_UNSIGNED_1_BYTE,
>>>> +        .elem_len       = 1,
>>>> +        .elem_size      = sizeof(u8),
>>>> +        .array_type     = NO_ARRAY,
>>>> +        .tlv_type       = 0x17,
>>>> +        .offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
>>>> +                       dynamic_ddr_support),
>>>> +    },
>>>>        {
>>>>            .data_type    = QMI_EOTI,
>>>>            .array_type    = NO_ARRAY,
>>>> @@ -2248,6 +2284,11 @@ int ath12k_qmi_host_cap_send(struct ath12k_base *ab)
>>>>        if (ret < 0)
>>>>            goto out;
>>>>    +    if (ab->qmi.dynamic_ddr_support) {
>>>> +        req.dynamic_mem_support_valid = 1;
>>>> +        req.dynamic_mem_support = 1;
>>>> +    }
>>>> +
>>>>        ret = qmi_txn_init(&ab->qmi.handle, &txn,
>>>>                   qmi_wlanfw_host_cap_resp_msg_v01_ei, &resp);
>>>>        if (ret < 0)
>>>> @@ -2319,11 +2360,14 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
>>>>          ab->qmi.num_radios = resp.num_phy;
>>>>    +    if (resp.dynamic_ddr_support_valid)
>>>> +        ab->qmi.dynamic_ddr_support = resp.dynamic_ddr_support;
>>>> +
>>>>        ath12k_dbg(ab, ATH12K_DBG_QMI,
>>>> -           "phy capability resp valid %d single_chip_mlo_support %d valid %d num_phy %d valid %d board_id %d\n",
>>>> +           "phy capability resp valid %d single_chip_mlo_support %d valid %d num_phy %d valid %d board_id %d dynamic_ddr_valid %d dynamic_ddr_support %d\n",
>>>>               resp.single_chip_mlo_support_valid, resp.single_chip_mlo_support,
>>>> -           resp.num_phy_valid, resp.num_phy,
>>>> -           resp.board_id_valid, resp.board_id);
>>>> +           resp.num_phy_valid, resp.num_phy, resp.board_id_valid, resp.board_id,
>>>> +           resp.dynamic_ddr_support_valid, resp.dynamic_ddr_support);
>>>>          return;
>>>>    diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
>>>> index 2a63e214eb42..dbde76e5a78d 100644
>>>> --- a/drivers/net/wireless/ath/ath12k/qmi.h
>>>> +++ b/drivers/net/wireless/ath/ath12k/qmi.h
>>>> @@ -156,9 +156,10 @@ struct ath12k_qmi {
>>>>        struct m3_mem_region aux_uc_mem;
>>>>        unsigned int service_ins_id;
>>>>        struct dev_mem_info dev_mem[ATH12K_QMI_WLFW_MAX_DEV_MEM_NUM_V01];
>>>> +    u8 dynamic_ddr_support;
>>>>    };
>>>>    -#define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN        261
>>>> +#define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN        265
>>>>    #define QMI_WLANFW_HOST_CAP_REQ_V01            0x0034
>>>>    #define QMI_WLANFW_HOST_CAP_RESP_MSG_V01_MAX_LEN    7
>>>>    #define QMI_WLFW_HOST_CAP_RESP_V01            0x0034
>>>> @@ -258,7 +259,8 @@ struct qmi_wlanfw_host_cap_req_msg_v01 {
>>>>        struct wlfw_host_mlo_chip_info_s_v01 mlo_chip_info[QMI_WLFW_MAX_NUM_MLO_CHIPS_V01];
>>>>        u8 feature_list_valid;
>>>>        u64 feature_list;
>>>> -
>>>> +    u8 dynamic_mem_support_valid;
>>>> +    u8 dynamic_mem_support;
>>>>    };
>>>>      struct qmi_wlanfw_host_cap_resp_msg_v01 {
>>>> @@ -267,7 +269,7 @@ struct qmi_wlanfw_host_cap_resp_msg_v01 {
>>>>      #define QMI_WLANFW_PHY_CAP_REQ_MSG_V01_MAX_LEN        0
>>>>    #define QMI_WLANFW_PHY_CAP_REQ_V01            0x0057
>>>> -#define QMI_WLANFW_PHY_CAP_RESP_MSG_V01_MAX_LEN        18
>>>> +#define QMI_WLANFW_PHY_CAP_RESP_MSG_V01_MAX_LEN        22
>>>
>>> this is not used anywhere, but since you're touching it should this be 26 ? response TLV 7, num_phy 4, board_id 7, existing single_chip_mlo_support 4, and new dynamic_ddr_support 4
>>>
>>>
>>> -- 
>>> Ramesh
>>
>> I checked the driver and found there are several unused QMI_*_RESP_MSG_LEN macros.
>> Since this macro is not used anywhere, I think it is better to remove this
>> change from the current patch.
>> I will send a separate cleanup patch to remove all unused QMI macros.
>>
>> Hope that’s fine with you.
>>
> 
> 
> I couldn’t trace the history either.
> My guess is that the response-length macro was retained either as schema 
> documentation or to keep it consistent with the generated QMI definitions.
> 
> Jeff may be able to confirm the original intent.

I suspect this was from the code generator and was just pulled in.
Concur we should just drop this (and have a cleanup patch to remove any others
that are unused).

And this V01 naming convention seems broken since we've regularly extended
messages and yet still call them V01. I would have expected each extension
would have incremented the version number...

And I also think it is strange to pass the message length anyway since the
serializer should be able to figure that out -- having the clients pass that
means the clients must know the details of the serialization algorithm which
is a layering violation. But that is a preexisting issue with the QMI interface.

/jeff

/jeff
> 


