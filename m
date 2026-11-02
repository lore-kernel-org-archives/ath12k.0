Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F672606A324
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 01:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R6+Qqipo;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lUnlm5+N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P45p9BFi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WvJcFINWzwp3JGPxOyys14YLISpX1jdIxUrb+1jNhNU=; b=R6+Qqiporz71NI
	Lrs1KVRycxELdUsY1huKc+sW22EyjP3Bzr6xIGUG8U551gf1z1xLdBzgsTuNQ0WbaKHx0S7wem1Wo
	vS4ELx3SewZrL062izN+Af+0w2AGrn7IUth9E7whuxhXDR+S5//18BHkMDL1w2QjBv4IS/5Vl1j69
	unzL83RPyCuSWSh2wzr/HVYj7WJIDu/LkX2FajbYZ/U399VudoxcRS0gdk98p5CyknqfY0UWBpqxl
	nRJLTpnK8kTqB16GiYZqEQXCrU5HyaOEhkwo4WjMlcDYLk8xV2Cm8zHH6F3Qmc4LCDiMB3iCPnOsS
	BWyWuEFRAFwHgX6An2Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNh9Q-0000000FN3n-1FLZ;
	Mon, 02 Nov 2026 01:47:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNh9N-0000000FN3O-2T9Z
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 01:47:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A20K8891733375
	for <ath12k@lists.infradead.org>; Mon, 2 Nov 2026 01:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WvJcFINWzwp3JGPxOyys14YLISpX1jdIxUrb+1jNhNU=; b=lUnlm5+NpdxN3VxY
	y9Y7oTeh5rFxBtCvf9M9x9/DHj1L+1esLeR8xTovaKm8xuf/cGW60QWHrkYX84oZ
	3wnxcvSQxYLDDqQRla4JYmrcCibGy/f/Letd5hI9TkYBfrscoqCBPdzqAFavMciM
	jrzjQ4Ym0zxUOaPCYUxrNOaJnuIq2SbiQududdutoKGok++cCcfPvZlqSBeLqp07
	1xqxLc6ftsvgBKX6H82p8fqFIXc3Hm9iYItYgF7uEhGo2Ji88C5X2E7LGS9odG0S
	SZ/dkweykqPtpyX+Ys13ra0WfoAwt3++rKb5jSQWsotnflYF6SWRScYIHITlatlb
	PE1vog==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93emje9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 01:47:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab1e771632so2750461a91.1
        for <ath12k@lists.infradead.org>; Sun, 01 Nov 2026 17:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793584072; x=1794188872; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WvJcFINWzwp3JGPxOyys14YLISpX1jdIxUrb+1jNhNU=;
        b=P45p9BFiu0wtidgCrQDnVj4w1TmgMF+4Y9KQH8aRD8v+4ZXY2uKUSkWe3hC8WBIgsh
         SsqHNUN5SD0zs+DQ5gHpAx3+Q0vyds9qmP2VRc7PdP+YJcFdtiNDo8S1c2LnOivxWkzx
         fUVkgSP6gWdkeKz3Rir0SO6hHM+nJAd/N2Kj49DpKhR+d4e96ydBXDZOrxRuQvqiIT0U
         q3zgIy2Kgw4/4DG8QzTb23Zn7IBAG5lxp92aEEC0SHESCyRUiIAipr46YbOIcgBPpWTO
         +CZSGk3bj5nnsmNKeIpKO9VtO+JUHq0sIs7IoPMJKMhVvev+jePmBiSKXfbrls34H1ZA
         OrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793584072; x=1794188872;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WvJcFINWzwp3JGPxOyys14YLISpX1jdIxUrb+1jNhNU=;
        b=jhkaRv5hsdnRSZ1Z19dajOzslcWWp3slfGt8qvgjuOucsIMSoRJON8fVSOL7cIINkK
         oVRUoQAcy3GZCsCcIzhh6q+fQqV3eQBghvBaLi+J+n/QwFUdg4aUY37VEdK3ihYqUN96
         h9pimnTh5uW6ramTyhkPmKolOK07uR2N6eUoa5zKc7zuBpAL9bbtqIVuCsVs0j4Fcw8m
         GrbXLNj6QzYG9koX7nJ9vZM/Iq55WHlaydC79Pb4207yGmwOJtDjTj5hk3uIliN/nLcW
         N+LONi/FcKuw0hspxGrV0mwVywGKnZVeV2s1XNSWl7wyJgdS4aq/UK+5l8tEMdBomTFk
         3hBw==
