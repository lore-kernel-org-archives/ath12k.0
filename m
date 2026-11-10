Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B286606A31C
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 06:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R9ICpO+f;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Byzn4mLE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kxJWXKQD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=icOQpI59W6lW9kuuF+gh7Ra66qKmbDpQonDWFC3Z2co=; b=R9ICpO+fSdOgVV
	M1trnIwiMuZ4IDQno6L28QfNYsBFpo++T2tydLADOdXipyiclrfD+PJMT8CwRcwPiSWXP6JngdD0G
	k6YtFuXaVynbJBs3m5D0OQjSI7DXjBgjOEzB8L2EBJv2BWrHFMmYXThF9Qx42EtEWrx6pz1a8L5LE
	oYKx5zOkUu8WftlGygUObBsmej/xJk3EL3o1LQmywxAmK3/bFFCn55Na94aQtpCg99hl7MUDwgFJ5
	ZVQXE4KWtHKMqNLsw3JytpCPeeUEjy4q+9r1M/PqAMwD7QgHK7wUp8S7+G8XFUrSGzILTx8kp79dw
	AjeZZZM/dagleCxhge0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQf0t-00000002bmn-2bDn;
	Tue, 10 Nov 2026 06:07:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQf0q-00000002bm5-3xR2
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 06:07:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA550wB2414671
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	icOQpI59W6lW9kuuF+gh7Ra66qKmbDpQonDWFC3Z2co=; b=Byzn4mLEeFSXArMs
	hLgZZoqC2FXYp30l59k+Q5VCgPTXlpNYiJOucDVTX+qWFq3R9QWHCFHo+t4DSfSy
	lzyNwAt4KrmYaPhwZ9wIrWBirOz8UQMCaRXs5krKIE9d+6iXgKv6hnEpQCUbUnM8
	79zwy/XlDh7CogQfEGXpevL0h58oFDErw08gYepWAi+rl4R3Xmk4B/1jCmlbi/Vh
	fwVgH2bF2a0UIJJi7I3oeV+A6u0k2RzfHvummpIsQ8OHC1bP2sR52uQO4GwhOfKH
	CIMj8cnzSERLVbuTb4DNeSnTU1g9ljFyncpqRjUqVGrpSpxhAM9TfvRfay6aIrLS
	oeBHCA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtd884s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:07:19 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1af203073e0so2227512c88.1
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 22:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794290838; x=1794895638; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=icOQpI59W6lW9kuuF+gh7Ra66qKmbDpQonDWFC3Z2co=;
        b=kxJWXKQDZMnbwdGK77lZGIz5zMJCT8AJcqW/wvx9wSDKM9Mc647lxBg8uyRm+acwRB
         seZQDEO+gePhwejnzxdyUIe7IEfSBCcE18lNrtze3xHNWVqNUcKH/9FLcv/1uSPba44N
         YWFqpXpyuMPBAVtw41+2DEGyFDLqviaQTRN0Vt5CpHcOWWxpWraswhnw94TJWWsj58sD
         ZuG03YjxgF0yC6yOx4pTGlWVcvwB3je1i3LOHnwF2AHQFmLcELCSmHY0Ev8z7DCMmqsv
         8cwhJUNqr6hzAQ+c2yL0ZtodStqOIcFRYcRLL8Fig+Ld38o+belxAKWNrbqiOFqIFovv
         FewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794290838; x=1794895638;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icOQpI59W6lW9kuuF+gh7Ra66qKmbDpQonDWFC3Z2co=;
        b=SgvBFYBkkTbFwFi8YV1o6SvQwik0utfG7USZCudjSouWOyjqo9x+GKePQ5jSB3PMzu
         me7YsB6L4/+lOxaUMu05o1RZ43Z2/Y9jUJTM9/29hhhhSlWXtc0D9alUbbIYJWMJxaxZ
         cgsRHZ30SKrii+clSNN7VrcU7X0Y2a17mHkVZTozTHmI7zBXOoSYYyDTaJ9Q0ydgzB7Z
         z0o3zudBq6nPdOeBRWPQGQPr3sO1rAv2ObSsIqUwmhDWwqrjHwNDVYI9Q26zV0emKpOp
         Z5CGAf1U1e/wyjt5kjOdFB/sS2gXxAVnSi64w+PkF9qjwJr8Vo/56UUkdTqaFy3dBD7F
         BoJg==
