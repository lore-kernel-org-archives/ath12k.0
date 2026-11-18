Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FA9606A31C
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 04:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wcoheH+9;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZYh5HVp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d6lYFlpb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P/aCbd8gNdr3LHgaWm5l/br1ZRzYyDdSxOOzhGf8hXQ=; b=wcoheH+9CYXMnn
	B5Gvl5t0rj+G0ePy4EXK38/ZLuXv7RQaOf4M3sCTpELL3/FYkRHS6e8/1XE7zQS5nLkGa+QM3Rfur
	pICDozvPv1bfb3Lolfv/+AJjM7rdho4r0KFUTPIWFtgZvk28Jg9cmJanexcdPxpjjxH8v9uzx3c6J
	z+LRBnO835qMSXm6ZK29PMKXL9y2eogxaqH5IqKr8wmPmny4FlBWXEb1KThxRwTQsHDFPXTCz+LWL
	yDij3kLVrYZCZcCJsVewmynqLBAG2xKUw02ihPMJtha5CKxLlrIAyLCA6zIt1HABh8fs2Jy8PJuxZ
	DmFpSiP98jj8Pmdyahjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWqr-00000007gNg-2rpk;
	Wed, 18 Nov 2026 04:00:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWqm-00000007gMv-3668
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 04:00:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UxZB3121726
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 04:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P/aCbd8gNdr3LHgaWm5l/br1ZRzYyDdSxOOzhGf8hXQ=; b=pZYh5HVpJNgC3h6C
	qn4NdNhzKg/92PUSNO/CDsE3iaQan1+DJFCspw/agIQlY1aX6kZ/tYvP+NjCTwXb
	mxG/0pCguLr4Lu88laXoVEgD/1rafyrvc4J/rF7zmpc9Y9zYdjIikMrSBWolNsvd
	whIDa/qJuf0Hyz9sK2n+mEsq2JYZ7qm9Vt0hxie3QFfAv7BK3WHxkHLO+2MIm5OU
	JUIQ3N1p31tyBSm3b03W7H9oFJBPT0Uk0+X23VFkWxRqgXF7qtOPG00uM1NnbyS8
	cv15vEEz3qPK4sOt7FMVsAO6Oeb5Xt4xqSM5Rg/Cjs07Fp1knQEbUt2gE/G2SU9O
	YJgEmQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9h2bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 04:00:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so634844a91.2
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 20:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794974446; x=1795579246; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P/aCbd8gNdr3LHgaWm5l/br1ZRzYyDdSxOOzhGf8hXQ=;
        b=d6lYFlpbLGPJvR+NILS9gNyLLh5xGqSl3xGOVnErA3OrgyjUyKewJHprsQVpI7rYvj
         TxUPo/rXmGpQOii5dsQJST+qDp9XG1Wih9AWOo/kfzoXfEzpekIKq7KBg4vo099HJMli
         BDerPdnoPGNfC1V5xMakZKDtyXaOs3OJMa1u8kMRG5eKzcFwIWurvi0SAMHtCYVf9phB
         eXnaiAPoye7OFNnf9GNlpLptNQxBx7FkNYdzUHx1ItGrVGuA13PEwvOytxdhCLwVauYr
         ikzN5mRyHcPrWSUTcvnxQnY3hxBoTDQ+ltg36vIddPd7SVJCnC7YFrNPWx6DwhvZXe6B
         Xkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974446; x=1795579246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P/aCbd8gNdr3LHgaWm5l/br1ZRzYyDdSxOOzhGf8hXQ=;
        b=WWOB384kfCIJbsAMZLJuxuH0eJ3tQ3tqG/Udxa+1bwPVkZ+qTgZ/Owz6wV80nCtXjy
         M0mxkIPrgPGXRdK2sbdn35DchbLdpjVV2R2E+7SeMjaGmQV20QP1l6aytlrL6jkUlRuX
         4S6FfEIHaQL64SWXH6+0zRYR4etdS0LDD1mJodInmF6ZHZ41ZqAcLfecJJr1rRNljJVf
         d4bzMS9ApaaedGHQM0Qi5LNu3PmUYw/SqmwsgUtThUOs/JXcx3kr9g7wP3uKStsuCkvS
         dd0ZwjFcN5lKJXnClXN9jNRCi3IfVJN5eVZzydQ3gtvIFw+BEHtVUIHnJ3+oUOTNU0sf
         zgZQ==
