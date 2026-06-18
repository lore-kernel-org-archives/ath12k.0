Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81838CD98ED
	for <ath12k@archiver.kernel.org>; Thu, 18 Jun 2026 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/SLGDVSPRDEUNYHuypX30EWs1xc9l3jLHZ+M27X13U=; b=MKPhjgSmORy48lA6ZqsLpO6KqU
	7ELHrpFtw7DoQkQm1e8CwLKiQ+qh6xJavBYj6eMGvlib+w3PtHxNwzdWSG4nPco2kW5LuFgPT3fAp
	xILP0rBN5xco1DnolLNDskazVSSOjnyKb/oyNMksN30V5bDrSq4HRGy2cE6KTtUHQKAyQC6BMdL1X
	RA+GUr9tDdYH+0nWur31aYgEW6UkhTo1Qa3VaRx02SNSe3s4Px6vi95ztgRoVMwLvssnpePyEE2Di
	cTUjb2T450TQF29tQqLzlHUKFTpJ7eWTdxZfdEgWyPAiqtE5hHAKdhM1+xziYBvAGBgdj+7s59jCv
	QdNvfqzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa93r-00000000y0n-1ASg;
	Thu, 18 Jun 2026 09:29:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa93o-00000000xz9-3gn8
	for ath12k@lists.infradead.org;
	Thu, 18 Jun 2026 09:29:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I9Bj4M1369951
	for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 09:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h/SLGDVSPRDEUNYHuypX30EWs1xc9l3jLHZ+M27X13U=; b=faK3GOeyMd43FnHm
	d/IPRnww+uj/Oa+Mt6K5zZR7NlSMMDG7D2J8zr+kkO3RfUWCeDINgvW8QnF5JlnA
	Q6e1InJc0dl4ZTCBsFz2Rl31JcWKxEUCVkvQ8Gd2YdHWgQmF7QoBG5zWRN16cjq3
	etor/UDOccF12nr203JRmz5G1UmY0TDSGH5TzZJToqsyQZUk4lIXZlpCn91ZbQnV
	Pp5f3o3yCP6C6KQmLomtT+cLE1Z0uQR9M5nRo0e4A7FwvVNz9z0AIih+k8i33qWa
	IrQjmgVF6FrPt/N7BNKB5JENRx2adbCJUrHcViiwSitXdOy2/JOpzG6Ea3awYvxN
	ZF9oXQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2juwj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 09:29:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422382178bso489001b3a.2
        for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 02:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781774959; x=1782379759; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h/SLGDVSPRDEUNYHuypX30EWs1xc9l3jLHZ+M27X13U=;
        b=UUYD1qnKlr1hJlXoJWqUnK/nNK6PUOR26B3ZhkceusvPUtmolKNlfAI/KN+BqvJZRo
         B5s7hhKxnviXMELokLC0Wu02dFuVLTDSBAHbKI85YSPgEtKlKgZ+2ME9Z1/QpQdwXaq/
         Hhsy2/6fU53lM2LtA9dG5kEDcsQloO6qio7HEJJd4AvIRVIML/xR2lFtbyOb57ZLDSC8
         ix4tfAHumqJWMDkhmX+Kv3pUUtrDe2l3mSmGqZx5O6RFPAaNoVxI4g6Ay9l7mc2YBIs0
         goDaYNkI17d8HaM+PW0oUmhEFvbRyKvCJO8ItXAaF0upSBmh2F5dxRYuKhum+HMNCiww
         d94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781774959; x=1782379759;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/SLGDVSPRDEUNYHuypX30EWs1xc9l3jLHZ+M27X13U=;
        b=qyF07J4YrrY5u2twXk0Y2MUi0GyjkQd2U8izPycx57xnsGCWfxBx5lELu3CBO7HRAr
         fDmBk43aRbp08qL3Nm8mcnFFJZja2mYnDLePoRXbm+9oT9RtRAXH0oQ/AnaVHQ4Gh0DC
         mvb31EPJ4xnQ4d0ARxEwXPnaXB8XPkKwHM//ggi09MjMAbjbaZDvLwm7OSVffcFwaThe
         qmV1xAxng/o2ax6In4H9yNrFauE/wIly93LXc9s4iQEzhT02sGZLsbvzpeAq1Wu760Xf
         3YGmR/cCZtZS2phOokS0yuK13AkMFReneBFIRenXhLD8IxG3wrDk5DNl0h3dHjMkT63j
         KR6g==
