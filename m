Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6319FC43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 15:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVreIN8s8Hko6TB5LKHs8S1vs70TRbe2jG8ifee4bvw=; b=Q47eGJgh4ynX55gMh+zoRhYdfy
	PpIxxV0JI8jg6j20MPDGSNRzMgpA7i0foAD6AUl4OCUxQ/baAnj8c49x9c45hjFny74KPh4JThJma
	GpKV6i30LoMTx/RklH58YMQ+E1iHeyS0OthRLH7Pq+VsFgwOaEhtEG0tmM/ORzXy20B3oOs5ex2jx
	rNtbOKSqrQgVx35bBb/t1I6qIhGFjmrgcy3z179ekgPP4qARotlwx7g0r5sL2S1SQq+L6VycD+eTV
	1h2XTnIXQNLBVvIFTVeiGRRh/tYIagPlqgc4xmKLlNPNt1xM9COAFxEPPtQiqqRg0JK06V8MNXWAm
	t2w9lrbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wear2-0000000HQUz-3JnG;
	Tue, 30 Jun 2026 15:58:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wear0-0000000HQUT-1vHO
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 15:58:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDIZb2209773
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 15:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uVreIN8s8Hko6TB5LKHs8S1vs70TRbe2jG8ifee4bvw=; b=OqjIVEfmKJXrzu+e
	sX0jFIkvQUBbLpA0YhS/4UmNcyXiPWzB6Q4Mv+JfqlVRSOdu3+LMFhqm2Jm+vCy2
	fluXQFqNokpVQuKThS6xBuw5VxaYudidpDSOW2oinEWoHGhDn1Nd8TVVu/E4MMgQ
	2yDMWjLOks6cBKRlXBzbE2VUeBy5/qBdT3uYvO63WEtyYRQOl+PmsFzgnQi2B50F
	jhIXonl+KpxZ89q5drCro00dDpuIxuVC7QtzJ+pYBr7dAvg9I9y6Kr8dEJNDxMLx
	B2dw9ikcl3ExrElly75xjVo9JbqN3jpo3exKXZBLhzgBpQn6A6IcRbhD1UI4a0gR
	LUqWpQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avpsrxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 15:58:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30ca81e05bfso4846338eec.1
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 08:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782835108; x=1783439908; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uVreIN8s8Hko6TB5LKHs8S1vs70TRbe2jG8ifee4bvw=;
        b=eSjFwFgXHKDRyODanzlEAHmKQAv8PcumHVWAkOIYCfINXTm3kyZxdhI3Y37o2j7Eha
         TvbbHPN4SLat7d2vXWs8JeLieF/JMuK3Qmq0eTOy5VSZmalEdfuIP58Sgvi5XOCxqT5+
         BMChHNseUAr60LQOdqgloxkbwTQ6rwyWzr8LwXqtyC2vS8cyBvk5BZCyqEq/38+8YTHa
         cKSxGoB68Et1RFdBfYxfQtvaUTUTmq1pksQlzyXWesiR6y2P6+EtQH1LT4Mgyp290Yc/
         kFweOJv0nripysk9mWWZPjJ9bJOwTdXh89PPyozodTFOYdHCKCAkXfow0ELhcwSBjBUS
         F+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782835108; x=1783439908;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVreIN8s8Hko6TB5LKHs8S1vs70TRbe2jG8ifee4bvw=;
        b=l2kVUGnhatxaDyg1BxL3I5ioMVg70D2KqK10/dioOp1yL/DDLResX4blQZMU6dmOtF
         KVKxRE63XuExrYmvoKnYFNEjB8UT98nNRQYFK/DwMgXWa8CikyDiN6RkfbbxUBGmBavN
         Zr77YtlG6u36wnfzjPAGUWnXHwB5CHs8U1ue3g8H2n3X3HXrV2gtfUGma5GtXCYLR0gv
         9yQJDCb6MmK59Ues8cu1yk3Kzuc0vTuezu1/nu6Gvd003kKxNXTDCS8SfE+TVu4ViwNr
         9yQZmnflUEIx84X8Ag1J+rqAE/lTDaxhf09Lfy9vQmjMCQe+QbVc0DwqXR0ORglfcJya
         IULg==
