Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7D2606A321
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 07:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ry2TOKGY;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=USwIohAj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VU1xyvyf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5mJRDNzMlq1nfeOxClu49B/b8pA8+rKf+6ZtNiTNyaM=; b=ry2TOKGYnX/2T4
	LH/xHhczpHWHVJrOHfunKl4YoCTafZs9ukdMXHZ7IXHQ9hSm3MKlqGyqxZVyN1DCfVJd9/pP+eqqG
	JOFMPd0HISuHGd5D/bfYp7arljBp109LLxmb2FkSI18sfLREO5IVZTvtLHe07ip/JF77T8NyOYOkn
	Wj55UcdjwtLwvfJWq4rPdrdiq1Fsh7r+Wt48OUKcE9SAvOrUNxhDHm0SkK6POLPvEJyiXceuGQmdj
	sMMaGYrYF32kT2T6t0o5eejKrzJ3qd/cf1aBsmCupYKLiR2Jry2r5lzpmDQwRHBZKvKUVj6najDuH
	9sM/tlZ9qhyQ5VDcHgdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTdG-0000000CFke-0jN4;
	Thu, 26 Nov 2026 07:11:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTd4-0000000CFk2-2wsx
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 07:10:52 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36WSP2791235
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 07:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5mJRDNzMlq1nfeOxClu49B/b8pA8+rKf+6ZtNiTNyaM=; b=USwIohAjRHlPc8uE
	9dWA+PvTYtBhYGnW7WmI8kMQfuCwIPdzIuUGk4fmpCWerPW/EE8Ko970mZznQK5O
	WVOCCnbL9uzddkGIGHtVfbSHa4Nlka6YCN+q4Kg6qPCLiU4CtUCvygu4/S5LHSTp
	LE5ui30dfpMTOLqJOo4BwEpDM/vRDUMiyVpktFe/cHQpC9zgV7GTPYvOFsuW4g4g
	qlZKmegh/JBCbx490QzSeRPjyLCahvNYg6/pvw16IDlmznPRK400JhSJP7iP2DXK
	qJV6IVZFMVzf7ffuEvsl0Frq98T8FOyvnCnPEWzes27u2oFys5QvaSoo4FKtcV6h
	z+l/wA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnvbdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 07:10:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f05b674e3eso48732545ad.0
        for <ath12k@lists.infradead.org>; Wed, 25 Nov 2026 23:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795677047; x=1796281847; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5mJRDNzMlq1nfeOxClu49B/b8pA8+rKf+6ZtNiTNyaM=;
        b=VU1xyvyfTqmWvaL6xJROy8dnqYyJmKq7TjwU+FHgshcg6X9VqB2yKyjoBO9Msya7pe
         ukqjWdOC7hADovwdG1ajEF6bx9ZdOiow72+45bJ5fadQaNiDvzs98F2Inqsx5VLJU63x
         FMO5Bxa0G5AQkI7+WkjjVZN48wyFnT72+X693FHj5xeHi7gTJueaxsCXJydDYN69Byxg
         3owIeEUAP9Vc6g18Dj+aU359NysRTBvzqgfEE83hS5R70fmHeRS60pgb4iH00NhmI87O
         lAK8D6e4KR98FTsg4ocJi8p1kNeo4qENHzmIBKauS4WB6YMQcnJcyqKTJlUCsPN2wyNw
         qwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677047; x=1796281847;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mJRDNzMlq1nfeOxClu49B/b8pA8+rKf+6ZtNiTNyaM=;
        b=jed9xEA08xgUxO70T655o3hN5vBpqak6gI5abKOpvoVu+Dew89Q+4le5btLZj8ey2S
         e6jPNJvbcvjraDxjf23PDB0X6qhd73aD2aDTydn8A9k7LVII88vTCGCECsG89E7ecso7
         sW7dFlziYQbc+ue2fz84VkDO0ffavtk+YoXuMME8OwdbRizXiRb1xRCfSkoGziEIpsWY
         hqHL6ZSmbskH8k2MCf/XMJWzaIaiJr8ZZACDWJIVfOxEplE46iyU2nO7Qo1LuxdMJDua
         /FE5VC+u3ZpxZppVt7BQFuuXuHJrAqTCKqeQmkLqsU4FBqBUaIfH89OIBH3HNBZyqqaZ
         mwmw==