X-Forwarded-Encrypted: i=1; AKwUvBx1YrORU4NkdsKDFC/AwixBxjuEdgchyEGyoXngMfJxLAgnMutK/YSAntXJMTrizL7i8a2T/JM=@lists.infradead.org
X-Gm-Message-State: APuU4Z9odvgYUp1ACWdYRS9ZdiehH4uKc2sPX139nHWDr/Rg2ZDLx3Qv
	p5IrGwqQqZdYdps6TttiSxgMj3KkwAexSLiMI0yy1Jh5Z4fvxS6Az8gQBq73nOInEzli6AFfnzJ
	TGcmTlYU36qcC2f6S1zt08mP6GEN7gGo3p/BIAco50RXiyXoIFIJfqa1eTwEbL4z4
X-Gm-Gg: AYBFou09gkss0dKjKLMnYn6LlWgso7Rw3S18/FAlmgbO3/Fi9XlGOWAVPENvc++XCyx
	VApFl4KY1pVln21wsQpmdgPHnv7ZpFtwsbjMC9Cf0ErmfE1+BGkaHgF7f8MNXqOj0YBZBNORINd
	XNV3+574dWipLc8NaNu6u3rsKkPWlxbchLW6ZlZRIzBBsPOTA6ZEG1kSFMVEkSdFcBtlNXecDgu
	n3L/y4YKlV039IkzJbBY42vC7OuYJhbjN83bsgAMvcZrHCgEHPbAtcBuaXA2ioFnBbiEdbYUTUq
	i0blFHex38X8Zwd7FqfZEcXBBq3MKpzbAwCQjLiR+WB3OKBgbZazg69olVMHzERqnh/fOaPDwfV
	/2RnBZZ3/0LdiLWyELY6afp/DQXw4TQ4HCPNhiuWmso3N82Lu5VktO7OXf6YVaq1TaCu17Axi6d
	dxQjY=
X-Received: by 2002:a17:90b:5347:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3ae897994b7mr4718502a91.32.1793584071822;
        Sun, 01 Nov 2026 17:47:51 -0800 (PST)
X-Received: by 2002:a17:90b:5347:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3ae897994b7mr4718498a91.32.1793584071262;
        Sun, 01 Nov 2026 17:47:51 -0800 (PST)
Received: from [10.239.104.253] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm16200269a91.9.2026.11.01.17.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 17:47:50 -0800 (PST)
Message-ID: <692a240a-3995-47bc-8360-136610fb6a89@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 09:47:47 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: move arsta grouping from
 rhashtable to per-radio hashtable
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Nagarajan Maran <nagarajan.maran@oss.qualcomm.com>
References: <20261021173318.1935569-1-maharaja.kennadyrajan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261021173318.1935569-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAwNiBTYWx0ZWRfX/uzU9uBwfV4y
 jbTGbq9gZFmz+JXDVOZuBnn6Rc30DybGqPzUDxfrwnKn8yP9qHnJy8DE2lL1f9oXE4SQqU3Ez4J
 /JQdH8COfcnQRbJP1OzDJeccz+Atqzs1rp6CCEvZnuJSQ9eozSxS63WHau3pRg1+m4VIK4SeOu4
 eWFzWtu0NjK9X+x5wnBDquETdEwgZCmWmEWd+axdyQEC2YNnG4VWqjSNVQMzaG+hQmTTwss0+ig
 1QgDt9d6u3IQJr1+0SID3ghgAGCfa/O0gHv4wCPC8x30dZrPxddLJTkl55loEURUfTr0IsR2c4F
 EFqo1jMYszTXTZHzehlQzeOLnLyPWMUQHxyMIsFz58HSGgAofPgf0MwZt++7ouDJ5n8+AWE1DGl
 +fU+sIBU46bJLVpvSeo4P9iCG4U3bH7jS167u5gdYBkvSJBS4ihmNjWTBJYICC5NPc/T98aKUfg
 8UYodDC59yDGKAoUAKA==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae7ebc8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DFEwwh57fLMD9Ncyh9UA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: oX-lekw3b2u9pGxxj83DM9bfsBtQ564R
