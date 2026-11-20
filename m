Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11B8606A325
	for <ath12k@archiver.kernel.org>; Fri, 20 Nov 2026 05:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GUTbCYCR;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dgJ8zSHs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IqzCD3YB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KudALHjSrYnBsw3pEj/DMe9yjTELoN6g5Jd1NdVDQeg=; b=GUTbCYCRHGxc2g
	fwArd+IkbXHhczJb3RoSRY9bNp5zGtZemBBf0OA6TfkbBaS5vBsefOLu3gNn5kI2GtITDE3T4b5J6
	nsisVEMHEa/oeBgzOp5nZ7Ox1wEjatQYydKbaYrp5rTYohLsXbb+tFgg6UG5jTrB2AJLNORwD+hFl
	bKtinJRkOacF4fHoj5Y9KSWiJxXolysItb1rPP4k23V0jVK6v79YsB5+Isnch5lBkeT2zNORZWEo4
	gBuQeRJmKPOszBH965UIm6QDjlexklZQZT4+GxqjjisXy+aIoOEKbMRf+cE0Iaz6P02DhSl+2aWIe
	hWI955UUSfSUEu3+tuAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGvT-0000000E3Vu-1Hu8;
	Fri, 20 Nov 2026 05:12:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGvP-0000000E3VY-3ucF
	for ath12k@lists.infradead.org;
	Fri, 20 Nov 2026 05:12:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK3Uu1j498109
	for <ath12k@lists.infradead.org>; Fri, 20 Nov 2026 05:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KudALHjSrYnBsw3pEj/DMe9yjTELoN6g5Jd1NdVDQeg=; b=dgJ8zSHsz/T8li/l
	m2qjkuPkgDMe9vuY66T5T9mxF3NAf5aWuR3jdeAz31mYB5GMMLPge3fClAQ19BBV
	V6UvR5yNk2nhV0nqYhGoKoeeXDvrf/M+HfUIeyHKxC0Q6YS+Z3eH0z8LWBKJLrCS
	Qz5GGJAmM983qhuQ3L2cwRQhNv81KP6ffYlOD9uEOK/8VtE72PkmkBzswsKuWo8F
	9tqLHGGd1k62T1FImbZYwlUVMjbwGJA7XxrY/hszYeyDvNB6SkID/7j3uCo9ibAJ
	H3yOQaekxdvoHLpFrMi1pvutjH+uWQxai4Buu+B7OrrWKsQxe6utxdExLEzTNHss
	idO4Pg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j255wjtmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 20 Nov 2026 05:12:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a079256596so475795b3a.0
        for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 21:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795151558; x=1795756358; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KudALHjSrYnBsw3pEj/DMe9yjTELoN6g5Jd1NdVDQeg=;
        b=IqzCD3YB/dGCdt7l0B7QZuLAXHlr7cEuW3VAG9LctPhaAv3Rwf/d52WXMMawgHmCZe
         wZgMlzxX8aUdEWv3JWuXXYiq6n3en85KX7e/IqQRgJeh8WEzqvSY+LiwR/L6WbOvEFLs
         9n3bG6qO2XWo7wlaxe6UQk+NhxW+47XSJn4TQJWIfXm5SHQjCK8IMyzGLwar0plFIfIw
         y2+WPiqB17o6Zy+QsvtEDmqRPXglPHXDTF2+iPvW58/Z4pEG+GGcCEWoLkYgGPFE0WU1
         rc+CNERLx9ilU783kxdxLWefG9VCpiHBkq83OB0FvCFu09IscOYGbkBWZN3xlC59pDIN
         Coeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151558; x=1795756358;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KudALHjSrYnBsw3pEj/DMe9yjTELoN6g5Jd1NdVDQeg=;
        b=QByi2FzZLlVZ4WuYyxNlQOXEvu5KulBk/XB9xR0RpGvhE6efG3zJaxhjhtcjITLtbJ
         l95+zznq1mF+n0LXtO9ORm3qUjfeBsv6o/Pk5XXEjPDK2wPEofwlyEkJPgCT6DYza/XV
         5gSB6gc5RPUK15ioT4AZJtMfXKU9EIDFu/a5fAzX9qpvUpdXsq8rPXbzoiwR0O4rCX2m
         Tv6FtvYkYAYziw5zY8xoo5az73olSEYDw2R/E0/P9uZD0cBrSu/3E2kARwO0gZo7pDzG
         /1klZoHvxSTS9vhbGOe1y4wntKj6Tqi/Ht71NQXNByTOXQJf2z4BlNe9NVCKROB9BLXd
         CbJQ==
