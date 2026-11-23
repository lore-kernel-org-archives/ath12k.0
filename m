Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2C8606A31A
	for <ath12k@archiver.kernel.org>; Mon, 23 Nov 2026 14:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uR50H2On;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A2RfhsbF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U0WeaEqB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Smi7DyyjRxVYoicH7J6jG7b7447tQ0E7x3DcOOVFtuk=; b=uR50H2On/96LYH
	DVmYVqqPdILdAXuTV1ZUZNSnawz2BMBizIaL/J8pUbnHbSkl/8pF0PGT62K1sQeqP0MZfQWnWVKny
	wgSXeQJX3LM5sKtSGs2q5eXYdITLY+/orXnYuIRihbBsLzVinG9Tn0n0E8mY9U6LDSH5DFJPem1Kk
	EtvnutCj8GnTMr1TBVA5BP3HhAZ7tV3QLs5txOTH1CVCmLGOSk26tUXwluWKsuRsT8Mcr55hz/14e
	4pSu8Ic7CMowT4qgS+eQNyLKcY/B7qAs2PCCA+lDIoh2E9pThuBMzGiA+FY0W/3xXJn5J9Fa2IhTJ
	Z/uzeEu6LLcVIV7qgQ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVV7f-00000003ktS-0wLG;
	Mon, 23 Nov 2026 14:34:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVV7c-00000003kt8-42CR
	for ath12k@lists.infradead.org;
	Mon, 23 Nov 2026 14:34:22 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL1KT2086051
	for <ath12k@lists.infradead.org>; Mon, 23 Nov 2026 14:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Smi7DyyjRxVYoicH7J6jG7b7447tQ0E7x3DcOOVFtuk=; b=A2RfhsbFTZ2+HTle
	sLG+m/K8OrvRA9VXTgH77D9x25c9JWolKsMsguUulP4g5zXbRscSws2nJ6cXD9Oe
	cUI4Us34XskMW9E9bj63kvdcWOV5exFG+stnQX6SzzJGsXQ9HxCQvblyLqjmpElE
	l3RKlV9Bjaoz3R9UKzYrMuwUe2UesbFNRLFdqwsj7pHZHSchq0eejKwvsAuDsnEu
	mFvpPuZuaYziaXVGG16WfU0M8tV2SJbOkVUHMPkm2fFVOi4YTuKeSuC6L5aToTNU
	Mc+tXKXOeY6zxsc7ApVRYjxNYHw81RlrKaSAk9w9ukw892/3eHB4S8A03IOIb0cd
	7U9mqw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy01u3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Nov 2026 14:34:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3869accaac2so1749595eec.1
        for <ath12k@lists.infradead.org>; Mon, 23 Nov 2026 06:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795444458; x=1796049258; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Smi7DyyjRxVYoicH7J6jG7b7447tQ0E7x3DcOOVFtuk=;
        b=U0WeaEqBpgfi7lUwm9/UlLym5RBa55U9VwQqexm4GZigDVKleXowhsl7dSn1N3lLAt
         vRAXRuWUhOnRxO5ciZbrO2GOZ1AMNVMDxhC3Yosn4Az2LYa2BkuNWEvUYogY4WtTT/76
         Vpfy1/9NEw8geriSRRKNJKU9wcD4yng7UFqkWTdnzbTkMe1gMEr6trLiqH5u9lPH1oSW
         RE4c6eNf+hI+p4Cq+y4GOsKS/0YdBlN9K9y3/PJ9GA1H2jnXa+bh3+x05owjCyDfUJZs
         6JPkqXMtI2/5VQ+FQGfTL2kdpY3NJmmChWRVP+tgPFohspETl00YbqVbR5aoSTc4AJgO
         odBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444458; x=1796049258;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Smi7DyyjRxVYoicH7J6jG7b7447tQ0E7x3DcOOVFtuk=;
        b=mK6hUY1gidfGXKmYOdYdcIS8O53dXXOiByuU/4uRRiAd5kPh6f1zxtkYxpkY6WLPgU
         /pBMD4Ad1bNAhP+jaKIYK9xQSsC9EPhLnyBsjU1tyQRpjxJPtGuaCNDV/EJIvWAA3rJR
         7wK0xwnesXsAVyMmDR25ISe/2lRpZYMt7rOBwktXbX1Z4wU5SaJaftQQRSFiV0e3/a+1
         jH1F1EGUF++bUa2fEq+z8siHUATU4qaDJ7LZqJYio+yU8OzbhTS43KE0pWGn+puVkOla
         SEddYxuSAf5dPVY28aYHB6VyYOhCEwE9X5hDYsmPQIcvTlY529RbX2RvxcXsRzn7ePfg
         ACyg==