X-Forwarded-Encrypted: i=1; AL+hErHU8/Tiq+jtZp5sh1ni/zXzMkO2XI/VD25dDfJjWzOJEFmFQ+0fjX4x2Sq9NKv2XLCoXON8uPY=@lists.infradead.org
X-Gm-Message-State: APuU4Z9j6SeoF4cfNCEFUepZpWEIvNvdoc1G3jC9SZEh0iFv51ccXx/V
	1BEWy+VkdVyrNbU4EwyMOAIXCTRD3NCD1hghtl9Qmts3NkwIutg7L1I3GRxalQYgpOm8l6bJZyR
	i9PO4Dc4KDdx+H4CVLGkKUC41PQ9lo4dH/owc3MZy6kMzrg1Nno1pCPL7XYggmlkxe/FZqm7U
X-Gm-Gg: AYBFou2EIDhxxg/TrUXwMObQFLl7B4r8ykqw6KH2TGYY9My0bmjQXc5LOvLB3CGYoJz
	ZKJZIhZ/oyv7eW+spB6xq7U/7l5eWgylTEQUrCe7pTC1MtmRPnFl3uLavXQ5PEyqjVVD8u8Tz2i
	iZKPnyFdnqNP+9EMf1TeXiRIteGPTpMlffWBVH4HiRblBAXolpbAl6MSIWdye+6pR9RRoKDUZbw
	E+0FXJf5q6tOwQV9f/j90712n7tfduA1SEeI+InxZJHFm171FT0h2xefGMFdKCB1EpJjzt9OmZF
	3UIuGb3fmZwuFhkQL0MBhFL7HirXg/gKZM2Trsn8nBKUvJa+TZcq2ly2iDH8J/Ioj8yYdA8MF78
	1JGfLCWBkcQd9BOOkaYh2hKUh4OUuLxj+CldbPcWdNVZVE/tU+MJLjlZzzgTFRI4GuEmaxroZz5
	nDCTvhuF/8McXFeA==
X-Received: by 2002:a05:7022:6983:b0:143:3c9f:10a6 with SMTP id a92af1059eb24-1b3b5fa7a24mr3201714c88.4.1794290837898;
        Mon, 09 Nov 2026 22:07:17 -0800 (PST)
X-Received: by 2002:a05:7022:6983:b0:143:3c9f:10a6 with SMTP id a92af1059eb24-1b3b5fa7a24mr3201655c88.4.1794290836898;
        Mon, 09 Nov 2026 22:07:16 -0800 (PST)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5ba8426sm3857758c88.23.2026.11.09.22.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 22:07:16 -0800 (PST)
Message-ID: <1107c457-74ab-48b6-b45b-afe4a868a55d@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:37:11 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 11/11] wifi: ath12k: use link_id_map to
 resolve RX link id for all devices
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
 <20261102-ath12k-logical-link-id-v4-11-f4c7807c299b@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261102-ath12k-logical-link-id-v4-11-f4c7807c299b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U5QWRNocxRzQjuLqSoEWoxkP_5wTxkQ7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNCBTYWx0ZWRfXwDSr9BjPwAks
 7jrOommihkyHh4Ur9mYIMEl7lExGyr8SbOHi4ONJJXrFoogC/NMvzZFwz4FU6Y7B1YNmlbshIAH
 QsGSClxsNVjTAsWyEk0gCSxuQk7u6Aw=