X-Forwarded-Encrypted: i=1; AHgh+RobbSs3GaddzY0w0HenmWM4NeyhSNQJkVrr6piW5iT8aLgsS9TNeqn5w1E/mN7SdHAsI7mdqvM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHxRijakMp4lpIeghdeRf3C9/5+dET/UQ2na8AXjzOw+pBW0iy
	z07inRKNtU+0VlzAd8jRFJzbwdKI2+INBWaEgw6r7lFGzmmRrwZ5YsgdXVvETC18IJtd1Uiab3y
	nvyic3D7gpEgiNZAyJTWyzHsKUr+Q1dKjgupGCmq9IBqOdokZbzWdVMGsaJuVlQugN1g3fwpK
X-Gm-Gg: AfdE7cmx9AjT/dZ8XW2zYAOrEB71Ja7KyHqtvFgf4XSqv96J3tZbK4Fc+lZL0ILQT1v
	+7jGtMvai2jv6xC4SKy14jbtFZf3DIVGloffBN7yfCnFEkzQuCwZUzgnRQbYjeSgKLZmKHd6Fy2
	cKlB8hai/alXmyhr/FOkxBxc5VQFtN6kz6UN1teKqT0dk1nPxJ0kk6F5XWnbhZUyxRrNmBYuCvf
	VKJe6q0j1RCyrdHyF9tZSEHJczsDWLsbSyqZBNEdRIZEZY1SO1W1GYSq8XB1UPdHD4fOzWMyA1v
	vZ5wbF9T7Ovca3VfowBjZAHMdoVdUiJR+JaGfoXiViXB+pI8XudpMQOcAr4U9pBA9CXv95XF5zd
	MrgRiRIxqbGEMUtAbvzggWg6YWQF4WCQqLOaCh8K4KdQH2T50o/+ropSdTBo7YWuN446j6iQ=
X-Received: by 2002:a05:7300:e788:b0:30e:ea2d:7cf7 with SMTP id 5a478bee46e88-30ef095e2d8mr698926eec.30.1782835107763;
        Tue, 30 Jun 2026 08:58:27 -0700 (PDT)
X-Received: by 2002:a05:7300:e788:b0:30e:ea2d:7cf7 with SMTP id 5a478bee46e88-30ef095e2d8mr698901eec.30.1782835107182;
        Tue, 30 Jun 2026 08:58:27 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2cd21bcsm18512447eec.0.2026.06.30.08.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:58:25 -0700 (PDT)
Message-ID: <44a8f00e-5178-431a-9513-c60b7bbdd936@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 08:58:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Guard dp_peer dereference in
 ath12k_mac_peer_cleanup_all()
To: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>,
        ath12k@lists.infradead.org
References: <20260625073517.766582-1-hbijlani@qti.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260625073517.766582-1-hbijlani@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vNDIG8A8iFfWluZR9u957PwQDKt5fKm_
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a43e7a4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YoqGRNaBgx1oBrP2v9QA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE1MSBTYWx0ZWRfXw/FcO/rYUgYD
 DjO9Ku4Lj0j7HZEKfncauYyF+KLyGcrLJDE4xUqL8F16zy3o6rhYK0VZQHDTuAKankUINE/PWbG
 p5/C//LmVtQESt7xhMJkyY0/FZB4ZIbj2C0+/IZU0sNC3nfoU5Gf/4ULVcyR7cXXyiDVyTWMUi+
 W4wW/1ZlGkmh6wW1b6M0OZh3KrY68uPMcB8YbG3Dogmn/pLfBelyMFScllGVKqOen3z1H8n2gin
 DILGYNsujJeUmNM5cPxy0Ro14u8jsC+YiU1PIGJkYvHB0Ig73/fzM+2wt0XYqeNJb/lF5l4zN4i
 XQtDd1UkoMISzu0RD+CQjF/cDacBLDbJXCL4RSlzu+sBzd2n7O7otdRtL1w5rtCrEpArpOYprek
 Bc1zM+TcsJ1MHEGNpFTdr8mYu9Eb1rDlYCca4Z3y3GccLwIxPOeRmFy1x1UUEPi9/OdtdiApnKM
 iEHvuYcV9iWH/qezzyA==
