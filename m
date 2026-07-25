Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CEAC531D0
	for <ath12k@archiver.kernel.org>; Sat, 25 Jul 2026 19:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GosdS2/QopcTcvN0gpgPMl5jmSClH1CzdjJ+of2R4Bc=; b=2I2l0UqLDvU0+qrOBEx0A48Oc/
	3qrX4qKW15Qqd5D9EGFv7UZYCEEcYBD8vPiL54fGQIZphVfrrUxF/fb8b2QxDlJbsi/ZFYsWrnvi5
	AtCkEcL07ZTjMAiM5ouvpDSeLYtSf3hz9s+0Fb6XKL9b9WZt2F3x4+U+w1zGjPyi1cj19Yvti5T9M
	88bGPOFtuI2LeK1jcte9/uUbDJRnfHJnuMgFZyRIewrQz1D70P/X40tJZrzKblvL6USytYmiUB3ZM
	+QPwOAraJf1xlut+BFAI87JDI2yNb/yHRzJy4dycs3aGCDr+aT3icq/OQti7yxEyJ+CXd8iwtVFzy
	vqZIA9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wniCu-00000000g9L-1PFs;
	Sat, 25 Jul 2026 19:38:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wniCq-00000000g8x-3WjO
	for ath12k@lists.infradead.org;
	Sat, 25 Jul 2026 19:38:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66PGvZOD3604202
	for <ath12k@lists.infradead.org>; Sat, 25 Jul 2026 19:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GosdS2/QopcTcvN0gpgPMl5jmSClH1CzdjJ+of2R4Bc=; b=RPZBs2RTkxoALmd6
	j6Au4oZIDfSe1Kc8KnZSF+AqjrJZf61osyFXI2QECyHTYK/7C9C9jdwd07ptyL1k
	fzOP7i9YNsO5LM5+PdpaJHRpIBGJbquyva+7syK5JKLjIR3caMpDbbEnGMQsaJfd
	DwUP9fSAqVHQhuNFpe9a6imF5YF7xYfcQG8HqN4vb7Ew+ZrtJNO/qWntubZVmb4Y
	MSndJxEuiHZ3qxYhi4wa6SVks8zsCcusr6Xn944kgFxKKw2WLVHI9zsG4Dpz+wca
	erFg0jpAn6FedSVmpF1bxu9OhGntBUxmFB+34OSpWW+rAIfvUPA3yGqJLnRNFy42
	ZhQzSQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjufst31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 25 Jul 2026 19:38:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbbb9c9bfc3so320302a12.1
        for <ath12k@lists.infradead.org>; Sat, 25 Jul 2026 12:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785008322; x=1785613122; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GosdS2/QopcTcvN0gpgPMl5jmSClH1CzdjJ+of2R4Bc=;
        b=EM2D6dAnjHKeb32IdrzKbPwb2dhEmSKqqV3gco0HzhBXSH+Jc59S1c1t17pN1ZHFAq
         Odrlbz3w4I4iYoxfdlMS5TnLK7g1h68gP965z3ecK9vjL6tGiid92cBYHjE7ln5GC1OT
         xwTS9UWDOjlc1JhuubBKshF1rp7oTtOw8GzVkEdqjRt1KkciP+KN30SSmhC2ILcCsoM8
         Rr0oUDNcPkIX47Xo3MqFiKZ4T/pK8T170f94TNMDuZ24BhyEOfGfsfYSgO51c0+K0rez
         xBSSQuue0PDH7qw6gvE4HX2n3N+KlTv/eATXKz98NTbEMcxjsPsdIMX+y9FoX2xRl+mK
         Mh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785008322; x=1785613122;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GosdS2/QopcTcvN0gpgPMl5jmSClH1CzdjJ+of2R4Bc=;
        b=aNHyEhRCF+WgPfUHUvWdz0hjdXsIl3LkacJwOOUfq/kSs222yUGnlN/ZOx1PcA/1RJ
         +IDGV7WpmSOJpeT+zlnp/502X98KvWmX+pEBPua8DOK+PirtYgz1EsNmVq84DGknQUDX
         qvht9hNdXFXm3nJeX9e0rq4BV9o1shGoc+VchCIdJMToXdmYZwxIR5EmlMhEeQv/x0zn
         BnqzFHS/mg7r8QKYTeBwWgD0yvn5V61h18LYW+YAdO4phi1OkWd5RqldI4/8dHBa3HA2
         S/flgzsGqJZiKcIl8ODlD+szItR4NxQSPh6CX36BNQOa7kAawnS3coUrcYUTGbDgZgsj
         BSWw==
X-Forwarded-Encrypted: i=1; AHgh+RoRAKYsATU0/jqXGB31TwSD5Pz+5CTPEGv/9r1WdkTwfR421LihlXr5rf5B5n/E+26/wvTLnik=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcC6FiXc8+dU7Kbvub6QEubUvhQHORS8GALl3IDMpNgTaA5j0V
	6zW7h25O/+l3vrC+9drW2D1Xaaqn5MWf9H4DXMF/4xfpiNZiutxqqZM167Yb/sPWydbWqr0DUYL
	sb+Zdp5OBlKZIpr/GjKsBneZCD2TW/3ghRHBnW5ELV3ES47cN+0LXxVv0+NZ1G+n9qM48jPFQ
