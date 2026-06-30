Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDFEC43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 05:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXOkF6nHrxM611sZfpXBYGGRvXrxtTKPNCPO+f/c4Qw=; b=FmMlhF9HWKmvtUC5D+nlv6Pi6g
	LC4qvwFkauRHZ6GmCK6GKrd9B4meji/QKFsff2ILB24qowZXdyrdgKZkiUaDtpNzC1r2ArkhOyf4D
	VJhHf3+rIxeFYdrz0BHvB3Lpv4UGdrNT2MnhHB2oxccC4aspQV0AUPEKcpUw/cKqkear/qBVOisi/
	L7xg6/upVfs7pE+U8jvt3lRqEJaRpYFPbDOQ+m43bhv4RUF3zhjFfNNDw+Ap5nJTWMUj4Yr0rO2Yv
	tADtqN4+ydbmC4TAhK4qvTytsjlobneZixGK4zDIn4cPtsSSpWG0Fq1tESYj2g5OiXHSh6GckvPML
	Oqds0o1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weR3q-0000000Fq4X-33OS;
	Tue, 30 Jun 2026 05:31:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weR3o-0000000Fq3z-0uEw
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 05:31:05 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U1J5PR449153
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 05:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXOkF6nHrxM611sZfpXBYGGRvXrxtTKPNCPO+f/c4Qw=; b=KbcpTCXyotZBz5JY
	W3NSHQ+AxhZkAY3XxSbSncqNs0ItKoBXMF8qTpAGjNoOEAj8OKZfhwD0VTkvjUo2
	Kmv/BhSf6mwC4Qb26sdBqKZ/+PDiLzskeLYUqyiVcyVSgdIsk6qdDnlvJzBLaYfd
	BIKAO4ekZefHcXPIVPi3tT0SXqBB5fWP4vh79ubeO9UkAKLt7w2Khb3zEE9Qg6zO
	3hrMX2Bnx3GYZDpklA9WadV1oFFtciWBbH3j8DtPaCYeRqggwVzCVEg10ou4tiZY
	tZ1iV6YakEoE5GJlmTOSCZPWCi1KSmtUoTDa+GmhNjwoO/upze9CxR3+9jMQrvhD
	TaABxg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441grraq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 05:31:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847a225cd91so380804b3a.2
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 22:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782797462; x=1783402262; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXOkF6nHrxM611sZfpXBYGGRvXrxtTKPNCPO+f/c4Qw=;
        b=MhOz1jxQnRmilpgYctFmakan3MXb0E/Ku1SrqY5zwdQrBpXgeRsEJSKIfw+UMYJIx4
         zxnCt3fMATy56aa/asc9wTxpWtV/KvJZ4hZIiCVASXQoUgbwlrMCqun4DlUN+mca7ezu
         Jkc57CaQE1ZM8RWt2lqkiuokzFIHEJ8DruC8Q4YKRvUqBgPMdc3BPjRpcYmnHexlAttk
         xlw6tqigfmJd6E1ca9I6p92EoXXwpGk2MCeCZ+bPliaPrXUC0SNPCuMZF60lF6q1D5BN
         WSWQYaUqKtyXyqXh+ocBWkwC0r9v3Hh5QigSvbEWW2HLzbhRwxSTdlOGPEA9qy2tq8lm
         89sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782797462; x=1783402262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXOkF6nHrxM611sZfpXBYGGRvXrxtTKPNCPO+f/c4Qw=;
        b=XM7jq0KOsoktrYCgO6V1hGwnqz81F/A6gx5tHaefSpZzN1Di/hOEo9iApwVXt2skJd
         RuJZO6L/a2rKPy+xzA2+xSpnR+3DNp7OtCuKpElss7wa32b0kwCjfLlP1yX32Z5TPKi9
         j2kO3AkKVaWlI1H/pEEq6SXfYg3LKHTA+HZmHfjL3ZYJLB0sryQW28d0tpI3nyltc4Gw
         XuyzGLzutMyP7bI2an00ne3l4HUi8bHGbaQX4YzRyQES4j4PQaFEIO1LywmUhTFzhw+q
         KAXuqqE+tZSAARwwfMCuviiQ/0H5HZXVvUoNWrD4ezGHGRJVzXEnNi5mHai4apf6onjL
         iXhw==
X-Forwarded-Encrypted: i=1; AFNElJ8ljuY6L2ylIxFA1symMijszSq7cNA7nJXeKZxi1Ecu8LojM7Jspzb5e2a+5Wt7CZqYilSXFLE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQquNcl4HXcA7ZWuP0glF2G87f3QeEAveS+mxUHLkBwMw8Wq/8
	l+jKeK6GJY2iL220Av7KzLyNgdXJ2u3FPAczhBoYZCcn9Ewv23/qiT0fTc83uS69gnJ0a4RLYZ1
	ih2L4CFD3wzhJpGarjRAD/TcRSLwJ0qnU3PQC+mslrgoQo1BrZIQuRKblTe+Wov3J5JKUfcbS