X-Gm-Message-State: APuU4Z/LsR0IrJ1PXKyeaoZn8A63f5lpR79ilzQnWcTCZdxwA3LOTPZ2
	SAXadI8pK++KfRrvDQo7ajnEM1NbB5IKGH1rejWSYBwKWa8zXPfxvh99f1gTKmwVJKFnXaXYRJ2
	q0iPMYbmNXcW7XyJMRerdEjCRnkkTkfWAe/+4KTzFMe8SBdNyk9IOkSxG5G5tTOsd
X-Gm-Gg: AZFdTZeHijlRsBORCphEXsl+Zle9H51jYrOnc7yytPJU9s2v1vi51lBsZWF2mO/B7CP
	aU1YDs14Fsls3bXx1T4TICv+5uqEoMqedQYJvnCNiMOrg92P3o5a+bL9vsylRU4bSgqHCFmK9Nq
	aK6AophvXuGfA/FH1pUqgNJ2jbPoebQ2/5qRHc3dKskb81QTP2BlfaAYbB67CrVpEGOe2vJMTte
	xjp8EFMIumPpOvUoSCLlpBVn6QNdn+8fsoqY/V88d0vMg5pJ1XDXUWurhBGlygag4M9d6o6MVgJ
	W9XKqAvzQe9k1tN/e2kjSWSLMZOod0VOFofJ6MNWJmKQKVHLAqR7Sv5YTpVE9w/GMNdf176bx2h
	fmTMXv/XMYFbFdAkT9Ocht94+FWXdncKHiqyKDlq3OWuwh9gM8zUDPfDOU+vfpWLM6Omv9ZjYN3
	SUAxYYGzaV8U484IiJb82p35D42JZytQeDo1NkrWN6c2jXAw==
X-Received: by 2002:a17:902:fc8e:b0:2f0:429a:e3a8 with SMTP id d9443c01a7336-2f0429ae437mr195602395ad.47.1795677047407;
        Wed, 25 Nov 2026 23:10:47 -0800 (PST)
X-Received: by 2002:a17:902:fc8e:b0:2f0:429a:e3a8 with SMTP id d9443c01a7336-2f0429ae437mr195602125ad.47.1795677046816;
        Wed, 25 Nov 2026 23:10:46 -0800 (PST)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c88sm98893155ad.56.2026.11.25.23.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:10:46 -0800 (PST)
Message-ID: <bf1f2b46-8392-47d1-aa83-785a63fcef54@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:10:43 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 7/7] wifi: ath12k: handle MLO active link updates
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
 <20261118025520.39269-8-miaoqing.pan@oss.qualcomm.com>
 <d10c7d75-2113-454d-bffb-a71b826ccff6@oss.qualcomm.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <d10c7d75-2113-454d-bffb-a71b826ccff6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfX6DK4i2nskpiE
 kABu4bp1/+YuZp9Muu6/0O2wzlHdBH/AVl7qbrSfUD8Hu/NGz4TXLUKQxLz0AqPK7nFRQtIqq3m
 IEaaNV0xCmoBxLjKDHtne1hxR07HII4VB6iPPLPW0S/19/vp4y1qgvLUxN/8P27eBm2kWou5BEs
 xhB+X609vcyJPxm5B2hESQ/3ju/ncEgtk/7FnTL2FUMZL4owMgOrZM4j5ee17vDtgp2VYutdMnU
 857fFMlYvy6oG/N+zNjNJK5o2tsGifQkx/hNxMwMaLL/ki2BU4khGPspiaLMiZ42lkZTfubdsnZ
 rnpdZ4+43v6iM+X7yqAfZW6YP6755LD2DmWEKtav0HtBJtRZiEBQXZLpKgwDfZn4M20q1sqPpgL
 iA8iaQm0JJF+gPGITkwE5VdKxY2j7PZj9/GqR4dsX3QWEJSAtpU9qBFFbsNFQXOWCzg55LaP2Xd
 lcyBVIfgn35Im0NNt9g==