X-Proofpoint-GUID: oX-lekw3b2u9pGxxj83DM9bfsBtQ564R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAwNiBTYWx0ZWRfX1zpjB9lSDhqV
 nQara/xy2j3VN26lfh3f44hhEcIX6Qp+qrBjv93t1bEJ3cL4ak5yWa6TTIM3WVdNvJll07lRWXm
 Dms7xb9wtZPozCMhrIz8962PcRLE5kI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_174753_656801_78D367F5 
X-CRM114-Status: GOOD (  34.25  )
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



On 10/22/2026 1:33 AM, Maharaja Kennadyrajan wrote:
> From: Nagarajan Maran <nagarajan.maran@oss.qualcomm.com>
> 
> The link-station lookup table is a single rhashtable at the ath12k_base
> level, keyed only by station address. Rhashtable does not allow duplicate
> keys, so the same address cannot be represented on two radios at once;
> a roam or split-PHY overlap where an address briefly exists on more than
> one radio is instead handled by deleting the previous radio's entry
> before inserting the new one. Because the table is keyed only by address
> and shared device-wide, a lookup also cannot be scoped to a specific
> radio: during that overlap window, or due to stale remnants, the single
> entry present for an address can belong to a different radio than the
> one being looked up, silently attaching the wrong radio's data to the
> wrong arsta.
> 
> Move the lookup table down to the ath12k (per-radio) level, and switch its
> backing structure from rhashtable to hlist, which is simpler to walk in
> full for the iteration that some code paths already need. Each radio now
> owns its own table, so a lookup is inherently scoped to that radio, and
> the same address can occupy an entry on two different radios at once
> without any delete-then-insert workaround.
> 
> Update ath12k_peer_sta_kickout_event(), ath12k_wmi_tlv_fw_stats_data_parse()
> and ath12k_wmi_tlv_rssi_chain_parse() to use the new per-radio arsta lookup
> helpers accordingly.
> 
> The datapath's link-peer table (struct ath12k_dp_link_peer, in dp_peer.c) has
> the same device-level rhashtable design and delete-then-insert workaround; it
> is unaffected by this change and remains out of scope here.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Nagarajan Maran <nagarajan.maran@oss.qualcomm.com>
> Co-developed-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
> Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.c |   9 --
>  drivers/net/wireless/ath/ath12k/core.h |  21 ++--
>  drivers/net/wireless/ath/ath12k/mac.c  | 122 ++++++++++-----------
>  drivers/net/wireless/ath/ath12k/peer.c | 144 +++++++++++--------------
>  drivers/net/wireless/ath/ath12k/peer.h |  11 +-
>  drivers/net/wireless/ath/ath12k/wmi.c  | 112 ++++++++++++-------
>  6 files changed, 213 insertions(+), 206 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 25987bc58556..2309ccae5338 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -716,8 +716,6 @@ void ath12k_core_to_group_ref_put(struct ath12k_base *ab)
>  
>  static void ath12k_core_stop(struct ath12k_base *ab)
>  {
> -	ath12k_link_sta_rhash_tbl_destroy(ab);
> -
>  	ath12k_core_to_group_ref_put(ab);
>  
>  	if (!test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags)) {
> @@ -1016,12 +1014,6 @@ static int ath12k_core_start(struct ath12k_base *ab)
>  	/* Indicate the core start in the appropriate group */
>  	ath12k_core_to_group_ref_get(ab);
>  
> -	ret = ath12k_link_sta_rhash_tbl_init(ab);
> -	if (ret) {
> -		ath12k_warn(ab, "failed to init peer addr rhash table %d\n", ret);
> -		goto err_reo_cleanup;
> -	}
> -
>  	return 0;
>  
>  err_reo_cleanup:
> @@ -1425,7 +1417,6 @@ static int ath12k_core_reconfigure_on_crash(struct ath12k_base *ab)
>  	int ret, total_vdev;
>  
>  	mutex_lock(&ab->core_lock);
> -	ath12k_link_sta_rhash_tbl_destroy(ab);
>  	ath12k_thermal_unregister(ab);
>  	ath12k_dp_pdev_free(ab);
>  	ath12k_ce_cleanup_pipes(ab);
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 99d71dab7c04..bde3b4985023 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -17,7 +17,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/average.h>
>  #include <linux/of.h>
> -#include <linux/rhashtable.h>
> +#include <linux/hashtable.h>
>  #include "qmi.h"
>  #include "htc.h"
>  #include "wmi.h"
> @@ -510,8 +510,8 @@ struct ath12k_link_sta {
>  	 /* for firmware use only */
>  	u8 link_idx;
>  
> -	/* peer addr based rhashtable list pointer */
> -	struct rhash_head rhash_addr;
> +	/* node for ar->arsta_hlist, the peer addr keyed hash table */
> +	struct hlist_node hash_node;
>  };
>  
>  struct ath12k_sta {
> @@ -658,11 +658,21 @@ struct ath12k {
>  	/* protects the radio specific data like debug stats, ppdu_stats_info stats,
>  	 * vdev_stop_status info, scan data, ath12k_sta info, ath12k_link_vif info,
>  	 * channel context data, test mode data, regd_channel_update_queue,
> -	 * peer_delete_waits.
> +	 * peer_delete_waits, arsta hash table (arsta_hlist/arsta_hash_bits).
>  	 */
>  	spinlock_t data_lock;
>  
>  	struct list_head arvifs;
> +
> +	/* per-radio hash buckets for station address lookup */
> +	struct hlist_head *arsta_hlist;
> +
> +	/*
> +	 * Number of bits used to size arsta_hlist (arsta_hlist has
> +	 * BIT(arsta_hash_bits) buckets).
> +	 */
> +	u8 arsta_hash_bits;
> +
>  	/* should never be NULL; needed for regular htt rx */
>  	struct ieee80211_channel *rx_channel;
>  
> @@ -1149,9 +1159,6 @@ struct ath12k_base {
>  	 */
>  	const struct ieee80211_ops *ath12k_ops;
>  
> -	struct rhashtable *rhead_sta_addr;
> -	struct rhashtable_params rhash_sta_addr_param;
> -
>  	/* must be last */
>  	u8 drv_priv[] __aligned(sizeof(void *));
>  };
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 01f8c6572f65..d21b0b50853e 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -1185,35 +1185,6 @@ static int ath12k_mac_set_kickout(struct ath12k_link_vif *arvif)
>  	return 0;
>  }
>  
> -static void ath12k_mac_link_sta_rhash_cleanup(void *data, struct ieee80211_sta *sta)
> -{
> -	u8 link_id;
> -	unsigned long links_map;
> -	struct ath12k_sta *ahsta;
> -	struct ath12k *ar = data;
> -	struct ath12k_link_sta *arsta;
> -	struct ath12k_link_vif *arvif;
> -	struct ath12k_base *ab = ar->ab;
> -
> -	ahsta = ath12k_sta_to_ahsta(sta);
> -	links_map = ahsta->links_map;
> -
> -	rcu_read_lock();
> -	for_each_set_bit(link_id, &links_map, IEEE80211_MLD_MAX_NUM_LINKS) {
> -		arsta = rcu_dereference(ahsta->link[link_id]);
> -		if (!arsta)
> -			continue;
> -		arvif = arsta->arvif;
> -		if (!(arvif->ar == ar))
> -			continue;
> -
> -		spin_lock_bh(&ab->base_lock);
> -		ath12k_link_sta_rhash_delete(ab, arsta);
> -		spin_unlock_bh(&ab->base_lock);
> -	}
> -	rcu_read_unlock();
> -}
> -
>  void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
>  {
>  	struct ath12k_dp_link_peer *peer, *tmp;
> @@ -1262,9 +1233,10 @@ void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
>  	ar->num_peers = 0;
>  	ar->num_stations = 0;
>  
> -	/* Cleanup rhash table maintained for arsta by iterating over sta */
> -	ieee80211_iterate_stations_mtx(ar->ah->hw, ath12k_mac_link_sta_rhash_cleanup,
> -				       ar);
> +	/* Cleanup address hash maintained for arsta on this radio */
> +	spin_lock_bh(&ar->data_lock);
> +	ath12k_link_sta_hlist_flush(ar);
> +	spin_unlock_bh(&ar->data_lock);
>  
>  	/* Delete all the self dp_peers on asserted radio */
>  	list_for_each_entry_safe_reverse(arvif, tmp_vif, &ar->arvifs, list) {
> @@ -7101,7 +7073,6 @@ static int ath12k_mac_station_remove(struct ath12k *ar,
>  	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(arsta->ahsta);
>  	struct ath12k_vif *ahvif = arvif->ahvif;
>  	int ret = 0;
> -	struct ath12k_link_sta *temp_arsta;
>  
>  	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
>  
> @@ -7130,14 +7101,9 @@ static int ath12k_mac_station_remove(struct ath12k *ar,
>  
>  	ath12k_mac_station_post_remove(ar, arvif, arsta);
>  
> -	spin_lock_bh(&ar->ab->base_lock);
> -
> -	/* To handle roaming and split phy scenario */
> -	temp_arsta = ath12k_link_sta_find_by_addr(ar->ab, arsta->addr);
> -	if (temp_arsta && temp_arsta->arvif->ar == ar)
> -		ath12k_link_sta_rhash_delete(ar->ab, arsta);
> -
> -	spin_unlock_bh(&ar->ab->base_lock);
> +	spin_lock_bh(&ar->data_lock);
> +	ath12k_link_sta_hlist_delete(ar, arsta);
> +	spin_unlock_bh(&ar->data_lock);
>  
>  	if (sta->valid_links)
>  		ath12k_mac_free_unassign_link_sta(ahvif->ah,
> @@ -7155,7 +7121,6 @@ static int ath12k_mac_station_add(struct ath12k *ar,
>  	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(arsta->ahsta);
>  	struct ath12k_wmi_peer_create_arg peer_param = {};
>  	int ret;
> -	struct ath12k_link_sta *temp_arsta;
>  
>  	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
>  
> @@ -7166,22 +7131,11 @@ static int ath12k_mac_station_add(struct ath12k *ar,
>  		goto exit;
>  	}
>  
> -	spin_lock_bh(&ab->base_lock);
> -
> -	/*
> -	 * In case of Split PHY and roaming scenario, pdev idx
> -	 * might differ but both the pdev will share same rhash
> -	 * table. In that case update the rhash table if link_sta is
> -	 * already present
> -	 */
> -	temp_arsta = ath12k_link_sta_find_by_addr(ab, arsta->addr);
> -	if (temp_arsta && temp_arsta->arvif->ar != ar)
> -		ath12k_link_sta_rhash_delete(ab, temp_arsta);
> -
> -	ret = ath12k_link_sta_rhash_add(ab, arsta);
> -	spin_unlock_bh(&ab->base_lock);
> +	spin_lock_bh(&ar->data_lock);
> +	ret = ath12k_link_sta_hlist_add(ar, arsta);
> +	spin_unlock_bh(&ar->data_lock);
>  	if (ret) {
> -		ath12k_warn(ab, "Failed to add arsta: %pM to hash table, ret: %d",
> +		ath12k_warn(ab, "failed to add %pM to hash table %d\n",

it is warning, so you can have colons before error code:

"failed to add %pM to hash table: %d\n"


with that fixed:

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