X-Gm-Gg: AfdE7clq/MN0qIOGZh8ZgrSaXnntQaW5kG3C3eXMNYlZdCubvwzeRD2oq8ieAMoXlx7
	5nGwMvtY5UsDVst8XNwa9tL19UvD3FvTIYhalDsG+Cu8lact0NAQ5UR51QaZbk28JJ6H1akMe/4
	TPhHGLR2Ho6odT6OdR0BaurUi+tDYVMdtvRx0QiQqotNPTzxDuH7PZZkvVkOnUKRQ42dQOj2RsA
	RGrurqeHdBN7chfkTPzK2rNS5SNk48H/ZTtidXY1JPawCkxurwSQRllOI4jNVweSgy11Vj57h1e
	T9T3Xe8SCxQJO4ZFmyoSnmW6XB8hq1zCwPEBa3mUvoP6Nyr1uQHc8oHAInuRdfHJPftvhVTWI0H
	rvMcTeH+fYm62jwzlxP8LyWMQfqCSmMl+yDVXQzVka2Dr
X-Received: by 2002:a05:6a20:918c:b0:3bf:6c07:b2ee with SMTP id adf61e73a8af0-3bfc52cb7d8mr1910882637.49.1782797462077;
        Mon, 29 Jun 2026 22:31:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:918c:b0:3bf:6c07:b2ee with SMTP id adf61e73a8af0-3bfc52cb7d8mr1910865637.49.1782797461631;
        Mon, 29 Jun 2026 22:31:01 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbf95a3e7sm804560a12.19.2026.06.29.22.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 22:31:01 -0700 (PDT)
Message-ID: <1d307fe7-49df-4616-bfb7-e2050c5ddacd@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 11:00:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 3/3] wifi: ath12k: allocate HOST_DDR and BDF
 regions after Q6 RO region
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260611033314.2330-1-aaradhana.sahu@oss.qualcomm.com>
 <20260611033314.2330-4-aaradhana.sahu@oss.qualcomm.com>
 <2d776c69-51d0-429f-b716-b5302d657047@oss.qualcomm.com>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <2d776c69-51d0-429f-b716-b5302d657047@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA0MiBTYWx0ZWRfX3HDzN0Kq9j6V
 JauZlFoY+eLVVvKJtMHn4qWTrKBM5CgImbrGfmoqlQodx6mHYtml+SNOt/REQbvqAflbB6Sjj8h
 NDDpdRb1R+9qojFpfhXsapxob4qIVNg=
X-Proofpoint-ORIG-GUID: BGBCVe2BeXE4vmmITCirQhLx_zOqGwuH
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a435496 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=GDVKn0GNZQE__RHKs1UA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA0MiBTYWx0ZWRfX3+J6mOU/SFkm
 Jb4dQqGmmEPVLonVogV7Mx30VIuxB1cAM6bxY08t06yRom9UlkkRmU8E4o1JdRjHz6/BMUSAFlm
 8RtDccqsBWCnj1pWNUHygT6fGaOId5XJSTSaW5vkVmSzBca2p5YXTcJ+0N6LERxcb44fUZ9KD2y
 wKBgtsLmNYHC2GHxcyoifbKWJylyuNQoCsSQU07TpnZTz4rOdX0IsO/3b5bj/mbe7OGGjIT+adE
 9ui3zV5AwiXHUfZjfIQQIGp4tp9d0eAZy6j6JfZPtX8n1BZyufD9sdNqPu+x+cGrnD9xDlHXm6U
 h5s/1IUdAMi3QVP0ESv8k7TLWmkwc+2phIsGyVy1vKpSZf1VXyezKXu/vjbyiFCCY6h2mB0jiE1
 rQiJiRhBmFLAx6Bow8SbxFnv0fbBMujpl/WtSsnIPuxfjr415n1qH+ghsfaTYHBo2hCm3VknW5s
 O6vdwhu7tLTPVlNGuLQ==
X-Proofpoint-GUID: BGBCVe2BeXE4vmmITCirQhLx_zOqGwuH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_223104_311688_3B893D37 
X-CRM114-Status: GOOD (  13.00  )
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



On 6/30/2026 6:06 AM, Jeff Johnson wrote:
> On 6/10/2026 8:33 PM, Aaradhana Sahu wrote:
>> @@ -2781,9 +2781,12 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
>>  			goto out;
>>  
>>  		avail_rmem_size = resource_size(&res);
>> -		if (chunk->type == BDF_MEM_REGION_TYPE) {
>> +		if (chunk->type == BDF_MEM_REGION_TYPE ||
>> +		    chunk->type == HOST_DDR_REGION_TYPE) {
>>  			avail_rmem_size -= ab->hw_params->bdf_addr_offset;
>> -			res.start += ab->hw_params->bdf_addr_offset;
>> +			avail_rmem_size -= offset;
>> +			res.start += ab->hw_params->bdf_addr_offset + offset;
>> +			offset += chunk->size;
> 
> avail_rmem_size is size_t (unsigned).
> If bdf_addr_offset + offset >= resource_size(&res) (e.g., DT
> misconfiguration), the subtraction silently wraps to a huge value, the
> avail_rmem_size < chunk->size guard passes incorrectly, and ioremap proceeds
> out-of-bounds.
> 
> So seems there should be a test to sanitize the DT values.
> 

Sure, I will address this in the next version.

>>  		}
>>  
>>  		if (avail_rmem_size < chunk->size) {
> 


