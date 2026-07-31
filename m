Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E406BC55167
	for <ath12k@archiver.kernel.org>; Fri, 31 Jul 2026 08:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j71HTHFsicwBuXZTYdByExT5ln5C9xVWv9Y1JZNj1l8=; b=jK5dAVb4FH+Cff66hxG8ZQ8OjN
	7Luc+T0tOnZMSR0qFt7/DePCgnVK0lthbwKM611c0S70DWG/mQ304+8it6IymaZrsMK61rBxuSpjn
	ZQENxQzwlvRdZgIccveMjBJhxk/nxXFP2wAmfU7D4+2bDUm6HOtYIXriPgGYvui8ixpU1tKVJp8u3
	izVPsT7AtdRySeRe6ozWEorTHu9VzL8u8q9FG9JV9WDL0qc1rvMN8b4ZWhfCwsqJHl1Bh8covSDwf
	vZt1zasoADfVASW5bJLbiYVcbvpzblhR8ysZK9zwaAfGo0VOprid8bbjgcQgZSRrpj/hkqx6H4CTZ
	tWs/zOCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiCq-0000000C0am-2Jby;
	Fri, 31 Jul 2026 08:03:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiCo-0000000C0aA-1RVL
	for ath12k@lists.infradead.org;
	Fri, 31 Jul 2026 08:02:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V7vLBM3210461
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 08:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j71HTHFsicwBuXZTYdByExT5ln5C9xVWv9Y1JZNj1l8=; b=GohOw9VZOtV2RV75
	JXiptDZ8Vgo1ykZ9OGSdjdAymeEvnmNyTXLvBQHuJekzA5VOVpuXZA934DqtveJR
	Gj+ni2LqbEdEnjyODEuFB61qnB/sTAG/eOlYMLwDcY+KRd78rRGkTxBwlhdN6VsP
	+Apv3InqZcUjxoJQHhYuoaLEL6XxCFxD4Hp/3gLG6VjTxByd2Nns+jpQIHBd0FYF
	TcmlNGt3gJ+jhHYwlM+fB6rGmgcvB7r13E7+3nsgzg3mAhpvh4oWwqUZPrNQlMij
	Xirp/+BjQV0uxAzzP+q4Ssqxyrb8y7eUSgb6EuAS6tGahGoEFEOyzoXOHxE4yP32
	22YsoA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp5kgcyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 08:02:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb835525b10so860294a12.2
        for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 01:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785484977; x=1786089777; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j71HTHFsicwBuXZTYdByExT5ln5C9xVWv9Y1JZNj1l8=;
        b=BG0sXDj4BO38iUJ9oykvBFJK42pz+cjt+tzMUkAR6wZupVa/OnEkHFc9/9kFz9C1Vz
         0kv5vvBB0t24BieDoHUiqhCKV/vzPuIkZ+KuTK+bSzY3FrTDp/VrJPO2Fu7aGakdCQfP
         ym1yTQlx7iC1njlIqnKmzLHvZ7+Md6qfeZZBAAREbqBdkgOW6Y9TeFIP8sA/x7zruvsK
         a5eBjvn6Gdr0xiIfp4u2pU2e2f+zzg3OTQ/ajQrvegcaubBAuTPinjYkpTWQyCZaA2Yg
         MPqAZOUQT+9RJ2rmEUt0u+a5HrjxUHapD6nSWS6s4Y+unNYIp9ojXU/EFwPhZo6adITd
         5eEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785484977; x=1786089777;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j71HTHFsicwBuXZTYdByExT5ln5C9xVWv9Y1JZNj1l8=;
        b=gtAKg0+cIXtOzjRnccHhQmPvE4yNU4W+57VnkaCGLyN2eCapIi5UIpe6bzBEHZTg5f
         Ydgb2J2DF8BgNx3gaAz2u7D5wRKSqA/BPv5ACVjm2t+Vepv8s6Wyeu/+Q6YSAiQ7bmQu
         jmJnc2o2ZHOzeXH8UfS5WgIW5ki3OFKB05Yji5sah2BQaTor73ix0eHvffHacBzGG60I
         IetpsSm6bfDKgZj6r5E8rPjxY0JtlzQC4t+C1tOVWqy2ImrCjFR0Hc3CHsj8Azg88Zd7
         7lCfWCJTe21M5lAXqN+WaMnsJ7coa6GEjJso9VlUv9OE119vXBGVFyImmodXLTqJbk4b
         +o/g==
X-Forwarded-Encrypted: i=1; AHgh+RqK7ve42Wmp6xSYP8CDXjpzdL7zpEQdKdm4V3M3kVH8GrJKrzW+ZfRwIRMg2PvOqNJeq+MS8Ag=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+fRzL9LSTt9/dpy01koITVQVlLlIMSlEDpsNxA6vxYz0r7L8D
	gSmnZnUBMGP4PvmuymlZdnF5oRbw5EyaJ71C1FMKTa5kxcnzIC/s90nFnfXURXDey7s8lKo4S0b
	4irFPwKMMw/gIQJyG2PRil/ljtufhqpkaJDOZG5eH4jlEthouq5dmxlh3H1027wxD
X-Gm-Gg: AR+sD10mjYOcp4V1PbPTvhRnrFbDGbc1/EZewXnYuyI3YfDKdSnQgp06Xtf5cHDCO8A
	QeGPtDR6jN5PZt1pMQxhalzKVa8BB1Iiku+KFjZWS129quu9aQP1laxmQym+UaqAZO+XocopLaQ
	iSkWxo2WIocRCvPPv5bjh4OuFIB52cChaUKoue4R84SP2nYska8pnF4WOJMFiyuY1u2+fxjkSMd
	dRuOwNVyzLdIEqIVqIkrusBdb1q55e+77Vav1AMCa5JvLwJbYsbcrCehhaq1OTu1JS/r+46A4PY
	ljXuNyobIklKbwiWVKtuRd4gGv+HiH7FiiR7OTt9PQXb+at3ET4/pbD08wdLGbtvC2DO+UE07NT
	t5pPH/f/bKwRSV2CTACrWWWTYDLeJd9//FXAw1ab6WrhCT6TaKdhIzD6/ckh5DnqCSrlb6TRvmw
	==