X-Forwarded-Encrypted: i=1; AL+hErFTGfuOQ6FgvQXzK/vdTWWP8Wav5H7Cx7wHca2NAvdZJ/n55Bhiwt0/PI1u9anwFgWwddxHDgE=@lists.infradead.org
X-Gm-Message-State: APuU4Z8gXZWWhx2Uw6+0W4lobIashy6Is4DB4IQFe6YTTsbdWkQN+Oh2
	jNRteUyTA0NAMDu8eLxN7LbWURLqUr3iLIH/g3xLW5lXQQ9aCJs6vBUHHdmcxVrBNKsK6cNcKfy
	jUZZ4birt4BWEHJkWArI54+I+iV4qPmEgvgYZrjjUmesGDZKFiMTvRXoFewhLy0hv
X-Gm-Gg: AZFdTZcvzpy+8xExwMAVmtJsSzEh6x341FEv+8/DV4Z0Rwrmn5ieZFp6HKtKKonrpKK
	zESNmHi4sTJpoyqeQ6XL5C3k4dzKzQQCmanZ0vDhhE1ETehjfC44hrS9tcAoNN0anh/1UVrz0+f
	4Jm0Q8sl0LUK50/+h+I9WmVxNREG0Nh9BHJ5xqy35GRAb6gcaXwV3Pc2fji5EEePgJvwYnZx/c6
	XtJkpkLpfkOBxyn1BPvNHcE1oXCHdbKlwhNnG3hLkbL66okArxT3j4pHRUR4EXWiFTtEA2J3ss9
	P+C+CB1O3ec0Z9rewPNg1qi5c/VqdV/bkACYbQCK0E0Ql2dTMCUM7MBWeSW4oDfRKV0B94mFgrk
	wOJDFH9rAqZKZLwdqdoo9hrNV2mNrEhmbogwYkHyu+UehL1jADSTV9I54AtJv0BX1vTNLF9Nwe1
	Q7nw==
X-Received: by 2002:a17:90b:1802:b0:3b1:922a:7b22 with SMTP id 98e67ed59e1d1-3b3d07c66b8mr1531111a91.60.1794974446141;
        Tue, 17 Nov 2026 20:00:46 -0800 (PST)
X-Received: by 2002:a17:90b:1802:b0:3b1:922a:7b22 with SMTP id 98e67ed59e1d1-3b3d07c66b8mr1531068a91.60.1794974445641;
        Tue, 17 Nov 2026 20:00:45 -0800 (PST)
Received: from [10.152.194.17] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abb786f7sm6835082a91.1.2026.11.17.20.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 20:00:45 -0800 (PST)
Message-ID: <0a62305e-4bff-4273-9153-9cdc0084151a@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 09:30:42 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: add hash table for peer lookup in
 struct ath12k_dp_hw
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
References: <20261026062131.1589569-1-aishwarya.r@oss.qualcomm.com>
 <2420c657-0aee-4d8e-9c84-dd8aeb510841@oss.qualcomm.com>
Content-Language: en-US
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
In-Reply-To: <2420c657-0aee-4d8e-9c84-dd8aeb510841@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HLliuD3YWul71DNVjwxIcF3WrTS69RTY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNSBTYWx0ZWRfXxgllVGT2Jwyn
 NMErJrCj10V/FblgXQa6hZp4uLGy38JO3frr82l+Sk0VzLS4PovSt5yPqPFzs7Hho1aie0I8+6c
 hmCAxXxxoGGod5urtiy12l0WZYb4iGI=
