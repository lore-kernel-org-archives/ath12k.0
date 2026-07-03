Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E88C44500
	for <ath12k@archiver.kernel.org>; Fri,  3 Jul 2026 07:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDBcHrirnFEjY+454YJdrV3UGfnP7gb4/Xl0/8PlRnY=; b=Zo4kXxavNEHHhkAPW2OpmVMR5x
	9tXEUMCmhSRPsqjrFdayhcUS5KwomyD0UbT7DIexqCp1mwcA8ZHLLisJ5mmY1p83cRET1J4f2RCsC
	W04OtvV0i4NiKwk+L05jPn4M6ZAM4I/1QL5cGgIGZ6QWASD+rHadoxOWnrCOqwezazXv1DLePmqBN
	D34OF+KBdKBI9cUzPXuhq1hxuez1CfpVqMz4XWuTblNKTv+ZELxJY1FiFMekC5lYpC+Z+HKXNH5TS
	UkDASe2Qsy6sN0pPAWBzw2jcVsy7UqnIXxOdIQEdVfcnZepMKOK/CM2SJ3AGtVi7Bh2izbNNyYYtr
	7YpYjb0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXx0-00000006F5i-3Wxw;
	Fri, 03 Jul 2026 07:04:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXwx-00000006F4R-2xxl
	for ath12k@lists.infradead.org;
	Fri, 03 Jul 2026 07:04:38 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rsWT3123883
	for <ath12k@lists.infradead.org>; Fri, 3 Jul 2026 07:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TDBcHrirnFEjY+454YJdrV3UGfnP7gb4/Xl0/8PlRnY=; b=nrNDkJDbZf52vEhD
	mZVr1thBY1A28KrgxnBO/Yy/uvv/KVwgj1HsCtYTGdNsX9klhAnGgVN4NwWUJW3P
	gnbT/i8x/RI6OFgx4QTp9occYnIs3KduMy2+gfgCyRvk7K4zi76LEkwvkO7M+GNM
	Eqggl7kfZklT7elualpvCSCHQnx0M7IV8V5KwWqw0YUoji/3RQ8B6jwx43dFknZe
	n0cvT/16tOjm1BgDEY8PXrJD1X4LrNWelWc5FL3Fa6JCh4iUo80K5sno8IBhIOcV
	XsIL+L8s9Pu5kDESafTLDAYP+ES49rYe2lpWIwOn+fV3hdd1ouk6ImavHuP33aRK
	0crM7g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpc453-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 03 Jul 2026 07:04:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380b630c505so435920a91.1
        for <ath12k@lists.infradead.org>; Fri, 03 Jul 2026 00:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783062274; x=1783667074; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TDBcHrirnFEjY+454YJdrV3UGfnP7gb4/Xl0/8PlRnY=;
        b=iVsRMZMwcLcVJYg97i5J6hfKcQmZB7GkWXA7uJNimzazBOjtlTkWAPB4cP+YseI8L5
         Rci/OqwnJLdP+t3jeoPAWUFjTWjxCy9bBjNcb3FUy1c5GkQohW5gSBdKsxuteJd1CD/l
         pMk1HX3vLEq49kqQcaGI0XqfdDONCzv2EC47o1emOyGs/dfJWJJLyah+9dclBYMh2Btd
         +Q80CYhrGPCxgciphds+5cJrby6jqpP5Dc9l6n0W3V53izTpEEhVcVnT2lSsJKTS0Qcp
         2fYQlqrP/YcKIt/fTMDQQ+/JrlchSyMTG6kAEz0V2Hs9/BSeWyZ+liIK568JDxqdloi1
         G7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062274; x=1783667074;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TDBcHrirnFEjY+454YJdrV3UGfnP7gb4/Xl0/8PlRnY=;
        b=ntBkj4MAxzyk776FNv0DQTE/6uqSPnnCau9CTNWfXTIYkjCADqyaOUfKMbjtRGMvLe
         tWTOHogz3+pbhsfoEpyOPPPOFIHdCIzQT7Mjt/8uT6Y6QuNEAMuABoceKyEw4X7qGGkA
         efxiz5DBBKLdrLXluprCN/JHPnvaPfjBKlnRd8JRY4Y0lp5pZdQlJe1m3StOgGmwQyNq
         m3KDN64SYrHR3anVtGn4H7N3JaSVcNydMYnx5pxKZ4Wtjym5DKKIHMfiPrIwdUS2YmUW
         D4urmrOKM60SZ/3thgWv3L6YE6fG9JxZgqafSa1VgeW5Z2f/HzxXzk6RcBzIEsGORSQr
         RPbw==
