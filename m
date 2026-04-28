Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B083FF8864
	for <ath12k@archiver.kernel.org>; Tue, 28 Apr 2026 02:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCrRRzdOxR7F+nlwBIfEECPWvo0hTjDusmQKaUluhuo=; b=3IF9y1FcaYYRDg3aWpCWO4vldl
	Y2xNpuQ5uvpDs7imCndQYzp8ApXbYqObr+JFPgzuLm3/raizNz5L5Bd5Jl+CgvbD9ExEwoqKqCTTS
	266eQFAEb81Mee8FyQ2O2CDC6uL9L2599kM8zlGEWeXHL3/KLzMh6qhdmYhxsm7QOkThLhRKc9D3S
	mpPq7necgQVYvVl4gX5ZC4samYWU14ANh0Gx4DdQJtOMZzTl8c/Nq+b4zLl26vRB1tuejJAlKL0hs
	0a+SW++bvyiZ+ENSnqTEZTPapYwEzcugicIF93ESwEc3kWO9kbJ1pSmg9IKMfecG1pzW/yEgkIyzr
	wR+OURCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYb0-00000000TIH-0QLS;
	Tue, 28 Apr 2026 02:54:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYax-00000000THy-1q6e
	for ath12k@lists.infradead.org;
	Tue, 28 Apr 2026 02:54:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RJNQM2429029
	for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 02:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dCrRRzdOxR7F+nlwBIfEECPWvo0hTjDusmQKaUluhuo=; b=oIy/OFMXI7wxLNCF
	Zdb4QTxTUuzaT+KMpmAaR4vqq/PwippWO98w5vbUAqHPn9lxNfu2f3yHpWeTpx61
	kxyWwnn3iIH2tzgZaR+tTF2kw7UDpEDAjTS1kNXNhQat7SkXEhe9NhAvbEs/F+0/
	LRu3L2iqozFpq5Cl2fcCzI3RMpxeckv6K6+PUQv2qPIYfPO7g76kc2VJDULJJubb
	NisBVpjwYwwGZOPXqbdvQ6ZtbpGPpgMVXJG3TO2Hi9eZkG4vPws2rq90UMFl+z/b
	ttuc+CzymFyRK3a1WY2asXjBnEuX/dDmvKHQ8WIYDaQp0o4aJMy37WJqxxVSHHfH
	Eq9sCA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x32yhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 02:54:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2d0c1ead1so201422195ad.0
        for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 19:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777344881; x=1777949681; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCrRRzdOxR7F+nlwBIfEECPWvo0hTjDusmQKaUluhuo=;
        b=Z8OnUcD8CqXXSWa1TjPMRiwEtI+Zvd9lMBmmSz7/iYymNl/9+4lU5wLLUzzwmA697a
         dl4+cnUmkF6ovQ2oeo2cHTErxyzsP425cD9WMJebiF29es9xLIiP3Xh35S54QBqU/O03
         6zMKj3chKARXxs73B0DJSwQsxqcoJL+N4P4bL56PPr0EVtJhPlshkc/oiBtmrUMeTzDk
         afre1OwGqc51K0Uz3Z5CTJ9cHMAHjmsAVYzhSM267mT2wC051rZe8qlLhspg3Urefnw3
         F1RqMHrh142tq77W67mIw4CZcFMgIMu312pP5Vyh8kcU2vdzIwCgI3qAWKqPik5jQ5Bb
         4yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777344881; x=1777949681;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCrRRzdOxR7F+nlwBIfEECPWvo0hTjDusmQKaUluhuo=;
        b=js/+F9Nv4lRsmG+G6xjQmkeGC6Pi2ZbNwlRu69sKLBhKBTWiVJK2Ts6cpPo52ekw65
         VaiPZRnZ72g1pwVSINXwLAC25ikgD7LprdGL2Ab6H4OAohRN0LUhpUdGc0IY98AHiBsF
         soHir2Sb8StuvEG7lodx0LJdo+YrxcFy79V4pGy0/omkOw0ZaCG6QJuDic4I5OFdBQT7
         WtpGToc/4knY7zTpXpzgK6cg1z1ntmPWUIjSUG9h2CXLquSx93AUNsTKN5ORrmKs1ZYu
         0/HQPdbJWy1ymHdfrkunusyjCDX8BueUu1SkmWVrLyA0K3ZymNEf11ioYYQPIUad4OMZ
         ZaVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/74uy66hv/FOS6KxmI7/pB9lJYObF2ixa/70mf+mV3RIq3NMhL8vdrmsH2awH+k1kSvIBsHqg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJPkyTTy4RhGrYVGOMYLxtx6RmuRClUH2x6+o6ceTTGJEm1hjm
	e5bsE81AbDaN1fgEWzmvbTj0TjsiFGQ4lTxA05zXPegV9kntafzBkFaxMAifEoleVJVvYBhpTQm
	ZtxlPv4UOBFjtBDdA7zQQbFVni1SDH1heFsX6qHIVwZEbc1I4+5PzfZVp0sGtefopgdyTLAO2Sc
	Q=
