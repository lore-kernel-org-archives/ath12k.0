Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DCCC43458
	for <ath12k@archiver.kernel.org>; Fri,  3 Jul 2026 06:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++XPPP0QRe3kJRFuS+h2UvRKvVMN5ddGc1ptzBceeAk=; b=4BtwW1I5Xl/7b4/Ig9+4jjAQYH
	Jsj3svJBDpp6Vmsiu5T2SBsN6KngpI04ZBbmqOt8ZKs5t1SHPRz8co/eteMBOGI/aZ6UsAzMBaaXx
	jFlYLlRzHfGJK5kEmsBHQbAwTzpivjFv4wksX38ZRJ15BosinTf4CgjAUMr4O6ydcsSaHu3opActW
	tCsCXIo0Q7Z/BX87dXJhG47UOdLeEeA2QMIwBWxnZZ4K/ptUGbUbMzeooEfrqxU2XI38zs7p5LkSm
	QfJ1zQfDqQTg/UxN5DUdxTvjBgsZInKHi4jMNuYA7g0Exqf8HtrWG+Ad2vZqQWTxPDKCU4kHRSFtn
	5dyciFBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfX6W-000000068SW-3SbH;
	Fri, 03 Jul 2026 06:10:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfX6T-000000068Ru-2d6R
	for ath12k@lists.infradead.org;
	Fri, 03 Jul 2026 06:10:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rZg83136108
	for <ath12k@lists.infradead.org>; Fri, 3 Jul 2026 06:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	++XPPP0QRe3kJRFuS+h2UvRKvVMN5ddGc1ptzBceeAk=; b=TcqkF/SdDjtK8LEJ
	UIl3mVmaJP4WR228fhMH89/eahdLi0AzEAjAbduTu+rfiCjXGDefrsViwXdjYjA7
	lPpRRVBh4Wm2NXVhHRtsP/cQAB6A3v3g1cGQiuGzoVffUfnhNrr0yocmvvC9bHtV
	OGPCHW11wtgV6cAOT66/IucFAoLOzGIPnQuXd/yA1MQ6HmpkluodivkfyuMUGFmt
	tPqhPEtExBG2Z3i98VR54l8qI0O3PHRTmYzFmLV2Q9vYu8AP67u79IS0wzQ01bGc
	2l+dB4YgmirvVv3jexZOKl/kC2aasOcdU8Bsy6kQ4gvt70w8yfnRWsxifr+ftR2m
	nOjvZg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b58uv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 03 Jul 2026 06:10:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3810fcd9adbso440889a91.3
        for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 23:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783059020; x=1783663820; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=++XPPP0QRe3kJRFuS+h2UvRKvVMN5ddGc1ptzBceeAk=;
        b=a28vfgsuVky0XmeX4yCsb9ldeOj2gYiy29Yhvlg3cdD49bp5+AXqZFqJQvKYItSHBd
         mOPkGD4it3nmHCJimpJR2HBq4FRMhFJWPpDDM8PxqdSzL+zxN0t2H1c+EpnKCHuMhwX0
         dv6z/uEgm4GXENIfA6OlIhBqwEp+ZNBdXgExfnPxyoYEc8fVoM4teDdxBi8o77n/Kp8u
         tptMzm4ADI/wLeYdellOs+mD2GUjmFvWYCf5iTBgtv2CwpN7RrMJxf16TtRzrmz5cjs+
         4a6v2xLlNXup7CJEqISZjWwWrL40Jl0bE22PfI2tuf9WkZpeynXnR64nepNQGu2Ot42w
         AtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783059020; x=1783663820;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++XPPP0QRe3kJRFuS+h2UvRKvVMN5ddGc1ptzBceeAk=;
        b=RiIEQ1R1pdiWFqzOG8B51Sg7l+eTEHxPJr2v7KrltFMiZ1AqP31aqzyljkocPfeV1F
         tXvGdOAUac4Amg+jH745o0/aq/XJVIBJeN0TsPPj8hHMLBNhvvzvqowXfqX2tiOKrblq
         ciQ8kvzcM2u1RWZtBJIIVceNiQiQ0rsjTHv9y3sn/pKtqFGz9t5CWs6Bj72RvKkdkHF3
         ghimqUlkkBhL4mlafck51OBKQVnjUFUiebWvwkW0oh2dn2WTvyb2b9J5Zf+xuGLe9oxi
         6VfK8w+E2jv+u/PNUTrVDMGvbksetMOAvuqFh7fX3VBWMPGK9yUWqenvtwYv4jt/oX0X
         suig==
X-Forwarded-Encrypted: i=1; AHgh+Rr32xK7c9rNK49p/kjSHotrKuh3FOkG42REYhg5VQCtmNjkZCnI+BtgEUzxmwEjDtBOtEyfIzI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWrr5978/FWyibRppJbdN5/j0QqdSz3xCimMh4wUW+8FKKrVLs
	3uGEUoX/iJWbhDjGIXzmkwxGL0CxULuQ2YkfGq5aaXtOsgddME4B+A92IUwVJLvmrRaSLmzIVw2
	XXeJr7Sf3H47AjLEIAcvZ5An4Rq1cR1Zy+i0Hjlfvx89XU7oTNlSEzI8oaDXAQTTP
