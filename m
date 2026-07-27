Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361CDC531D0
	for <ath12k@archiver.kernel.org>; Mon, 27 Jul 2026 06:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCLCsloY+3vPAHcmMgoxsQBtxcBgu97GDuDz3PvF0Xk=; b=cX6QpGCaO+oAP3sbjDztAgkTYI
	UTYT6wlk0xhsvdhuXGRSh56l73QwM70iBJvuLvgEiJXJ/9OC/Dbw+xqIaUQR4UICAQVxqVLAOnVwK
	eLAtkc6/CbjX989jipg44o3Le0irFERlzyQcph1FO3QRQfYvnjttykEyZh9pTnbm7lY54wGKYTp9t
	ZjQBr/WqwMBFR6mgaxlISxRLe/Kwp8dWdsT+YtVYrc6ByQqlMIDpH52PDnWfScMaHPwb7MBXm7q0+
	63z+N4wsQiZykAD4v1c/0gSzj8eZgcuXKMS5pWylGe8PyBPN0DP7TfwtPQ41qQYOB5xEdYbjkkwSq
	+5G6wwNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woEVK-00000001zqz-3M2Z;
	Mon, 27 Jul 2026 06:07:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woEVI-00000001zqZ-2avK
	for ath12k@lists.infradead.org;
	Mon, 27 Jul 2026 06:07:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R3HMjG3604489
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 06:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gCLCsloY+3vPAHcmMgoxsQBtxcBgu97GDuDz3PvF0Xk=; b=pQJ9NZt/EvqZzYI0
	pwxDbJWFaLUkpONjb8ppcdymqmGomZ4IczTY31/2RZmdZa8F9B7OZF5GT0kn+/Po
	Eh5vCVGr/KioorildjSz0uDCH8D/WrGRKauIRYpP3Yldgi7JvXoBRXWMh5L9szc5
	61dx4WpsikoDplVrmRDYzL3hI95JZ6CnoFMtNrhWJ7XX7AYZn3drAju2JKA30/FO
	Oyy42XhyfuV2gnSPDZStfAl2WMekMtZY1kzXkPeQpy7AsIDiy7QUb2BGJmZtGSXS
	CBcJW2kR37+iwLvSd431K6CZTV0VxkGlLxGd1nuTPL3hePzspRmnwOPTaP7JPIUR
	PfYv4w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9wgdvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 06:07:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so449526a91.1
        for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 23:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785132474; x=1785737274; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCLCsloY+3vPAHcmMgoxsQBtxcBgu97GDuDz3PvF0Xk=;
        b=MjEoATNkdMZ/N5pRv7z1TDdecGb/ao4ySd37Nz4MTL1sdJWzUOSR498LnPT+Jx6wva
         TccnO85JHBR712ub5RqZP+Dkv2Yx5stEpTOWhzdcaP7VI5jvHX8XEom85ogdJRir478Q
         HhqKrSvf8JI6F5RXh4vpYtUUqDBCnp+kM0d3+SNw4t+bTBeZragQTH4fSnfYw/DzI1++
         SXe74wK2+mqNb/14PGwoigvMbivFjQIzVp3ulnAbKNpLdUmCr0bqipz4X838PR66kXHN
         /rlWzOgnyyC2wzwtWFsTKXhcsEZYaByVHsVdq/QiGXb/7J3yAzzhy+Waveq5bGnsAlWr
         oTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785132474; x=1785737274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCLCsloY+3vPAHcmMgoxsQBtxcBgu97GDuDz3PvF0Xk=;
        b=g33w7PdqMmhgpLC51dAHZWaVdKq9TcskphWj7d+LszTOm6IkQSauG6HSKZ2RHOE22u
         j7/RzENUdOocULTuf1ax4Pmvih75e9L2TYRV+oM9+G/wRc354HNsMfiplQm2pk6ypfbE
         jrnoZmemvuaPRKw1s70aSDcquPAf6Rso8HJMkw7d6KdGZ+z6wNujVXpOsEwz6/pgYxb2
         CRq/mBooW6V+i994EzVU3G0hwssWShYAFbEvaSrZ6PuHiXOaaFhCIzPDNiad9zmQfHC9
         p7FHW7T9VMsH/qrKFCt6Ez3NYKQwRsxlrI3Vql0dQ4NWdTY6rV8jWd3TZ+Vu6LNQYp1R
         8isw==