X-Forwarded-Encrypted: i=1; AL+hErGZbUht0fRsbJrfXtN2kDivcgNJGWPJPB5wUdy2ppgKvJB2a4BqZhO7E92aoas09qFWqfGfMQU=@lists.infradead.org
X-Gm-Message-State: APuU4Z9PKtAmHxQSs+v6N7BwF+eEKFDp0bBXQpOrlG9caIz2TBmSBCUB
	vXI4InBJTvIuly+IAy2eR++jhyHg+9MZphiBp5wUKDRW9ksv8gtO7IICOjAA5e5xG9eDLYOj/fZ
	Hm0SqLXchlHvdGqucWMTm1hFEgG8u7elIoBW7VurVnF/76VswkF56G/v9AXDBLVlU
X-Gm-Gg: AZFdTZcPUGqfWFC3KLTubeEwdahCfWyuoSdbub9XAD92O+1nrYet7yO4LVLKwr8sHBL
	O/P5TsNmCdFPk8DIsogfeX9+lXwRiefHOHIvvctw30Qh/CyJ+q5oA343rp8/OmhYic96kDKC8xj
	PSnukani9O9RbZ93gQT8GvHXfxSJduwwv9VkOV3zO5HrK1GsTmxWpW2jlfNsyvaMAOSjsUe3MGs
	00jyfKUnrihvyfdEFdhgkgDROVjLA7XY3xojUKi0E+86iiADY1YQPTBzGvdeFjhzxS/BsdDETWB
	7zjgWU8cOf7vgg5iG62Mh8BiyZyH1lBZ3Ry/Gs44Jbk+ubjh15I5WMlP51ZoPAX8MUNCEwkq7Ze
	TC6Zlgw/4RO9Ekj914RiPDJMxhxm7AYmPRTpFYdIoexm1YESR1RoG/r9OUrLGU7VhZPAvRRewvu
	ldfoeSQ3yB6RPWdBhR
X-Received: by 2002:a05:7301:2b5:b0:386:b8a7:a195 with SMTP id 5a478bee46e88-386b8a7a885mr1173722eec.2.1795444457775;
        Mon, 23 Nov 2026 06:34:17 -0800 (PST)
X-Received: by 2002:a05:7301:2b5:b0:386:b8a7:a195 with SMTP id 5a478bee46e88-386b8a7a885mr1173687eec.2.1795444456713;
        Mon, 23 Nov 2026 06:34:16 -0800 (PST)