X-Proofpoint-ORIG-GUID: pCLU8-C8NQq83tyJTHBHoT2MM_5v71Cf
X-Proofpoint-GUID: pCLU8-C8NQq83tyJTHBHoT2MM_5v71Cf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfXxNPxoaTZ3tFi
 DTBmZawOlex50PuHYNtfXIvHUurgHCNSfsPY2ZGFvraoL5FDb+R02oDiRRdlYi0A1LwL19gzhEl
 J02SOiW6tXSkSSmFPX5n0u43M1is+RM=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b07db78 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Dr3Gg3Y-FhNBr10yXqAA:9 a=9Or771OM3RG0_sXS:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_231050_888587_09F96007 
X-CRM114-Status: GOOD (  29.48  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/25/2026 4:54 AM, Rameshkumar Sundaram wrote:
> On 11/18/2026 8:25 AM, Miaoqing Pan wrote:
>> ath12k_mac_op_change_sta_links() handles both valid-link and active-link
>> changes from mac80211. For an active-link change, old_links and new_links
>> are the active sets. The callback returned early whenever new_links was
>> smaller than old_links, and outside connect nothing sends an active-link
>> command to firmware. So when an associated MLO STA deactivates a link,
>> e.g. active links 0x5 -> 0x1, firmware keeps link 2 active while
>> mac80211 has already released its channel context.
>>
>> Sync the active links to firmware from the callback once the STA is
>> AUTHORIZED:
>>
>> - Create link STAs for sta->valid_links instead of new_links. Firmware
>>    cannot remove a single link sta, so removals are only logged and are
>>    left to STA removal.
>> - Take the active set from channel contexts: a link with a link STA and
>>    a link vif is active if it holds a chanctx, inactive otherwise.
>>    mac80211 releases the chanctx of a deactivated link and assigns one to
>>    a newly activated link before it calls the callback.
>> - Send WMI_MLO_LINK_SET_ACTIVE only when this set differs from the one
>>    last programmed, cached per vif. Send it to each device that holds
>>    vdevs of the STA, with that device's links, and wait up to 5 seconds
>>    for each response. Two active links on the same MAC use
>>    INACTIVE_LINK_NUM, as at connect, and that command is not waited for.
>>    Update the cache only if all devices succeed, so a failed sync is
>>    retried on the next callback.
>> - Reset the cache on ASSOC -> AUTHORIZED, so the first sync after each
>>    (re)connect is always sent. This also covers hw restart, where
>>    mac80211 replays the station state transitions.
>>
>> If the device crashes while a request is pending, the waiter still holds
>> the wiphy lock. ath12k_core_pre_reconfigure_recovery() therefore releases
>> the waiter before it takes the lock, otherwise recovery stalls until the
>> timeout expires.
>>
>> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277- 
>> QCACOLSWPL_V1_TO_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108- 
>> QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>>
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/core.c |  15 ++
>>   drivers/net/wireless/ath/ath12k/core.h |  20 ++
>>   drivers/net/wireless/ath/ath12k/mac.c  | 241 +++++++++++++++++++++++--
>>   drivers/net/wireless/ath/ath12k/wmi.c  |   9 +-
>>   drivers/net/wireless/ath/ath12k/wmi.h  |   1 +
>>   5 files changed, 271 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/ 
>> wireless/ath/ath12k/core.c
>> index 42a9cd28c652..183da4cb5e64 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.c
>> +++ b/drivers/net/wireless/ath/ath12k/core.c
>> @@ -1524,6 +1524,19 @@ void ath12k_core_halt(struct ath12k *ar)
>>       idr_init(&ar->txmgmt_idr);
>>   }
>> +static void ath12k_core_abort_mlo_link_set_active(struct ath12k_base 
>> *ab)
>> +{
>> +    struct ath12k_mlo_link_set_active_req *req;
>> +
>> +    rcu_read_lock();
>> +    req = rcu_dereference(ab->mlo_link_set_active_req);
>> +    if (req) {
>> +        req->status = -ESHUTDOWN;
>> +        complete(&req->done);
>> +    }
>> +    rcu_read_unlock();
>> +}
>> +
>>   static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base 
>> *ab)
>>   {
>>       struct ath12k_hw_group *ag = ab->ag;
>> @@ -1538,6 +1551,8 @@ static void 
>> ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
>>       if (ab->is_reset)
>>           set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>> +    ath12k_core_abort_mlo_link_set_active(ab);
>> +
>>       for (i = 0; i < ag->num_hw; i++) {
>>           ah = ath12k_ag_to_ah(ag, i);
>>           if (!ah || ah->state == ATH12K_HW_STATE_OFF ||
>> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/ 
>> wireless/ath/ath12k/core.h
>> index 7c7057468916..74f184d283b7 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.h
>> +++ b/drivers/net/wireless/ath/ath12k/core.h
>> @@ -401,6 +401,12 @@ struct ath12k_vif {
>>       struct ath12k_link_vif deflink;
>>       struct ath12k_link_vif __rcu *link[ATH12K_NUM_MAX_LINKS];
>>       struct ath12k_vif_cache *cache[IEEE80211_MLD_MAX_NUM_LINKS];
>> +    /*
>> +     * Last active/inactive link state programmed to firmware via
>> +     * WMI_MLO_LINK_SET_ACTIVE. Zero means unknown: forces a resend.
>> +     */
>> +    u16 fw_active_links;
>> +    u16 fw_inactive_links;
>>       /* indicates bitmap of link vif created in FW */
>>       u32 links_map;
>>       /* Must be last - ends in a flexible-array member.
>> @@ -797,6 +803,12 @@ struct ath12k {
>>       } incumbent_signal_interference;
>>   };
>> +struct ath12k_mlo_link_set_active_req {
>> +    struct completion done;
>> +    int status;
>> +    struct rcu_head rcu_head;
>> +};
>> +
>>   struct ath12k_hw {
>>       struct ieee80211_hw *hw;
>>       struct device *dev;
>> @@ -1153,6 +1165,14 @@ struct ath12k_base {
>>   #endif /* CONFIG_ACPI */
>>       struct ath12k_hw_group *ag;
>> +
>> +    /*
>> +     * Set-active request in flight to this device, NULL when idle. 
>> Freed
>> +     * via kfree_rcu(). The links of an MLO STA can be on several 
>> devices,
>> +     * and each device is programmed separately, so at most one 
>> request is
>> +     * outstanding per device.
>> +     */
>> +    struct ath12k_mlo_link_set_active_req __rcu 
>> *mlo_link_set_active_req;
>>       struct ath12k_wsi_info wsi_info;
>>       enum ath12k_qmi_firmware_mode fw_mode;
>>       struct ath12k_ftm_event_obj ftm_event_obj;
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/ 
>> wireless/ath/ath12k/mac.c
>> index dfb0f6e678ac..885eedbbdd67 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -7667,6 +7667,8 @@ static int 
>> ath12k_mac_mlo_sta_update_link_active(struct ath12k_base *ab,
>>       u8 num_mlo_vdev = 0;
>>       u8 link_id;
>> +    lockdep_assert_wiphy(hw->wiphy);
>> +
>>       for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
>>           arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
>>           /* make sure vdev is created on this device */
>> @@ -7982,6 +7984,14 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw 
>> *hw,
>>       if (ieee80211_vif_is_mld(vif) && vif->type == 
>> NL80211_IFTYPE_STATION &&
>>           old_state == IEEE80211_STA_ASSOC && new_state == 
>> IEEE80211_STA_AUTHORIZED) {
>> +        /*
>> +         * The cached active link state is only updated while 
>> AUTHORIZED,
>> +         * so reset it on each ASSOC -> AUTHORIZED. The next active-link
>> +         * sync then sends the state to firmware.
>> +         */
>> +        ahvif->fw_active_links = 0;
>> +        ahvif->fw_inactive_links = 0;
>> +
>>           for_each_ar(ah, ar, i) {
>>               ab = ar->ab;
>>               if (prev_ab == ab)
>> @@ -8243,6 +8253,194 @@ static struct ath12k_link_sta 
>> *ath12k_mac_alloc_assign_link_sta(struct ath12k_hw
>>       return arsta;
>>   }
>> +static struct ieee80211_chanctx_conf *
>> +ath12k_mac_link_chanctx(struct ieee80211_hw *hw, struct ieee80211_vif 
>> *vif,
>> +            u8 link_id)
>> +{
>> +    struct ieee80211_bss_conf *link_conf;
>> +
>> +    link_conf = wiphy_dereference(hw->wiphy, vif->link_conf[link_id]);
>> +    if (!link_conf)
>> +        return NULL;
>> +
>> +    return wiphy_dereference(hw->wiphy, link_conf->chanctx_conf);
>> +}
>> +
>> +struct ath12k_mlo_dev_links {
>> +    u8 active_vdev[IEEE80211_MLD_MAX_NUM_LINKS];
>> +    u8 inactive_vdev[IEEE80211_MLD_MAX_NUM_LINKS];
>> +    u32 active_freq[IEEE80211_MLD_MAX_NUM_LINKS];
>> +    unsigned int num_active;
>> +    unsigned int num_inactive;
>> +};
>> +
>> +static u16 ath12k_mac_mlo_vif_active_links(struct ieee80211_hw *hw,
>> +                       struct ieee80211_vif *vif,
>> +                       unsigned long links)
>> +{
>> +    u16 active = 0;
>> +    u8 link_id;
>> +
>> +    for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
>> +        if (ath12k_mac_link_chanctx(hw, vif, link_id))
>> +            active |= BIT(link_id);
>> +    }
>> +
>> +    return active;
>> +}
>> +
>> +static void ath12k_mac_mlo_sta_collect_dev_links(struct ieee80211_hw 
>> *hw,
>> +                         struct ath12k_vif *ahvif,
>> +                         struct ath12k_base *ab,
>> +                         unsigned long links,
>> +                         struct ath12k_mlo_dev_links *dl)
>> +{
>> +    struct ieee80211_chanctx_conf *conf;
>> +    struct ath12k_link_vif *arvif;
>> +    u8 link_id;
>> +
>> +    dl->num_active = 0;
>> +    dl->num_inactive = 0;
>> +
>> +    for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
>> +        arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
>> +        if (!arvif || !arvif->is_created || arvif->ar->ab != ab)
>> +            continue;
>> +
>> +        conf = ath12k_mac_link_chanctx(hw, ahvif->vif, link_id);
>> +        if (!conf) {
>> +            dl->inactive_vdev[dl->num_inactive++] = arvif->vdev_id;
>> +            continue;
>> +        }
>> +
>> +        dl->active_freq[dl->num_active] = conf->def.chan->center_freq;
>> +        dl->active_vdev[dl->num_active++] = arvif->vdev_id;
>> +    }
>> +}
>> +
>> +static bool ath12k_mac_mlo_dev_same_mac(struct ath12k_base *ab,
>> +                    const struct ath12k_mlo_dev_links *dl)
>> +{
>> +    return dl->num_active == 2 &&
>> +           ath12k_mac_freqs_on_same_mac(ab, dl->active_freq[0],
>> +                        dl->active_freq[1]);
>> +}
>> +
>> +static int ath12k_mac_mlo_sta_send_inactive_link_num(struct 
>> ath12k_base *ab,
>> +                             struct ath12k_mlo_dev_links *dl)
>> +{
>> +    return ath12k_mac_mlo_sta_set_link_active(ab,
>> +                          WMI_MLO_LINK_FORCE_REASON_NEW_CONNECT,
>> +                          WMI_MLO_LINK_FORCE_MODE_INACTIVE_LINK_NUM,
>> +                          NULL, dl->active_vdev, dl->num_active,
>> +                          NULL, 0);
>> +}
>> +
>> +static int ath12k_mac_mlo_sta_send_set_active(struct ath12k_base *ab,
>> +                          struct ieee80211_vif *vif,
>> +                          struct ath12k_mlo_dev_links *dl)
>> +{
>> +    struct ath12k_mlo_link_set_active_req *req;
>> +    enum wmi_mlo_link_force_mode mode;
>> +    int ret;
>> +
>> +    req = kzalloc_obj(*req);
>> +    if (!req)
>> +        return -ENOMEM;
>> +
>> +    init_completion(&req->done);
>> +    rcu_assign_pointer(ab->mlo_link_set_active_req, req);
>> +
>> +    mode = dl->num_inactive ? WMI_MLO_LINK_FORCE_MODE_ACTIVE_INACTIVE :
>> +                  WMI_MLO_LINK_FORCE_MODE_ACTIVE;
>> +
>> +    ret = ath12k_mac_mlo_sta_set_link_active(ab,
>> +                         WMI_MLO_LINK_FORCE_REASON_NEW_CONNECT,
>> +                         mode, vif->cfg.ap_addr,
>> +                         dl->active_vdev, dl->num_active,
>> +                         dl->inactive_vdev, dl->num_inactive);
>> +
>> +    if (!ret && !wait_for_completion_timeout(&req->done,
>> +                         ATH12K_MLO_LINK_SET_ACTIVE_TIMEOUT_HZ)) {
>> +        ath12k_warn(ab, "timeout waiting for mlo set active links 
>> resp\n");
>> +        ret = -ETIMEDOUT;
>> +    }
>> +
>> +    if (!ret && req->status)
>> +        ret = -EIO;
>> +
>> +    rcu_assign_pointer(ab->mlo_link_set_active_req, NULL);
>> +    kfree_rcu(req, rcu_head);
>> +
>> +    return ret;
>> +}
>> +
>> +static int ath12k_mac_mlo_sta_sync_active_links(struct ath12k_hw *ah,
>> +                        struct ath12k_vif *ahvif,
>> +                        struct ath12k_sta *ahsta,
>> +                        struct ieee80211_sta *sta)
>> +{
>> +    struct ath12k_base *ab, *prev_ab = NULL;
>> +    struct ieee80211_hw *hw = ah->hw;
>> +    struct ath12k_mlo_dev_links dl;
>> +    unsigned long links;
>> +    u16 active, inactive;
>> +    struct ath12k *ar;
>> +    int ret;
>> +    int i;
>> +
>> +    lockdep_assert_wiphy(hw->wiphy);
>> +
>> +    links = ahsta->links_map & ahvif->links_map;
>> +
>> +    /*
>> +     * A link holding a channel context is active. The links of an 
>> MLO STA
>> +     * can be on different devices, so the active set is derived over 
>> all
>> +     * links and each device is then programmed with the links it holds.
>> +     */
>> +    active = ath12k_mac_mlo_vif_active_links(hw, ahvif->vif, links);
>> +    inactive = links & ~active;
>> +
>> +    if (!active) {
>> +        ath12k_hw_warn(ah, "no active link for sta %pM\n", sta->addr);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (active == ahvif->fw_active_links &&
>> +        inactive == ahvif->fw_inactive_links)
>> +        return 0;
>> +
>> +    for_each_ar(ah, ar, i) {
>> +        ab = ar->ab;
>> +        if (ab == prev_ab)
>> +            continue;
>> +        prev_ab = ab;
>> +
>> +        ath12k_mac_mlo_sta_collect_dev_links(hw, ahvif, ab, links, &dl);
>> +
>> +        if (!dl.num_active && !dl.num_inactive)
>> +            continue;
>> +
>> +        if (!dl.num_active) {
>> +            ath12k_hw_warn(ah,
>> +                       "cannot deactivate all STA links on a device\n");
>> +            return -EOPNOTSUPP;
>> +        }
>> +
> 
> for a configuration where more than one QCN9274 is combined in a hw 
> group and advertised under one wiphy, the only link can be deactivated 
> on ab
> 
> ah->radio[0] -- ab-1 QCN9274 5GHz
> ah->radio[1] -- ab-2 QCN9274 6GHz
> 
> This setup can associate as 5+6GHz ML STA and if mac80211 deactivates 
> one link say 5GHz, ath12k_mac_mlo_sta_collect_dev_links() will report 
> dl.num_active as 0 and dl.num_inactive as 1 which is still valid.
> 
> I tested this with such a setup and when AP removes one link i get below 
> errors,
> 
> root@buildroot:~# [  208.620233] wlan0: authenticate with 
> 00:03:7f:01:57:45 (local address=32:43:40:d5:13:f0)
> [  208.620278] wlan0: send auth to 00:03:7f:01:57:45 (try 1/3)
> [  208.646676] wlan0: authenticate with 00:03:7f:01:57:45 (local 
> address=32:43:40:d5:13:f0)
> [  208.646705] wlan0: send auth to 00:03:7f:01:57:45 (try 1/3)
> [  208.656809] wlan0: authenticated
> [  208.662463] wlan0: associate with 00:03:7f:01:57:45 (try 1/3)
> [  208.681771] wlan0: RX AssocResp from 00:03:7f:01:57:45 (capab=0x111 
> status=0 aid=1)
> [  208.706457] wlan0: [link 0] local address 32:43:40:d5:13:f0, AP link 
> address 00:03:7f:01:57:45 (assoc)
> [  208.707397] wlan0: [link 1] local address 4a:cd:9a:9c:d5:a5, AP link 
> address 00:03:7f:01:56:84
> [  209.128875] wlan0: associated
> 
> 
> root@buildroot:~# [  278.858680] wlan0: MLO Reconfiguration: work: 
> valid=0x3, removed=0x2
> [  278.860079] ath12k_wifi7_pci 0000:01:00.0: cannot deactivate all STA 
> links on a device
> [  278.864245] ath12k_wifi7_pci 0000:01:00.0: failed to sync mlo active 
> links for sta 00:03:7f:01:57:45: -95
> [  278.871936] ------------[ cut here ]------------
> [  278.881468] WARNING: net/mac80211/link.c:650 at 
> _ieee80211_set_active_links+0x398/0x3c8 [mac80211], CPU#0: kworker/u17:0/39
> [  279.021054] Call trace:
> [  279.028167]  _ieee80211_set_active_links+0x398/0x3c8 [mac80211] (P)
> [  279.030428]  ieee80211_set_active_links+0x88/0x138 [mac80211]
> [  279.036677]  ieee80211_ml_reconf_work+0xc8/0x13c [mac80211]
> [  279.042579]  cfg80211_wiphy_work+0x94/0xcc [cfg80211]
> [  279.047961]  process_one_work+0x178/0x2b0
> [  279.053168]  worker_thread+0x180/0x2f4
> [  279.057160]  kthread+0xf8/0x118
> [  279.060806]  ret_from_fork+0x10/0x20
> [  279.063845] ---[ end trace 0000000000000000 ]---
> 
> 
> 
> [Apologies for not catching this earlier :(]
> 

Thanks for testing this on a multi-device setup.

Yes, the behavior you observed is expected for QCN9274. Baochen had 
pointed out this limitation earlier. I checked the QCN9274 firmware code 
and confirmed that it does not support making the only link on an 
ath12k_base inactive. With two QCN9274 devices in one MLO hw group, each 
device owns a single link, so deactivating either link results in 
dl.num_active == 0 for that device. The firmware cannot represent or 
program this state. Therefore, QCN9274-based multi-device MLO does not 
support this type of active_links update.

I will fix this in v2 as follows:
- Before sending any WMI command, ath12k_mac_mlo_sta_sync_active_links() 
now checks all devices holding vdevs of the STA. If any device would end 
up with no active link (num_active == 0 && num_inactive > 0), the sync 
is skipped. It logs an info message and returns 0.
- The firmware is not programmed and the cached active/inactive links 
are not updated. The behavior is the same as before the patch, with no 
WARN and no disconnect.
- The check runs as a separate pass before any command is sent. 
Otherwise, with the 6 GHz link removed, ab-1 could already have been 
programmed when ab-2 turns out to be unsupported, leaving firmware 
partially updated.