X-Forwarded-Encrypted: i=1; AFNElJ8wJecP3gX67ySGlADoRFYWNbi8uqps8BKm/tEKtoNj6HLO1B5sNriN+zdRxZm2ACXpkISLbBE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmHEjjDCcNaEbbWy65kRpJFcPYrVuPQ9T9nZCHr+ijwxndcqfe
	4n9iOA2YitMD7qQnU81sUC2TKPMw8zsLmanK/GJf5S/Iat5ktWpkSOFo5z2cIpnUv0pPLj2ViYe
	JvsBwMefuYhgE/+oUDoq/3hdZOaa02GaJCdwiQmdhJtCj54B+eaANj+0J3r4+2jheyJ34L0nj
X-Gm-Gg: AfdE7clAc0+XnywoalG3TOy7n3fLDFvoZL3Qu/gE5cRwN6lMj6FL9b99bbxe1UjDsa0
	l7kCqbx5uD3pubZlRaNH8YQWWkVNmG+FLJm3uWE6i753BKmDaWd5WBgue1poeIZ01XUY6KJkl/0
	j0bAUuIWFHt1P+biqYgiDSXSCBTFJkRsNiFloD4xqsiDR6fAf6/mEuY/IAK99lBntFUNGP8p3sk
	9Ar6Se9uf7MS+uL1skr4KqCUHpIa0cdGWkk5dZGJbt6+7IsK+5kv8hSFYRCiE5gT86u7z2dQjKO
	ourB/h9eSlsAFNE4Rh0TGvrvtRGl09xDXWHW0pyapsdvV/Bz9UdlS8Se48snqCLVoHWNtodI8F5
	peVpvqBnFy/2Pone5nRxTt+CXDLw+qpSFB3pvFUWMItb+OiN3sFM=
X-Received: by 2002:a05:6a00:ac8:b0:842:8500:95f1 with SMTP id d2e1a72fcca58-845245bbf8emr8134945b3a.40.1781774958762;
        Thu, 18 Jun 2026 02:29:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:ac8:b0:842:8500:95f1 with SMTP id d2e1a72fcca58-845245bbf8emr8134883b3a.40.1781774958138;
        Thu, 18 Jun 2026 02:29:18 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434aca3041sm19249025b3a.5.2026.06.18.02.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 02:29:17 -0700 (PDT)
Message-ID: <96953b10-379b-41d9-a151-68982b9a9854@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:59:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: add QMI capability negotiation for
 dynamic memory mode
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath12k@lists.infradead.org, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org
References: <20260601031850.3715354-1-aaradhana.sahu@oss.qualcomm.com>
 <7f3f0f10-3493-49b7-ac6d-cc5efca24746@oss.qualcomm.com>
 <4fc10b44-3107-4e0b-9b1f-793713c28e0f@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4fc10b44-3107-4e0b-9b1f-793713c28e0f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4NyBTYWx0ZWRfX8zLCS2CsjW1M
 4u9DLTCh4FHO34qpQmG5Lso/0lRdeuWQq3laS5P9NzCB/2pG4jy/doHYsfydv/7v5CRBqTK9Zj7
 CmD3OdkBMczbHdLEBcDST//aByriM5a6uic3Rr3V/UGL1Tb0Sqd+7CKPmRP6MYhRLD9G0Vfn5P9
 emIGL8F/fZy2d/rtQcVfFrPcxLMau0nvT2vUelGE+0pvQNb3i9UxOPEpg5+1Eku4DubFLNajlQJ
 c3AGWkpVv2ic7cSUgD15q7zbAM0nA3KlxeoKJAAs2gdXuN07ti1dJ4t+mb2ooSuw6D8HQbia6EO
 +KpxMdEw6c6AOSLQ9U3oFJVYFCijfftMyvXK+ML56cLRD0z9Ghk9akvH2X2ds7P3L3gT9Ki5vqX
 Y9c6tfLmN3Lm8huun9wWGDpeWov5HA8RbGYXC4WdrkLlj4EZnNegLpc1ElFdT0MvCaI0z5u4fwv
 EfoVbmwtv/Z/8sO8Jkw==
X-Authority-Analysis: v=2.4 cv=Fsg1OWrq c=1 sm=1 tr=0 ts=6a33ba6f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=lR1UrLcOgk-yx1UTwkYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: JbVmnurIxio31oLk0KIDj24-c8J2AvLM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4NyBTYWx0ZWRfXwbx5BXB+DuxK
 9/OiK/s7NrYI4XneCQR6SJcJMhg0OF2jUZq7LckDuKspD2yNyPnmtMUljI+mP//BRWzjwX6BhMt
 nSsjx6z24IAfgDT7oTP1oVNYhX+g06k=