X-Proofpoint-ORIG-GUID: vNDIG8A8iFfWluZR9u957PwQDKt5fKm_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE1MSBTYWx0ZWRfXwWaT2qGDsiVN
 SrCUgdim77fkbWQdLx08FkulJ3UwxJTeZMX55haKDAimZHtNyIIqHmxACAeyRimP1154kZp1kSr
 24JtWdBpGA/wDypqTfkbtbZL0NoCfoU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_085830_641715_8C5550FA 
X-CRM114-Status: GOOD (  26.23  )
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

On 6/25/2026 12:35 AM, Harsh Kumar Bijlani wrote:
> From: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
> 
> In ath12k_mac_peer_cleanup_all(), the code iterates over all
> ath12k_dp_link_peer entries in the dp->peers list and performs
> datapath peer cleanup. For each peer, it accesses peer->dp_peer
> to clear the link_peers[] and dp_peers[] RCU pointers.
> 
> However, peer->dp_peer can legitimately be NULL. The
> ath12k_dp_link_peer structure is allocated and added to dp->peers
> during peer creation (ath12k_peer_create()), but the dp_peer
> assignment happens later via ath12k_dp_link_peer_assign(), which
> is called only when a valid dp_peer is found or created. If the
> peer creation sequence is interrupted, for example, due to a
> firmware crash, a race during interface teardown, or a failure
> in the HTT peer-map event processing, then a link peer entry can
> exist in dp->peers with dp_peer still NULL.
> 
> Accessing peer->dp_peer without a NULL check in this path leads
> to a NULL pointer dereference kernel crash during the mac cleanup
> path, which is invoked on radio stop or firmware recovery.
> 
> This is consistent with how the rest of the driver handles this
> field: ath12k_dp_link_peer_unassign(), ath12k_dp_peer_cleanup(),
> and several other paths all guard access to peer->dp_peer with
> an explicit NULL check before dereferencing it.
> 
> Fix this by wrapping the dp_peer dereference block inside a
> NULL check, mirroring the pattern already used in the same
> function for the Rx TID cleanup:
> 
>     if (peer->sta && peer->dp_peer)
>         ath12k_dp_rx_peer_tid_cleanup(ar, peer);
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Signed-off-by: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index af354bef5c0d..caf274ee064e 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -1237,10 +1237,12 @@ void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
>  
>  		/* cleanup dp peer */
>  		spin_lock_bh(&dp_hw->peer_lock);
> -		dp_peer = peer->dp_peer;
> -		peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
> -		rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
> -		rcu_assign_pointer(dp_hw->dp_peers[peerid_index], NULL);
> +		if (peer->dp_peer) {
> +			dp_peer = peer->dp_peer;
> +			peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
> +			rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
> +			rcu_assign_pointer(dp_hw->dp_peers[peerid_index], NULL);
> +		}
>  		spin_unlock_bh(&dp_hw->peer_lock);
>  
>  		ath12k_dp_link_peer_rhash_delete(dp, peer);
> 
> base-commit: 972c4dd19cb92e03d75b66c426cfade07582a1ba

FYI this was not submitted properly since you did not use 'b4' or the
get_maintainer.pl script to properly address all necessary recipients.
In particular this is not being tracked in patchwork since the linux-wireless
list was not specified.

Please send a REPOST with all necessary recipients specified.

/jeff

