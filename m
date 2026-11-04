Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0290F606A332
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 07:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1t2MmoNX;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T6rJ+jfO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bnR9/yk+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=q6oJS16sD1XK509mHnNdi+5JE7YY0ZS6BjwD5nrXrBM=; b=1t2MmoNXicXyrq
	UJX0qN5hDSSZ3vYruhobcz55iON5lqV2vfcN3iXTtPJqOqNefWwMXyp81B4bpcHzpDUdw9kOiDmHX
	uWPCq09WuN+ssfXstaVUDXpbR78Rm3bT0utq2BIxfPW1iUfUxkvfSbuhpTwhPf72QCTPCNj0F1ga6
	tY2vbiWn/GHwL+CQSj8pBYFZ0bkca+Y3equO6MZ4EX+O9GnwzApYgaate3QgZL44vEIpZKJFihxa9
	GLRXWxHBYNu9vxcOF91KikbIM1NhvbfmxwrcDqgBk5wscl6ucO/xn5aVIc54kIxZuh4+Yy27KCb7f
	9Kt9Xy/cFg2EnPTs2K6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVMp-00000004WYv-19Dy;
	Wed, 04 Nov 2026 07:25:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVMm-00000004WY3-49Jm
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 07:25:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A46xwn91248580
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 07:25:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q6oJS16sD1XK509mHnNdi+5JE7YY0ZS6BjwD5nrXrBM=; b=T6rJ+jfOnE2+2j2g
	lr3aTQuYynJag/uX7VPfR4CubnwFXluy40/bUQyDmLcmOswq1o0HLA98FcJxDQJd
	afwP9yZ9G442qTrZdQNpF0APHujlFwwNE4PGiz216t9KuHoI0K3kuyew/6P2QZpc
	DZdU1uAmoyDGk1wHxhaSAMBSm1IH6T9SZAd5lWzscMztnOEnGzL9bhfvbPNIkjl1
	o9tmDSXX1kxk1krwP5Bo5mTG1Q7beYSj4YxXBSp5vchi2hQ+Ioa9RTFl8DA4OZ27
	I05IYdIvmJw3sqySPz/luYhRFtvdovtBHOizM+1g4mtEePQO+4Xqfty31uGh1DrK
	9f2OTw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuva4r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 07:25:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso848546eec.1
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 23:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793777103; x=1794381903; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q6oJS16sD1XK509mHnNdi+5JE7YY0ZS6BjwD5nrXrBM=;
        b=bnR9/yk+HzoeFZqBMtIdB9CI8bSMAUPbXL7xgJJdcE7MvVS2CS3oPKvxs8N4HPX8Td
         UzfQ75WsrgRNVzGVHywKNKskixu8PVqzkO45XWf7uKJ118G3EKxfr26YvNcYi5QyO+98
         VMITuSfWLZ9pI9F6UevQXL5mMOKHNZtrLGLBBlsqgmW3n5XypY+RjWArnTS7AkkTSGSF
         q3MaG4GKomqPL2yZ5DW8stzmncw5nOLZLZPZDBQSiE+Ojz8FcA8NLHarq1EVF1Tqao1w
         hHArE8AvbvIiHwy0iajLisxugkVuXj1IFdZeauyVpHi9XXqzqDFa4nvK34+RDihbb9OK
         BSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793777103; x=1794381903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q6oJS16sD1XK509mHnNdi+5JE7YY0ZS6BjwD5nrXrBM=;
        b=S7y9ULan/aa23t6CEYuMWAiiocA5wIf9KxVaHtR+pOEeX6n58h6Fi4hoC9nwr0ZY66
         YeV3qMuEzRFHLzw26rfqgsP1nyPGAQdGG43oz07AunON6hj2xVQjyFzHqGM3RnneuOFF
         403ttlf63cIUaZyQWHELC7ZiGmYjL4wn0Uy5AlRnxt9vqPUmEhNnFtn9BhoNG67UMpvv
         BMysgc00HNhrTAMpyo8deGdKzEMP2a7U1QY0CUP1KNG31DL4/HdNBEkxZ0kIpeo+GRGn
         z100QarXmu9eP1QVzsYDl4/6KgfyO0aPNT+FdrTKoRIYE4+5gDtggg7DZgWIjcgLsw59
         lacg==
X-Forwarded-Encrypted: i=1; AKwUvBzCgwpFVAyWhu//5gR6swt960lgxYrFzEhVXC8Uc4rgC0kAtwTqI8w8OTu4aYEI1On1p3dV86A=@lists.infradead.org
X-Gm-Message-State: APuU4Z8SJJ54fMQXBm86xBnZmQo4NzylDw5IetITx5ONNuwgFG/7kxo/
	nC5nYPRFvwlQVILCwWH6wkpHkW1Z/nx7F+dPchof/dURABWNRXOtqlLnPZd+V0XXZdf3HjhrImw
	KGXP0vQgwyFIu2w8kuQ1N5OPARC1tevLNmy/QPUwMxXGW4+FZPWDGmwysyvPq24He