X-Proofpoint-GUID: JbVmnurIxio31oLk0KIDj24-c8J2AvLM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_022921_051190_D60C17E5 
X-CRM114-Status: GOOD (  24.98  )
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

On 6/18/2026 2:22 PM, Aaradhana Sahu wrote:
> 
> 
> On 6/18/2026 12:18 PM, Rameshkumar Sundaram wrote:
>> On 6/1/2026 8:48 AM, Aaradhana Sahu wrote:
>>> On AHB platforms, firmware operates in two modes: fixed-memory mode where
>>> firmware uses hardcoded addresses for memory regions such as BDF and does
>>> not request HOST_DDR memory from the host, and dynamic-memory mode where
>>> firmware expects the host to provide memory addresses including HOST_DDR
>>> after the Q6 read-only region and relies on host allocation for all memory
>>> types.
>>>
>>> Introduce QMI capability negotiation to support both modes. Add a new QMI
>>> PHY capability flag dynamic_ddr_support which is advertised by firmware to
>>> indicate it supports dynamic memory mode. When the host detects this
>>> capability, set the dynamic_mem_support flag in the host capability message
>>> to signal the host is ready to provide dynamic memory allocation. This
>>> triggers firmware to send the HOST_DDR memory request and use the
>>> host-provided address.
>>>
>>> For backward compatibility, if firmware doesn't advertise
>>> dynamic_ddr_support, the firmware continues to operate in fixed-memory mode
>>> where firmware uses predefined addresses.
>>>
>>> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
>>> ---
>>>    drivers/net/wireless/ath/ath12k/qmi.c | 50 +++++++++++++++++++++++++--
>>>    drivers/net/wireless/ath/ath12k/qmi.h | 10 ++++--
>>>    2 files changed, 54 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>>> index fd762b5d7bb5..85406d6e6da1 100644
>>> --- a/drivers/net/wireless/ath/ath12k/qmi.c
>>> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
>>> @@ -506,6 +506,24 @@ static const struct qmi_elem_info qmi_wlanfw_host_cap_req_msg_v01_ei[] = {
>>>            .offset        = offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
>>>                           feature_list),
>>>        },
>>> +    {
>>> +        .data_type    = QMI_OPT_FLAG,
>>> +        .elem_len    = 1,
>>> +        .elem_size    = sizeof(u8),
>>> +        .array_type    = NO_ARRAY,
>>> +        .tlv_type    = 0x33,
>>> +        .offset        = offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
>>> +                       dynamic_mem_support_valid),
>>> +    },
>>> +    {
>>> +        .data_type    = QMI_UNSIGNED_1_BYTE,
>>> +        .elem_len    = 1,
>>> +        .elem_size    = sizeof(u8),
>>> +        .array_type    = NO_ARRAY,
>>> +        .tlv_type    = 0x33,
>>> +        .offset        = offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
>>> +                       dynamic_mem_support),
>>> +    },
>>>        {
>>>            .data_type    = QMI_EOTI,
>>>            .array_type    = NO_ARRAY,
>>> @@ -602,6 +620,24 @@ static const struct qmi_elem_info qmi_wlanfw_phy_cap_resp_msg_v01_ei[] = {
>>>            .offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
>>>                           single_chip_mlo_support),
>>>        },
>>> +    {
>>> +        .data_type      = QMI_OPT_FLAG,
>>> +        .elem_len       = 1,
>>> +        .elem_size      = sizeof(u8),
>>> +        .array_type     = NO_ARRAY,
>>> +        .tlv_type       = 0x17,
>>> +        .offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
>>> +                       dynamic_ddr_support_valid),
>>> +    },
>>> +    {
>>> +        .data_type      = QMI_UNSIGNED_1_BYTE,
>>> +        .elem_len       = 1,
>>> +        .elem_size      = sizeof(u8),
>>> +        .array_type     = NO_ARRAY,
>>> +        .tlv_type       = 0x17,
>>> +        .offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
>>> +                       dynamic_ddr_support),
>>> +    },
>>>        {
>>>            .data_type    = QMI_EOTI,
>>>            .array_type    = NO_ARRAY,
>>> @@ -2248,6 +2284,11 @@ int ath12k_qmi_host_cap_send(struct ath12k_base *ab)
>>>        if (ret < 0)
>>>            goto out;
>>>    +    if (ab->qmi.dynamic_ddr_support) {
>>> +        req.dynamic_mem_support_valid = 1;
>>> +        req.dynamic_mem_support = 1;
>>> +    }
>>> +
>>>        ret = qmi_txn_init(&ab->qmi.handle, &txn,
>>>                   qmi_wlanfw_host_cap_resp_msg_v01_ei, &resp);
>>>        if (ret < 0)
>>> @@ -2319,11 +2360,14 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
>>>          ab->qmi.num_radios = resp.num_phy;
>>>    +    if (resp.dynamic_ddr_support_valid)
>>> +        ab->qmi.dynamic_ddr_support = resp.dynamic_ddr_support;
>>> +
>>>        ath12k_dbg(ab, ATH12K_DBG_QMI,
>>> -           "phy capability resp valid %d single_chip_mlo_support %d valid %d num_phy %d valid %d board_id %d\n",
>>> +           "phy capability resp valid %d single_chip_mlo_support %d valid %d num_phy %d valid %d board_id %d dynamic_ddr_valid %d dynamic_ddr_support %d\n",
>>>               resp.single_chip_mlo_support_valid, resp.single_chip_mlo_support,
>>> -           resp.num_phy_valid, resp.num_phy,
>>> -           resp.board_id_valid, resp.board_id);
>>> +           resp.num_phy_valid, resp.num_phy, resp.board_id_valid, resp.board_id,
>>> +           resp.dynamic_ddr_support_valid, resp.dynamic_ddr_support);
>>>          return;
>>>    diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
>>> index 2a63e214eb42..dbde76e5a78d 100644
>>> --- a/drivers/net/wireless/ath/ath12k/qmi.h
>>> +++ b/drivers/net/wireless/ath/ath12k/qmi.h
>>> @@ -156,9 +156,10 @@ struct ath12k_qmi {
>>>        struct m3_mem_region aux_uc_mem;
>>>        unsigned int service_ins_id;
>>>        struct dev_mem_info dev_mem[ATH12K_QMI_WLFW_MAX_DEV_MEM_NUM_V01];
>>> +    u8 dynamic_ddr_support;
>>>    };
>>>    -#define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN        261
>>> +#define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN        265
>>>    #define QMI_WLANFW_HOST_CAP_REQ_V01            0x0034
>>>    #define QMI_WLANFW_HOST_CAP_RESP_MSG_V01_MAX_LEN    7
>>>    #define QMI_WLFW_HOST_CAP_RESP_V01            0x0034
>>> @@ -258,7 +259,8 @@ struct qmi_wlanfw_host_cap_req_msg_v01 {
>>>        struct wlfw_host_mlo_chip_info_s_v01 mlo_chip_info[QMI_WLFW_MAX_NUM_MLO_CHIPS_V01];
>>>        u8 feature_list_valid;
>>>        u64 feature_list;
>>> -
>>> +    u8 dynamic_mem_support_valid;
>>> +    u8 dynamic_mem_support;
>>>    };
>>>      struct qmi_wlanfw_host_cap_resp_msg_v01 {
>>> @@ -267,7 +269,7 @@ struct qmi_wlanfw_host_cap_resp_msg_v01 {
>>>      #define QMI_WLANFW_PHY_CAP_REQ_MSG_V01_MAX_LEN        0
>>>    #define QMI_WLANFW_PHY_CAP_REQ_V01            0x0057
>>> -#define QMI_WLANFW_PHY_CAP_RESP_MSG_V01_MAX_LEN        18
>>> +#define QMI_WLANFW_PHY_CAP_RESP_MSG_V01_MAX_LEN        22
>>
>> this is not used anywhere, but since you're touching it should this be 26 ? response TLV 7, num_phy 4, board_id 7, existing single_chip_mlo_support 4, and new dynamic_ddr_support 4
>>
>>
>> -- 
>> Ramesh
> 
> I checked the driver and found there are several unused QMI_*_RESP_MSG_LEN macros.
> Since this macro is not used anywhere, I think it is better to remove this
> change from the current patch.
> I will send a separate cleanup patch to remove all unused QMI macros.
> 
> Hope that’s fine with you.
> 


I couldn’t trace the history either.
My guess is that the response-length macro was retained either as schema 
documentation or to keep it consistent with the generated QMI definitions.

Jeff may be able to confirm the original intent.

-- 
--
Ramesh