X-Forwarded-Encrypted: i=1; AL+hErGlN26b/Kus/Fc3obULTO2KD3dMU35gpbWoLKMHGYWbecHCwiMSv1hZZpiCVLBH/8Vao1F+ofk=@lists.infradead.org
X-Gm-Message-State: APuU4Z8SADfcIbLZcaNOsm82PVxMuQdQcuM9NJnP9WSYUf7WfKkihAob
	po7Oy250GYmv6u9MFjAyq3BAl+PGpNSJYKIqbP4CLSjnn7pAG/KEkc7oi3I2rqstA7Xgo7PlgI4
	NQQxmj1ZL/kCwV/r8179AuTbtT0BL/B77WsHE7kwtondaCUgPPHm9hoca/nOKMWE9
X-Gm-Gg: AYBFou3OgRWNvK4Bul1cfdHtaStHDqhGNtoGLNleAfQdhFv3Sh2+7Njp2OifCzXiyb4
	0JqNDYmOErjAsEvyqn5UidJVUeWhFMGx0SCVidmxO+A+Zg3du9qIEHZENFM8ei8uW+dJi22rE3o
	YnrzNBbMViUJ742eN8jiIUOnz55Bu+mue4i8Tyervll2uTrfOgIy3FtUDjjMk9L47O4ENt/Ow+s
	kH1YLEWQYMCwGh3AuN9aMb7DXkkp9McNAiGSj9NhJMgVQnJG/aobS9g/WlCIFoaw0j4JPt5m/Kx
	1IXMhcQhHMMaxWOKtw/N0rozWTO1VlEMmWdECn8sLuSMlOJlX8RSvpLhBU9PVDsx0ULEksWKZbR
	FGcBv5PUSxzZnN+SQHaXTAJdfldvAzohjEZbIuqBaflqDCjm88BwP+OsO2X1TxPqifgUpHMZ2HI
	km8Q==
X-Received: by 2002:a05:6a00:10c4:b0:886:3bd6:fe65 with SMTP id d2e1a72fcca58-8c87b9d0526mr1963974b3a.19.1795151557572;
        Thu, 19 Nov 2026 21:12:37 -0800 (PST)
X-Received: by 2002:a05:6a00:10c4:b0:886:3bd6:fe65 with SMTP id d2e1a72fcca58-8c87b9d0526mr1963958b3a.19.1795151557102;
        Thu, 19 Nov 2026 21:12:37 -0800 (PST)
Received: from [10.152.194.17] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm900570b3a.31.2026.11.19.21.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:12:36 -0800 (PST)
Message-ID: <f82cd743-adfc-4ebb-a796-7131a0b07004@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 10:42:33 +0530
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAyMCBTYWx0ZWRfXwUj/IkMmMyoz
 cd9YlidpuSNtLh0GMDiUTC7j0hNG9XMA8giKpt4/ag1uZwjtiavwki/3AxaLH4yiF2wO4wv11DI
 p2815i4D2WL3gNHjtx3j5/NIQ/0feTU=
X-Proofpoint-GUID: oonydgEo6ISdcoAlfImZsprtPa3Dm023
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAyMCBTYWx0ZWRfX0utAEaIAtbTf
 xz+HCWbU46lRKm6E+pcRjUWnE6xmjwQIbmq52fjjWUhoTmpoTFTQqpSupI+Puvb9xhmxnOnikYQ
 +Th078q08jn4PHm3w9ON+rPIOaPe+rQep9AhE/NDQgabSFdC7rIksF2A0Toi0+akH6aOD/kgYLP
 ZS7Md/IRGpbfb9TRia8j6kDAFz2l4wZaFVBEla2WhCaA0XOWoLuZUEiebgKD1zlbt/SxZFaHqsw
 4BLtjIEiP04Y1cj3ifJTS1ScSOaOKb+FrmDeXng1HsmEahqgE3R6dHKWvjeWqnr69mqFKvcX3ME
 3RjWr1L+DW6KvfE2VKiVa/x+JyGUPqTFe5nb8z2K2ok3Qztt5k4deKi9nEqRxNZLcopTgm8OOca
 BfOyndu/iCDHi2/srmkaxrAU5tdkPGZ34MXELF3paVElHNhep1qXX/AvGZJCnbXfSAtlM5ZoP+A
 Rts+6ENA3/G3IawPvoA==
X-Authority-Analysis: v=2.4 cv=da0VTnXe c=1 sm=1 tr=0 ts=6affd6c6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=A1sr6ljbd0UWWdy09vsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: oonydgEo6ISdcoAlfImZsprtPa3Dm023
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_211240_077847_0A0035EE 
X-CRM114-Status: GOOD (  18.06  )
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

QCN6432 uses 256 for max_client_single. The newly introduced 
ATH12K_MAX_CLIENTS define is only for hardware supporting 512 clients, 
so no change is needed for QCN6432.

> 
> with that fixed:
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> 