X-Proofpoint-ORIG-GUID: HLliuD3YWul71DNVjwxIcF3WrTS69RTY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNSBTYWx0ZWRfX40d3RyhUIpBj
 JXOS5hH3T/x+7WxyGAaiPsqf3pjoguUcEE5Xz3y49K4mqYa/JI7pvVIp3YlwSURr8SI8zyt3VD4
 pSVe/nNk8MJ7Uraw4IT2w+jUGrWmdQ/6LJ4wz9/+R42Ul4wYKPqm7M/heklgjITZVoo16VdPSiZ
 Ki9iGgsNkBRmAlTZDaG2E3SlC8EmWSK10VYufgUMm5CJdkpJsxEoV/L84JJ7P5DFQEwdcD91j81
 MytIKF5GFIoENiL5NEqZfYF9p3Oasz1epIKEd9FfKcUeAYT62XoCL1S7XrtwsmeWfwxSv7tVPFq
 QdIbV3reMRmgbocymUbi/CGkpzgfCaW6UNVAu/5apcP5zv22rnNzoTJRFwxiLsJ0kpWOyi5+YRe
 0oV3Ip701VHFVkuVxSnPhi4mbw3QA8fGIDgzxID1n7nJkU1EqMFBAidOpDEB6f6+7oj3HOZ7C4c
 Ljv2dXSy79ZYdiQsR3A==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd22ef cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=A1sr6ljbd0UWWdy09vsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_200048_904812_43B6196C 
X-CRM114-Status: GOOD (  18.44  )
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



On 11/16/2026 11:52 AM, Baochen Qiang wrote:
> 
> 
> On 10/26/2026 2:21 PM, Aishwarya R wrote:
>> Peer lookup by MAC address in struct ath12k_dp_hw is currently performed by
>> walking the dp_peers_list, resulting in O(n) lookup complexity. As the
>> driver supports up to 1536 clients, frequent lookups on critical paths
>> such as TX/RX processing, peer management, control operations and
>> debug/statistics handling can incur noticeable overhead in dense
>> deployment scenarios.
>>
>> Replace the peer list with a generic kernel hash table for MAC address
>> based peer management and lookup, providing O(1) average-case lookup
>> performance. The hash table is implemented using DECLARE_HASHTABLE()
>> with 2048 buckets (2^11), derived from
>> order_base_2(ATH12K_MAX_DEVICES * ATH12K_MAX_CLIENTS), and uses jhash()
>> over the peer MAC address as the hash key.
>>
>> The hash table is used both for address-based lookups and peer
>> traversal operations, eliminating the need for maintaining a separate
>> peer list.
>>
>> The maximum single-radio client limit is defined as
>> ATH12K_MAX_CLIENTS and reused by the memory profile and hardware
>> params. This keeps the peer hash sizing aligned with the per-device
>> client limit and the maximum number of devices in a hardware group.
>>
>> Key changes:
>> - Add peer_hash table to ath12k_dp_hw and initialize it during
>>    hardware allocation.
>> - Add hash_node to ath12k_dp_peer for hash table membership.
>> - Introduce helper APIs for hash computation, insertion, deletion and
>>    lookup.
>> - Convert MAC-address-based peer searches from list traversal to
>>    hash-table lookup.
>> - Replace peer list traversal with hash table iteration.
>>
>> Peer creation inserts the peer into the hash table, while deletion
>> removes it from the hash table. Peer cleanup paths are updated to
>> iterate over the hash table and safely free peer objects.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
>>
>> Co-developed-by: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
>> Signed-off-by: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
>> Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
> 
> 
> QCN6432 support recently get merged upstream, so you might want to rebase to have its
> max_client_single modified as well in ath12k_wifi7_hw_params.
>

Thanks for the review. I will rebase the changes and update 
max_client_single for QCN6432 as well.

> with that fixed:
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> 