X-Forwarded-Encrypted: i=1; AHgh+Rp0GJGkHwWSY+hsEqqSvvkyyFJohGJP5c3Jo6HagvXrKHaJZ0rC/UJvQAJf4vTmYB0yni24U3w=@lists.infradead.org
X-Gm-Message-State: AOJu0YyWL5eh8rHa5ney3odtRfi/0LVh98XQB1jMsk+8K3QeEWXhz+eN
	7xxXjJsNDqFJ+zKk1Lssl9taspFxONMb6QlyOpqn0BLfXNVQlANeflX75bHv7kR4MrtIabPP3Io
	Db2qugGWRgNGRLMGO0sgAkyC0IqUcWB4T/wEzqjOnWvFvwlHelN2UwOsSn6soid0J
X-Gm-Gg: AR+sD11lB8um6rnWkysDeIUY59VmnCYNGwpZNSK4DBchxYOpWemJVbgrA/BNaG8ENlu
	LWJcYn+lajr72uXggMLhUF5lJrBDuciolOesVnqR+09LuEdb324rUYA8Ju850baZSi5RG4bbxPb
	k0lTc687jptVxspg9F/c3riKCyqEwmASo/bSvaVXJ8aiJqAp0uhMxXJKsp/DxjbuQ/uJuXFUt54
	d99qto++/LXeDgGq7kxJA3gHKxbSbY6To13ST+9HmATMLAC1lq0la/h4e/KIvoIu9K4AvZjZIQe
	uD3CL5wBserSZ98IKyoBznXl0I33eEl/6ycIILZLyK/dgVnJ5ML9PD8FT4WWb5Ib/pB0oAKWwar
	xtKgLN48LYwNHlDyINwvInJol5C1UylHE8EAy9YNAaUXnL+fpVUF7mcN/MiHmhpG0fyDEo/WSNQ
	u8kDUBLTCHKmDbB18CLDU=
X-Received: by 2002:a05:6a20:430d:b0:3c3:89cf:f55 with SMTP id adf61e73a8af0-3c67e11ab3dmr7019680637.61.1785132474503;
        Sun, 26 Jul 2026 23:07:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:430d:b0:3c3:89cf:f55 with SMTP id adf61e73a8af0-3c67e11ab3dmr7019652637.61.1785132474032;
        Sun, 26 Jul 2026 23:07:54 -0700 (PDT)
Received: from [10.79.124.106] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548e63sm28217281eec.19.2026.07.26.23.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 23:07:53 -0700 (PDT)
Message-ID: <2067da3b-cbee-4c2d-8104-4b5d74846675@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 11:37:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Guard dp_peer dereference in
 ath12k_mac_peer_cleanup_all()
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260722095828.2930377-1-hbijlani@qti.qualcomm.com>
 <3d793ba2-09f1-44e4-95c4-1ad877db7b4d@oss.qualcomm.com>
Content-Language: en-US
From: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
In-Reply-To: <3d793ba2-09f1-44e4-95c4-1ad877db7b4d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA1OCBTYWx0ZWRfX4Im8eL6D/0EG
 +kMy15KHwoMmPZnYr/omwwlx/9XJpt0OaJDLLPMO2//3+Q0khXp635tZkREq0MiQE9Z+QwTKQ+g
 UMpdaIBkXZzOkE3K6RRl9qhnPnnHToAG3rgymjiMhN/xr0op6423kjgVLInbyZsO1F76rl5eXl9
 BRblF17cxPfOFy/qDf1i3WUSN5ilzYxUi7ALPbCwjEFzIXIOetR+o4157Wa1ptTX9j7R7xZot8g
 UbBpPNlB7c+LzLJBQ1aBMEUCJNSW6bKx0VJqON0FbNMVEfSDrbfU5ceO+O5ZMHll0djGEiT1Y3p
 GwnSTt8AWBmiltAh7PSF2PPPaQPRl9hIrb7iG2vRbeUX6+A+eJFX/z+b5OHqX6acraL2u0MK0CO
 E5XSIWAKCqJ4yMi1Ip9dPN+wbfGEOytf1sY2SAnUdB1CSm3kmDqp8IapPohHnXKurvDZ70s+BLo
 WyL4IzlIJRNuG+P4X6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA1OCBTYWx0ZWRfXwFS1Kln1sttA
 298PTEBO2a4kMgsvR/r2NDh9nNmW7z92uVntNOp3F/8Qzm1foHICqqiqAJioMbJxuG01QDXA2p3
 BoyjYrorQxFfNSlNPVJ7EU2lfonNvZA=