Received: from [192.168.11.103] ([124.123.81.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm40049875eec.21.2026.11.23.06.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:34:16 -0800 (PST)
Message-ID: <99ed1f21-2c87-4673-8d4a-45f20899b3ef@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 20:04:12 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: add hash table for peer lookup
 in struct ath12k_dp_hw
To: Aishwarya R <aishwarya.r@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20261120070900.541279-1-aishwarya.r@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261120070900.541279-1-aishwarya.r@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NyBTYWx0ZWRfX8ctdSKh4RIlV
 xQVP0RNevbOfWt1WzknNK8YYCoZQvqiQ8K5X6Xiq22xdtMXYw8e/RN5mvpcyuiVCeeLCIT60kzq
 82mckXa5WJUPfCjt5yyXSTc4IVxUs428y6dX9HtpnXpdUruVD6VXAI6PKsJBETUZx49fViDiSl/
 2e9ak5sukztzM/H2Al9lPWuXoLqGPy/iI8+XvG2O06GovN8PKw2BDtp3/4HuuJ6gshbof8GncwV
 WiIq5oQTqRCjBFziLP1dhL+yJkK+6JVB6OM4yOwtjyFSrHR6XrocPueDh+Bw8X+WI0EJIDyJJRy
 FgcmK40LCnqO60ULVBOrOP8t3vYKVC55XFFr0II8Z0GRHZKeR94wt/LpiZ/fnPtJWpR2ba8LgnJ
 8oMJqQTvvwZQum9+p947RwDSHfEHBQ37t9hXfdYtmm997jGxWygrKjwUCAusOGzuEjMghYsbBsi
 16t4zmNN1G8gSvSYeQg==
X-Proofpoint-ORIG-GUID: yegWRSf65HCD1uyd3x3t0Fr7pq9Lb2Tc
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b044eeb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=WcLwt0pvHDAIUQ3iVSLIEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xdo4dnPfHygUjUsX-2sA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: yegWRSf65HCD1uyd3x3t0Fr7pq9Lb2Tc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NyBTYWx0ZWRfX9TG+8JhfW4Gu
 AsrLOLm74Gh3y8pDm3iMpCv7rJqn6b3G/4F2vnmB7SW51kXn9shTzz8QCZLFyVjIsddDHR7hnbj
 GwtRXBr2F1mP84/xZcL+BB1EN7zjcls=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_063421_127456_A05355CD 
X-CRM114-Status: GOOD (  32.82  )
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

On 11/20/2026 12:39 PM, Aishwarya R wrote:
> Peer lookup by MAC address in struct ath12k_dp_hw is currently performed by
> walking the dp_peers_list, resulting in O(n) lookup complexity. As the
> driver supports up to 1536 clients, frequent lookups on critical paths
> such as TX/RX processing, peer management, control operations and
> debug/statistics handling can incur noticeable overhead in dense
> deployment scenarios.
> 
> Replace the peer list with a generic kernel hash table for MAC address
> based peer management and lookup, providing O(1) average-case lookup
> performance. The hash table is implemented using DECLARE_HASHTABLE()
> with 2048 buckets (2^11), derived from
> order_base_2(ATH12K_MAX_DEVICES * ATH12K_MAX_CLIENTS), and uses jhash()
> over the peer MAC address as the hash key.
> 
> The hash table is used both for address-based lookups and peer
> traversal operations, eliminating the need for maintaining a separate
> peer list.
> 
> The maximum single-radio client limit is defined as
> ATH12K_MAX_CLIENTS and reused by the memory profile and hardware
> params. This keeps the peer hash sizing aligned with the per-device
> client limit and the maximum number of devices in a hardware group.
> 
> Key changes:
> - Add peer_hash table to ath12k_dp_hw and initialize it during
>    hardware allocation.
> - Add hash_node to ath12k_dp_peer for hash table membership.
> - Introduce helper APIs for hash computation, insertion, deletion and
>    lookup.
> - Convert MAC-address-based peer searches from list traversal to
>    hash-table lookup.
> - Replace peer list traversal with hash table iteration.
> 
> Peer creation inserts the peer into the hash table, while deletion
> removes it from the hash table. Peer cleanup paths are updated to
> iterate over the hash table and safely free peer objects.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
> Signed-off-by: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
> Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased the changes
> ---
>   drivers/net/wireless/ath/ath12k/cmn_defs.h |  2 +
>   drivers/net/wireless/ath/ath12k/core.c     |  2 +-
>   drivers/net/wireless/ath/ath12k/dp_cmn.h   | 14 ++++++-
>   drivers/net/wireless/ath/ath12k/dp_peer.c  | 47 ++++++++++++++++++----
>   drivers/net/wireless/ath/ath12k/dp_peer.h  |  7 +++-
>   drivers/net/wireless/ath/ath12k/mac.c      | 20 ++++-----
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c | 10 ++---
>   7 files changed, 76 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/cmn_defs.h b/drivers/net/wireless/ath/ath12k/cmn_defs.h
> index 20208ffea1c9..15c5e8d11afc 100644
> --- a/drivers/net/wireless/ath/ath12k/cmn_defs.h
> +++ b/drivers/net/wireless/ath/ath12k/cmn_defs.h
> @@ -10,6 +10,8 @@
>   
>   #define MAX_RADIOS 2
>   #define ATH12K_MAX_DEVICES 3
> +#define ATH12K_MAX_CLIENTS 512
> +
>   #define ATH12K_GROUP_MAX_RADIO (ATH12K_MAX_DEVICES * MAX_RADIOS)
>   
>   #define ATH12K_SCAN_MAX_LINKS	ATH12K_GROUP_MAX_RADIO
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 719200759ca0..6e0bb1fecc09 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -44,7 +44,7 @@ static const struct
>   ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
>   [ATH12K_QMI_MEMORY_MODE_DEFAULT] = {
>   		.num_vdevs = 17,
> -		.max_client_single = 512,
> +		.max_client_single = ATH12K_MAX_CLIENTS,
>   		.max_client_dbs = 128,
>   		.max_client_dbs_sbs = 128,
>   		.dp_params = {
> diff --git a/drivers/net/wireless/ath/ath12k/dp_cmn.h b/drivers/net/wireless/ath/ath12k/dp_cmn.h
> index 88abe90767eb..ff011fafc175 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_cmn.h
> +++ b/drivers/net/wireless/ath/ath12k/dp_cmn.h
> @@ -6,6 +6,7 @@
>   #ifndef ATH12K_DP_CMN_H
>   #define ATH12K_DP_CMN_H
>   
> +#include <linux/hashtable.h>
>   #include "cmn_defs.h"
>   
>   struct ath12k_hw_group;
> @@ -18,12 +19,21 @@ struct ath12k_dp_link_peer;
>    */
>   #define MAX_DP_PEER_LIST_SIZE  16384
>   
> +/*
> + * The hash table supports ATH12K_MAX_DEVICES * ATH12K_MAX_CLIENTS clients;
> + * order_base_2() gives 2048 hash buckets.
> + */
> +#define ATH12K_DP_PEER_HASH_BITS \
> +	order_base_2(ATH12K_MAX_DEVICES * ATH12K_MAX_CLIENTS)
> +
>   struct ath12k_dp_hw {
>   	struct ath12k_dp_peer __rcu *dp_peers[MAX_DP_PEER_LIST_SIZE];
>   
> -	/* Lock for protection of dp_peer_list and peers */
> +	/* Lock for protection of dp_peers[] and peer_hash */
>   	spinlock_t peer_lock;
> -	struct list_head dp_peers_list;
> +
> +	/* Generic hash table for fast MAC address lookup */
> +	DECLARE_HASHTABLE(peer_hash, ATH12K_DP_PEER_HASH_BITS);
>   };
>   
>   struct ath12k_dp_hw_group {
> diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
> index 4e753e6abe3a..5dc7f08e6292 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_peer.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
> @@ -4,6 +4,7 @@
>    * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>    */
>   
> +#include <linux/jhash.h>
>   #include "core.h"
>   #include "dp_peer.h"
>   #include "debug.h"
> @@ -371,30 +372,58 @@ void ath12k_dp_link_peer_rhash_delete(struct ath12k_dp *dp,
>   			    peer->addr, peer->peer_id, ret);
>   }
>   
> +static u32 ath12k_dp_peer_addr_hash(const u8 *addr)
> +{
> +	return jhash(addr, ETH_ALEN, 0);
> +}
> +
>   struct ath12k_dp_peer *ath12k_dp_peer_find_by_addr(struct ath12k_dp_hw *dp_hw, u8 *addr)
>   {
> -	struct ath12k_dp_peer *peer;
> +	struct ath12k_dp_peer *dp_peer;
> +	u32 hash;
>   
>   	lockdep_assert_held(&dp_hw->peer_lock);
>   
> -	list_for_each_entry(peer, &dp_hw->dp_peers_list, list) {
> -		if (ether_addr_equal(peer->addr, addr))
> -			return peer;
> +	hash = ath12k_dp_peer_addr_hash(addr);
> +	hash_for_each_possible(dp_hw->peer_hash, dp_peer, hash_node, hash) {
> +		if (ether_addr_equal(dp_peer->addr, addr))
> +			return dp_peer;
>   	}
>   
>   	return NULL;
>   }
>   EXPORT_SYMBOL(ath12k_dp_peer_find_by_addr);
>   
> +static void ath12k_dp_peer_hash_table_add(struct ath12k_dp_hw *dp_hw,
> +					  struct ath12k_dp_peer *dp_peer)
> +{
> +	u32 hash;
> +
> +	lockdep_assert_held(&dp_hw->peer_lock);
> +
> +	hash = ath12k_dp_peer_addr_hash(dp_peer->addr);
> +	hash_add(dp_hw->peer_hash, &dp_peer->hash_node, hash);
> +}
> +
> +void ath12k_dp_peer_hash_table_delete(struct ath12k_dp_hw *dp_hw,
> +				      struct ath12k_dp_peer *dp_peer)
> +{
> +	lockdep_assert_held(&dp_hw->peer_lock);
> +
> +	hash_del(&dp_peer->hash_node);
> +}
> +
>   struct ath12k_dp_peer *ath12k_dp_peer_find_by_addr_and_sta(struct ath12k_dp_hw *dp_hw,
>   							   u8 *addr,
>   							   struct ieee80211_sta *sta)
>   {
>   	struct ath12k_dp_peer *dp_peer;
> +	u32 hash;
>   
>   	lockdep_assert_held(&dp_hw->peer_lock);
>   
> -	list_for_each_entry(dp_peer, &dp_hw->dp_peers_list, list) {
> +	hash = ath12k_dp_peer_addr_hash(addr);
> +	hash_for_each_possible(dp_hw->peer_hash, dp_peer, hash_node, hash) {
>   		if (ether_addr_equal(dp_peer->addr, addr) && (dp_peer->sta == sta))
>   			return dp_peer;
>   	}
> @@ -408,10 +437,12 @@ static struct ath12k_dp_peer *ath12k_dp_peer_create_find(struct ath12k_dp_hw *dp
>   							 bool mlo_peer)
>   {
>   	struct ath12k_dp_peer *dp_peer;
> +	u32 hash;
>   
>   	lockdep_assert_held(&dp_hw->peer_lock);
>   
> -	list_for_each_entry(dp_peer, &dp_hw->dp_peers_list, list) {
> +	hash = ath12k_dp_peer_addr_hash(addr);
> +	hash_for_each_possible(dp_hw->peer_hash, dp_peer, hash_node, hash) {
>   		if (ether_addr_equal(dp_peer->addr, addr)) {
>   			if (!sta || mlo_peer || dp_peer->is_mlo ||
>   			    dp_peer->sta == sta)
> @@ -517,7 +548,7 @@ int ath12k_dp_peer_create(struct ath12k_dp_hw *dp_hw, u8 *addr,
>   
>   	spin_lock_bh(&dp_hw->peer_lock);
>   
> -	list_add(&dp_peer->list, &dp_hw->dp_peers_list);
> +	ath12k_dp_peer_hash_table_add(dp_hw, dp_peer);
>   
>   	/*
>   	 * For an MLO client whose ML peer ID is allocated by the host, the
> @@ -555,7 +586,7 @@ void ath12k_dp_peer_delete(struct ath12k_dp_hw *dp_hw, u8 *addr,
>   	    dp_peer->peer_id != ATH12K_MLO_PEER_ID_PENDING)
>   		rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], NULL);
>   
> -	list_del(&dp_peer->list);
> +	ath12k_dp_peer_hash_table_delete(dp_hw, dp_peer);
>   
>   	spin_unlock_bh(&dp_hw->peer_lock);
>   
> diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
> index 2ac4c6c6d535..0a2b9d1814a5 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_peer.h
> +++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
> @@ -127,7 +127,6 @@ void ath12k_dp_link_peer_extended_event(struct ath12k_base *ab, u8 vdev_id,
>   					u8 logical_link_id, u8 valid);
>   
>   struct ath12k_dp_peer {
> -	struct list_head list;
>   	bool is_mlo;
>   	bool dp_setup_done;
>   
> @@ -164,6 +163,9 @@ struct ath12k_dp_peer {
>   	struct ath12k_dp_rx_tid rx_tid[IEEE80211_NUM_TIDS + 1];
>   
>   	bool use_4addr;
> +
> +	/* Hash table node for MAC address lookup */
> +	struct hlist_node hash_node;
>   };
>   
>   struct ath12k_dp_link_peer *
> @@ -212,4 +214,7 @@ ath12k_dp_link_peer_get_sta(const struct ath12k_dp_link_peer *link_peer)
>   	return link_peer && link_peer->dp_peer ?
>   		link_peer->dp_peer->sta : NULL;
>   }
> +
> +void ath12k_dp_peer_hash_table_delete(struct ath12k_dp_hw *dp_hw,
> +				      struct ath12k_dp_peer *dp_peer);
>   #endif
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index a247dcf387de..51ee44e72abf 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -1277,16 +1277,20 @@ void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
>   
>   void ath12k_mac_dp_peer_cleanup(struct ath12k_hw *ah)
>   {
> -	struct list_head peers;
> -	struct ath12k_dp_peer *dp_peer, *tmp;
>   	struct ath12k_dp_hw *dp_hw = &ah->dp_hw;
> +	struct ath12k_dp_peer *dp_peer;
> +	struct hlist_head free_list;
> +	struct hlist_node *tmp;
> +	int bkt;
>   
>   	lockdep_assert_wiphy(ah->hw->wiphy);
>   
> -	INIT_LIST_HEAD(&peers);
> +	INIT_HLIST_HEAD(&free_list);
>   
>   	spin_lock_bh(&dp_hw->peer_lock);
> -	list_for_each_entry_safe(dp_peer, tmp, &dp_hw->dp_peers_list, list) {
> +	hash_for_each_safe(dp_hw->peer_hash, bkt, tmp, dp_peer, hash_node) {
> +		ath12k_dp_peer_hash_table_delete(dp_hw, dp_peer);
> +
>   		if (dp_peer->is_mlo) {
>   			if (dp_peer->peer_id != ATH12K_MLO_PEER_ID_PENDING)
>   				rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id],
> @@ -1294,17 +1298,15 @@ void ath12k_mac_dp_peer_cleanup(struct ath12k_hw *ah)
>   			ath12k_peer_ml_free(ah, ath12k_sta_to_ahsta(dp_peer->sta));
>   		}
>   
> -		list_move(&dp_peer->list, &peers);
> +		hlist_add_head(&dp_peer->hash_node, &free_list);
>   	}
>   
>   	spin_unlock_bh(&dp_hw->peer_lock);
>   
>   	synchronize_rcu();
>   
> -	list_for_each_entry_safe(dp_peer, tmp, &peers, list) {
> -		list_del(&dp_peer->list);
> +	hlist_for_each_entry_safe(dp_peer, tmp, &free_list, hash_node)
>   		kfree(dp_peer);
> -	}
>   }
>   
>   static int ath12k_mac_vdev_setup_sync(struct ath12k *ar)
> @@ -15530,7 +15532,7 @@ static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_hw_group *ag,
>   
>   	spin_lock_init(&ah->survey_lock);
>   	spin_lock_init(&ah->dp_hw.peer_lock);
> -	INIT_LIST_HEAD(&ah->dp_hw.dp_peers_list);
> +	hash_init(ah->dp_hw.peer_hash);
>   
>   	for (i = 0; i < num_pdev_map; i++) {
>   		ab = pdev_map[i].ab;
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index 48a2f6da16ef..9f2b1dddfdb4 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -488,7 +488,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   
>   		.dp_primary_link_only = true,
>   		.client = {
> -			.max_client_single = 512,
> +			.max_client_single = ATH12K_MAX_CLIENTS,
>   			.max_client_dbs = 128,
>   			.max_client_dbs_sbs = 128,
>   		},
> @@ -587,7 +587,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   
>   		.dp_primary_link_only = false,
>   		.client = {
> -			.max_client_single = 512,
> +			.max_client_single = ATH12K_MAX_CLIENTS,
>   			.max_client_dbs = 128,
>   			.max_client_dbs_sbs = 128,
>   		},
> @@ -682,7 +682,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   
>   		.dp_primary_link_only = true,
>   		.client = {
> -			.max_client_single = 512,
> +			.max_client_single = ATH12K_MAX_CLIENTS,
>   			.max_client_dbs = 128,
>   			.max_client_dbs_sbs = 128,
>   		},
> @@ -871,7 +871,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   
>   		.dp_primary_link_only = false,
>   		.client = {
> -			.max_client_single = 512,
> +			.max_client_single = ATH12K_MAX_CLIENTS,
>   			.max_client_dbs = 128,
>   			.max_client_dbs_sbs = 128,
>   		},
> @@ -963,7 +963,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   
>   		.dp_primary_link_only = true,
>   		.client = {
> -			.max_client_single = 512,
> +			.max_client_single = ATH12K_MAX_CLIENTS,
>   			.max_client_dbs = 128,
>   			.max_client_dbs_sbs = 128,
>   		},
> 
> base-commit: 03b7c601b6e314115015a57061f5b377afe13190


Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