X-Forwarded-Encrypted: i=1; AHgh+RqfJtBydaMKz1IOty9hwqz5zvGwwfadUA0kK0t4VFN3UPsN1eXs1rUt1+FTc1yIm2piXHoQOsY=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcri2F7Glj0MIAJTsZoXJRvMQfY7HkN5pwxEcnuzQKG7vlf8Nc
	eJCBWHU34vNGVGChY8Ot8uRIhtbRUAHnTH5G7zGcOjGFkW3LtvW0ZN2x10CPPjAVsStwWCIRDGO
	ZGP8Uk6EbQqeF2AhH4fezRMOpoEFy06UHfmVhcqTHspab/SvRKe0s0mPfEg41kODk
X-Gm-Gg: AfdE7cmFvzsD4SxxoYn8XJH/UmiwU4Mj7nxorQD7zcyquAC4bd2GTB0BpNijvgSSrIZ
	DAQ1/hvENOzWiwjUzesJNRuARgJmDwB4cdf4S7BYW3XHkTbQs/kDe1n63c2IG5iNb67esYOKKMt
	IyDPrRX6yCudBW6ILoaZIQ8ZqEklkxE3CQ7MEv/AcyRhU+GOwsvI+JKGuiqZOdrDAyFEH5eWGLG
	YanM/8ybRQUN48H8FsLF54NxDF8JWFN/+ESa/EJ8gcbRk37iEnYo1EhE9J8X1xZgED45SZ5V+Nu
	nHul/nXIXmCgUp3l73lXxm+dryW5ghyAm35mM08hu1L1c84tXW0My45YvfZA3IttwGLES6+ja6B
	bBwFJp3knAq1zBpDCjghadlSVBzbKpPryIVY9zaAyWfWRFDQX2elA83f7LjwG0aTcoN0rNShL/9
	0FGgjL0Tpk
X-Received: by 2002:a17:90b:4d88:b0:37f:bfd6:8b40 with SMTP id 98e67ed59e1d1-380aa0952c0mr9548920a91.5.1783062273660;
        Fri, 03 Jul 2026 00:04:33 -0700 (PDT)
X-Received: by 2002:a17:90b:4d88:b0:37f:bfd6:8b40 with SMTP id 98e67ed59e1d1-380aa0952c0mr9548886a91.5.1783062273034;
        Fri, 03 Jul 2026 00:04:33 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38097da4c32sm2853484a91.2.2026.07.03.00.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:04:32 -0700 (PDT)
Message-ID: <4c4b8f9a-32b3-4c8b-bd52-02434695b610@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:04:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix low MLO RX throughput on
 WCN7850
To: Yingying Tang <yingying.tang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260610053315.2249912-1-yingying.tang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260610053315.2249912-1-yingying.tang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2NSBTYWx0ZWRfXzzbIPQlJbo9M
 wBLdmZz8dUJJxij5Gq6KEP0gplRsctV3coMENHw+CwnoEzTriJcRL9UukdrdjmOhafklHFu4OVq
 6scKmj0SfZLZoYDwrkRbp518QR2P6QY=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a475f02 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OnWgCjIbBKlE7jiPxrkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2NSBTYWx0ZWRfX4hZIu1CBc4I1
 +FRDodwGexltFP9bIYRSblanrzeOIH/IpHXAIk+jJW0wRY79hfK6Nss5d4+av6otxDPm1eIVFEn
 0lJzNbfnTlWrxUqu5Je6Z6qfUjaNVtD1IE3pqIdOxujgfoqjMWhl0RyoObNcFEPW7ClYBA9JbnL
 /uwheky/9KP7XmcmJH0x/C+1qxrGy8gnBeRotmddhiefFPN+qyKrcfV0Ggiw5d6dSfyj2Lbo6cO
 ywcIgUHaLRlCEUj27UVVq3IhDfWEI5GI0CUuJBeI0uSPyqM3+OGcm0LlQx03YEBBJrDiwDE9sTi
 WuPN8GQuOWnHRHZTcgKx9JmrayWOwMh/cHZV47cY79SVqgGWoxUA7qpbzF308GNQRhaYKMh9mib
 Hid2/vr5CJ8uALru6Oi4D/RYLymt2G4zd5qj7k2WdjjPcjbkMO8e9QC+OViFYP17q+mYbOuFFqz
 9f1SBpH21kpLmnsQsZg==
