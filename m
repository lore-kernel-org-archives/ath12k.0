Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D036606A323
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 06:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jEdEkIdA;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fHokRJMB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XfidkClV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qbPyWDTGsxZxaxa888WW+RqeZR/JVWOIfYKuKKm7ekc=; b=jEdEkIdAoQGJPA
	JdoZaKsFCCSgR+Nhv6RlQDFZwFVRSZK7yRXI6hpxC6wCOLH0+Ry234cEtjUjE6LwTma/MpHMDCYPV
	M8eVW3HnAimiHOo9XGb/pV14mdPs9UyJj9JfwbeywgSBjPCKJvXQafiFK2U/WZB+b8D3c7uKFgeZe
	ZcvynuuYlYxqukpr05/pO+zwKOHvaayl8ijSqhR4wtLR+mhYK+RIq9zTVtPEkF5HgSU1giYBhgzy6
	BnZoTRiDUyV1rlOb4uZiVrDMzNuEkmaTQKMp3urGhADaufyAQz57PqI7y7nl091o4SiQu1jsHV9SE
	chVx4ZlxNrN4hkiLjz4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSq7C-00000001EE0-2nfw;
	Mon, 16 Nov 2026 06:22:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSq7A-00000001EDK-16yK
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 06:22:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5Lb581321031
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 06:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbPyWDTGsxZxaxa888WW+RqeZR/JVWOIfYKuKKm7ekc=; b=fHokRJMBX+dFtEVa
	Sr25bEDhpqMsMbA8mAGjJvLn9Lb5QgfDnRS7V2hPonrcDGxywUuoS4P6LzTBjXM4
	E9O776kF3o3F8jzB46f6bIXaPc3Gfo1MvFlbfd04z0M/Ps2rPlipulLi7UN/r7Tt
	4uxznC5bOPoeyT4QOekGuOknGwkd746TF3b4rMUya1qkWppLcjbqVdX5Wyi1v3k7
	IfvcXVxOEMcp+kthMfw0EUUtnbyd2/2SqYOfAclOnieHLA+X/EgBRtTARKz7x4Te
	+rLweDJd2Wf/LXvjheijv5VH1RPIxqq3h2dlYlWxkPRFO1RmS3W6JSMpQVX43nTv
	OrNwJw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhman1nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 06:22:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2edd25534afso23161455ad.2
        for <ath12k@lists.infradead.org>; Sun, 15 Nov 2026 22:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794810170; x=1795414970; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qbPyWDTGsxZxaxa888WW+RqeZR/JVWOIfYKuKKm7ekc=;
        b=XfidkClVYtWT03syTBguEiZYjCx8MwY9Es2Jcewxzx0GiPYFQgDFnE5pv36LsDRjRf
         QmP1mjzIIbQKBd+esqCWgd3L+qLPc6pgnMcPlpFTNSUf0KiaAThgC/+nEbm3sP9SevHv
         xsZ6jeaQ5vzkqNxsT6AFtqzwvrg26FC0h56u1zsZRbnkWLbKbk02Xsf02fedQfFOOf2w
         g3VGHFD82FDmH2S4T95x1xvUmf5ij4IzY3Y8ewL4ok8hjtdH3GMWwEDCYTpaXyQWiGfL
         0jh4d3Ycjb1chen1mxrlUIC5w3rCggClPK0vk+IGbnPSZGmE8mlSEBK/MQIEmoo4QF1D
         tD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810170; x=1795414970;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbPyWDTGsxZxaxa888WW+RqeZR/JVWOIfYKuKKm7ekc=;
        b=mw7+qJm8p/FKkhfOyy2jexgW4gRfbp9W9prYxxyaK2dYUhQTpZFO9pEdLqu+oFXeta
         9Les9RLH96T2ZzIuuFPiORNQ87ZBf72wLZP82mKFmkB2B+RFLm/le6w9pn9kxJ5gGELH
         tGshtG+nGfi2NS0F38mCm2VEoS1rd3XT5T9C8pIpg5nUu+OmoEc2682h25OZwaNHdB5k
         qesxioMEnAKcMUR/vzAbcm4qbErymOjjgxO2swADl35a0M5ArQtk/adWHr8JlGgR7e1l
         IQUDEFACitOBZLWVl6cwXD8OtTQ/vZYnqzCK54iv5x6v878xFgJOuoSZjdZ/tnNOn5v3
         uB0A==
X-Forwarded-Encrypted: i=1; AL+hErG48iyDJhl5VH0VjnphYMXxXd+DiumZ5n0knjVdMwjpSR8QAA5WqvsAINHtO87PeBqKbKsmJxE=@lists.infradead.org
X-Gm-Message-State: APuU4Z927/lVi+1ECWVsygvZKZvu2R4rvQFmddK7hI35Cf1uJn2u2bfG
	A52ybbB4HZQzbpP+NVNr/RpLlv+v/lcon+RpYSvd9NJwuEPVvgiAIi529kjrfBBqs5iIE087p7y
	Hj5mLgiIaEVXD6hi1URoh0HvgHZThjqXbXFm3PPLfBJs9oWehLLN7pxd/Z64jg9Xu