X-Gm-Gg: AfdE7cn5VdXfhZZ4uU25OWW5wCNpeToUL3LOwCQGo8DuSzFOnvWaA62LUBNl9KuQydo
	RCyY3W/CxvlM0MLByeEOfKgFSX35iTv6w4SJMecM3+ChEsEXyiXdJPZqowaq9BvHNIkb6dEmeh8
	Pf2ZIE0SDgcHqxbwiKgQsbV1FoV1MS2ikKXxsDJLq/DradA1Gsx7VQehvb3Sffr3Fl8D3UzRY2u
	+nFrXh3VUXVf+ez69ys4yKivqohtDS7YVpyfX9ev53G5nooEdNg4pIktEUCNQVNh09oR9m0j0jH
	cAc8T7LFXFdSOl5Xbh1R56CnvrfmcWQZiLakUv4UNwQIywH6R9yXU5AAN84u56G6PpIs49O9Sl3
	PljtVx2VfHA9vdCZL5eecvsGkyrku7RCHvtjwsAgDFoNDg1eSVcY=
X-Received: by 2002:a17:90a:d888:b0:381:270c:4dd1 with SMTP id 98e67ed59e1d1-381270c525amr1564655a91.20.1783059019698;
        Thu, 02 Jul 2026 23:10:19 -0700 (PDT)
X-Received: by 2002:a17:90a:d888:b0:381:270c:4dd1 with SMTP id 98e67ed59e1d1-381270c525amr1564603a91.20.1783059019187;
        Thu, 02 Jul 2026 23:10:19 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b86ef6asm18069022eec.13.2026.07.02.23.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 23:10:18 -0700 (PDT)
Message-ID: <f432e443-7df5-4727-a64c-b9460d8c7487@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 11:40:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix low MLO RX throughput on
 WCN7850
To: Yingying Tang <yingying.tang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260610053315.2249912-1-yingying.tang@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260610053315.2249912-1-yingying.tang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA1NiBTYWx0ZWRfX3zRKnAE05tOQ
 H4xnMTMDs/FfpzJLhquGPwXOhGFSsIBkV8XxuetDZkV2AXO7nYoLBDrDb75roPPJ4wGiCDvaYmW
 TfWhaVi8VZV1SI4LC1rtsoI9qcPLpFA=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a47524c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OnWgCjIbBKlE7jiPxrkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 29CHFgpsXwdI9ZAJi4zaNns2iA_Fugqe
X-Proofpoint-GUID: 29CHFgpsXwdI9ZAJi4zaNns2iA_Fugqe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA1NiBTYWx0ZWRfX9+TNY+GEWMxN
 G62yywIfuHAOfO6MFMxe/QQyj6oll+oB69HbvGsW0KQvJH3AG0Pl9FLdNutbJNWek5T+ZI/tPdl
 a1xfR2sqpa69mENL6hPw/WZ6U/PYNPCd5bHe6fbpfWv/3TrLWrZnkTif/Lu7Ymj+7vot6wqgyuE
 CMxiTurqXEjeEwXBEHAZRA4L9Zmp8qO7Ykt2yqXpUoe5IyHsJ5l4NqH8+GEHuQ/hQGABnFqNvlk
 +W8EXHrtgRo55/Kj6DGqrhg94op01FItIf4xGeNScWbh09wTA7gqAfKk1uaN6JiaT6z2St27v0d
 E0JyjGXNKX5Jh6eRFh5qeK8BoZA1YvMzC3sFHn7QdbLp7lVZqbzpt0K+Kd1+668lCYv31G1vy0h
 vQbQeLgNaWRLZHjg7X+NvBQMUP+0xEAWFHszmy2kX2mG4fBDcuNVEO1eSXKW6FW2z4vfgukFwkf
 Z/MuLcswGBKw2gxjQqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_231021_719036_13F98FC4 
X-CRM114-Status: GOOD (  20.47  )
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

On 6/10/2026 11:03 AM, Yingying Tang wrote:
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
>    - On QCN9274 / IPQ5332, the host owns multiple ar instances and the
>      per-MSDU hw_link_id from the RX descriptor maps cleanly through
>      dp_peer->hw_links[hw_link_id] to the IEEE link_id.
> 
>    - On single-ar chipsets like WCN7850 / QCC2072, there is only one ar
>      instance for both MLO links, so dp_peer->hw_links[] has just one
>      valid slot and cannot be used to distinguish the two links. To
>      resolve the link, walk dp_peer->link_peers[] and match by
>      rxcb->peer_id, which on the link_peer side identifies the link
>      peer for the MSDU.
> 
> Add a new hw_op set_rx_link_id() so each chipset resolves the link
> on the RX fast path using whatever signal it actually has, and let
> the op itself decide whether to populate rx_status::link_valid and
> rx_status::link_id:
> 
>    QCN9274 / IPQ5332 : always derive link_id from
>                        dp_peer->hw_links[rxcb->hw_link_id] and set
>                        link_valid.
>    WCN7850 / QCC2072 : walk the link_peers[] of dp_peer to find the
>                        link_peer whose peer_id matches rxcb->peer_id,
>                        and set link_valid only when a match is found.
>                        Otherwise leave link_valid clear so that
>                        mac80211 can fall back to its own link
>                        resolution path (via addr2 / deflink).
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
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