X-Proofpoint-ORIG-GUID: V9E--EqpQSQPFXxBsd5KU5eJIvmyqXdo
X-Proofpoint-GUID: V9E--EqpQSQPFXxBsd5KU5eJIvmyqXdo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_000436_043727_479BDED8 
X-CRM114-Status: GOOD (  19.89  )
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



On 6/10/2026 1:33 PM, Yingying Tang wrote:
> Commit [1] introduced a regression causing severely degraded MLO RX
> throughput on WCN7850.
> 
> On WCN7850, there is only a single ar instance, but MLO uses two
> link IDs. ath12k_dp_peer->hw_links[] is indexed using ar->hw_link_id,
> which causes both MLO link IDs to be stored at the same index.
> 
> As a result, an incorrect link ID is assigned to MSDUs in
> ath12k_dp_rx_deliver_msdu(), leading to severe MLO RX throughput loss.
> 
> Different chipsets identify the per-MSDU link differently:
> 
>   - On QCN9274 / IPQ5332, the host owns multiple ar instances and the
>     per-MSDU hw_link_id from the RX descriptor maps cleanly through
>     dp_peer->hw_links[hw_link_id] to the IEEE link_id.
> 
>   - On single-ar chipsets like WCN7850 / QCC2072, there is only one ar
>     instance for both MLO links, so dp_peer->hw_links[] has just one
>     valid slot and cannot be used to distinguish the two links. To
>     resolve the link, walk dp_peer->link_peers[] and match by
>     rxcb->peer_id, which on the link_peer side identifies the link
>     peer for the MSDU.
> 
> Add a new hw_op set_rx_link_id() so each chipset resolves the link
> on the RX fast path using whatever signal it actually has, and let
> the op itself decide whether to populate rx_status::link_valid and
> rx_status::link_id:
> 
>   QCN9274 / IPQ5332 : always derive link_id from
>                       dp_peer->hw_links[rxcb->hw_link_id] and set
>                       link_valid.
>   WCN7850 / QCC2072 : walk the link_peers[] of dp_peer to find the
>                       link_peer whose peer_id matches rxcb->peer_id,
>                       and set link_valid only when a match is found.
>                       Otherwise leave link_valid clear so that
>                       mac80211 can fall back to its own link
>                       resolution path (via addr2 / deflink).
> 
> For WCN7850 / QCC2072, walking dp_peer->link_peers[] is bounded by
> the number of links actually populated, so introduce a link_peers_map
> bitmap (unsigned long) in struct ath12k_dp_peer that tracks populated
> slots and use for_each_set_bit() to iterate. Non-MLO clients hit one
> slot, current MLO clients hit two; the full ATH12K_NUM_MAX_LINKS
> array is never scanned. The bitmap is maintained with WRITE_ONCE() on
> the write side (under dp_hw->peer_lock) paired with READ_ONCE() on
> both the lockless RX read side and the write-side RMW for KCSAN
> correctness.
> 
> Also guard the dp_peer dereference in ath12k_mac_peer_cleanup_all()
> with a NULL check, since peer->dp_peer can be NULL for self-peers or
> peers not yet fully assigned, the pre-existing rcu_assign_pointer()
> call there had the same latent issue.
> 
> This restores the correct link ID on WCN7850 without changing the
> QCN9274 / IPQ5332 data path, which keeps its O(1) hw_links[]
> indexing.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Fixes: 11157e0910fd ("wifi: ath12k: Use ath12k_dp_peer in per packet Tx & Rx paths") # [1]
> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