X-Received: by 2002:a05:6a20:4324:b0:3c6:3c5b:fe55 with SMTP id adf61e73a8af0-3c91b362e6dmr931124637.52.1785484977208;
        Fri, 31 Jul 2026 01:02:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:4324:b0:3c6:3c5b:fe55 with SMTP id adf61e73a8af0-3c91b362e6dmr931087637.52.1785484976644;
        Fri, 31 Jul 2026 01:02:56 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe3963daa7sm257353a12.5.2026.07.31.01.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:02:56 -0700 (PDT)
Message-ID: <f7e90024-df8e-4fad-ad42-864c092a56d2@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:02:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] wifi: ath12k: fix MLO dp_peer ID desync with firmware
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727162748.963275-1-jtornosm@redhat.com>
 <20260727162748.963275-4-jtornosm@redhat.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727162748.963275-4-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1NyBTYWx0ZWRfX2N+9+20c3TpZ
 z2aNEjGoNBSLGonesGO/geQURr4v7T9oo80d7jzqe+urAa6s2HxbfXeBkogVuzGmc/f9xEvaGup
 AsAw6214xKXfVfUylkl+gWT0T6s/OUs=
X-Proofpoint-GUID: ih3bPQ7Q_ocjfY0U_-JgqiIwYKwAVY1p
X-Proofpoint-ORIG-GUID: ih3bPQ7Q_ocjfY0U_-JgqiIwYKwAVY1p
X-Authority-Analysis: v=2.4 cv=c/Obhx9l c=1 sm=1 tr=0 ts=6a6c56b1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZiB7qzRtAR3mgBQmdTAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1NyBTYWx0ZWRfX1P+7ppwQjLIN
 ZZBehhKsm8a+o3dmDB5vUuEVVKG7ybVkm9y+M9B0yiO0czpFr7zvgWYPO7zrYsR5h3HlE/MQ+b9
 xPAYt4/eO9Z9n7dCAGNrzT67bNyG3qBd3P4JKN7s0SqaKky3aQ7t+6kAXOaDZpbTnBNX++Z/xmj
 mGR1IYhEkxcc9Ymy7Ww1XcfG/NORQbXaG3b1BYM1HP/fwA/C3nx74MG/T2UZxXeH1VRlHlXYP8S
 HjLwFHe8yg7igNZ0nfd3zuCwQajeggod7xYuQWuA4U73om8JwVS/ODZWtMuVU2Cn63umtNDZlAl
 Xb53SN29PBDH0RgiW/iY9l3gKDjpOyUlgDICT43KhWrcIA1W+LmLcCnNS4mYPVTL8jJ0KltAlBp
 Y71SVYnSFq2IuNtIrc/Lv+B2zh9G/J/XWGPLVq84h8Ofl+WfbqFLg0mKuoUdVjLJowDM5dl/2O1
 LyFjuFb2JlTzQbBiyOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_010258_410931_91B1D64C 
X-CRM114-Status: GOOD (  16.00  )
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



On 7/28/2026 12:27 AM, Jose Ignacio Tornos Martinez wrote:
> TX completions fail with:
>   "dp_tx: failed to find the peer with peer_id <N>"
> 
> where <N> is an ML peer_id (host-assigned ml_peer_id OR'd with
> ATH12K_PEER_ML_ID_VALID, BIT(13) = 0x2000). This happens because
> the firmware uses an internal monotonic counter for ML peer IDs that
> does not necessarily match the host-assigned ml_peer_id. The desync
> has been observed in normal MLO operation and is particularly
> reproducible after firmware crash recovery, where the
> create-delete-create cycle guarantees the firmware increments its
> internal counter.
> 
> Currently, ath12k_dp_peer_create() stores the host-assigned
> ml_peer_id (with ATH12K_PEER_ML_ID_VALID OR'd in) as dp_peer->peer_id
> and immediately populates the dp_peers[] RCU lookup table at that
> index. When the firmware later uses a different peer_id in its data
> path descriptors, ath12k_dp_peer_find_by_peerid() looks up the wrong
> index and returns NULL, causing the "failed to find peer" error on
> every TX completion.
> 
> Fix this by initializing dp_peer->peer_id to ATH12K_DP_PEER_ID_INVALID
> for MLO peers at creation time, deferring the dp_peers[] RCU table
> population. When ath12k_dp_peer_find_by_peerid() encounters a lookup
> miss for an ML peer_id (one with ATH12K_PEER_ML_ID_VALID set), it
> walks dp_peers_list for an MLO peer whose peer_id is still INVALID,
> syncs peer_id from the firmware's actual value, and populates the
> dp_peers[] table. This lazy sync approach ensures the host always uses
> the firmware's real ML peer_id regardless of any internal firmware
> counter behavior.
> 
> Guard the dp_peers[] RCU table clear in ath12k_dp_peer_delete() and
> ath12k_mac_dp_peer_cleanup() against ATH12K_DP_PEER_ID_INVALID to
> avoid clearing uninitialized slots. Replace per-peer clear_bit() with
> bitmap_zero() in ath12k_mac_dp_peer_cleanup() to avoid out-of-bounds
> access when peer_id has not been synced yet.
> 

this is a known issue and has been fixed by [1], and that fix has landed in ath.git [2], please try.

[1] https://lore.kernel.org/ath12k/20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/