X-Gm-Gg: AR+sD11wp+xHPImIrGgLgdGsnm/K/f6SeZ4vcLhzPQbCQDa1VC6JO8MG3qKBDA597j7
	2bVMNIHhWoTN4TiXlxiyX1kCq+8uzKRuzEzIczJRdhLJi10olsxmm43gijgw5Dh176xwFTerBxU
	ZVIQhwBlY5ceOyHIkNnm07pzHMzlh+isWSmoIDtfTGaHgL8LiY4AJ0iUCVNxBF6HNqgvAR+JgPE
	cYIb0/Bq9Nh0kbetBy1/DcSCNn6L8IoxQ9PxdbpK9RQFjPQzJjdvqNdm/2UHCMNDVrMV7tqv/un
	fp/eRkHlgMuzrCXyQIFYGKsTLlVEC7SLeAqkD4+FGuNOjHXDdsAM0DEZCd0GoL2drKYqdFZ8GL5
	Yyk50UyyWIatNUxaJickmfwWZJXovoOLKVeBM+le7AprQ1ZAOC839vm+bzw==
X-Received: by 2002:a05:6a21:a43:b0:3c3:6af4:a658 with SMTP id adf61e73a8af0-3c67dfa3ea2mr2664600637.50.1785008322577;
        Sat, 25 Jul 2026 12:38:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:a43:b0:3c3:6af4:a658 with SMTP id adf61e73a8af0-3c67dfa3ea2mr2664591637.50.1785008322120;
        Sat, 25 Jul 2026 12:38:42 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc549cacsm13537457eec.16.2026.07.25.12.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2026 12:38:41 -0700 (PDT)
Message-ID: <3d793ba2-09f1-44e4-95c4-1ad877db7b4d@oss.qualcomm.com>
Date: Sat, 25 Jul 2026 12:38:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Guard dp_peer dereference in
 ath12k_mac_peer_cleanup_all()
To: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260722095828.2930377-1-hbijlani@qti.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260722095828.2930377-1-hbijlani@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: csWcVu72e_YxE_F6RodK2x1RqhBs2qIa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDE4NyBTYWx0ZWRfX5/Qg0T2aptDZ
 Qus1b6GdRI5RJY+InWk+p9wnw1oH23/QCwlobEAZH0Wo3wyYL3V+zMCijpB7sMkvbWTt0qlr5VH
 GJXxa3GoH6d/Z6+xosR/lz/GtVi2LfQ=
X-Proofpoint-GUID: csWcVu72e_YxE_F6RodK2x1RqhBs2qIa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDE4NyBTYWx0ZWRfX0d9OUxF0Fwxf
 5i7SHhg1wlx/M86nQR29KAbhl37Oe56N8+gC3yn1G/3RhaztnLqcmFnEiuhQBP9a+kLiNkcLNlk
 6GYq6MlBfMFjyZArl7mGoosulr0/zEkF65jiBj6eOHOnwbWwZU2IeTaoHapnm1EwsaWg9VIyTI0
 GgOd+PJPGyFYYAjTCEDJgcmEtWYL+wROveFqpGYE5GaFfLAiYErhRxoYMA1DGn9yHNAU2FtVbfb
 1WIGmKpmbtjZ+UZxSXda+Gwtak8yxSiyKKzp1Me8v+Xt0llxtWkXKSUeqMfHvEL4cldZiLZX11G
 PIM17kRtucKs6r0k9K9dCZ0uz15dWxlS+Gary94fv3NQxXoo1o0hXt8T9y3zlLCTJNtWf7pV2iH
 7Vv+1RDDB+4TuCpHlwxL5HQNVNrrqroo277lmYeVabcLJx7TpK4hyBIvdYZJt9vjmEo4WzINWol
 eErL7dmIhzSZvpnwKsA==
X-Authority-Analysis: v=2.4 cv=F5ZnsKhN c=1 sm=1 tr=0 ts=6a6510c3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YoqGRNaBgx1oBrP2v9QA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607250187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_123844_933391_20E2AC3F 
X-CRM114-Status: GOOD (  26.14  )
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

On 7/22/2026 2:58 AM, Harsh Kumar Bijlani wrote:
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
> index 956414b953ec..18c1c809ae4d 100644
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
> base-commit: ca27e3c2284a7a43ba390ed5ce0d68b3c869c0ce

This patch does not apply:
* Applying
20260722_harsh_bijlani_wifi_ath12k_guard_dp_peer_dereference_in_ath12k_mac_peer_cleanup_all.mbx

Applying: wifi: ath12k: Guard dp_peer dereference in ath12k_mac_peer_cleanup_all()
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/mac.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/mac.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/mac.c

It conflicts with
a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX throughput on WCN7850")

And since that adds the NULL check I think your patch is actually not needed?

/jeff