X-Proofpoint-ORIG-GUID: U5QWRNocxRzQjuLqSoEWoxkP_5wTxkQ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNCBTYWx0ZWRfX3bxofzApwzaY
 hZowpbemonDTa9mACiFQwtzmgeoFqVhEEvX/bxit5YFOtY0cub67K9x74ebFctaDi1Gc15DXcRg
 Cxt/U1f7fn84AqlgIQYqM3BtrwK27CjrxrxF43ARj2nbqIUBT2NSpXANUkKtOA8Swf+Iboumr+X
 A36erT5K7dwrmFTcTpyuhk+vIa19ElvhjEcPyvcj626xYcaWrkgeIbNMkFerEUrvi+O91ZBiKPq
 +ocsQG4ow/MxXkcdy1eOiLXAKDIxp1kjh3tSo+sDDoqbDYmsKEj1O1Tg0D7eLUT+P9Ypat2lWaC
 ETQFyq1/0ProNhM6KABnOGVB7DtpcsuJwS241yctLpdWBxwtQfZwxcHAfvq9O+nhpUo2FYLpWaj
 TCAjmSohM9ZfFXwAOvKGi/bFgf9n8A12FPSEcWplaWNevRygR+VxJtYrZQNT0P9XMwHrfRKFQjA
 1JuoP0C9q17rSGdsL0Q==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af2b497 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6uJRTybd-CgNM_aqSxsA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_220721_112158_B7F84E6A 
X-CRM114-Status: GOOD (  24.89  )
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

On 11/2/2026 12:08 PM, Baochen Qiang wrote:
> Commit a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX throughput on
> WCN7850") added a set_rx_link_id() op so that each device could resolve
> the RX link id in its own way: QCN9274/IPQ5332 index
> dp_peer->link_id_map[] with the hw_link_id, while WCN7850/QCC2072 walk
> dp_peer->link_peers[] and match by peer_id, tracked with a link_peers_map
> bitmap.
> 
> Now that ath12k_skb_rxcb::drv_link_id carries the driver link id for all
> devices (the hw_link_id on QCN9274/IPQ5332 and the logical link id on
> WCN7850/QCC2072) and ath12k_dp_peer::link_id_map maps it to the IEEE80211
> link id, the RX path can resolve the link id uniformly.
> 
> Revert the set_rx_link_id() machinery and the link_peers_map bitmap, and
> derive the link id directly from link_id_map[drv_link_id] in
> ath12k_dp_rx_deliver_msdu() for all devices. The NULL dp_peer guard added
> to ath12k_mac_peer_cleanup_all() is kept as it is an independent fix.
> 

Fixes: a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX throughput on 
WCN7850") ??

> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1
> 
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/dp_peer.c     |  4 ----
>   drivers/net/wireless/ath/ath12k/dp_peer.h     |  1 -
>   drivers/net/wireless/ath/ath12k/dp_rx.c       |  8 ++-----
>   drivers/net/wireless/ath/ath12k/hw.h          | 18 ----------------
>   drivers/net/wireless/ath/ath12k/mac.c         |  2 --
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 30 ---------------------------
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |  6 ------
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c    |  3 ---
>   8 files changed, 2 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
> index ee3cdd7ca460..ff88c694e1e3 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_peer.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
> @@ -658,8 +658,6 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
>   	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
>   
>   	rcu_assign_pointer(dp_peer->link_peers[peer->link_id], peer);
> -	WRITE_ONCE(dp_peer->link_peers_map,
> -		   READ_ONCE(dp_peer->link_peers_map) | BIT(peer->link_id));
>   
>   	rcu_assign_pointer(dp_hw->dp_peers[peerid_index], dp_peer);
>   
> @@ -728,8 +726,6 @@ void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_
>   	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
>   
>   	rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
> -	WRITE_ONCE(dp_peer->link_peers_map,
> -		   READ_ONCE(dp_peer->link_peers_map) & ~BIT(peer->link_id));
>   
>   	rcu_assign_pointer(dp_hw->dp_peers[peerid_index], NULL);
>   
> diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
> index c2d060de88ea..2ac4c6c6d535 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_peer.h
> +++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
> @@ -159,7 +159,6 @@ struct ath12k_dp_peer {
>   
>   	/* Info used in MMIC verification of * RX fragments */
>   	struct ieee80211_key_conf *keys[WMI_MAX_KEY_INDEX + 1];
> -	unsigned long link_peers_map;
>   	struct ath12k_dp_link_peer __rcu *link_peers[ATH12K_NUM_MAX_LINKS];
>   	struct ath12k_reoq_buf reoq_bufs[IEEE80211_NUM_TIDS + 1];
>   	struct ath12k_dp_rx_tid rx_tid[IEEE80211_NUM_TIDS + 1];
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index f11810c6e0d4..52838ade1b1d 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -1370,13 +1370,9 @@ void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struc
>   
>   	if (pubsta) {
>   		if (pubsta->valid_links) {
> -			int link_id =
> -				ath12k_hw_get_rx_link_id(dp->hw_params, peer,
> -							 rxcb, status);
> +			int link_id = peer->link_id_map[rxcb->drv_link_id];
>   
> -			if (link_id >= 0)
> -				link_pubsta =
> -					rcu_dereference(pubsta->link[link_id]);
> +			link_pubsta = rcu_dereference(pubsta->link[link_id]);
>   		} else {
>   			link_pubsta = &pubsta->deflink;
>   		}
> diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
> index 106d858efc44..3a7d1959f19f 100644
> --- a/drivers/net/wireless/ath/ath12k/hw.h
> +++ b/drivers/net/wireless/ath/ath12k/hw.h
> @@ -13,10 +13,6 @@
>   #include "wmi.h"
>   #include "hal.h"
>   
> -struct ath12k_dp_peer;
> -struct ath12k_skb_rxcb;
> -struct ieee80211_rx_status;
> -
>   /* Target configuration defines */
>   
>   /* Num VDEVS per radio */
> @@ -255,9 +251,6 @@ struct ath12k_hw_ops {
>   	bool (*dp_srng_is_tx_comp_ring)(int ring_num);
>   	bool (*is_frame_link_agnostic)(struct ath12k_link_vif *arvif,
>   				       struct ieee80211_mgmt *mgmt);
> -	int (*get_rx_link_id)(struct ath12k_dp_peer *dp_peer,
> -			      struct ath12k_skb_rxcb *rxcb,
> -			      struct ieee80211_rx_status *status);
>   };
>   
>   static inline
> @@ -288,17 +281,6 @@ static inline int ath12k_hw_mac_id_to_srng_id(const struct ath12k_hw_params *hw,
>   	return 0;
>   }
>   
> -static inline int ath12k_hw_get_rx_link_id(const struct ath12k_hw_params *hw,
> -					   struct ath12k_dp_peer *dp_peer,
> -					   struct ath12k_skb_rxcb *rxcb,
> -					   struct ieee80211_rx_status *status)
> -{
> -	if (hw->hw_ops->get_rx_link_id)
> -		return hw->hw_ops->get_rx_link_id(dp_peer, rxcb, status);
> -
> -	return -1;
> -}
> -
>   struct ath12k_fw_ie {
>   	__le32 id;
>   	__le32 len;
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 01c048046290..4ac31cb9a5dc 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -1241,8 +1241,6 @@ void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
>   		if (dp_peer) {
>   			peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
>   			rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
> -			WRITE_ONCE(dp_peer->link_peers_map,
> -				   READ_ONCE(dp_peer->link_peers_map) & ~BIT(peer->link_id));
>   			rcu_assign_pointer(dp_hw->dp_peers[peerid_index], NULL);
>   		}
>   		spin_unlock_bh(&dp_hw->peer_lock);
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> index 4132578085cc..473887ed4bb1 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> @@ -2374,33 +2374,3 @@ ath12k_wifi7_dp_rxdesc_mpdu_valid(struct ath12k_base *ab,
>   
>   	return tlv_tag == HAL_RX_MPDU_START;
>   }
> -
> -int
> -ath12k_wifi7_dp_rx_get_link_id_qcn9274(struct ath12k_dp_peer *dp_peer,
> -				       struct ath12k_skb_rxcb *rxcb,
> -				       struct ieee80211_rx_status *status)
> -{
> -	return dp_peer->link_id_map[rxcb->drv_link_id];
> -}
> -
> -int
> -ath12k_wifi7_dp_rx_get_link_id_wcn7850(struct ath12k_dp_peer *dp_peer,
> -				       struct ath12k_skb_rxcb *rxcb,
> -				       struct ieee80211_rx_status *status)
> -{
> -	struct ath12k_dp_link_peer *link_peer;
> -	unsigned long links_map;
> -	int i;
> -
> -	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> -			 "ath12k set rx link id called without rcu lock");
> -
> -	links_map = READ_ONCE(dp_peer->link_peers_map);
> -	for_each_set_bit(i, &links_map, ATH12K_NUM_MAX_LINKS) {
> -		link_peer = rcu_dereference(dp_peer->link_peers[i]);
> -		if (link_peer && link_peer->peer_id == rxcb->peer_id)
> -			return link_peer->link_id;
> -	}
> -
> -	return -1;
> -}
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
> index 8a16fb3dd005..3da80da19ced 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
> @@ -59,10 +59,4 @@ ath12k_wifi7_dp_rxdesc_mpdu_valid(struct ath12k_base *ab,
>   				  struct hal_rx_desc *rx_desc);
>   int ath12k_wifi7_dp_rx_tid_delete_handler(struct ath12k_base *ab,
>   					  struct ath12k_dp_rx_tid_rxq *rx_tid);
> -int ath12k_wifi7_dp_rx_get_link_id_qcn9274(struct ath12k_dp_peer *dp_peer,
> -					   struct ath12k_skb_rxcb *rxcb,
> -					   struct ieee80211_rx_status *status);
> -int ath12k_wifi7_dp_rx_get_link_id_wcn7850(struct ath12k_dp_peer *dp_peer,
> -					   struct ath12k_skb_rxcb *rxcb,
> -					   struct ieee80211_rx_status *status);
>   #endif
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index b073282e5525..080ead233106 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -159,7 +159,6 @@ static const struct ath12k_hw_ops qcn9274_ops = {
>   	.get_ring_selector = ath12k_wifi7_hw_get_ring_selector_qcn9274,
>   	.dp_srng_is_tx_comp_ring = ath12k_wifi7_dp_srng_is_comp_ring_qcn9274,
>   	.is_frame_link_agnostic = ath12k_wifi7_is_frame_link_agnostic_qcn9274,
> -	.get_rx_link_id = ath12k_wifi7_dp_rx_get_link_id_qcn9274,
>   };
>   
>   static const struct ath12k_hw_ops wcn7850_ops = {
> @@ -170,7 +169,6 @@ static const struct ath12k_hw_ops wcn7850_ops = {
>   	.get_ring_selector = ath12k_wifi7_hw_get_ring_selector_wcn7850,
>   	.dp_srng_is_tx_comp_ring = ath12k_wifi7_dp_srng_is_comp_ring_wcn7850,
>   	.is_frame_link_agnostic = ath12k_wifi7_is_frame_link_agnostic_wcn7850,
> -	.get_rx_link_id = ath12k_wifi7_dp_rx_get_link_id_wcn7850,
>   };
>   
>   static const struct ath12k_hw_ops qcc2072_ops = {
> @@ -181,7 +179,6 @@ static const struct ath12k_hw_ops qcc2072_ops = {
>   	.get_ring_selector = ath12k_wifi7_hw_get_ring_selector_wcn7850,
>   	.dp_srng_is_tx_comp_ring = ath12k_wifi7_dp_srng_is_comp_ring_wcn7850,
>   	.is_frame_link_agnostic = ath12k_wifi7_is_frame_link_agnostic_wcn7850,
> -	.get_rx_link_id = ath12k_wifi7_dp_rx_get_link_id_wcn7850,
>   };
>   
>   #define ATH12K_TX_RING_MASK_0 0x1
> 


-- 
Ramesh