X-Gm-Gg: AeBDietyq5lVRMDyCqHgP7M/mK8fGAyBgX5f9L9LULPkax+M6V5My4ToSpdiC0Vn54P
	BCgK8NwBjrf8g3l8hmB3uocLflrujqUFeEL4P7vRTPh9Tav5wSfJMwhbHIJyyAEVLF63velMKQv
	gCId4NICZ0LvwvFnnRLfIRpgkMv1EsM804zXIn73ZLdixUx1LvinIp0MCRLI+sIuMbkp55MhYwn
	vWrnEOpTGSxEGi3NDxO916eQghbnB/I83F/7OAHORtHK/0WXFWGC+fQX6G8wcW7G4NxnslDxc1+
	rnKcRyo0mFjKXJR33DPr5hdkb5vObQkzYFJV+EXb1+MQszcbyf0rUhLQdTWpH7CtVQxM0DNIs0G
	xNJRbwawHQP58ir8TK711HO7yauWD2JyYsBfFGsiWF+Outf2G74qdEPZXIPWeYAKVgbHS0vS1yz
	IjE8WhQLYEgAzQJwcTvKMDSnlC1UmEJg==
X-Received: by 2002:a17:902:b591:b0:2b4:5d51:ce96 with SMTP id d9443c01a7336-2b97c4aa50dmr8598275ad.24.1777344880871;
        Mon, 27 Apr 2026 19:54:40 -0700 (PDT)
X-Received: by 2002:a17:902:b591:b0:2b4:5d51:ce96 with SMTP id d9443c01a7336-2b97c4aa50dmr8598145ad.24.1777344880408;
        Mon, 27 Apr 2026 19:54:40 -0700 (PDT)
Received: from [10.133.33.153] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac78792sm8566795ad.41.2026.04.27.19.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 19:54:40 -0700 (PDT)
Message-ID: <759ba445-c7a9-4f72-8128-6be62320e465@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 10:54:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: initialize RSSI dBm conversion
 event state
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260427103011.2983269-1-rameshkumar.sundaram@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260427103011.2983269-1-rameshkumar.sundaram@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAyNSBTYWx0ZWRfXwA1wQrH68DXN
 IWmicaS6okJdXrZwipmRJafVlPkTqSKGKd+YXQXowlxpl9DW3Zp5nN/FpDY1y++PfD2MVCHUyE+
 ZWXYWeseEufchb7lkY+3c+VysvLjP3Bal2iQ4h2UCnpNw07a83rA8wJZ0O14l51SF62bT+w2j9c
 Q5i/bd8axOlDQAaTrqkCMI2jo7+K741CngPxE6FeSXwVlSDAbpNEmd1eX4yi4DQqYm6szKi1h+U
 sm9bvdZbI/BW+xV4h96lqUqD2Kr/qWje6Y1OT/vGLew6DtuMxeL+ZnTdHnwGAD/2wC3+ZHzmfJC
 kEKPHizPPIlVUBepcLOb/xYYIxJPJ/N3p2aiIruy8Ph2fjFczy5Z6yJVmYJBJy/zROnu1H7+lmn
 H60E5YsMN6idMY6UozOozMJszKGzwQ5xku0OuewJLDnGLm/ZKMrdhHvSQBNMoEyJp5LwlBiycpN
 52YnZeOTJ4kRUxwixyA==
X-Proofpoint-ORIG-GUID: QDHrwo2-iORZveOSynHlzZUitvjpKvhc
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69f02172 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_dLuOwf2joCYYqwKFIgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: QDHrwo2-iORZveOSynHlzZUitvjpKvhc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_195443_599270_B9F4B131 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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



On 4/27/2026 6:30 PM, Rameshkumar Sundaram wrote:
> Currently, the RSSI dBm conversion event handler leaves struct
> ath12k_wmi_rssi_dbm_conv_info_arg uninitialized on the stack before
> calling the TLV parser. If one of the optional sub-TLVs is absent, the
> corresponding *_present flag retains stack garbage and later gets read
> in ath12k_wmi_update_rssi_offsets(). With UBSAN enabled this triggers an
> invalid-load report for _Bool:
> 
> UBSAN: invalid-load in drivers/net/wireless/ath/ath12k/wmi.c:9682:15
> load of value 9 is not a valid value for type '_Bool'
> Call Trace:
>  ath12k_wmi_rssi_dbm_conversion_params_info_event.cold+0x72/0x85 [ath12k]
>  ath12k_wmi_op_rx+0x1871/0x2ab0 [ath12k]
>  ath12k_htc_rx_completion_handler+0x44b/0x810 [ath12k]
>  ath12k_ce_recv_process_cb+0x554/0x9f0 [ath12k]
>  ath12k_ce_per_engine_service+0xbe/0xf0 [ath12k]
>  ath12k_pci_ce_workqueue+0x69/0x120 [ath12k]
> 
> Initialize the parsed event state to zero before passing it to the TLV
> parser so missing sub-TLVs correctly leave the presence flags false.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 0314ee81a91d ("wifi: ath12k: handle WMI event for real noise floor calculation")
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