X-Gm-Gg: AZFdTZcxjJ2HJPyPO8A5Xnfsg5EEPBmn/iuphwYr9ZEBq5AxsiMoQHupXDCq74RyB8f
	1CFnDz8Gic8pFtnFpxK1B5kUF4aKeveXWpic/Ur6eVYRCj+FMGgxGcHlkZuWE/A/IQ4NO8y9b9b
	EBhzjPtj6hueceoDCwBQJjXdpWi61W2UWQY2sjFSuUTDKVXbwDXr7edndUIJPyvfBl5hHDek1ss
	RxuHdWn4Mxk+k4nTOQsGSSy9ZBFqt75osj1lupNtbf8ZvYTlVGYzFCbiVsiiyMtQhsckt7ynTTq
	fSLD5bdgRnvYUJwsdiu2qYH5EBD+TINuzC7gqnx3XX7nXL6Y7mqHam1jU2Hzwj4DJartEi6sMpK
	LLARKvGKX8lY/xAowgN8k4czOpfqLMtAepUuf3OZOQGAd3mYibCzAV5fhKfU/Fwjd1YQ/vht35Z
	pnNNjQWFDL06a0NG5UjqtNJP1G3spHoXlPwTLEHevZP0Uz
X-Received: by 2002:a17:902:ef0c:b0:2e9:6972:54d2 with SMTP id d9443c01a7336-2ee0de12039mr97623735ad.12.1794810170112;
        Sun, 15 Nov 2026 22:22:50 -0800 (PST)
X-Received: by 2002:a17:902:ef0c:b0:2e9:6972:54d2 with SMTP id d9443c01a7336-2ee0de12039mr97623565ad.12.1794810169662;
        Sun, 15 Nov 2026 22:22:49 -0800 (PST)
Received: from [10.133.33.65] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8d9966sm33428915ad.61.2026.11.15.22.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 22:22:49 -0800 (PST)
Message-ID: <2420c657-0aee-4d8e-9c84-dd8aeb510841@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:22:46 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: add hash table for peer lookup in
 struct ath12k_dp_hw
To: Aishwarya R <aishwarya.r@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
References: <20261026062131.1589569-1-aishwarya.r@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261026062131.1589569-1-aishwarya.r@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ks9RZ0PfE9N9YKcFUUisfBFPhIh2pPG4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNSBTYWx0ZWRfXx7dK/z9y2+wX
 TtqJlUtv8G4rK6pOeTj/iPb0u+B/dDKJ0EpQlwjTqWz5yroCQ5bN8FcL02kgIBISVWq5XFfq6hj
 3TQXLayDljKs4+IljYQRK1doC7TLUcwtP0+p1eZgy7y+HLqrG4hSS+HoSMPVgtvy1laaPpwqbdi
 l7fdOmnsb0XLSAvDeuE7nGpH45saWe7t7VFKnJ5nRwHdLhEx9Z2SNYdMPdaGgKNkfuNlKooyCbd
 CcUJDAFvpo8hMzz06zumHGUCUVwyvn9FoP5mQsyDSSpo/PkLy8eo5pK75G5HzERuuRdIlgOId34
 niFKe00qrAEXFFDhNLeodkSRt2bMgXTEKHDGzlcc/K3Ngr8Kc6R1CWR+xK4qkBeiGKehkPSbgsn
 PZprWuTXOkkLZUhuDMuyk0CyNTm8kfhZZB4HzdnjCIXtu8+W6mgHp0n88nMrKZHTbox5ZSpbh0W
 SV73Hppzf8m15QSwwqA==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6afaa13b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PFxcabDSBE7cXvBVjb4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ks9RZ0PfE9N9YKcFUUisfBFPhIh2pPG4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNSBTYWx0ZWRfX1Y7kjXhLX/Nc
 csLKnw6+aNC9PKKlGcmzfUWyqPHYwPsMW8bl6kELuhdbkABMwp740XM7ZPFCBKODuRcjDBtdG5K
 cCEHBRD14lAWgz600n9BYYmLnId/MQ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_222252_425417_CE79BDEC 
X-CRM114-Status: GOOD (  17.08  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/26/2026 2:21 PM, Aishwarya R wrote:
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
>   hardware allocation.
> - Add hash_node to ath12k_dp_peer for hash table membership.
> - Introduce helper APIs for hash computation, insertion, deletion and
>   lookup.
> - Convert MAC-address-based peer searches from list traversal to
>   hash-table lookup.
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


QCN6432 support recently get merged upstream, so you might want to rebase to have its
max_client_single modified as well in ath12k_wifi7_hw_params.

with that fixed:
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