X-Gm-Gg: AYBFou3wlAwiKYolYrmux/Yvvzax37rRu+hGeIy6WZe3E2dmWQBnAFar5G7mebbEORC
	Pdrda5OB+v8bN1WkbFRfptS4ufC0SnlP8ZJudkytwGtpoShjeKuLqS0NOQ50Pp4C5gDYPUAXVC2
	TFhBsylVFI6vhfk3evFqSqk33l/ju5LMOAqbZmfeRLtl6rODchf7Lsf5qxjaGz8I75hj4DwtDkV
	UC8LkIwYzMWQr/g01wXwpF6jeg8WG07xakQWzI6GzkI0R3C0CwufZB7j1JouqGgbuseWna4bdV4
	XZ1lNQ0mLUI0P3JlGmzYCjwpPuYwzOM9BNtFmEInZjV5GiDw9vs5qV3/fysmZp3OhBBlNL3yNd9
	MqhFx0LvvaK+PlDC5S2iWHVgC+yI7X+jAuOZpOIge5tnQNmAwAOMrrfoxbfRdMRydhvq4240kWy
	2/vutVZdruW05VREZWMv7G
X-Received: by 2002:a05:7301:4b0a:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-36a424199eamr23022307eec.23.1793777102878;
        Tue, 03 Nov 2026 23:25:02 -0800 (PST)
X-Received: by 2002:a05:7301:4b0a:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-36a424199eamr23022274eec.23.1793777102156;
        Tue, 03 Nov 2026 23:25:02 -0800 (PST)
Received: from [10.152.202.164] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36a1sm5422435eec.12.2026.11.03.23.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 23:25:01 -0800 (PST)
Message-ID: <2d508cb8-fc7d-4cc7-8c13-4b67989a81e3@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 12:54:57 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: refactor m3/aux_uc firmware
 memory handling
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aeaddcf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WH3b8gmyxz3kVt_5t98A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: adQRBS1RWB71Pm17tUNbcQqnCDP04cJX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyOSBTYWx0ZWRfX3igwuLla/Q4S
 ZkauqbTgLE0o3xpNR6/LqCLVwOTgSE9b6VUL5+F80XigjXMigvHgazCDG1ohdSy2yzHq5F0BvWX
 fN37QyfgMN2pf87FUfLTB2zbhyJU2CA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyOSBTYWx0ZWRfX2ju9hn5ktuX4
 vkC6wQh5qLT2SqIgu2qIyxjFLbyRFv91Np1H5C9XWNKi93Ym1+NcTzey3dVavrfQPaQaxTGwfAm
 WN5qy0vGLHGX86jh4MqFMTtHBznwgUsL3nvQ4ihTxzQeNWjDTjBBe05aVnRyl41OeYUoFeM4KZk
 tfqF76lrzobVaRuk9pYn4rmJ7VLJQ3mfOsgzHKBmCGB3btjm1+vO9FcSd9J5srEfItFD5ZzMfjy
 B4wHDiO4zbXctoA6wiMcWdvp25m+8j1BNx/UaWTJxR9xZEGMRrAWsk9sxnSPgKf+E4S0BgVYcrI
 LZjroy1PRpP0MqtgdK7WWUQht3yEi1dTMIm0W1Jffef+sxm/mpTBWM/xGDQJFZoDkHRTNi4S9O+
 fzBsIST/JQh9iLMUqiJ14XsI7CnwTXNdraeGOtQl4pQjdlGYZeFkx7No8LsEyGK5/Gn2A+wb5tw
 m+DurVc4Fc12ZIJw42A==
X-Proofpoint-GUID: adQRBS1RWB71Pm17tUNbcQqnCDP04cJX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_232505_054147_678466BF 
X-CRM114-Status: GOOD (  14.20  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 04-11-2026 12:00, Madhavan Ganesan wrote:
> ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
> ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() carry near-identical
> logic for freeing a DMA-coherent firmware memory region and loading
> firmware into it. Factor the shared logic into common helpers.
> 
> Patch 1 is a preparatory, no-functional-change rename of
> struct m3_mem_region to struct ath12k_fw_mem_region, since the type
> is also used for the aux_uc region and the old name no longer
> reflects its purpose.
> 
> Patch 2 refactors the shared free/load logic into
> ath12k_qmi_free_mem_region() and ath12k_qmi_fw_mem_load(), and
> rewires the m3 and aux_uc wrappers to use them.
> 
> ---
> Changes in v2:
> - Addressed the review comments.
>   
> ---
> Madhavan Ganesan (2):
>        wifi: ath12k: rename m3_mem_region to ath12k_fw_mem_region
>        wifi: ath12k: refactor m3 and aux_uc firmware memory handling
>   
>   drivers/net/wireless/ath/ath12k/qmi.c | 168 ++++++++++++----------------------
>   drivers/net/wireless/ath/ath12k/qmi.h |   6 +-
>   2 files changed, 60 insertions(+), 114 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