X-Proofpoint-ORIG-GUID: _kDD89ZjliKh0dmhxYfFGe7AfYmQgptu
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a66f5bb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QSdo0hW_NjUXybdPYREA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: _kDD89ZjliKh0dmhxYfFGe7AfYmQgptu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_230756_695691_F10554B3 
X-CRM114-Status: GOOD (  24.91  )
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


On 26-Jul-26 1:08 AM, Jeff Johnson wrote:
> On 7/22/2026 2:58 AM, Harsh Kumar Bijlani wrote:
>> From: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
>>
>> In ath12k_mac_peer_cleanup_all(), the code iterates over all
>> ath12k_dp_link_peer entries in the dp->peers list and performs
>> datapath peer cleanup. For each peer, it accesses peer->dp_peer
>> to clear the link_peers[] and dp_peers[] RCU pointers.
>>
>> However, peer->dp_peer can legitimately be NULL. The
>> ath12k_dp_link_peer structure is allocated and added to dp->peers
>> during peer creation (ath12k_peer_create()), but the dp_peer
>> assignment happens later via ath12k_dp_link_peer_assign(), which
>> is called only when a valid dp_peer is found or created. If the
>> peer creation sequence is interrupted, for example, due to a
>> firmware crash, a race during interface teardown, or a failure
>> in the HTT peer-map event processing, then a link peer entry can
>> exist in dp->peers with dp_peer still NULL.
>>
>> Accessing peer->dp_peer without a NULL check in this path leads
>> to a NULL pointer dereference kernel crash during the mac cleanup
>> path, which is invoked on radio stop or firmware recovery.
>>
>> This is consistent with how the rest of the driver handles this
>> field: ath12k_dp_link_peer_unassign(), ath12k_dp_peer_cleanup(),
>> and several other paths all guard access to peer->dp_peer with
>> an explicit NULL check before dereferencing it.
>>
>> Fix this by wrapping the dp_peer dereference block inside a
>> NULL check, mirroring the pattern already used in the same
>> function for the Rx TID cleanup:
>>
>>      if (peer->sta && peer->dp_peer)
>>          ath12k_dp_rx_peer_tid_cleanup(ar, peer);
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
>>
>> Signed-off-by: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/mac.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>> index 956414b953ec..18c1c809ae4d 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -1237,10 +1237,12 @@ void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
>>   
>>   		/* cleanup dp peer */
>>   		spin_lock_bh(&dp_hw->peer_lock);
>> -		dp_peer = peer->dp_peer;
>> -		peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
>> -		rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
>> -		rcu_assign_pointer(dp_hw->dp_peers[peerid_index], NULL);
>> +		if (peer->dp_peer) {
>> +			dp_peer = peer->dp_peer;
>> +			peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
>> +			rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
>> +			rcu_assign_pointer(dp_hw->dp_peers[peerid_index], NULL);
>> +		}
>>   		spin_unlock_bh(&dp_hw->peer_lock);
>>   
>>   		ath12k_dp_link_peer_rhash_delete(dp, peer);
>>
>> base-commit: ca27e3c2284a7a43ba390ed5ce0d68b3c869c0ce
> This patch does not apply:
> * Applying
> 20260722_harsh_bijlani_wifi_ath12k_guard_dp_peer_dereference_in_ath12k_mac_peer_cleanup_all.mbx
>
> Applying: wifi: ath12k: Guard dp_peer dereference in ath12k_mac_peer_cleanup_all()
> Using index info to reconstruct a base tree...
> M       drivers/net/wireless/ath/ath12k/mac.c
> Falling back to patching base and 3-way merge...
> Auto-merging drivers/net/wireless/ath/ath12k/mac.c
> CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/mac.c
>
> It conflicts with
> a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX throughput on WCN7850")
>
> And since that adds the NULL check I think your patch is actually not needed?

Yes, since change a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX throughput 
on WCN7850") is already adding exactly the same check,

hence this patch is no longer required and can be dropped.

>
> /jeff
>

